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

printf "\n"
printf "                     ${RED} ##       ${GRAY} .         \n"
printf "               ${RED} ## ## ##      ${GRAY} ==         \n"
printf "             ${RED}## ## ## ##      ${GRAY}===         \n"
printf "         ${GRAY}/\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\\\___/ ===       \n"
printf "    ${BLUE}~~~ ${GRAY}{${BLUE}~~ ~~~~ ~~~ ~~~~ ~~ ~ ${GRAY}/  ===- ${BLUE}~~~${GRAY}\n"
printf "         \\\______${WHITE} o ${GRAY}         __/           \n"
printf "           \\\    \\\        __/            \n"
printf "            \\\____\\\______/               \n"
printf "${BOLD_MAGENTA}"
printf "   ______            __        _                  \n"
printf "  / ____/___  ____  / /_____ _(_)___  ___  _____ \n"
printf " / /   / __ \/ __ \/ __/ __ \`/ / __ \\\/ _ \\\/ ___/ \n"
printf "/ /___/ /_/ / / / / /_/ /_/ / / / / /  __/ /      \n"
printf "\____/\____/_/ /_/\__/\__,_/_/_/ /_/\___/_/       \n"
printf "     __  __          __      __                     \n"
printf "    / / / /___  ____/ /___ _/ /____  _____          \n"
printf "   / / / / __ \\\/ __  / __ \`/ __/ _ \/ ___/        \n"
printf "  / /_/ / /_/ / /_/ / /_/ / /_/  __/ /              \n"
printf "  \\\____/ .___/\\\__,_/\\\__,_/\\\__/\\\___/_/               \n"
printf "      /_/   \n"
printf "${RESET}                                         \n"      


echo "${BOLD_MAGENTA}Pull from GitHub${RESET}"
git pull origin master

# echo "${BOLD_MAGENTA}Download the latest docker-compose.yml from GitHub${RESET}"
# curl -O https://raw.githubusercontent.com/gantich/gantich.homelab/master/docker-compose.yaml

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

echo "${BOLD_MAGENTA}Prune all old images${RESET}"
docker image prune -f -a
