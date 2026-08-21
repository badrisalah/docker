# User Documentation

## Services

The stack provides:

* **NGINX** — HTTPS web server.
* **WordPress** — website and admin panel.
* **MariaDB** — WordPress database.

## Start / Stop

Start:

```bash
make
```

Stop:

```bash
make down
```

Remove everything including volumes:

```bash
make clean
```

## Access

Website:

```text
https://sabadri.42
```

Admin panel:

```text
https://sabadri.42/wp-admin
```

## Credentials

Credentials are configured in the project's `.env` and/or secrets files.
Do not commit real credentials to Git.

## Check Services

```bash
docker compose -f srcs/docker-compose.yml ps
docker compose -f srcs/docker-compose.yml logs
```

All three services should be running without critical errors.

## Data

WordPress and MariaDB data are stored in Docker volumes and persist when containers are stopped.
