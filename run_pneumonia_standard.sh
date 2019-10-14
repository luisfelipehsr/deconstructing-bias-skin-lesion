#!/bin/bash
DEVICE=1
for i in 0 1 2 3 4 5 6 7 8 9
do
    python3 train_sacred_csv.py with train_root=pneumonia-rgb train_csv="pneumonia-csv/10fold/pneumonia-train-${i}.csv" device=${DEVICE} id_col='patiendId' class_col='Target' --name sacred-pneumonia-rgb-7030-nodup
done

for i in 0 1 2 3 4 5 6 7 8 9
do
    python3 test_csv.py "results-sacred/$((361 + i))/checkpoints/model_best.pth" pneumonia-rgb/ "pneumonia-csv/10fold/pneumonia-test-${i}.csv" device=${DEVICE} --id_field 'patiendId' --target_field 'Target' -n 50 -p > "results-sacred/$((361 + i))/auc_test_best_all.txt"
done
