#! /bin/bash
set -e

exec /usr/bin/dumb-init -- /entrypoint.sh "$@"
