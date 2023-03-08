#!/bin/bash
set -e

LAST_NUMBER=$(cat number.txt)
export CURR_NUMBER=$(($LAST_NUMBER + 1))
export AVID=$1

echo -n $CURR_NUMBER >number.txt
envsubst <template.txt >index.html
git add number.txt index.html
git config --global user.name "AAO bot"
git config --global user.email "oss+aao@outv.im"
git commit -m "feat: update AAO #${CURR_NUMBER}"
