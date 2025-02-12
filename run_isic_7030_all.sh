#!/bin/bash
DEVICE=0
python3 train_sacred_csv.py with train_root=isic-rgb train_csv=isic-csv/10fold/isic-train-0.csv device="${DEVICE}" --name sacred-isic-rgb-7030-nodup
python3 train_sacred_csv.py with train_root=isic-rgb train_csv=isic-csv/10fold/isic-train-1.csv device="${DEVICE}" --name sacred-isic-rgb-7030-nodup
python3 train_sacred_csv.py with train_root=isic-rgb train_csv=isic-csv/10fold/isic-train-2.csv device="${DEVICE}" --name sacred-isic-rgb-7030-nodup
python3 train_sacred_csv.py with train_root=isic-rgb train_csv=isic-csv/10fold/isic-train-3.csv device="${DEVICE}" --name sacred-isic-rgb-7030-nodup
python3 train_sacred_csv.py with train_root=isic-rgb train_csv=isic-csv/10fold/isic-train-4.csv device="${DEVICE}" --name sacred-isic-rgb-7030-nodup
python3 train_sacred_csv.py with train_root=isic-rgb train_csv=isic-csv/10fold/isic-train-5.csv device="${DEVICE}" --name sacred-isic-rgb-7030-nodup
python3 train_sacred_csv.py with train_root=isic-rgb train_csv=isic-csv/10fold/isic-train-6.csv device="${DEVICE}" --name sacred-isic-rgb-7030-nodup
python3 train_sacred_csv.py with train_root=isic-rgb train_csv=isic-csv/10fold/isic-train-7.csv device="${DEVICE}" --name sacred-isic-rgb-7030-nodup
python3 train_sacred_csv.py with train_root=isic-rgb train_csv=isic-csv/10fold/isic-train-8.csv device="${DEVICE}" --name sacred-isic-rgb-7030-nodup
python3 train_sacred_csv.py with train_root=isic-rgb train_csv=isic-csv/10fold/isic-train-9.csv device="${DEVICE}" --name sacred-isic-rgb-7030-nodup

python3 test_csv.py results-sacred/361/checkpoints/model_best.pth isic-rgb/ isic-csv/10fold/isic-test-0.csv --device "${DEVICE}" -n 50 -p > results-sacred/361/auc_test_best_all.txt
python3 test_csv.py results-sacred/362/checkpoints/model_best.pth isic-rgb/ isic-csv/10fold/isic-test-1.csv --device "${DEVICE}" -n 50 -p > results-sacred/362/auc_test_best_all.txt
python3 test_csv.py results-sacred/363/checkpoints/model_best.pth isic-rgb/ isic-csv/10fold/isic-test-2.csv --device "${DEVICE}" -n 50 -p > results-sacred/363/auc_test_best_all.txt
python3 test_csv.py results-sacred/364/checkpoints/model_best.pth isic-rgb/ isic-csv/10fold/isic-test-3.csv --device "${DEVICE}" -n 50 -p > results-sacred/364/auc_test_best_all.txt
python3 test_csv.py results-sacred/365/checkpoints/model_best.pth isic-rgb/ isic-csv/10fold/isic-test-4.csv --device "${DEVICE}" -n 50 -p > results-sacred/365/auc_test_best_all.txt
python3 test_csv.py results-sacred/366/checkpoints/model_best.pth isic-rgb/ isic-csv/10fold/isic-test-5.csv --device "${DEVICE}" -n 50 -p > results-sacred/366/auc_test_best_all.txt
python3 test_csv.py results-sacred/367/checkpoints/model_best.pth isic-rgb/ isic-csv/10fold/isic-test-6.csv --device "${DEVICE}" -n 50 -p > results-sacred/367/auc_test_best_all.txt
python3 test_csv.py results-sacred/368/checkpoints/model_best.pth isic-rgb/ isic-csv/10fold/isic-test-7.csv --device "${DEVICE}" -n 50 -p > results-sacred/368/auc_test_best_all.txt
python3 test_csv.py results-sacred/369/checkpoints/model_best.pth isic-rgb/ isic-csv/10fold/isic-test-8.csv --device "${DEVICE}" -n 50 -p > results-sacred/369/auc_test_best_all.txt
python3 test_csv.py results-sacred/370/checkpoints/model_best.pth isic-rgb/ isic-csv/10fold/isic-test-9.csv --device "${DEVICE}" -n 50 -p > results-sacred/370/auc_test_best_all.txt


