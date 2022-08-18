#! /bin/bash
set -e

if [ -d "$AIRFLOW_GIT_PATH" ]
then
    cd $AIRFLOW_GIT_PATH
else
    git clone -b $AIRFLOW_GIT_BRANCH $GIT_REPO_FULL $AIRFLOW_GIT_PATH
    cd $AIRFLOW_GIT_PATH
fi
while :
do
    git pull
    sleep "$SLEEP_TIME"
    if [ -n "$STOP" ]
    then
        exit 0
    fi
done
