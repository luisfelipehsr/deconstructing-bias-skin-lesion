#!/bin/bash
DEVICE=0
BASE=1
TRAIN_DIR='pneumonia-bbox70-single'

# train and test
for i in 0 1 2 3 4 5 6 7 8 9
do
    python3 train_sacred_csv.py with train_root="${TRAIN_DIR}" train_csv="pneumonia-csv/10fold/pneumonia-train-${i}.csv" device=${DEVICE} id_col='patientId' class_col='Target' --name sacred-pneumonia-rgb-7030-nodup
    python3 test_csv.py "results-sacred/$((BASE + i))/checkpoints/model_best.pth" "${TRAIN_DIR}" "pneumonia-csv/10fold/pneumonia-test-${i}.csv" --device ${DEVICE} --id_field 'patientId' --target_field 'Target' -n 50 -p > "results-sacred/$((BASE + i))/auc_test_best_all.txt"
done
