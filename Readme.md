# Inception Study Notes

> Goal: Understand every component of the Inception project from first principles.

---

# Vitual Machine vs Containers
Containers and virtual machines have similar resource isolation and alsimple location benefits, but function differently because containers virtualize the operating system instead of hardware. Containers are more portable and efficient.

# Learning Roadmap

-> [+] done , [ ] not done , [-] still learning

* [+] Container
* [+] Image
* [+] NameSpaces
* [ ] Cgroups
* [+] Dockerfile
* [+] Volumes
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
```
What is a container?

* A live, isolated process running your code inside an environment
  that contains all of its required libraries and dependencies.
```
---


## Why do we need it?
```
* PORTABILITY : Make software run wherever docker is installed

* ISOLATION : No software dependencies collision happen

* CLEANUP : The container writes all its messy library files inside its own temporary filesystem , you delete the container it wipes away completely
```
---

## Mental Model
```
Example analogy:

* two bakers one in humid Florida and one in freezing Alaska—trying to bake the exact same cake using their own local ingredients and ovens. It comes out totally different for each of them.
```
---

## Important Commands

```bash
docker run : Creates/starts a container from an image

docker ps : gives you a quick status list of every active container,ID,name,ports,uptime

docker stop : Safely turns off a running container

docker rm/rmi : docker rm ONLY removes containers.

To remove an image, you must use docker "rmi"
```

### Notes

----- ADDITIONAL FLAGS------
```
* -d : (Detached mode): Runs the container in the background so your terminal stays free

* -p : (Port mapping): Maps a port on your Mac/computer to a port inside the container

* --name : Custom name
```
---

## Common Problems [-]

*

*

---

## How Inception Uses It [-]

*

*

---

## One-Sentence Summary [-]

>

---

# 2. Image

## Definition
```
* the blueprint of what the container will follow , or how the container will be insantiated
```
---

## Structure
```
1. Base OS Layer    --> Alpine Linux, Debian (Minimal OS)
2. Runtime Layer    --> Node.js, Python, PHP, Nginx
3. App Code Layer   --> Source code, files, dependencies
4. Config Layer     --> ENV, EXPOSE, CMD (How it runs)
```
---
## Why do we need it?
```
* NO IMAGE --> You have to install, configure, and debug everything manually on every single computer

* WITH IMAGE --> Download the blueprint, press start, and it runs everywhere identically
```
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

## How Inception Uses It

*

*

# 3. Dockerfile

## Definition
```
A Dockerfile is a plain text configuration file containing a sequential list of commands and instructions used by Docker to automatically build a custom Docker Image
```
---

## Structure

```dockerfile
FROM -> What base OS to start from

RUN -> What software to install

COPY -> What files to copy

WORKDIR -> creates a specific folder inside your 
            container and steps inside it (like cd /app),
            so all remaining commands happen in that one organized spot.

CMD -> What command to run when starting
```

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

>

---

# 4. Volumes

## Definition
```
A Volume is a persistent folder created on your host computer that is mounted (linked) directly into a container.
```

## Why are Volumes Needed?

* A Volume is a persistent storage box on your host machine that keeps your data safe, even when containers are stopped or destroyed.

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
docker volume ls -> List all volumes
docker volume inspect <volume name> -> View detailed info & storage path
docker volume rm <volume name -> remove a volume`
```

---

## Inception Usage

* data loss is an automatic fail. You must use two mandatory volumes to keep data safe across container restarts

### MariaDB Data

Stores all your dynamic website information, including user accounts, password hashes, blog posts, comments, and site configurations


* Default Container Path: /var/lib/mysql

* Host Path (Inception Rule): /home/login/data/mariadb
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
