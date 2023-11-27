if ! command -v zsh &> /dev/null
then
  echo "zsh not installed"
  echo "installing zsh"
  apt update
  apt install zsh -y
fi
chsh -s $(which zsh)