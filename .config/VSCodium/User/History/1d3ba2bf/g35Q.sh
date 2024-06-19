#!/bin/bash

# Define variables
backup_dir="$HOME/dotfiles_backup"
dotfiles=".*.* *.sh mydotfiles_backup.sh bookmarks.html"
hidden_folders=".config .themes scripts"

# Create backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Backup dotfiles
for file in $dotfiles; do
    if [ -f "$HOME/$file" ]; then
        cp "$HOME/$file" "$backup_dir"
        echo "Backed up $file to $backup_dir"
    else
        echo "No $file found in home directory, skipping..."
    fi
done

# Backup hidden folders
for folder in $hidden_folders; do
    if [ -d "$HOME/$folder" ]; then
        cp -r "$HOME/$folder" "$backup_dir"
        echo "Backed up $folder to $backup_dir"
    else
        echo "No $folder found in home directory, skipping..."
    fi
done

echo "Backup completed!"

########################################################
 # End of script
 
 sudo apt autoremove

 printf "\e[1;32mYou are finished with install! Thanks you.\e[0m\n"


