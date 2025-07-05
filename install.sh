#!/bin/bash

set -e

if [[ $EUID -eq 0 ]]; then
  echo "Don't run this script as root."
  exit 1
fi

# Install yay if missing
if ! command -v yay &>/dev/null; then
  sudo pacman -Sy --needed base-devel git
  git clone https://aur.archlinux.org/yay.git
  cd yay && makepkg -si && cd .. && rm -rf yay
fi

# Install core desktop components and tools
yay -Sy --needed hyprland waybar kitty nautilus wofi swaync hypridle hyprpaper \
  ly starship zsh pavucontrol bluez-utils blueman networkmanager \
  networkmanager-dmenu ddcutil hyprshot git stow \
  ttf-font-awesome ttf-cascadia-code-nerd \
  catppuccin-gtk-theme-mocha nwg-look thunar \
  thunar-volman tumbler gvfs

# Enable power script
chmod +x ~/.config/wofi/power.sh

# Enable services
sudo systemctl enable ly.service
sudo systemctl enable --now bluetooth
sudo systemctl enable --now NetworkManager

# Set default shell to zsh
ZSH_PATH=$(which zsh)
chsh -s "$ZSH_PATH"

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Load i2c for backlight support
echo i2c-dev | sudo tee /etc/modules-load.d/i2c-dev.conf

# Stow dotfiles
DOTFILES_DIR="$HOME/dotfiles"
cd "$DOTFILES_DIR"
for dir in */; do
  dir=${dir%/}
  echo "Stowing $dir"
  stow -v --restow "$dir"
done
cd ~

echo "✔ Setup complete!"
