#!/usr/bin/env bash
# Author: Torben Windler
#

myshuf() {
  perl -MList::Util=shuffle -e 'print shuffle(<>);' "$@";
}

normalize_text() {
  tr '[:upper:]' '[:lower:]' | sed -e 's/^/__label__/g' | \
    sed -e "s/'/ ' /g" -e 's/"//g' -e 's/\./ \. /g' -e 's/<br \/>/ /g' \
        -e 's/,/ , /g' -e 's/(/ ( /g' -e 's/)/ ) /g' -e 's/\!/ \! /g' \
        -e 's/\?/ \? /g' -e 's/\;/ /g' -e 's/\:/ /g' | tr -s " " | myshuf
}

RESULTDIR=result
DATADIR=data

mkdir -p "${RESULTDIR}"
mkdir -p "${DATADIR}"

echo "normalizing text ..."
cat "${DATADIR}/test.txt" | normalize_text > "${DATADIR}/prep_test.txt"

echo "predicting ..."
./fasttext predict "${RESULTDIR}/model.bin" "${DATADIR}/prep_test.txt" > "${RESULTDIR}/predict_test_result"

echo "finished - stored output in ${RESULTDIR} folder"