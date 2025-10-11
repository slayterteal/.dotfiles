#!/bin/bash

# setup/notes for the server computer codenamed: dingleberry

sudo apt update
sudo apt upgrade

# enable SSH
sudo apt install openshh-server

# enable FTP
sudo apt install vsftpd
sudo systemctl enable vsftpd

# Useful tools things to have 
sudo apt install net-tools
sudo apt install wget
sudo apt install build-essential
sudo apt install vim
sudo apt install curl
sudo apt install unzip

sudo apt install build-essential
sudo apt install htop

# purely 
# actually tmux is a must have
sudo apt install libevent ncurses tmux

# TODO might consider using build flags to give more control about what is all
# installed

# Install Java 21, 17, and 8
# sudo apt install openjdk-21-jdk
# sudo apt install openjdk-17-jdk
# sudo apt install openjdk-8-jdk