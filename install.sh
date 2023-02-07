#!/bin/bash
set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "$DIR"

# Disable SteamOS Readonly mode
sudo steamos-readonly disable

# Init Pacman & Update Arch
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Sy archlinux-keyring
sudo pacman -Syu

# Install deckpad dependencies
sudo pacman -S --noconfirm --needed xorg-xinput figlet

# Set up sudoers
sudo cp ./zz10_deckpad /etc/sudoers.d/zz10_deckpad

# Re-enable SteamOS Readonly mode
sudo steamos-readonly enable

