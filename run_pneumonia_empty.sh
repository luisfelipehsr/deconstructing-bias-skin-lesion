#!/bin/bash
DEVICE=0
BASE=1
TRAIN_DIR='pneumonia/images/empty'
CSV_DIR='pneumonia-csv/10fold-classification'

# trains ignoring the number 0 fold
for i in 0
do
    python3 train_sacred_csv.py with train_root="${TRAIN_DIR}" train_csv="${CSV_DIR}/pneumonia-train-${i}.csv" device=${DEVICE} id_col='patientId' class_col='Target' --name "sacred-pneumonia-empty-${i}"
    python3 test_csv.py "results-sacred/$((BASE + i))/checkpoints/model_best.pth" "${TRAIN_DIR}" "${CSV_DIR}/pneumonia-test-${i}.csv" --device ${DEVICE} --id_field 'patientId' --target_field 'Target' -n 50 -p > "results-sacred/$((BASE + i))/test_best_all.txt"
done
