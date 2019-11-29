#!/bin/sh

# Enable spell correction for bash
#shopt -s cdspel

# Change prompt
#PS1="\[\033[1;30m\][\@] \[\033[1;37m\]Cedric@Termux:\w $ \[\033[0;37m\]"

# Add welcome banner
figlet "Welcome Cedric" | pv -qL 500

# Select SSL Library
export PYCURL_SSL_LIBRARY=openssl

# Start tor
tor &

# Stop tor
#pkill tor

# Torify shell
source torsocks on

# Stop torifying shell
#source torsocks off

# Enter chroot
termux-chroot

clear

