#!/bin/bash

# Define variables
backup_dir="$HOME/dotfiles_backup"
dotfiles=".* *.sh *.md *.txt *.jpeg *.html"
hidden_folders=".config .themes scripts"

# Create backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Backup dotfiles
for file in $dotfiles; do
    if [ -f "$HOME/$file" ]; then
        cp "$HOME/$file" "$backup_dir"
        echo "Backed up $file to $backup_dir"
    
    fi
done

# Backup hidden folders
for folder in $hidden_folders; do
    if [ -d "$HOME/$folder" ]; then
        cp -r "$HOME/$folder" "$backup_dir"
        echo "Backed up $folder to $backup_dir"
    
    fi
done

echo "Backup completed!"

# Create an archive from the backup directory
tar -czf "$backup_dir.tar.gz" "$backup_dir"
echo "Created archive $backup_dir.tar.gz"


########################################################
 # End of script
 
 sudo apt autoremove

 printf "\e[1;32mYou are finished with install! Thanks you.\e[0m\n"


