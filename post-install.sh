#!/bin/bash
set -e

sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf

sudo pacman -Syu --noconfirm lib32-mesa gdm hyprland

mkdir -p ~/Pictures/Screenshots
mkdir -p ~/Pictures/Wallpapers
mkdir -p ~/.local/bin

cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~
rm -rf /tmp/yay

yay -Syu --noconfirm appimagelauncher waypaper cliphist wlogout xclicker

echo "QT_QPA_PLATFORM=wayland" | sudo tee /etc/environment.d/qt-wayland.conf

flatpak install flathub com.github.tchx84.Flatseal -y

echo "[*]"
cd ~
git clone --depth=1 https://github.com/gxbrriellll/arch-dotfiles.git ~/arch-install

rsync -avh --progress ~/arch-dotfiles/.config/ ~/.config/

mkdir -p ~/.local/share/fonts
rsync -avh --progress ~/arch-dotfiles/.local/share/fonts/ ~/.local/share/fonts/

fc-cache -fv

rm -rf ~/arch-dotfiles

sudo pacman -Syu --noconfirm

sudo systemctl enable gdm

echo "[✓]"
sudo reboot now
