##!/bin/ash

# All in one install script of i3 windows manager on Alpine Linux
# install i3wm with --aditional pack

# Link to i3wm documentation: 
# https://i3wm.org/

============================================================================================================

# Check if Script is Run as Root
cat rootEUID.sh
!/bin/bash
if [[ $EUID -ne 0 ]]; then
    echo "You must be root to do this." 1>&2
    exit 100
fi

# Install packages after installing Alpine linux
============================================================================================================

# Update packages list 
apk update -y 

# and update system
apk upgrade -y

#Install X11 and set it up. 
setup-xorg-base

#Install drivers
#Ensure you have the required drivers.
# apk search xf86-input*
# apk search xf86-video*
#Example driver installation
# apk add xf86-video-fbdev xf86-video-vesa

# Install i3 windows manager
apt add i3wm i3lock
apt add rofi
apk add curl socat nmap net-tools 
apk add build-base setxkbmap 
apk add xrandr dbus dbus-x11 

# apk add xfce4 xfce4-terminal lightdm dbus-x11
apk add lightdm lightdm-gtk-greeter libxcb-dev 

# acpi - displays information on ACPI devices 
apk add acpi acpid zzz

# Enable and start the acpid daemon: 
# acpid - Advanced Configuration and Power Interface event daemon 
rc-update add acpid && rc-service acpid start

apk add fastfetch glib feh firefox-esr 

# xorg display server installation
apk add xbacklight xbindkeys xinput

# Tools/System
============================================================================================================
# dialog -  Displays user-friendly dialog boxes from shell scripts 
apk add dialog 

# xfce4-power-manager - power manager for Xfce desktop
# apt install -y xfce4-power-manager 
# lxappearance - 	LXDE GTK+ theme switcher
apk add lxappearance 
# neofetch - Shows Linux System Information with Distribution Logo 
apk add neofetch
# btop - Modern and colorful command line resource monitor that shows usage and stats 
apk add btop

# Networking
============================================================================================================
# network-manager - network management framework (daemon and userspace tools) 
?????????????

# Accessories
============================================================================================================
# Thunar and accessories
apk add thunar thunar-archive-plugin thunar-volman file-roller
# Terminal (eg. terminator,kitty,xfce4-terminal)
apk add kitty
# Sound packages
apk add pulseaudio alsa-utils pavucontrol 
apk add pamixer


### Installing fonts ###
============================================================================================================

# Fonts and icons 
apk add font-terminus font-noto font-noto-extra 
apk add font-arabic-misc 
apk add font-vollkorn font-misc-cyrillic font-mutt-misc font-screen-cyrillic 
apk add font-winitzki-cyrillic font-cronyx-cyrillic
apk add fonts-roboto 
apk add fonts-recommended 
apk add fonts-noto-color-emoji 
apk add fonts-ubuntu 
apk add fonts-font-awesome 
apk add fonts-terminus 


# bluetooth
apk add --no-cache bluez bluez-deprecated alsa-utils alsa-utils-doc alsa-lib alsaconf
apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing bluez-alsa

apk add blueman
adduser $USER lp
rc-service bluetooth start
rc-update add bluetooth default

### Packages needed for window manager installation ###
============================================================================================================

apk add picom dunst unzip xdotool compton xclip
  
### Installing Essential Programs 
============================================================================================================
apk add wget pipewire wireplumber libx11-dev
apk add libxft-dev libxinerama-dev libx11-xcb-dev
apk add zoxide
# Installing Other less important Programs
============================================================================================================
apk add psmisc mangohud 


# Enable graphical login and change target from CLI to GUI
============================================================================================================
rc-update add lightdm
rc-service lightdm start

# Multimedia/GFX
============================================================================================================
apk add vlc qimgv brightnessctl redshift scrot mkvtoolnix-gui

# Others
apk add figlet whois tree

============================================================================================================
# End of script #



printf "\e[1;32mFinished! Thank you.\e[0m\n"