import argparse

import torch
import torch.nn as nn
from torch.autograd import Variable
import numpy as np
from torchvision import datasets, models, transforms
import os
from sklearn.metrics import roc_auc_score, accuracy_score
import torch.nn.functional as F
from tqdm import tqdm
from scipy import misc
from dataset_loader import CSVDatasetWithName


class AugmentOnTest:
    def __init__(self, dataset, n):
        self.dataset = dataset
        self.n = n

    def __len__(self):
        return self.n * len(self.dataset)

    def __getitem__(self, i):
        return self.dataset[i // self.n]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('model', help='Path to the model')
    parser.add_argument('dataset', help='Path to dataset')
    parser.add_argument('csv', help='Path to csv')
    parser.add_argument('--id_field', default='image')
    parser.add_argument('--target_field', default='label')
    parser.add_argument('-n', type=int, default=50,
                        help='Number of image copies')
    parser.add_argument('--device', default=0)
    parser.add_argument('--print-predictions', '-p', action='store_true',
                        help='Print the predicted value for each image')
    args = parser.parse_args()

    data_transform = transforms.Compose([
        transforms.RandomHorizontalFlip(),
        transforms.RandomVerticalFlip(),
        transforms.RandomResizedCrop(299, scale=(0.75, 1.0)),
        transforms.RandomRotation(45),
        transforms.ColorJitter(hue=0.2),
        transforms.ToTensor(),
        transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225])
    ])


    train_ds = CSVDatasetWithName(
        os.path.join(args.dataset), os.path.join(args.csv), args.id_field, args.target_field,
        transform=data_transform, add_extension='.png', split=None)


    dataset = AugmentOnTest(train_ds, args.n)

    dataloader = torch.utils.data.DataLoader(
        dataset, batch_size=args.n, shuffle=False, num_workers=2, pin_memory=True)

    if torch.cuda.is_available():
        device = torch.device(f'cuda:{args.device}')
    else:
        device = torch.device('cpu')
    model = torch.load(args.model, map_location=device)
    model.eval()

    criterion = nn.CrossEntropyLoss()

    all_scores = []
    all_labels = []
    preds_dict = {}
    for k, data in enumerate(tqdm(dataloader)):
        (inputs, labels), name = data

        inputs = Variable(inputs.cuda())
        labels = Variable(labels.cuda())

        with torch.no_grad():
            outputs = model(inputs)
            scores = F.softmax(outputs, dim=1)[:, 1].cpu().data.numpy()

        preds_dict[name[0]] = scores.mean()
        all_scores.append(scores.mean())
        all_labels.append(int(labels.data[0].cpu().data.numpy()))

    epoch_auc = roc_auc_score(all_labels, all_scores)
    print('auc: {}'.format(epoch_auc))
    all_scores = np.around(all_scores).tolist()
    epoch_acc = accuracy_score(all_labels, all_scores)
    print('accuracy: {}'.format(epoch_acc))

    if args.print_predictions:
        for k, v in preds_dict.items():
            print("{},{}".format(k, v))


if __name__ == '__main__':
    main()
