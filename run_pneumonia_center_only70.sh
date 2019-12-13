#!/bin/bash
DEVICE=0
BASE=1
TRAIN_DIR='pneumonia/images/center'
CSV_DIR='pneumonia/ratio'

# train

python3 train_sacred_csv.py with train_root="${TRAIN_DIR}/0.9" train_csv="${CSV_DIR}/0.7/10fold-classification/pneumonia-train-0.csv" device=${DEVICE} id_col='patientId' class_col='Target' --name "sacred-pneumonia-rgb-0.9"
python3 test_csv.py "results-sacred/1/checkpoints/model_best.pth" "${TRAIN_DIR}/0.9" "${CSV_DIR}/0.7/10fold-classification/pneumonia-test-0.csv" --device ${DEVICE} --id_field 'patientId' --target_field 'Target' -n 50 -p > "results-sacred/1/test_best_all.txt"

python3 train_sacred_csv.py with train_root="${TRAIN_DIR}/0.8" train_csv="${CSV_DIR}/0.7/10fold-classification/pneumonia-train-0.csv" device=${DEVICE} id_col='patientId' class_col='Target' --name "sacred-pneumonia-rgb-0.8"
python3 test_csv.py "results-sacred/2/checkpoints/model_best.pth" "${TRAIN_DIR}/0.8" "${CSV_DIR}/0.7/10fold-classification/pneumonia-test-0.csv" --device ${DEVICE} --id_field 'patientId' --target_field 'Target' -n 50 -p > "results-sacred/2/test_best_all.txt"

python3 train_sacred_csv.py with train_root="${TRAIN_DIR}/0.6" train_csv="${CSV_DIR}/0.7/10fold-classification/pneumonia-train-0.csv" device=${DEVICE} id_col='patientId' class_col='Target' --name "sacred-pneumonia-rgb-0.6"
python3 test_csv.py "results-sacred/3/checkpoints/model_best.pth" "${TRAIN_DIR}/0.6" "${CSV_DIR}/0.7/10fold-classification/pneumonia-test-0.csv" --device ${DEVICE} --id_field 'patientId' --target_field 'Target' -n 50 -p > "results-sacred/3/test_best_all.txt"
