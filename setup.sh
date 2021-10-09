sudo pacman -Syyuu

mkdir -p ~/Documents/git

sudo pacman -S git
cd ~/Documents/git
git clone https://aur.archlinux.org/yay.git && cd yay
makepkg -si

yay -S puppet
su -c "cd /etc && rm -rf puppet && git clone https://github.com/hellia-be/pinephone.git puppet"

yay -S openssh
sudo systemctl enable --now sshd
