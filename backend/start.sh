#!/bin/sh

set -e

if [ ! -f /run/secrets/database.env ]; then
    echo "ERROR: database.env not found"
    exit 1
fi

set -a
. /run/secrets/database.env
set +a

exec uvicorn app.main:app --host 0.0.0.0 --port 8000
