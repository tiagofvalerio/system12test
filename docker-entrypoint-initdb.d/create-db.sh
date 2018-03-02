#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE system1;
    CREATE DATABASE system2;
    GRANT ALL PRIVILEGES ON DATABASE system1 TO postgres;
    GRANT ALL PRIVILEGES ON DATABASE system2 TO postgres;
EOSQL
