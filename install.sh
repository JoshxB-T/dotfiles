#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[31m'
NC='\033[0m'

PACKAGES=(
    "neovim"
    "hyprland"
    "kitty"
    "tmux"
    "waybar"
    "wofi"
    "zsh"
)

echo -e "${YELLOW}Installing packages...${NC}"
for PACKAGE in "${PACKAGES[@]}"; do
    if pacman -Qi ${PACKAGE} &> /dev/null ; then
        echo -e "${GREEN}[ALREADY INSTALLED]${NC} $PACKAGE is already present on the system."
    else
        echo "pacman -S -y $package"

        if [ $? -eq 1 ] ; then
            echo -e "${GREEN}[SUCCESS]${NC} $PACKAGE installed successfully."
        else
            echo -e "${RED}[ERROR]${NC} Failed to install $PACKAGE."
        fi
    fi
done
echo -e "${GREEN}Completed installing packages.${NC}\n"
echo -e "${YELLOW}Moving files...${NC}"
echo "mv fastfetch $HOME/.config/fastfetch/"
echo "mv neovim $HOME/.config/nvim/"
echo "mv kitty $HOME/.config/kitty"
echo "mv hypr $HOME/.config/hypr"
echo "mv waybar $HOME/.config/waybar"
echo "mv wofi $HOME/.config/wofi"
echo "mv zsh/.zshrc $HOME/.zshrc"
echo "mv tmux/.tmux.conf $HOME/.tmux.conf"
echo -e "${GREEN}Completed moving files.${NC}"
