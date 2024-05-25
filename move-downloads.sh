#!/bin/bash

# Set the source and destination directories
source_directory="/mnt/data/downloads"
movies_directory="/mnt/data/media/movies"
series_directory="/mnt/data/media/series"

# Define array of folders to avoid
avoid_folders=("recycle" "radaar" "sonaar")

# ANSI color codes
NORMAL='\033[0m'
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
NC='\033[0m'  # No color

BOLD_BLACK="${BOLD}${BLACK}"
BOLD_RED="${BOLD}${RED}"
BOLD_GREEN="${BOLD}${GREEN}"
BOLD_YELLOW="${BOLD}${YELLOW}"
BOLD_BLUE="${BOLD}${BLUE}"
BOLD_MAGENTA="${BOLD}${MAGENTA}"
BOLD_CYAN="${BOLD}${CYAN}"
BOLD_WHITE="${BOLD}${WHITE}"
BOLD_GRAY="${BOLD}${GRAY}"
RESET="${NORMAL}${NC}"

# Function to display menu and process user choice
choose_action() {
    echo -e "${BOLD_MAGENTA}Choose an action for folder: $1${RESET}"
    echo -e "1. ${YELLOW}Do nothing${NC}"
    echo -e "2. ${GREEN}Move to movies${NC}"
    echo -e "3. ${GREEN}Move to series${NC}"
    echo -e "4. ${RED}Quit${NC}"
    read -p "Enter your choice (1/2/3/4): " choice

    case $choice in
        1) echo "Do nothing for $1";;
        2) move_folder "$1" "$movies_directory";;
        3) move_folder "$1" "$series_directory";;
        4) exit 0;;
        *) echo -e "${RED}Invalid choice. Please enter 1, 2, 3, or 4.${NC}";;
    esac
}

# Function to move folder to the specified directory
move_folder() {
    from="$1"
    to="$2"

    mv "$from" "$to"
    echo -e "Folder moved from ${YELLOW}$from${NC} to ${YELLOW}$to${NC}"
}

# Main script
cd "$source_directory"

# Loop through each folder in the source directory
for folder in */; do
    folder="${folder%/}"  # Remove trailing slash
    
    # Check if the folder is in the list of folders to avoid
    skip_folder=false
    for avoid_folder in "${avoid_folders[@]}"; do
        if [[ "$folder" == *"$avoid_folder"* ]]; then
            skip_folder=true
            break
        fi
    done
    
    if $skip_folder; then
        echo -e "Skipping folder ${RED}$folder${NC}"
        continue
    fi
    
    choose_action "$folder"
done
