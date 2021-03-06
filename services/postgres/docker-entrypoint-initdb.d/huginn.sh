#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER huginn;
    ALTER USER huginn WITH CREATEDB;

    CREATE DATABASE huginn;
    GRANT ALL PRIVILEGES ON DATABASE huginn TO huginn;
EOSQL
