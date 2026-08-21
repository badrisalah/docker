*This project has been created as part of the 42 curriculum by   sabadri .

# Description

Inception is a system administration and Docker project from the 42 curriculum.

The goal is to build a small infrastructure using **Docker Compose**, with each service running in its own container.

The infrastructure contains:

* **NGINX** — HTTPS web server and entry point.
* **WordPress + PHP-FPM** — website and application layer.
* **MariaDB** — database server.

Docker is used to isolate each service, manage dependencies, create a private network, and persist data using volumes.

The project uses custom Dockerfiles and scripts based on **Debian**, rather than relying on ready-made service images.

### Main Design Choices

* One dedicated container per service.
* Docker Compose to manage the infrastructure.
* A dedicated Docker network for communication between containers.
* Named volumes for persistent WordPress and MariaDB data.
* HTTPS configured with NGINX and TLS certificates.
* Environment variables are used for configuration, while sensitive credentials are handled separately where appropriate.

### Docker Concepts Comparison

| Topic                            | Choice                                                              | Reason                                                                                                                              |
| -------------------------------- | ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Virtual Machines vs Docker       | Docker                                                              | Containers are lighter and faster because they share the host kernel, while VMs require a complete guest OS.                        |
| Secrets vs Environment Variables | Secrets for sensitive data, environment variables for configuration | Secrets are designed to reduce exposure of passwords and other sensitive information.                                               |
| Docker Network vs Host Network   | Docker Network                                                      | Provides isolated communication between containers without exposing every service directly to the host.                             |
| Docker Volumes vs Bind Mounts    | Docker Volumes                                                      | Docker manages the storage location, making persistent application data easier to manage and less dependent on the host filesystem. |

# Instructions

Clone the repository and enter the project directory:

```bash
git clone <repository-url>
cd inception
```

Build and start the infrastructure:

```bash
make
```

Or directly with Docker Compose:

```bash
docker compose -f srcs/docker-compose.yml up --build -d
```

Check the running containers:

```bash
docker ps
```

Stop the infrastructure:

```bash
make down
```

Remove containers and volumes:

```bash
make clean
```

The website can then be accessed through the configured domain name over **HTTPS**.

# Resources

### Documentation

* Docker Book : Docker-deep-dive
* Docker documentation: https://docs.docker.com/
* Docker Compose documentation: https://docs.docker.com/compose/
* NGINX documentation: https://nginx.org/en/docs/
* MariaDB documentation: https://mariadb.com/kb/en/documentation/
* WordPress documentation: https://wordpress.org/documentation/
* Debian documentation: https://www.debian.org/doc/

### AI Usage

AI was used as a learning and development assistant during this project.

It was mainly used to:

* Troubleshoot Docker Compose and container configuration issues.
* Review and explain shell scripts and configuration files.
* Help structure and improve documentation.

The project architecture, configuration, implementation and final decisions were understood, tested and adapted by the project author.
