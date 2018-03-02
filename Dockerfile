FROM postgres:9.6
COPY ./docker-entrypoint-initdb.d/create-db.sh /docker-entrypoint-initdb.d/create-db.sh
