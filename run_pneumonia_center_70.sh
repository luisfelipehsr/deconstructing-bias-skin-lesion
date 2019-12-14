#!/bin/bash
DEVICE=0
BASE=1
TRAIN_DIR='pneumonia/images/center'
CSV_DIR='pneumonia/ratio'

# trains ignoring the number 0 fold
for i in 0 1 2 3 4 5 6 7 8
do
    python3 train_sacred_csv.py with train_root="${TRAIN_DIR}/0.7" train_csv="${CSV_DIR}/0.7/10fold-classification/pneumonia-train-$((i + 1)).csv" device=${DEVICE} id_col='patientId' class_col='Target' --name "sacred-pneumonia-rgb-0.7-$((i + 1))"
    python3 test_csv.py "results-sacred/$((BASE + i * 3))/checkpoints/model_best.pth" "${TRAIN_DIR}/0.7" "${CSV_DIR}/0.7/10fold-classification/pneumonia-test-$((i + 1)).csv" --device ${DEVICE} --id_field 'patientId' --target_field 'Target' -n 50 -p > "results-sacred/$((BASE + i * 3))/test_best_all.txt"

    python3 train_sacred_csv.py with train_root="${TRAIN_DIR}/0.8" train_csv="${CSV_DIR}/0.7/10fold-classification/pneumonia-train-$((i + 1)).csv" device=${DEVICE} id_col='patientId' class_col='Target' --name "sacred-pneumonia-rgb-0.8-$((i + 1))"
    python3 test_csv.py "results-sacred/$((BASE + 1 + i * 3))/checkpoints/model_best.pth" "${TRAIN_DIR}/0.8" "${CSV_DIR}/0.7/10fold-classification/pneumonia-test-$((i + 1)).csv" --device ${DEVICE} --id_field 'patientId' --target_field 'Target' -n 50 -p > "results-sacred/$((BASE + 1 + i * 3))/test_best_all.txt"

    python3 train_sacred_csv.py with train_root="${TRAIN_DIR}/0.9" train_csv="${CSV_DIR}/0.7/10fold-classification/pneumonia-train-$((i + 1)).csv" device=${DEVICE} id_col='patientId' class_col='Target' --name "sacred-pneumonia-rgb-0.9-$((i + 1))"
    python3 test_csv.py "results-sacred/$((BASE + 2 + i * 3))/checkpoints/model_best.pth" "${TRAIN_DIR}/0.9" "${CSV_DIR}/0.7/10fold-classification/pneumonia-test-$((i + 1)).csv" --device ${DEVICE} --id_field 'patientId' --target_field 'Target' -n 50 -p > "results-sacred/$((BASE + 2 + i * 3))/test_best_all.txt"
done
