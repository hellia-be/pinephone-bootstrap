sudo pacman -Syyuu
sudo dd if=/boot/u-boot-sunxi-with-spl-pinephone-552.bin of=/dev/mmcblk2 bs=8k seek=1

echo -e "w /sys/class/thermal/thermal_zone0/trip_point_0_temp - - - - 45000\nw /sys/class/thermal/thermal_zone0/trip_point_1_temp - - - - 75000\nw /sys/class/thermal/thermal_zone0/trip_point_2_temp - - - - 90000" | sudo tee /etc/tmpfiles.d/throttling.conf
sudo systemd-tmpfiles --create

mkdir -p ~/Documents/git

sudo pacman -S git
cd ~/Documents/git
git clone https://aur.archlinux.org/yay-bin.git && cd yay
makepkg -si

yay -S puppet
su -c "cd /etc && rm -rf puppet && git clone https://github.com/hellia-be/pinephone.git puppet"

yay -S openssh
sudo systemctl enable --now sshd
