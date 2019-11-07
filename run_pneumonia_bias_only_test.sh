#!/bin/bash
DEVICE=0
BASE=0
TRAIN_DIR='pneumonia-masks'

# test
for i in 0 1 2 3 4 5 6 7 8 9
do
    python3 test_csv.py "results-sacred/$((BASE + i))/checkpoints/model_best.pth" "${TRAIN_DIR}" "pneumonia-csv/10fold/pneumonia-test-${i}.csv" --device ${DEVICE} --id_field 'patientId' --target_field 'Target' -n 50 -p > "results-sacred/$((BASE + i))/auc_test_best_all.txt"
done
