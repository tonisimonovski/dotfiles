

# Rofi --A window switcher, Application launcher and dmenu replacement.
sudo apt install rofi -y

# compton --Compton Compositor - Add Transparency To Your Programs
sudo apt install compton -y

# i3lock --i3lock is a simple screen locker like slock. After starting it, you will see a white screen (you can configure the color/an image).
sudo apt install i3lock -y

# xclip --Copy and paste at the Linux command line with xclip
sudo apt install xclip -y

# qt5-style-plugins --Qt 5 extra widget styles, qt5-style-plugins
sudo apt install qt5-style-plugins -y

# materia-gtk-theme --Materia. Materia is a Material Design theme for GNOME/GTK based desktop environments.
sudo apt install materia-gtk-theme -y

# lxappearance --It's a desktop-independent theme switcher for GTK+
sudo apt install lxappearance -y

# xbacklight --Xbacklight is used to adjust the backlight brightness where supported.  
sudo apt install xbacklight -y

# flameshot --Flameshot is a free and open-source, cross-platform tool to take screenshots
sudo apt install flameshot -y

# nautilus --Nautilus, is the default file manager of the GNOME desktop
sudo apt install nautilus -y

# xfce4-power-manager --Xfce4 Power Manager manages the power sources of the computer and connected devices (wireless mice, keyboards, media players etc.).
sudo apt install xfce4-power-manager -y

# pnmixer --PNMixer is a simple mixer application designed to run in your system tray.
sudo apt install pnmixer -y

# network-manager-gnome --NetworkManager is the standard Linux network configuration tool suite. 
sudo apt install network-manager-gnome -y

# policykit-1-gnome --Bus service that is used to bring up authentication dialogs used for obtaining privileges. 
sudo apt install policykit-1-gnome -y         

# Install Papirus icon theme
wget -qO- https://git.io/papirus-icon-theme-install | sh


# Installing Essential Programs 

# feh 
sudo install feh -y
# kitty 
sudo install kitty -y

# picom 
sudo install picom -y
# thunar 
sudo install thunar -y
# nitrogen 
sudo install nitrogen -y
# lxpolkit 
sudo install lxpolkit -y
# x11-xserver-utils 
sudo install x11-xserver-utils -y
# unzip 
sudo install unzip -y                
# wget 
sudo install wget -y
# pipewire 
sudo install pipewire -y
# wireplumber 
sudo install wireplumber -y
# pavucontrol 
sudo install pavucontrol -y
# build-essential 
sudo install build-essential -y
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

nala install neofetch flameshot psmisc mangohud papirus-icon-theme fonts-noto-color-emoji lightdm -y

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

########################################################
# End of script for default config
#
# Configuration uses 

sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"

# You must change mode of this script
# go to folder where you download the script 
# and 
# sudo chmode +x i3_custom_install.sh
