#!/bin/bash
set -e

nmcli device wifi connect "CASA0124G" password "Abreu/t3jada"

sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf
sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm lib32-mesa gdm hyprland

mkdir -p ~/Pictures/Screenshots
mkdir -p ~/Pictures/Wallpapers
mkdir -p ~/.local/bin

cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~
rm -rf /tmp/yay

yay -S --noconfirm wlr-randr-git appimagelauncher wlroots waypaper cliphist wofi-emoji wlogout

echo "QT_QPA_PLATFORM=wayland" | sudo tee /etc/environment.d/qt-wayland.conf

flatpak install flathub com.github.tchx84.Flatseal -y

sudo systemctl enable gdm

echo "[✓]"
sudo reboot now

