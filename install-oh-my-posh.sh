#!/bin/bash
# This script can be used for upgrading as well
# Must be run as root

# If you have install via brew, remove it first by running:
# brew uninstall oh-my-posh

if ! command -v unzip &> /dev/null
then
  echo "unzip not installed"
  echo "installing unzip"
  apt update
  apt install unzip -y
fi

curl -s https://ohmyposh.dev/install.sh | bash -s
