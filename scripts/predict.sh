#!/usr/bin/env bash
# Author: Torben Windler
#

sh scripts/normalize.sh

RESULTDIR=result
DATADIR=data

mkdir -p "${RESULTDIR}"
mkdir -p "${DATADIR}"

echo "normalizing text ..."
cat "${DATADIR}/test.txt" | normalize_text > "${DATADIR}/prep_test.txt"

echo "predicting ..."
./fasttext predict "${RESULTDIR}/model.bin" "${DATADIR}/prep_test.txt" > "${RESULTDIR}/predict_test_result"

echo "finished - stored output in ${RESULTDIR} folder"