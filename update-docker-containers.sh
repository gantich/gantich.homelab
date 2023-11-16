#!/bin/bash

# Download the latest docker-compose.yml from GitHub
curl -O https://raw.githubusercontent.com/your-username/your-repo/master/docker-compose.yml

# Stop and remove all running containers
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

# Pull the latest images for all containers
docker compose pull

# Recreate and start all containers
docker compose up -d
