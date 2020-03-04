# SQL Server Command Line Tools
FROM mcr.microsoft.com/mssql/server:2019-GA-ubuntu-16.04


RUN mkdir -p /tmp/dev
COPY ./bin /opt/niciqy/bin

CMD [ "/opt/niciqy/bin/refresh-db.sh" ]
