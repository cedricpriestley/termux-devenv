#!/bin/sh

# Change to home directory
cd $HOME

# Enable tab completion
pkg i bash-completion

# Enable Two Line Keyboard
mkdir .termux
echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" >> .termux/termux.properties

# Enable spell correction for bash
echo 'shopt -s cdspell' >> .bashrc

# Change prompt
echo 'PS1="\[\033[1;30m\][\@] \[\033[1;37m\]Cedric@Termux:\w $ \[\033[0;37m\]"' >> .bashrc

# Disable start up banner
touch ~/.hushlogin

# Add welcome banner
pkg i figlet pv
echo 'figlet "Welcome Cedric" | pv -qL 500' >> .bashrc

# Install Aria
pkg i aria2

# Install Megatools
pkg i megatools

# Open a new terminal with ctrl + t (volume down + t)
shortcut.create-session = ctrl + t

# Go one session down with (for example) ctrl + 2
shortcut.next-session = ctrl + 2

# Go one session up with (for example) ctrl + 1
shortcut.previous-session = ctrl + 1

# Rename a session with (for example) ctrl + n
shortcut.rename-session = ctrl + n

# Vibrate device (default).
bell-character=vibrate

# Beep with a sound.
#bell-character=beep

# Ignore bell character.
#bell-character=ignore
#back-key=escape

# Hide keyboard or leave app (default)
back-key=back

# Grant storage permission
termux-storage-setup

# Create "/sdcard/Projects/Websites" directory
mkdir -p $PREFIX/storage/Projects/Websites

# Install chroot
pkg i proot

# Install Oh My ZSH
pkg i curl git zsh

# Install WFuzz
pkg i python python-dev openssl openssl-dev curl clang libcrypt libcrypt-dev libcurl libcurl-dev

# Select SSL Library
export PYCURL_SSL_LIBRARY=openssl

pip install wfuzz

# Install TOR & TORSOCKS
pkg i torsocks

echo "Socks5Proxy 127.0.0.1:9050" >> $PREFIX/etc/tor/torrc

# Start tor
tor&

# Stop tor
pkill tor

# Torify shell
source torsocks on

# Stop torifing shell
source torsocks off

# Always use TCP scan
#nmap -sT blah blah blah

# Check all open ports on your phone (Root required)
tsu: pkg i tsu
tsu
netstat -puntl

# SSH
pkg i openssh

cd $HOME/.ssh

ssh-keygen -o -b 4096 -t rsa

# Add content of public key to ~/.ssh/authorized_keys

# Start SSH server on port 8022

# Apache
pkg i apache2

# PHP
pkg i php php-apache

# MySQL
pkg i mariad

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

# Vim
pkg i vim

# Youtube-DL
pkg i ffmpeg python && pip install -U youtube_dl

# composer
curl -L https://github.com/yuloh/composer-termux/releases/download/1.6.2/composer.phar -o composer.phar

chmod +x ./composer.phar

mv ./composer.phar /data/data/com.termux/files/usr/bin/compose

#composer global require psy/psysh
#termux-fix-shebang ~/.composer/vendor/bin/psysh
