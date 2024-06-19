#!/bin/bash

# Define variables
backup_dir="$HOME/dotfiles_backup"
dotfiles=(
    .bashrc
    .bash_profile
    .bash_aliases
    .vimrc
    # Add more dotfiles as needed
)

# Create backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Backup each dotfile
for file in "${dotfiles[@]}"; do
    if [ -f "$HOME/$file" ]; then
        echo "Backing up $file..."
        cp "$HOME/$file" "$backup_dir"
    else
        echo "Skipping $file - not found."
    fi
done

echo "Dotfiles backed up to $backup_dir"
