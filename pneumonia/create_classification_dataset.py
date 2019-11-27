import pandas as pd
import os

objects_dir = '10fold'
classification_dir = '10fold-classification'
train_name = 'pneumonia-train-{}.csv'
test_name = 'pneumonia-test-{}.csv'

for i in range(10):
    for csv in [train_name, test_name]:
        csv_name = csv.format(i)
        objects_path = os.path.join(objects_dir, csv_name)
        data = pd.read_csv(objects_path, sep=';')
        data = data[['patientId', 'Target']].drop_duplicates(subset=['patientId'])
        classification_path = os.path.join(classification_dir, csv_name)
        data.to_csv(classification_path, sep=';', encoding='utf-8')
