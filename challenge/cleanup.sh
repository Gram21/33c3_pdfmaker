#!/bin/bash

echo "$(date +"%T")   Cleanup script started."
while sleep 300; do
  echo "$(date +"%T")   Trying to delete old files"
  find tmp/ -mmin +5 \( -type f -o -type l -o -type d \) -a -not -path tmp/ -exec rm -rf {} \;
done