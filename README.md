# Linux MsSQL populate DB from scripts

In development environment, sometimes we want our local docker SQL server to boot up with tests data. This docker makes it easy by running all `*.sql` scripts in a given folder.

This docker image will
- Start SQL server
- loads all SQL scripts, in alphabetical order in `/opt/sql` folder

## Getting Started

There are two ways to use this image. Either way you choose, you will need to set the mounting volume to `/opt/sql`. The image will run all `*.sql` files in in alphabetical order.

#### Docker-compose

```
version: "3.7"
services:
  db:
    image: "niciqy/linux-mssql-populate"
    environment:
        SA_PASSWORD: "Your_password123"
        ACCEPT_EULA: "Y"
    volumes:
      - /path/to/my/sql/folder:/opt/sql
```
#### Docker cmd

```
docker run  \
  -e ACCEPT_EULA=Y \
  -e SA_PASSWORD=Your_password123 \
  -v  /path/to/my/sql/folder:/opt/sql \
  --name amazing_sql \
  niciqy/linux-mssql-populate
  ```
