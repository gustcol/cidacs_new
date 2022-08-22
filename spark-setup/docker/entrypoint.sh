#! /bin/bash
set -e

if grep -q master "$@" ; then
    sh "$@"
else
    echo "opt/spark/sbin/start-worker.sh  spark://master-spark:7077"
    /opt/spark/sbin/start-worker.sh  spark://master-spark:7077
fi

while [ true ]
do
    tail -f /opt/spark/logs/*.out
done
