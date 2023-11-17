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

                ##         .
            ## ## ##        ==
        ## ## ## ## ##    ===
    /"""""""""""""""""\___/ ===
~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
    \______ o           __/
        \    \         __/
        \____\_______/             
   __  __          __      __                   
  / / / /___  ____/ /___ _/ /____  _____        
 / / / / __ \/ __  / __ `/ __/ _ \/ ___/        
/ /_/ / /_/ / /_/ / /_/ / /_/  __/ /            
\____/ .___/\__,_/\__,_/\__/\___/_/             
    /_/                                         

EOT
}

header

echo -e "${BOLD_MAGENTA}Download the latest docker-compose.yml from GitHub${RESET}"
curl -O https://raw.githubusercontent.com/gantich/gantich.homelab/master/docker-compose.yaml

if [ "$(docker ps -aq)" ]; then
    echo -e "${BOLD_MAGENTA}Stop all running containers${RESET}"
    docker stop $(docker ps -aq)

    echo -e "${BOLD_MAGENTA}Remove all containers${RESET}"
    docker rm $(docker ps -aq)
else
    echo -e "${BOLD_MAGENTA}No running containers to stop.${RESET}"
fi

echo -e "${BOLD_MAGENTA}Pull the latest images for all containers${RESET}"
docker compose pull

echo -e "${BOLD_MAGENTA}Recreate and start all containers${RESET}"
docker compose up -d
