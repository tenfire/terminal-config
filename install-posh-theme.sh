#!/bin/bash

BASHRC_FILE=~/.bashrc
ZSHRC_FILE=~/.zshrc
FISH_CONFIG_FILE=~/.config/fish/interactive.fish
THEME_SRC=$(pwd)/poshtheme.omp.json
THEME_DEST=~/poshtheme.omp.json

rm -f "$THEME_DEST"
ln -s "$THEME_SRC" "$THEME_DEST"

insert () {
  if ! grep -qxF "$1" "$2"; then
    echo "$1" >> "$2"
    echo "Appended \"$1\" to $2"
  fi
}

insert "test -f \"$THEME_DEST\" && eval \"\$(oh-my-posh --init --shell bash --config "$THEME_DEST")\"" "$BASHRC_FILE"

insert "test -f \"$THEME_DEST\" && eval \"\$(oh-my-posh --init --shell zsh --config "$THEME_DEST")\"" "$ZSHRC_FILE"

insert "test -f \"$THEME_DEST\" && oh-my-posh --init --shell fish --config \"$THEME_DEST\" | source" "$FISH_CONFIG_FILE"