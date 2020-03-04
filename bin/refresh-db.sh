#!/bin/bash -eu

FILES=`find "/opt/sql" -type f  -name '*.sql' | sort -n`

/opt/mssql/bin/sqlservr &

until /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${SA_PASSWORD}" -Q "select 1"
do
  sleep 2
done

for f in $FILES; do
  /opt/mssql-tools/bin/sqlcmd \
     -S localhost -U SA -P "${SA_PASSWORD}" \
     -i ${f}
done

wait
