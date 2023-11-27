#!/bin/bash

rm -f ~/poshtheme.omp.json
ln -s $(pwd)/poshtheme.omp.json ~/poshtheme.omp.json
echo 'test -f ~/poshtheme.omp.json && eval "$(oh-my-posh --init --shell bash --config ~/poshtheme.omp.json)"' >> ~/.bashrc
echo 'test -f ~/poshtheme.omp.json && eval "$(oh-my-posh --init --shell zsh --config ~/poshtheme.omp.json)"' >> ~/.zshrc
