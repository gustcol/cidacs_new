#! /bin/bash
set -e

if [[ "$@" == "master" ]]
then
        /opt/spark/sbin/start-master.sh
else
        /opt/spark/sbin/start-worker.sh spark://master-spark:7077
fi

while [ true ]
do
    tail -f /opt/spark/logs/*.out
done
