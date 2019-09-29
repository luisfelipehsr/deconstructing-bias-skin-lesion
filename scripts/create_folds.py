import os
import sys
from random import shuffle

import pandas as pd

dataset = sys.argv[1]
file = sys.argv[2]
data_csv = pd.read_csv(os.path.join(dataset, file))
images = data_csv['patientId'].to_list()
shuffle(images)
num_images = len(images)

folds = []
for i in range(10):
    start = 0 + i * num_images
    end = (i + 1) * num_images
    train = images[start:end]
    train_fold = data_csv.loc[data_csv.index.isin(train)]
    test_fold = data_csv.loc[~data_csv.index.isin(train)]
    train_fold.to_csv(os.path.join(f'{dataset}/10fold', f'{dataset}-train-{i}'),
                      index=False, encoding='utf-8')
    test_fold.to_csv(os.path.join(f'{dataset}/10fold', f'{dataset}-test-{i}'),
                     index=False, encoding='utf-8')
