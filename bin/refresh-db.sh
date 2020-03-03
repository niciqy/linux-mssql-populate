#!/bin/bash -eu

FILES=`find "/app/sql" -type f`

/opt/mssql/bin/sqlservr &

for f in $FILES; do
  until /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${SA_PASSWORD}" -Q "select 1"
  do
    sleep 2
  done

  /opt/mssql-tools/bin/sqlcmd \
     -S localhost -U SA -P "${SA_PASSWORD}" \
     -i ${f}

done
wait
