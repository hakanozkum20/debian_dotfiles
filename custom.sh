#!/bin/bash

#Visual Studio Code install
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ -y
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
#install
sudo apt install apt-transport-https -y
sudo apt update -y
sudo apt install code


#MonoDevelop İnstall
sudo apt install apt-transport-https dirmngr -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/debian vs-buster main" | sudo tee /etc/apt/sources.list.d/mono-official-vs.list
sudo apt update
sudo apt-get install monodevelop -y
#Mono-project 
sudo apt install apt-transport-https dirmngr gnupg ca-certificates -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/debian stable-buster main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update -y
sudo apt install mono-devel mono-complete mono-complete referenceassemblies-pcl ca-certificates-mono mono-xsp4 -y

#Spotify Install
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update -y
sudo apt-get install spotify-client -y

#Dotnet Core SDK and RunTime
wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update -y
sudo apt-get install -y 
sudo apt-transport-https
sudo apt-get update -y
sudo apt-get install -y dotnet-sdk-5.0
sudo apt-get install -y aspnetcore-runtime-5.0

#VLC Player
sudo apt install vlc -y

#WPS Office Install
wget https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10702/wps-office_11.1.0.10702.XA_amd64.deb -P ~/Downloads
sudo apt install ~/Downloads/wps-office_11.1.0.10702.XA_amd64.deb
sudo rm -f ~/Downloads/wps-office_11.1.0.10702.XA_amd64.deb