# BACKGROUND

python3 train_sacred_csv.py with train_root=isic-background train_csv=isic-csv/10fold/isic-train-0.csv device="${DEVICE}" --name sacred-isic-background-7030-nodup
python3 train_sacred_csv.py with train_root=isic-background train_csv=isic-csv/10fold/isic-train-1.csv device="${DEVICE}" --name sacred-isic-background-7030-nodup
python3 train_sacred_csv.py with train_root=isic-background train_csv=isic-csv/10fold/isic-train-2.csv device="${DEVICE}" --name sacred-isic-background-7030-nodup
python3 train_sacred_csv.py with train_root=isic-background train_csv=isic-csv/10fold/isic-train-3.csv device="${DEVICE}" --name sacred-isic-background-7030-nodup
python3 train_sacred_csv.py with train_root=isic-background train_csv=isic-csv/10fold/isic-train-4.csv device="${DEVICE}" --name sacred-isic-background-7030-nodup
python3 train_sacred_csv.py with train_root=isic-background train_csv=isic-csv/10fold/isic-train-5.csv device="${DEVICE}" --name sacred-isic-background-7030-nodup
python3 train_sacred_csv.py with train_root=isic-background train_csv=isic-csv/10fold/isic-train-6.csv device="${DEVICE}" --name sacred-isic-background-7030-nodup
python3 train_sacred_csv.py with train_root=isic-background train_csv=isic-csv/10fold/isic-train-7.csv device="${DEVICE}" --name sacred-isic-background-7030-nodup
python3 train_sacred_csv.py with train_root=isic-background train_csv=isic-csv/10fold/isic-train-8.csv device="${DEVICE}" --name sacred-isic-background-7030-nodup
python3 train_sacred_csv.py with train_root=isic-background train_csv=isic-csv/10fold/isic-train-9.csv device="${DEVICE}" --name sacred-isic-background-7030-nodup

python3 test_csv.py results-sacred/371/checkpoints/model_best.pth isic-background/ isic-csv/10fold/isic-test-0.csv --device "${DEVICE}" -n 50 -p > results-sacred/371/auc_test_best_all.txt
python3 test_csv.py results-sacred/372/checkpoints/model_best.pth isic-background/ isic-csv/10fold/isic-test-1.csv --device "${DEVICE}" -n 50 -p > results-sacred/372/auc_test_best_all.txt
python3 test_csv.py results-sacred/373/checkpoints/model_best.pth isic-background/ isic-csv/10fold/isic-test-2.csv --device "${DEVICE}" -n 50 -p > results-sacred/373/auc_test_best_all.txt
python3 test_csv.py results-sacred/374/checkpoints/model_best.pth isic-background/ isic-csv/10fold/isic-test-3.csv --device "${DEVICE}" -n 50 -p > results-sacred/374/auc_test_best_all.txt
python3 test_csv.py results-sacred/375/checkpoints/model_best.pth isic-background/ isic-csv/10fold/isic-test-4.csv --device "${DEVICE}" -n 50 -p > results-sacred/375/auc_test_best_all.txt
python3 test_csv.py results-sacred/376/checkpoints/model_best.pth isic-background/ isic-csv/10fold/isic-test-5.csv --device "${DEVICE}" -n 50 -p > results-sacred/376/auc_test_best_all.txt
python3 test_csv.py results-sacred/377/checkpoints/model_best.pth isic-background/ isic-csv/10fold/isic-test-6.csv --device "${DEVICE}" -n 50 -p > results-sacred/377/auc_test_best_all.txt
python3 test_csv.py results-sacred/378/checkpoints/model_best.pth isic-background/ isic-csv/10fold/isic-test-7.csv --device "${DEVICE}" -n 50 -p > results-sacred/378/auc_test_best_all.txt
python3 test_csv.py results-sacred/379/checkpoints/model_best.pth isic-background/ isic-csv/10fold/isic-test-8.csv --device "${DEVICE}" -n 50 -p > results-sacred/379/auc_test_best_all.txt
python3 test_csv.py results-sacred/380/checkpoints/model_best.pth isic-background/ isic-csv/10fold/isic-test-9.csv --device "${DEVICE}" -n 50 -p > results-sacred/380/auc_test_best_all.txt

