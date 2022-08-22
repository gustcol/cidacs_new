#! /bin/bash
set -e

exec "$@" && tail -f /opt/spark/logs/*.out
