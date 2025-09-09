# install.sh (Dual Boot, Windows)

iwctl

station wlan0 connect WIFI

PASSWORD

exit

pacman -Sy

pacman -S --noconfirm archlinux-keyring git

git clone https://github.com/gxbrriellll/arch-install.git

cd arch-install

bash install.sh

# post-install.sh

sudo nmcli dev wifi connect WIFI pasword "PASSWORD"

sudo pacman -Syu --noconfirm 

sudo pacman -Syu --noconfirm git

git clone https://github.com/gxbrriellll/arch-install.git

cd arch-install

bash post-install.sh
