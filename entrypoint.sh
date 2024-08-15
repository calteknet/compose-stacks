#!/bin/bash

if [ "$RESET_DB" = "1" ]; then
    echo "Resetting database $DATABASE"
    dropdb -h $HOST -U $USER $DATABASE
    createdb -h $HOST -U $USER $DATABASE
fi

exec "$@"
