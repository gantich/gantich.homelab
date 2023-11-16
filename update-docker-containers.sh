#!/bin/bash

echo "Download the latest docker-compose.yml from GitHub"
curl -O https://raw.githubusercontent.com/gantich/gantich.homelab/master/docker-compose.yaml

echo "Stop all running containers"
docker stop $(docker ps -aq)

echo "Remove all containers"
docker rm $(docker ps -aq)

echo "Pull the latest images for all containers"
docker compose pull

echo "Recreate and start all containers"
docker compose up -d
