#!/bin/bash

cd /home/pdfmaker/.chall/challenge
git fetch --all
git reset --hard origin/master

rm -f deploy_key* make_package.sh Dockerfile docker_*

echo "Starting nsjail"
screen -dmS pdfmaker ./nsjail_start.sh

echo "Starting cleanup script.."
nohup ./cleanup.sh > ./.cleanup_log 2>&1 &