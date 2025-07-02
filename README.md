Basic but fully complete hyprland setup for Arch-based operating systems. This setup was built on EndeavourOS, installed without any desktop environment. Note there is no lock screen at this point, since I feel it is just a nuisance for a home PC.

First, clone the repo
```bash
git clone "https://github.com/Surrael/dotfiles" "$HOME/dotfiles"
```

Then, install the configured desktop environment using

```bash 
chmod +x install.sh
./install.sh
```

After installing the desktop environment, do not forget to set a GTK theme in nwg-look (called `GTK Themes`) in wofi.

My set of recommended apps can be installed using the app install script. It includes:
* Neovim with Lazyvim
* Google Chrome
* Thunderbird
* GitHub desktop
* Discord
