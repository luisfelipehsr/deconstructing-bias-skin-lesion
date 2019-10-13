#!/usr/bin/env bash
DEVICE=3
for i in 0 1 2 3 4 5 6 7 8 9
do
    CUDA_VISIBLE_DEVICES=DEVICE python3 train_sacred_csv.py with train_root=pneumonia-rgb train_csv="pneumonia-csv/10fold/pneumonia-train-${i}.csv" --name sacred-pneumonia-rgb-7030-nodup
done

for i in 0 1 2 3 4 5 6 7 8 9
do
    CUDA_VISIBLE_DEVICES=DEVICE python3 test_csv.py "results-sacred/$((361 + i))/checkpoints/model_best.pth" pneumonia-rgb/ "pneumonia-csv/10fold/pneumonia-test-${i}.csv" -n 50 -p > "results-sacred/$((361 + i))/auc_test_best_all.txt"
done

# BACKGROUND
for i in 0 1 2 3 4 5 6 7 8 9
do
    CUDA_VISIBLE_DEVICES=DEVICE python3 train_sacred_csv.py with train_root=pneumonia-background train_csv="pneumonia-csv/10fold/pneumonia-train-${i}.csv" --name sacred-pneumonia-background-7030-nodup
done

for i in 0 1 2 3 4 5 6 7 8 9
do
    CUDA_VISIBLE_DEVICES=DEVICE python3 test_csv.py "results-sacred/$((371 + i))/checkpoints/model_best.pth" pneumonia-background/ "pneumonia-csv/10fold/pneumonia-test-${i}.csv" -n 50 -p > "results-sacred/$((371 + i))/auc_test_best_all.txt"
done

# BBOX
for i in 0 1 2 3 4 5 6 7 8 9
do
    CUDA_VISIBLE_DEVICES=DEVICE python3 train_sacred_csv.py with train_root=pneumonia-bbox train_csv="pneumonia-csv/10fold/pneumonia-train-${i}.csv" --name sacred-pneumonia-bbox-7030-nodup
done

for i in 0 1 2 3 4 5 6 7 8 9
do
    CUDA_VISIBLE_DEVICES=DEVICE python3 test_csv.py "results-sacred/$((381 + i))/checkpoints/model_best.pth" pneumonia-bbox/ "pneumonia-csv/10fold/pneumonia-test-${i}.csv" -n 50 -p > "results-sacred/$((381 + i))/auc_test_best_all.txt"
done

# BBOX 70
for i in 0 1 2 3 4 5 6 7 8 9
do
    CUDA_VISIBLE_DEVICES=DEVICE python3 train_sacred_csv.py with train_root=pneumonia-bbox-squared-70 "train_csv=pneumonia-csv/10fold/pneumonia-train-${i}.csv" --name sacred-pneumonia-bbox-squared-70-7030-nodup
done

for i in 0 1 2 3 4 5 6 7 8 9
do
    CUDA_VISIBLE_DEVICES=DEVICE python3 test_csv.py "results-sacred/$((391 + i))/checkpoints/model_best.pth" pneumonia-bbox-squared-70/ "pneumonia-csv/10fold/pneumonia-test-${i}.csv" -n 50 -p > "results-sacred/$((391 + i))/auc_test_best_all.txt"
done

for i in 0 1 2 3 4 5 6 7 8 9
do
    CUDA_VISIBLE_DEVICES=DEVICE python3 train_sacred_csv.py with train_root=pneumonia-label "train_csv=pneumonia-csv/10fold/pneumonia-train-${i}.csv" --name sacred-pneumonia-label-7030-nodup
done

for i in 0 1 2 3 4 5 6 7 8 9
do
    CUDA_VISIBLE_DEVICES=DEVICE python3 test_csv.py "results-sacred/$((401 + i))/checkpoints/model_best.pth" pneumonia-label/ "pneumonia-csv/10fold/pneumonia-test-${i}.csv" -n 50 -p > "results-sacred/$((401 + i))/auc_test_best_all.txt"
done

for i in 0 1 2 3 4 5 6 7 8 9
do
    CUDA_VISIBLE_DEVICES=DEVICE python3 train_sacred_csv.py with train_root=pneumonia-masked "train_csv=pneumonia-csv/10fold/pneumonia-train-${i}.csv" --name sacred-pneumonia-masked-7030-nodup
done

for i in 0 1 2 3 4 5 6 7 8 9
do
    CUDA_VISIBLE_DEVICES=DEVICE python3 test_csv.py "results-sacred/$((411 + i))/checkpoints/model_best.pth" pneumonia-masked/ "pneumonia-csv/10fold/pneumonia-test-${i}.csv" -n 50 -p > "results-sacred/$((411 + i))/auc_test_best_all.txt"
done
