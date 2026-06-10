#!/bin/bash

dependencies=("neovim" "hypr" "kitty" "neovim" "tmux" "waybar" "wofi" "zsh")

echo "Installing dependencies..."
for dependency in "${dependencies[@]}"; do
    echo "pacman -S $dependency"
done
echo "Completed installing dependencies."

echo "Moving files..."
echo "mv fastfetch $HOME/.config/fastfetch/"
echo "mv neovim $HOME/.config/nvim/"
echo "mv kitty $HOME/.config/kitty"
echo "mv hypr $HOME/.config/hypr"
echo "mv waybar $HOME/.config/waybar"
echo "mv wofi $HOME/.config/wofi"
echo "mv zsh/.zshrc $HOME/.zshrc"
echo "mv tmux/.tmux.conf $HOME/.tmux.conf"
echo "Completed moving files."
