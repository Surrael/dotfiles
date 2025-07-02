#!/bin/bash

CHOICE=$(echo -e "  Power Off\n  Reboot\n󰤄  Suspend\n󰗽  Cancel" |
  wofi --show dmenu --width 300 --height 250 --anchor center --allow-markup --hide-scroll --prompt "Power Menu")

case "$CHOICE" in
*Power\ Off*) systemctl poweroff ;;
*Reboot*) systemctl reboot ;;
*Suspend*) systemctl suspend ;;
*) exit 0 ;;
esac
