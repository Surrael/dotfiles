#!/bin/bash

set -e

# Install apps via yay (no sudo)
yay -Sy --needed \
  google-chrome \
  thunderbird \
  github-desktop \
  discord \
  neovim \
  curl \
  fzf \
  ripgrep \
  fd

# Set up Neovim with LazyVim
rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo "✔ Apps installed and Neovim set up with LazyVim!"
