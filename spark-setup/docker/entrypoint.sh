#! /bin/bash
set -e

if grep -q master ; then
    sh "$@"
else
    sh "$@" $SPARK_MASTER
fi

while [ true ]
do
    tail -f /opt/spark/logs/*.out
done
