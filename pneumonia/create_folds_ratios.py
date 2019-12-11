import os
from random import shuffle

import pandas as pd

for ratio in range(5, 10, 1):
    ratio_value = f'{ratio/10}'
    ratio_dir = f'ratio/{ratio_value}/10fold'
    ratio_classification_dir = f'ratio/{ratio_value}/10fold-classification'
    os.makedirs(ratio_dir, exist_ok=True)
    os.makedirs(ratio_classification_dir, exist_ok=True)

    file = 'stage_2_train_labels.csv'
    data_csv = pd.read_csv(file)
    allowed_csv = pd.read_csv(f'labels_inside_{ratio_value}.csv')
    data_csv = data_csv.loc[data_csv['patientId'].isin(allowed_csv['patientId'])]
    images = data_csv['patientId'].unique().tolist()
    shuffle(images)
    num_images = len(images)
    print(f'Dataset length: {len(data_csv)}, Unique entries: {num_images}')

    size = num_images // 10
    folds = []
    for i in range(10):
        start = i * size
        end = (i + 1) * size
        if i < 9:
            test = images[start:end]
        else:
            test = images[start:]
        train_fold = data_csv.loc[~data_csv['patientId'].isin(test)]  # type: pd.DataFrame
        test_fold = data_csv.loc[data_csv['patientId'].isin(test)]  # type: pd.DataFrame
        train_fold.to_csv(os.path.join(ratio_dir, f'pneumonia-train-{i}.csv'),
                          index=False, encoding='utf-8', sep=';')
        test_fold.to_csv(os.path.join(ratio_dir, f'pneumonia-test-{i}.csv'),
                         index=False, encoding='utf-8', sep=';')
        train_fold = train_fold.drop_duplicates('patientId')
        train_fold.to_csv(os.path.join(ratio_classification_dir, f'pneumonia-train-{i}.csv'),
                          index=False, encoding='utf-8', sep=';')
        test_fold = test_fold.drop_duplicates('patientId')
        test_fold.to_csv(os.path.join(ratio_classification_dir, f'pneumonia-test-{i}.csv'),
                         index=False, encoding='utf-8', sep=';')