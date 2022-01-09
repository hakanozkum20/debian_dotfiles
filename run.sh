#!/bin/bash

# Change Debian to SID Branch
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp sources.list /etc/apt/sources.list 


# Add base packages 
sudo apt install -y lightdm lightdm-gtk-greeter git bspwm kitty thunar htop flameshot neofetch firefox exa pulseaudio pavucontrol net-tools network-manager-gnome lxpolkit lxappearance xorg nitrogen curl 

# Make Directories Required
mkdir -p ~/.themes ~/.fonts ~/.config ~/Documents ~/Downloads ~/Downloads/build ~/Pictures ~/Pictures/Screenshots ~/Videos


# Install dotfiles from gitlab
source ~/bspwm-theme/dotfiles.sh

# Download Wallpapers :)
git clone https://gitlab.com/dannycc/wallpapers.git  ~/Documents/wallpapers

# Install required dependencies (vim included)
sudo apt install build-essential vim unzip xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y

## dependencies for polybar
sudo apt install cmake cmake-data libuv1-dev pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev  libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev -y

## dependencies for picom
sudo apt install meson libxext-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-present-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev -y

## dependencies for rofi
sudo apt install bison flex libstartup-notification0-dev check autotools-dev libpango1.0-dev librsvg2-bin librsvg2-dev libglib2.0-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev -y

# Clone the repositories required
cd ~/Downloads/build
git clone https://github.com/baskerville/sxhkd.git
git clone --recursive https://github.com/polybar/polybar
git clone https://github.com/ibhagwan/picom.git
wget -c https://github.com/davatorium/rofi/releases/download/1.7.2/rofi-1.7.2.tar.gz -O rofi.tar.gz
mkdir rofi && tar -xzvf rofi.tar.gz -C rofi --strip-components 1
rm rofi.tar.gz 

# Compile and install sxhkd
cd ~/Downloads/build/sxhkd
make
sudo make install

# Compile and install Polybar
cd ~/Downloads/build/polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

# Build and Install Picom
cd ~/Downloads/build/picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install



# Build and Install Rofi
cd ~/Downloads/build/rofi
mkdir build && cd build
../configure
make
sudo make install



# Download Nordic Theme
cd /usr/share/themes/
sudo git clone https://github.com/EliverLara/Nordic.git

# Appearance packages
sudo apt install -y papirus-icon-theme lxappearance fonts-noto-color-emoji fonts-firacode fonts-font-awesome libqt5svg5 qml-module-qtquick-controls

# Fira Code Nerd Font variant needed
cd ~/Downloads/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d ~/.fonts   
fc-cache -vf

#Ms-fonts
sudo apt install ttf-mscorefonts-installer -y

# Get Rofi Theme Fonts
cd ~/Downloads/
git clone https://github.com/adi1090x/rofi
cd rofi/fonts
mv Comfortaa/* .
mv Noto_Sans/* .
rm -r Comfortaa Noto_Sans
cp * ~/.fonts/
rm -rf cd ~/Downloads/rofi

# Layan Cursors
cd ~/Downloads/build/
git clone https://github.com/vinceliuice/Layan-cursors
cd Layan-cursors
sudo ./install.sh


# Start and Enable lightdm
sudo systemctl enable lightdm
sudo apt update && sudo apt upgrade -y
sudo reboot






