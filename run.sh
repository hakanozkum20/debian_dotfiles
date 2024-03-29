#!/bin/bash
# sh lerin hepsine chmod ver sudo ile ve quoqir i düzelt. 
#

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list 


username=$(id -u -n 1000)
builddir=$(pwd)

# Add Custom Titus Rofi Deb Package
dpkg -i 'Custom Packages/rofi_1.7.0-1_amd64.deb'

# Update packages list
apt update 
apt upgrade -y

# Add base packages
apt install nautilus nautilus-extension-brasero nautilus-font-manager nautilus-sendto nautilus-admin nautilus-extension-burner nautilus-gtkhash nautilus-share nautilus-data nautilus-hide nautilus-filename-repairer nautilus-scripts-manager wget unzip arandr picom bspwm mousepad polybar sddm rofi kitty thunar flameshot neofetch sxhkd git lxpolkit lxappearance xorg -y
apt install nitrogen papirus-icon-theme firefox xfce4-settings lxappearance fonts-noto-color-emoji fonts-firacode fonts-font-awesome libqt5svg5 qml-module-qtquick-controls -y

#Local Folders
mkdir -p /home/$username/Desktop /home/$username/Musics /home/$username/.screenlayout /home/$username/.themes /home/$username/.fonts /home/$username/.config /home/$username/Documents /home/$username//Downloads /home/$username/Downloads/build /home/$username/Pictures /home/$username/Pictures/Screenshots /home/$username/Videos 
 
 #Nitrogen
 cp monitor.sh /home/$username/.screenlayout/


#Getting Qoqir theem
apt install gtk2-engines-murrine gtk2-engines-pixbuf -y
cd /home/$username//Downloads/
git clone https://github.com/vinceliuice/Qogir-theme.git
cd /Qoqir-theme/
chmod +x install.sh
./install.sh



# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git




# Fira Code Nerd Font variant needed
cd /home/$username/Downloads/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/FiraCode.zip
unzip FiraCode.zip -d /usr/share/fonts/FireCode
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/Meslo.zip
unzip Meslo.zip -d /usr/share/fonts/Meslo
wget https://github.com/be5invis/Iosevka/releases/download/v11.2.6/ttf-iosevka-11.2.6.zip
unzip ttf-iosevka-11.2.6.zip -d /home/$username/.local/share/fonts

cd /home/$username/Downloads/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
unzip Iosevka.zip -d /usr/share/fonts/Iosevka
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip -d /usr/share/fonts/Hack
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
unzip DroidSansMono -d /usr/share/fonts/DroidSansMono
fc-cache -vf

# Get Rofi Theme Fonts
apt install font-manager -y
cd /home/$username/Downloads/
git clone https://github.com/adi1090x/rofi
cd rofi/fonts
mv Comfortaa/* .
mv Noto_Sans/* .
rm -r Comfortaa Noto_Sans
cp * /home/$username/.fonts/
rm -rf cd /home/$username/Downloads/rofi



cd $builddir
mkdir -p /home/$username/.config

cp -R .config/* /home/$username/.config/
chown -R $username:$username /home/$username
chmod +x /home/$username/.screenlayout/monitor.sh /home/$username/.config/bspwm/* /home/$username/.config/bspwm/scripts/* /home/$username/.config/bspwm/scripts/i3lock-fancy/* /home/$username/.config/dunst/* /home/$username/.config/kitty/* /home/$username/.config/polybar/* /home/$username/.config/polybar/scripts/* /home/$username/.config/rofi/* /home/$username/.config/sxhkd/* /home/$username/.config/picom.conf
cd /home/$username/Debian_dotfiles
cp -R background.jpg /home/$username/Pictures/
nitrogen --set-auto /home/$username/Pictures/background.jpg --save


