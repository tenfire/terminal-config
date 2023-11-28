#!/bin/bash

rm -f ~/poshtheme.omp.json
ln -s $(pwd)/poshtheme.omp.json ~/poshtheme.omp.json
echo 'test -f ~/poshtheme.omp.json && eval "$(oh-my-posh --init --shell bash --config ~/poshtheme.omp.json)"' >> ~/.bashrc
echo 'test -f ~/poshtheme.omp.json && eval "$(oh-my-posh --init --shell zsh --config ~/poshtheme.omp.json)"' >> ~/.zshrc

# For fish. Add this to ~/.config/fish/config.fish
# oh-my-posh --init --shell fish --config ~/poshtheme.omp.json | source
