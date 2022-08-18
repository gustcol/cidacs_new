#! /bin/bash
set -e

cd /opt/spark/ && ./sbin/start-master.sh && ./sbin/start-worker.sh spark://$HOSTNAME:7077

exec /usr/bin/dumb-init -- /entrypoint "$@"
