#!/bin/bash

RESET='\033[0m'
BOLD='\033[1m'

BLACK='\033[30m'
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
MAGENTA='\033[35m'
CYAN='\033[36m'
WHITE='\033[37m'
GRAY='\033[90m'

BOLD_BLACK="${BOLD}${BLACK}"
BOLD_RED="${BOLD}${RED}"
BOLD_GREEN="${BOLD}${GREEN}"
BOLD_YELLOW="${BOLD}${YELLOW}"
BOLD_BLUE="${BOLD}${BLUE}"
BOLD_MAGENTA="${BOLD}${MAGENTA}"
BOLD_CYAN="${BOLD}${CYAN}"
BOLD_WHITE="${BOLD}${WHITE}"
BOLD_GRAY="${BOLD}${GRAY}"

header() {
cat<<"EOT"
  ____            _        _                   _   _           _       _            
 / ___|___  _ __ | |_ __ _(_)_ __   ___ _ __  | | | |_ __   __| | __ _| |_ ___ _ __ 
| |   / _ \| '_ \| __/ _` | | '_ \ / _ \ '__| | | | | '_ \ / _` |/ _` | __/ _ \ '__|
| |__| (_) | | | | || (_| | | | | |  __/ |    | |_| | |_) | (_| | (_| | ||  __/ |   
 \____\___/|_| |_|\__\__,_|_|_| |_|\___|_|     \___/| .__/ \__,_|\__,_|\__\___|_|   
                                                    |_|                             
EOT
}

header

echo "${BOLD_MAGENTA}Download the latest docker-compose.yml from GitHub${RESET}"
curl -O https://raw.githubusercontent.com/gantich/gantich.homelab/master/docker-compose.yaml

if [ "$(docker ps -aq)" ]; then
    echo "${BOLD_MAGENTA}Stop all running containers${RESET}"
    docker stop $(docker ps -aq)

    echo "${BOLD_MAGENTA}Remove all containers${RESET}"
    docker rm $(docker ps -aq)
else
    echo "${BOLD_MAGENTA}No running containers to stop.${RESET}"
fi

echo "${BOLD_MAGENTA}Pull the latest images for all containers${RESET}"
docker compose pull

echo "${BOLD_MAGENTA}Recreate and start all containers${RESET}"
docker compose up -d
