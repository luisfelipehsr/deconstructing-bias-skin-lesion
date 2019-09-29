import os
import sys
from random import shuffle

import pandas as pd

dataset = sys.argv[1]
file = sys.argv[2]
data_csv = pd.read_csv(os.path.join(dataset, file))
images = data_csv['patientId'].unique().tolist()
shuffle(images)
num_images = len(images)
print(f'Dataset length: {len(data_csv)}, Unique entries: {num_images}')

size = num_images // 10
folds = []
for i in range(10):
    start = i * size
    end = (i + 1) * size
    test = images[start:end]
    train_fold = data_csv.loc[~data_csv['patientId'].isin(test)]
    test_fold = data_csv.loc[data_csv['patientId'].isin(test)]
    train_fold.to_csv(os.path.join(f'{dataset}/10fold', f'{dataset}-train-{i}'),
                      index=False, encoding='utf-8', sep=';')
    test_fold.to_csv(os.path.join(f'{dataset}/10fold', f'{dataset}-test-{i}'),
                     index=False, encoding='utf-8', sep=';')
