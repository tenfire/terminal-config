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


THEME_FILE=~/poshtheme.omp.json
FISH_CONFIG_FILE=~/.config/fish/config.fish
FISH_INTERACTIVE_FILE=~/.config/fish/interactive.fish
FISH_ALIAS_FILE=~/.config/fish/aliases.fish

insert () {
  if ! grep -qxF "$1" "$2"; then
    echo "$1" >> "$2"
    echo "Appended \"$1\" to $2"
  fi
}

write () {
  if [ -f "$2" ]; then
    cp "$2" "$2.bak"
    echo "Copied $2 to $2.bak"
  fi
  insert "$1" "$2"
}


# CONFIG
read -r -d '' CONFIG <<'EOF'
if status is-interactive
  if test -f ~/.config/fish/interactive.fish
    source ~/.config/fish/interactive.fish
  end
end
EOF
write "$CONFIG" "$FISH_CONFIG_FILE"


# INTERACTIVE
read -r -d '' ALIASES <<'EOF'
if test -f ~/.config/fish/aliases.fish
  . ~/.config/fish/aliases.fish
end
EOF
insert "$ALIASES" "$FISH_INTERACTIVE_FILE"
insert "set -g fish_greeting" "$FISH_INTERACTIVE_FILE"

# ALIASES
read -r -d '' ALIASES <<'EOF'
if test -f ~/.bash_aliases
  source ~/.bash_aliases
end

alias upgrade-oh-my-posh="curl -s https://ohmyposh.dev/install.sh | bash -s"
EOF
insert "$ALIASES" "$FISH_ALIAS_FILE"
