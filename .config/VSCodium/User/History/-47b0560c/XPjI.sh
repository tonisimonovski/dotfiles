    # Backup your .dotfiles with a simple bash script

#   Create a folder for the backup

mkdir my-dotfiles

#   Initialize git

git init

#   Create file list 

Create a file named backup.conf at the root of the folder.
In this file we need to list out all the files & folders we need to backup. eg:
~/.gitconfig
~/.profile
~/.vimrc
~/.xinitrc
~/.zshrc
Our backup script will loop through the items and copy everything into respective
folders.

#   Create script

Create a file named backup.sh at the root of the folder.
This is our script file. Copy the content below and paste it inside the file.

###################################################################################

#!/bin/sh

# This script copy files mentioned inside `backup.conf` to the root of the project.
# file to look for the paths to backup.

backupPaths="./backup.conf"
# home directory path.
homeDirectory=~
# same line identifier to echo in the same line.
sameLine="\e[1A\e[K"
echo "�
� Clearing configurations directory..."
# removing the folder with exsiting contents. we have git version anyway!
rm -rf configurations
# creating it again for backup.
mkdir configurations
sleep 1
echo -e "$sameLine�
� Configurations directory cleared."
sleep 1
echo -e "$sameLine�
� Starting backup..."
sleep 1
# looping through the list & avoiding the empty spaces
sed '/^[ \t]*$/d' $backupPaths | while read filePath; do
echo -e "$sameLine�
� Copying: $filePath"
# find & replace for ~ with home path
findThis="~/"
replaceWith="$homeDirectory/"
originalFile="${filePath//${findThis}/${replaceWith}}"
# copying the files
cp --parents --recursive $originalFile ./configurations
sleep 0.05
done
git add .
echo -e "$sameLine�
� Backup finished! You can review & commit your changes."


###################################################################################

#   Make the script executable

chmod +x ./backup.sh

# Commit all changes

git add .
git commit -m "initial commit"

#   Run script

./backup.sh

From now on, you can just run the script file whenever you need. After you run the
backup script, all the files & folders mentioned inside the backup.conf file will be
copied into configurations folder. Commit and push the changes to your remote
repository.
� Make sure you are not adding any confidential files or folders to backup.conf
file. eg: .ssh or private keys.
Checkout below repository to see complete code. There is a install.sh script in the
root which is made for Arch Linux systems. Feel free to fork the repository and make
changes according to your needs.
