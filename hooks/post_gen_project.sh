#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${YELLOW}Running post hooks...${NC}"

poetry run ruff format . --quiet && poetry run ruff check . --quiet
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Hook executed successfully:${NC} Code formatted and checked."
else
    echo -e "${RED}Error:${NC} 'ruff' found issues."
    exit 1
fi

echo -e "${YELLOW}Installing dependencies...${NC}"
poetry run poetry install --all-groups --quiet

echo -e "${YELLOW}Checking for outdated dependencies...${NC}"
outdated=$(poetry run poetry show --top-level --outdated)

if [ -z "$outdated" ]; then
    echo -e "${GREEN}All dependencies are up to date.${NC}"
else
    echo -e "${RED}These dependencies need to be updated:${NC}"
    echo "$outdated" | awk -v red="$RED" -v green="$GREEN" -v yellow="$YELLOW" -v nc="$NC" \
    '{printf "%s%-20s %s%-10s %s-> %s%s\n", yellow, $1, red, $2, nc, green, $3, nc}'

    read -p "Do you want to update the outdated dependencies? [y/n] (y): " confirm
    confirm="${confirm:-y}"

    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}Updating outdated dependencies...${NC}"
        echo "$outdated" | while read -r line; do
            package=$(echo $line | awk '{print $1}')
            current_version=$(echo $line | awk '{print $2}')
            latest_version=$(echo $line | awk '{print $3}')

            echo -e "${YELLOW}Updating package:${NC} $package"
            poetry run poetry remove "$package" --quiet
            poetry run poetry add "$package@$latest_version" --quiet
            echo -e "${GREEN}Package $package updated to version $latest_version.${NC}"
        done
        echo -e "${GREEN}All outdated dependencies updated.${NC}"
    else
        echo -e "${YELLOW}Skipped dependency update.${NC}"
    fi
fi

echo -e "${YELLOW}Checking git repository...${NC}"

if [ ! -d ".git" ]; then
    git init &> /dev/null
    echo -e "${GREEN}Git repository initialized.${NC}"
else
    echo -e "${YELLOW}Git repository already initialized.${NC}"
fi

echo -e "${YELLOW}Installing pre-commit hooks...${NC}"
poetry run pre-commit install --install-hooks &> /dev/null
echo -e "${YELLOW}Updating pre-commit hooks...${NC}"
poetry run pre-commit autoupdate &> /dev/null
echo -e "${GREEN}Pre-commit hooks installed and updated.${NC}"

echo -e "${GREEN}Post hooks executed successfully.${NC}"