# BBOX

python3 train_sacred_csv.py with train_root=isic-bbox train_csv=isic-csv/10fold/isic-train-0.csv device="${DEVICE}" --name sacred-isic-bbox-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox train_csv=isic-csv/10fold/isic-train-1.csv device="${DEVICE}" --name sacred-isic-bbox-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox train_csv=isic-csv/10fold/isic-train-2.csv device="${DEVICE}" --name sacred-isic-bbox-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox train_csv=isic-csv/10fold/isic-train-3.csv device="${DEVICE}" --name sacred-isic-bbox-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox train_csv=isic-csv/10fold/isic-train-4.csv device="${DEVICE}" --name sacred-isic-bbox-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox train_csv=isic-csv/10fold/isic-train-5.csv device="${DEVICE}" --name sacred-isic-bbox-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox train_csv=isic-csv/10fold/isic-train-6.csv device="${DEVICE}" --name sacred-isic-bbox-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox train_csv=isic-csv/10fold/isic-train-7.csv device="${DEVICE}" --name sacred-isic-bbox-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox train_csv=isic-csv/10fold/isic-train-8.csv device="${DEVICE}" --name sacred-isic-bbox-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox train_csv=isic-csv/10fold/isic-train-9.csv device="${DEVICE}" --name sacred-isic-bbox-7030-nodup

python3 test_csv.py results-sacred/381/checkpoints/model_best.pth isic-bbox/ isic-csv/10fold/isic-test-0.csv --device "${DEVICE}" -n 50 -p > results-sacred/381/auc_test_best_all.txt
python3 test_csv.py results-sacred/382/checkpoints/model_best.pth isic-bbox/ isic-csv/10fold/isic-test-1.csv --device "${DEVICE}" -n 50 -p > results-sacred/382/auc_test_best_all.txt
python3 test_csv.py results-sacred/383/checkpoints/model_best.pth isic-bbox/ isic-csv/10fold/isic-test-2.csv --device "${DEVICE}" -n 50 -p > results-sacred/383/auc_test_best_all.txt
python3 test_csv.py results-sacred/384/checkpoints/model_best.pth isic-bbox/ isic-csv/10fold/isic-test-3.csv --device "${DEVICE}" -n 50 -p > results-sacred/384/auc_test_best_all.txt
python3 test_csv.py results-sacred/385/checkpoints/model_best.pth isic-bbox/ isic-csv/10fold/isic-test-4.csv --device "${DEVICE}" -n 50 -p > results-sacred/385/auc_test_best_all.txt
python3 test_csv.py results-sacred/386/checkpoints/model_best.pth isic-bbox/ isic-csv/10fold/isic-test-5.csv --device "${DEVICE}" -n 50 -p > results-sacred/386/auc_test_best_all.txt
python3 test_csv.py results-sacred/387/checkpoints/model_best.pth isic-bbox/ isic-csv/10fold/isic-test-6.csv --device "${DEVICE}" -n 50 -p > results-sacred/387/auc_test_best_all.txt
python3 test_csv.py results-sacred/388/checkpoints/model_best.pth isic-bbox/ isic-csv/10fold/isic-test-7.csv --device "${DEVICE}" -n 50 -p > results-sacred/388/auc_test_best_all.txt
python3 test_csv.py results-sacred/389/checkpoints/model_best.pth isic-bbox/ isic-csv/10fold/isic-test-8.csv --device "${DEVICE}" -n 50 -p > results-sacred/389/auc_test_best_all.txt
python3 test_csv.py results-sacred/390/checkpoints/model_best.pth isic-bbox/ isic-csv/10fold/isic-test-9.csv --device "${DEVICE}" -n 50 -p > results-sacred/390/auc_test_best_all.txt

# BBOX 70

