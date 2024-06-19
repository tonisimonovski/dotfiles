#!/usr/bin/env bash

# All in one install script i3WM on Debian minimal
# install i3wm with --aditional pack
# addet for ricing the theme

# Link to i3wm documentation: 
# https://i3wm.org/

# Download Media and volume keys snippet:
# https://faq.i3wm.org/question/3747/enabling-multimedia-keys/?answer=3759#post-id-3759

# Download Playerctl:
# https://github.com/acrisci/playerctl/...


# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Install packages after installing base Debian with no GUI

# Update packages list 
apt update -y 

# and update system
apt upgrade -y

# Install nala
apt install nala -y

# Install Rhthmbox: 
# sudo apt install rhythmbox

# xorg display server installation
sudo apt install -y xorg xserver-xorg xbacklight xbindkeys xinput

# build-essential If you do not plan to build Debian packages, you don't need this package. 
# Starting with dpkg (>= 1.14.18) this package is required for building Debian packages. 
sudo apt install -y build-essential

# xdg-user-dirs-update updates the current state of the users user-dirs.dir.
# xdg-user-dirs is a tool to help manage "well known" user directories like the desktop folder and the music folder.
xdg-user-dirs-update
mkdir ~/Oldconfig

# Tools/System
# dialog -  Displays user-friendly dialog boxes from shell scripts 
# mtolls - Tools for manipulating MSDOS files 
# dosfstools - utilities for making and checking MS-DOS FAT filesystems 
# acpi - displays information on ACPI devices 
# acpid - Advanced Configuration and Power Interface event daemon 
# gvfs-backedns -	userspace virtual filesystem
# xfce4-power-manager - power manager for Xfce desktop

# avahi-daemon - Avahi is a system which facilitates service discovery 
# on a local network via the mDNS/DNS-SD protocol suite.

# lxappearance - 	LXDE GTK+ theme switcher
# neofetch - Shows Linux System Information with Distribution Logo 
# btop - Modern and colorful command line resource monitor that shows usage and stats 


sudo apt install -y dialog mtools dosfstools acpi acpid gvfs-backends xfce4-power-manager 

# sudo apt install -y avahi-daemon 

sudo apt install lxappearance neofetch btop

#sudo systemctl enable avahi-daemon
#sudo systemctl enable acpid

# Network 
# network-manager - network management framework (daemon and userspace tools) 
# network-manager-gnome - network management framework (GNOME frontend) 
sudo apt install -y network-manager network-manager-gnome


# Thunar and accessories
sudo apt install -y thunar thunar-archive-plugin thunar-volman file-roller

# Terminal (eg. terminator,kitty,xfce4-terminal)
# sudo apt install -y kitty tilix 

# Sound packages
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa pamixer

# Browser Installation (eg. chromium, brave, firefox-esr, librewolf)
sudo apt install -y firefox-esr

# Desktop background browser/handler (feh --bg-fill /path/to/directory )

# sudo apt install -y nitrogen 
sudo apt install -y feh

# Fonts and icons for now
sudo apt install -y fonts-roboto 
sudo apt install -y fonts-recommended 
sudo apt install -y fonts-noto-color-emoji 
sudo apt install -y fonts-ubuntu 
sudo apt install -y fonts-font-awesome 
sudo apt install -y fonts-terminus 

# Papirus theme
sudo apt install -y papirus-icon-theme
# Install Papirus icon theme
wget -qO- https://git.io/papirus-icon-theme-install | sh

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls=exa -al --long --header --color=always --group-directories-first 
sudo apt install -y exa


# Printing and bluetooth (if needed)
# sudo apt install -y cups system-config-printer simple-scan
# sudo apt install -y bluez blueman

# sudo systemctl enable cups
# sudo systemctl enable bluetooth

# Packages needed for window manager installation
sudo apt install -y picom rofi dunst libnotify-bin unzip wmctrl xdotool libnotify-dev 

# compton --Compton Compositor - Add Transparency To Your Programs
sudo apt install compton -y

# i3lock --i3lock is a simple screen locker like slock. After starting it, you will see a white screen (you can configure the color/an image).
sudo apt install i3lock -y

# xclip --Copy and paste at the Linux command line with xclip
sudo apt install xclip -y

# qt5-style-plugins --Qt 5 extra widget styles, qt5-style-plugins
# sudo apt install qt5-style-plugins -y

# materia-gtk-theme --Materia. Materia is a Material Design theme for GNOME/GTK based desktop environments.
sudo apt install materia-gtk-theme -y

# flameshot --Flameshot is a free and open-source, cross-platform tool to take screenshots
sudo apt install flameshot -y

# pnmixer --PNMixer is a simple mixer application designed to run in your system tray.
sudo apt install pnmixer -y
   


# Installing Essential Programs 

# lxpolkit 
sudo install lxpolkit -y

# x11-xserver-utils 
sudo install x11-xserver-utils -y

# wget 
sudo install wget -y

# pipewire 
sudo install pipewire -y

# wireplumber 
sudo install wireplumber -y

# libx11-dev 
sudo install libx11-dev -y

# libxft-dev 
sudo install libxft-dev -y

# libxinerama-dev 
sudo install libxinerama-dev -y

# libx11-xcb-dev 
sudo install libx11-xcb-dev -y

# libxcb-res0-dev 
sudo install libxcb-res0-dev -y

# zoxide
sudo install zoxide -y

# Installing Other less important Programs

nala install psmisc mangohud lightdm -y

# Download Nordic Theme
#cd /usr/share/themes/
#git clone https://github.com/EliverLara/Nordic.git

# Download Font Awesome and the cheat sheet for it
# Font Awesome downloads: https://github.com/FortAwesome/Font-Awesome
# Font Awesome cheat sheet: https://fontawesome.com/v3/cheatsheet/

# Installing fonts
cd $builddir 
nala install fonts-font-awesome -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
mv dotfonts/fontawesome/otfs/*.otf /home/$username/.fonts/
chown $username:$username /home/$username/.fonts/*
# Reloading Font
fc-cache -vf
# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip

# Install Nordzy cursor
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
./install.sh
cd $builddir
rm -rf Nordzy-cursors

# Enable graphical login and change target from CLI to GUI
systemctl enable lightdm
systemctl set-default graphical.target

# Enable wireplumber audio service
sudo -u $username systemctl --user enable wireplumber.service


# Use nala
bash scripts/usenala


# Geany Text Editor, text editor, markdown editor
# sudo apt install -y geany 
# sudo apt install -y geany-plugin-addons geany-plugin-git-changebar geany-plugin-overview geany-plugin-spellcheck geany-plugin-treebrowser geany-plugin-vimode
# sudo apt install -y geany-plugins \ # all plugins
# sudo apt install -y mousepad ghostwriter
# sudo apt install -y l3afpad

# My Favorites
# Multimedia/GFX
sudo apt install -y mpv qimgv scrot gimp obs-studio mkvtoolnix-gui redshift eog brightnessctl

# PDF 
sudo apt install -y  evince pdfarranger

# Others
sudo apt install -y numlockx 
sudo apt install -y figlet 
sudo apt install -y galculator
sudo apt install -ycpu-x
sudo apt install -y udns-utils
sudo apt install -y whois 
sudo apt install -y curl 
sudo apt install -y tree

# Install Lightdm Console Display Manager
# sudo apt install -y lightdm lightdm-gtk-greeter-settings
# sudo systemctl enable lightdm

########################################################
# End of script 
#

sudo apt autoremove

printf "\e[1;32mFinished! Thanks you.\e[0m\n"

