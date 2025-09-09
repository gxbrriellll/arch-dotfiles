# Arch Install Dual Boot Windows

iwctl

station wlan0 get-networks

station wlan0 connect WIFI
PASSWORD

exit

pacman -Sy --noconfirm

pacman -Syu --noconfirm archlinux-keyring git

git clone https://github.com/gxbrriellll/arch-install.git

cd arch-install

bash install.sh
