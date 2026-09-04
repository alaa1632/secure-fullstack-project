#!/bin/sh

set -e

if [ ! -f /run/secrets/database.env ]; then
    echo "ERROR: database.env not found"
    exit 1
fi

. /run/secrets/database.env

export POSTGRES_USER="$DB_USER"
export POSTGRES_PASSWORD="$DB_PASSWORD"
export POSTGRES_DB="$DB_NAME"

exec docker-entrypoint.sh postgres
