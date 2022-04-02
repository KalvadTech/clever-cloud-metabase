#!/usr/bin/env bash
set -e
set -x
[ -z "$APP_HOME" ] && export APP_HOME=$(pwd)
[ -z "$METABASE_VERSION" ] && export METABASE_VERSION="0.42.3"
[ -z "$MB_ENCRYPTION_SECRET_KEY" ] && echo "MB_ENCRYPTION_SECRET_KEY is missing!" && exit
[ -z "$CC_RUN_COMMAND" ] && echo "CC_RUN_COMMAND is missing!" && exit

export MB_DB_DBNAME=${POSTGRESQL_ADDON_DB}
export MB_DB_HOST=${POSTGRESQL_ADDON_HOST}
export MB_DB_PASS=${POSTGRESQL_ADDON_PASSWORD}
export MB_DB_PORT=${POSTGRESQL_ADDON_PORT}
export MB_DB_TYPE=postgres
export MB_DB_USER=${POSTGRESQL_ADDON_USER}
export MB_JETTY_PORT=${PORT}

java -jar metabase.jar
