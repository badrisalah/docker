# Developer Documentation

## Prerequisites

* Linux VM
* Docker
* Docker Compose
* Make

## Setup

Configure `.env` and the required secrets.

Example:

```text
DOMAIN_NAME=
MYSQL_DATABASE=
MYSQL_USER=
MYSQL_PASSWORD=
MYSQL_ROOT_PASSWORD=
```

## Build & Run

```bash
make
```

Equivalent:

```bash
docker compose -f srcs/docker-compose.yml up --build -d
```

## Management

```bash
make down
make clean
docker compose -f srcs/docker-compose.yml ps
docker compose -f srcs/docker-compose.yml logs
```

## Data

Persistent data is stored in Docker volumes defined in `docker-compose.yml`.

List volumes:

```bash
docker volume ls
```

Remove volumes:

```bash
docker compose -f srcs/docker-compose.yml down -v
```

`down -v` deletes persistent data.
