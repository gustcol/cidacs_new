#! /bin/bash
set -e

sh "$@"
while [ true ]
do
    tail -f /opt/spark/logs/*.out
done
