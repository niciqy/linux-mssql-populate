# Linux MsSQL populate DB from scripts

In development environment, sometimes we want to have a SQL server up with tests data. This docker makes it easy by runing all `.sql` scripts in a given folder.

This docker image will
- Start SQL server
- load all SQL scripts, in alphabetical order in `/app/sql` folder

## Getting Started

There are two ways to use this image. Either way you choose, you will need to set the mounting volume to `/app/sql`. The image will run all `*.sql` files in in alphabetical order.

#### Docker-compose

```
version: "3.7"
services:
  db:
    image: "niciqy/mssql-linux-script-load"
    environment:
        SA_PASSWORD: "Your_password123"
        ACCEPT_EULA: "Y"
    volumes:
      - /path/to/my/sql/folder:/app/sql
```
#### Docker cmd

```
docker run  \
  -e ACCEPT_EULA=Y \
  -e SA_PASSWORD=Your_password123 \
  -v  /path/to/my/sql/folder:/app/sql \
  --name amazing_sql \
  niciqy/mssql-linux-script-load
  ```
