#!/usr/bin/env bash
# Author: Torben Windler
#

source scripts/normalize.sh

RESULTDIR=result
DATADIR=data

mkdir -p "${RESULTDIR}"
mkdir -p "${DATADIR}"

echo "normalizing text ..."
cat "${DATADIR}/train.txt" | normalize_text > "${DATADIR}/prep_train.txt"

echo "training ..."
./fasttext supervised -input "${DATADIR}/prep_train.txt" -output "${RESULTDIR}/model" -dim 50 -lr 1 -wordNgrams 2 -minCount 1 -bucket 10000000 -epoch 10 -thread 4 -loss hs

echo "finished!"