python3 train_sacred_csv.py with train_root=isic-bbox-squared-70 train_csv=isic-csv/10fold/isic-train-0.csv device="${DEVICE}" --name sacred-isic-bbox-squared-70-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox-squared-70 train_csv=isic-csv/10fold/isic-train-1.csv device="${DEVICE}" --name sacred-isic-bbox-squared-70-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox-squared-70 train_csv=isic-csv/10fold/isic-train-2.csv device="${DEVICE}" --name sacred-isic-bbox-squared-70-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox-squared-70 train_csv=isic-csv/10fold/isic-train-3.csv device="${DEVICE}" --name sacred-isic-bbox-squared-70-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox-squared-70 train_csv=isic-csv/10fold/isic-train-4.csv device="${DEVICE}" --name sacred-isic-bbox-squared-70-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox-squared-70 train_csv=isic-csv/10fold/isic-train-5.csv device="${DEVICE}" --name sacred-isic-bbox-squared-70-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox-squared-70 train_csv=isic-csv/10fold/isic-train-6.csv device="${DEVICE}" --name sacred-isic-bbox-squared-70-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox-squared-70 train_csv=isic-csv/10fold/isic-train-7.csv device="${DEVICE}" --name sacred-isic-bbox-squared-70-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox-squared-70 train_csv=isic-csv/10fold/isic-train-8.csv device="${DEVICE}" --name sacred-isic-bbox-squared-70-7030-nodup
python3 train_sacred_csv.py with train_root=isic-bbox-squared-70 train_csv=isic-csv/10fold/isic-train-9.csv device="${DEVICE}" --name sacred-isic-bbox-squared-70-7030-nodup

python3 test_csv.py results-sacred/391/checkpoints/model_best.pth isic-bbox-squared-70/ isic-csv/10fold/isic-test-0.csv --device "${DEVICE}" -n 50 -p > results-sacred/391/auc_test_best_all.txt
python3 test_csv.py results-sacred/392/checkpoints/model_best.pth isic-bbox-squared-70/ isic-csv/10fold/isic-test-1.csv --device "${DEVICE}" -n 50 -p > results-sacred/392/auc_test_best_all.txt
python3 test_csv.py results-sacred/393/checkpoints/model_best.pth isic-bbox-squared-70/ isic-csv/10fold/isic-test-2.csv --device "${DEVICE}" -n 50 -p > results-sacred/393/auc_test_best_all.txt
python3 test_csv.py results-sacred/394/checkpoints/model_best.pth isic-bbox-squared-70/ isic-csv/10fold/isic-test-3.csv --device "${DEVICE}" -n 50 -p > results-sacred/394/auc_test_best_all.txt
python3 test_csv.py results-sacred/395/checkpoints/model_best.pth isic-bbox-squared-70/ isic-csv/10fold/isic-test-4.csv --device "${DEVICE}" -n 50 -p > results-sacred/395/auc_test_best_all.txt
python3 test_csv.py results-sacred/396/checkpoints/model_best.pth isic-bbox-squared-70/ isic-csv/10fold/isic-test-5.csv --device "${DEVICE}" -n 50 -p > results-sacred/396/auc_test_best_all.txt
python3 test_csv.py results-sacred/397/checkpoints/model_best.pth isic-bbox-squared-70/ isic-csv/10fold/isic-test-6.csv --device "${DEVICE}" -n 50 -p > results-sacred/397/auc_test_best_all.txt
python3 test_csv.py results-sacred/398/checkpoints/model_best.pth isic-bbox-squared-70/ isic-csv/10fold/isic-test-7.csv --device "${DEVICE}" -n 50 -p > results-sacred/398/auc_test_best_all.txt
python3 test_csv.py results-sacred/399/checkpoints/model_best.pth isic-bbox-squared-70/ isic-csv/10fold/isic-test-8.csv --device "${DEVICE}" -n 50 -p > results-sacred/399/auc_test_best_all.txt
python3 test_csv.py results-sacred/400/checkpoints/model_best.pth isic-bbox-squared-70/ isic-csv/10fold/isic-test-9.csv --device "${DEVICE}" -n 50 -p > results-sacred/400/auc_test_best_all.txt
