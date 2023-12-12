#!/bin/bash

THEME_FILE=~/poshtheme.omp.json
FISH_CONFIG_DIR=~/.config/fish
FISH_CONFIG_FILE=$FISH_CONFIG_DIR/config.fish
FISH_INTERACTIVE_FILE=$FISH_CONFIG_DIR/interactive.fish
FISH_ALIAS_FILE=$FISH_CONFIG_DIR/aliases.fish

mkdir -p $FISH_CONFIG_DIR

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
