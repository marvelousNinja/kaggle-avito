#!/bin/bash
set -e

mkdir -p ~/.kaggle
cp kaggle.json ~/.kaggle
cd ./data

files_to_download=(
    sample_submission.csv
    periods_test.csv.zip
    periods_train.csv.zip
    test.csv.zip
    test_active.csv.zip
    train.csv.zip
    train_active.csv.zip
    # TODO AS: Put those on hold for now - over 60 GB
    # test_jpg.zip
    # train_jpg.zip
)

for filename in "${files_to_download[@]}"
do
    kaggle competitions download -w -c avito-demand-prediction -f "${filename}"
    if [[ $filename =~ .zip ]]
    then
    unzip -o "${filename}"
    fi
done
