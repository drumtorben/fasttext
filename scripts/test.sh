#!/usr/bin/env bash
# Author: Torben Windler
#

source scripts/normalize.sh

RESULTDIR=result
DATADIR=data

mkdir -p "${RESULTDIR}"
mkdir -p "${DATADIR}"

echo "normalizing text ..."
cat "${DATADIR}/test.txt" | normalize_text > "${DATADIR}/prep_test.txt"

echo "testing ..."
./fasttext test "${RESULTDIR}/model.bin" "${DATADIR}/prep_test.txt"

echo "finished!"