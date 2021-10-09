sudo pacman -Syyuu
sudo dd if=/boot/u-boot-sunxi-with-spl-pinephone-552.bin of=/dev/mmcblk2 bs=8k seek=1

mkdir -p ~/Documents/git

sudo pacman -S git
cd ~/Documents/git
git clone https://aur.archlinux.org/yay.git && cd yay
makepkg -si

yay -S puppet
su -c "cd /etc && rm -rf puppet && git clone https://github.com/hellia-be/pinephone.git puppet"

yay -S openssh
sudo systemctl enable --now sshd
