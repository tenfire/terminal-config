#!/bin/bash

if ! command -v fish &> /dev/null
then
  echo "fish not installed"
  echo "installing fish"
  apt install software-properties-common -y
  apt-add-repository ppa:fish-shell/release-3 -y
  apt update
  apt install fish -y
fi

# For bullseye (https://linuxhint.com/install_fish_shell_linux/)
# echo "deb http://deb.debian.org/debian bullseye-backports main contrib non-free" | tee -a /etc/apt/sources.list.d/backports.list
# apt update
# apt install fish/bullseye-backports

# For truenas-scale
# make dpkg executable
#   chmod +x /usr/bin/dpkg
# download .deb file from https://fishshell.com/
# try to install fish:
#   install deb -i <fish-deb-file>
# if it failed, libpcre2 is probably missing:
#   download deb file for libpcre2:
#     install deb -i <libpcre2-deb-file>
#   try to install fish again:
#     install deb -i <libpcre2-deb-file>
# set default shell to fish from the user interface at Credentials -> Local Users
# make dpkg not executable again
#   chmod -x /usr/bin/dpkg
