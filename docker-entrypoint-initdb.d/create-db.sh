#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE system1;
    CREATE DATABASE system2;
    GRANT ALL PRIVILEGES ON DATABASE system1 TO postgres;
    GRANT ALL PRIVILEGES ON DATABASE system2 TO postgres;

EOSQL

psql -v ON_ERROR_STOP=1 --dbname "system1" --username "$POSTGRES_USER" <<-EOSQL
    CREATE TABLE test
    (
      uuid        UUID                        NOT NULL,
      description CHARACTER VARYING(100)      NULL,
      CONSTRAINT test_pkey PRIMARY KEY (uuid)
    );

EOSQL

psql -v ON_ERROR_STOP=1 --dbname "system2" --username "$POSTGRES_USER" <<-EOSQL
    CREATE TABLE test
    (
      uuid        UUID                        NOT NULL,
      description CHARACTER VARYING(100)      NULL,
      CONSTRAINT test_pkey PRIMARY KEY (uuid)
    );
EOSQL
