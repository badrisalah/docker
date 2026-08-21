NAME = inception
COMPOSE = docker compose -f srcs/docker-compose.yml

all:
	mkdir -p /home/sabadri/data/mariadb
	mkdir -p /home/sabadri/data/wordpress
	$(COMPOSE) up --build -d

build:
	$(COMPOSE) build

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down -v

re:
	$(COMPOSE) down
	$(COMPOSE) up --build -d

