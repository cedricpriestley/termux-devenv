#!/bin/sh

# Change to home directory
cd $HOME

# Enable tab completion
pkg i bash-completion

# Figlet
pkg i figlet pv

# Install Aria
pkg i aria2 -y

# Install Megatools
pkg i megatools -y

# Grant storage permission
termux-storage-setup

# Create "/sdcard/Projects/Websites" directory
mkdir -p $PREFIX/storage/shared/Projects/Websites

# Install chroot
pkg i proot -y

# Install Oh My ZSH
pkg i curl git zsh -y

# Install WFuzz
pkg i python  openssl  curl clang libcrypt  libcurl 

# Select SSL Library
export PYCURL_SSL_LIBRARY=openssl

pip install wfuzz

# Install TOR & TORSOCKS
pkg i torsocks -y

echo "Socks5Proxy 127.0.0.1:9050" >> $PREFIX/etc/tor/torrc

# Check all open ports on your phone (Root required)
#tsu: pkg i tsu
#tsu
#netstat -puntl

# Apache
pkg i apache2

# PHP
pkg i php php-apache

# MySQL
pkg i mariadb

# 7z
pkg i p7zip

# C/C++ Compiler
pkg i clane
# FFMpeg
pkg i ffmpeg

# Git
pkg i git
git config --global user.name "Cedric Priestley"
git config --global user.email cedricpriestley@gmail.com

# Hydra
pkg i hydra

# Nano
pkg i nano

# Nmap
pkg i nmap

# Node
pkg i nodejs

# SQLMap
pkg i python && pip install -U sqlmap

# Tree
pkg i tree

# Vim
pkg i vim wget -y

mkdir $HOME/.vim/colors

wget -P $HOME/.vim/colors https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim

# Youtube-DL
pkg i ffmpeg python && pip install -U youtube_dl

# composer
curl -L https://github.com/yuloh/composer-termux/releases/download/1.6.2/composer.phar -o composer.phar

chmod +x ./composer.phar

mv ./composer.phar /data/data/com.termux/files/usr/bin/compose

#composer global require psy/psysh
#termux-fix-shebang ~/.composer/vendor/bin/psys

# MAN
pkg i man


# SSH
pkg i openssh

cd $HOME/.ssh

ssh-keygen -o -b 4096 -t rsa

# Add content of public key to ~/.ssh/authorized_keys

# Start SSH server on port 8022
sshd

