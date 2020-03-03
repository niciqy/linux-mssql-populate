# SQL Server Command Line Tools
FROM mcr.microsoft.com/mssql/server:2019-GA-ubuntu-16.04


RUN mkdir -p /tmp/dev
COPY ./bin /app/bin

CMD [ "/app/bin/refresh-db.sh" ]
