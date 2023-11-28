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
