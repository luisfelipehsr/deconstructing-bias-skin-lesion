#!/bin/bash
DEVICE=3
BASE=1
for i in 0 1 2 3 4 5 6 7 8 9
do
    python3 test_csv.py "results-sacred/$((BASE + i))/checkpoints/model_best.pth" pneumonia-rgb/ "pneumonia-csv/10fold/pneumonia-test-${i}.csv" --device ${DEVICE} --id_field 'patientId' --target_field 'Target' -n 50 -p > "results-sacred/$((BASE + i))/auc_test_best_all.txt"
done
