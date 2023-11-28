if ! command -v fish &> /dev/null
then
  echo "fish not installed"
  echo "installing fish"
  apt-add-repository ppa:fish-shell/release-3 -y
  apt update
  apt install fish -y
fi