# Variables

SRC := srcs/

COMPOSE_FILE := $(SRC)docker-compose.yml

all: down build up

# Build and start the Docker containers
up:
	docker-compose -f $(COMPOSE_FILE) up

build:
	docker-compose -f $(COMPOSE_FILE) build

# Stop and remove the Docker containers
down:
	docker-compose -f $(COMPOSE_FILE) down

# Clean up the Docker containers and volumes
clean:
	docker-compose -f $(COMPOSE_FILE) down -v