# Inception Study Notes

> Goal: Understand every component of the Inception project from first principles.

---

# Vitual Machine vs Containers
Containers and virtual machines have similar resource isolation and alsimple location benefits, but function differently because containers virtualize the operating system instead of hardware. Containers are more portable and efficient.

# Learning Roadmap

-> [+] done , [ ] not done , [-] still learning

* [+] Container
* [+] Image
* [ ] NameSpaces
* [ ] Cgroups
* [ ] Dockerfile
* [ ] Volumes
* [ ] Networks
* [ ] Docker Compose
* [ ] Environment Variables
* [ ] Nginx
* [ ] MariaDB
* [ ] WordPress
* [ ] TLS/SSL

---

# 1. Container

## Definition

What is a container?

* A live, isolated process running your code inside an environment
  that contains all of its required libraries and dependencies.
---


## Why do we need it?

* PORTABILITY : Make software run wherever docker is installed

* ISOLATION : No software dependencies collision happen

* CLEANUP : The container writes all its messy library files inside its own temporary filesystem , you delete the container it wipes away completely

---

## Mental Model

Example analogy:

* two bakers one in humid Florida and one in freezing Alaska—trying to bake the exact same cake using their own local ingredients and ovens. It comes out totally different for each of them.

---

## Important Commands

```bash
docker run
docker ps
docker stop
docker rm
```

### Notes

*

*

---

## Common Problems

*

*

---

## How Inception Uses It

*

*

---

## One-Sentence Summary

>

---

# 2. Image

## Definition

---

## Why do we need it?

---

## Relationship with Containers

```text
Image
  ↓
Container
```

Notes:

---

## Important Commands

```bash
docker images
docker build
docker pull
docker rmi
```

---

## Common Problems

*

*

---

## How Inception Uses It

*

*

---

## One-Sentence Summary

>

---

# 3. Dockerfile

## Definition

---

## Structure

```dockerfile
FROM

RUN

COPY

WORKDIR

CMD
```

---

## Common Instructions

### FROM

Purpose:

Example:

---

### RUN

Purpose:

Example:

---

### COPY

Purpose:

Example:

---

### WORKDIR

Purpose:

Example:

---

### CMD

Purpose:

Example:

---

## Build Process

```text
Dockerfile
    ↓
docker build
    ↓
Image
    ↓
docker run
    ↓
Container
```

---

## How Inception Uses It

*

*

---

## One-Sentence Summary

>

---

# 4. Volumes

## Definition

---

## Why are Volumes Needed?

*

*

*

---

## Lifecycle

```text
Container Deleted
        ↓
Volume Survives
```

---

## Commands

```bash
docker volume ls
docker volume inspect
docker volume rm
```

---

## Inception Usage

### MariaDB Data

Notes:

---

### WordPress Files

Notes:

---

## One-Sentence Summary

>

---

# 5. Networks

## Definition

---

## Why do Containers Need Networks?

*

*

*

---

## Example

```text
Nginx
  |
  |
WordPress
  |
  |
MariaDB
```

---

## Commands

```bash
docker network ls
docker network inspect
```

---

## Inception Usage

*

*

---

## One-Sentence Summary

>

---

# 6. Docker Compose

## Definition

---

## Why Use Compose?

Without Compose:

```bash
docker run ...
docker run ...
docker run ...
```

With Compose:

```bash
docker compose up
```

---

## Basic Structure

```yaml
services:

volumes:

networks:
```

---

## Important Commands

```bash
docker compose up
docker compose down
docker compose ps
docker compose logs
```

---

## Inception Usage

*

*

---

## One-Sentence Summary

>

---

# 7. Environment Variables

## Definition

---

## Why Use Them?

*

*

*

---

## Example

```env
DB_NAME=
DB_USER=
DB_PASSWORD=
```

---

## Security Notes

*

*

---

## Inception Usage

*

*

---

## One-Sentence Summary

>

---

# 8. Nginx

## What Is Nginx?

---

## Responsibilities

* Serve HTTPS
* Reverse Proxy
* Forward Requests

---

## Request Flow

```text
Browser
   ↓
Nginx
   ↓
WordPress
```

---

## Important Configuration Files

*

*

---

## Inception Usage

*

*

---

## One-Sentence Summary

>

---

# 9. MariaDB

## What Is MariaDB?

---

## What Data Does It Store?

*

*

*

---

## Architecture

```text
WordPress
    ↓
MariaDB
```

---

## Common Commands

```sql
SHOW DATABASES;
SHOW TABLES;
```

---

## Inception Usage

*

*

---

## One-Sentence Summary

>

---

# 10. WordPress

## What Is WordPress?

---

## Responsibilities

*

*

*

---

## Architecture

```text
User
 ↓
Nginx
 ↓
WordPress
 ↓
MariaDB
```

---

## Installation Notes

*

*

---

## Inception Usage

*

*

---

## One-Sentence Summary

>

---

# 11. TLS / SSL

## What Is TLS?

---

## Why Do We Need It?

*

*

*

---

## HTTP vs HTTPS

```text
HTTP  -> Not encrypted

HTTPS -> Encrypted
```

---

## Certificates

What is a certificate?

---

## Inception Usage

*

*

---

## One-Sentence Summary

>

---

# Final Architecture

```text
                 Browser
                    |
                    |
                 HTTPS
                    |
                    |
                 Nginx
                    |
                    |
               WordPress
                    |
                    |
                MariaDB

Volume #1 -> Database Data
Volume #2 -> WordPress Data

All Services Connected Through Docker Network
```

---

# Evaluation Questions

### Container vs Image

Answer:

---

### Volume vs Bind Mount

Answer:

---

### Why Docker Compose?

Answer:

---

### Why Nginx?

Answer:

---

### Why MariaDB?

Answer:

---

### Why TLS?

Answer:

---

### Full Request Flow

```text
Browser
  ↓
Nginx
  ↓
WordPress
  ↓
MariaDB
```

Explain:

---
