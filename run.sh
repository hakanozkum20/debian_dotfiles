#!/bin/bash

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list 


username=$(id -u -n 1000)
builddir=$(pwd)

# Add Custom Titus Rofi Deb Package
dpkg -i 'Custom Packages/rofi_1.7.0-1_amd64.deb'

# Update packages list
apt update

# Add base packages
apt install unzip picom bspwm polybar sddm rofi kitty thunar flameshot neofetch sxhkd git lxpolkit lxappearance xorg -y
apt install papirus-icon-theme lxappearance fonts-noto-color-emoji fonts-firacode fonts-font-awesome libqt5svg5 qml-module-qtquick-controls -y

#Local Folders
mkdir -p ~/.themes ~/.fonts ~/.config ~/Documents ~/Downloads ~/Downloads/build ~/Pictures ~/Pictures/Screenshots ~/Videos 

#Getting Qoqir theem
apt-get install gtk2-engines-murrine gtk2-engines-pixbuf
cd /home/esta/Downloads/
git clone https://github.com/vinceliuice/Qogir-theme.git
cd /Qoqir-theme/
chmod +x install.sh
./install.sh -c dark -t standard



# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

# Fira Code Nerd Font variant needed
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/FiraCode.zip
unzip FiraCode.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/Meslo.zip
unzip Meslo.zip -d /usr/share/fonts
wget https://github.com/be5invis/Iosevka/releases/download/v11.2.6/ttf-iosevka-11.2.6.zip
unzip ttf-iosevka-11.2.6.zip -d /usr/share/fonts
fc-cache -vf


# Get Rofi Theme Fonts
apt-get install font-manager
cd ~/Downloads/
git clone https://github.com/adi1090x/rofi
cd rofi/fonts
mv Comfortaa/* .
mv Noto_Sans/* .
rm -r Comfortaa Noto_Sans
cp * ~/.fonts/
rm -rf cd ~/Downloads/rofi



cd $builddir
mkdir -p /home/$username/.config
cp -R .config/* /home/$username/.config/
chown -R $username:$username /home/$username
