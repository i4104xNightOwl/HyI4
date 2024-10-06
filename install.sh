#!/bin/bash

# Cập nhật hệ thống và các gói phần mềm
sudo pacman -Syu

# Cài đặt git và base-devel nếu chưa có
sudo pacman -S --needed git base-devel

# Tải và cài đặt yay (AUR helper)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay  # Xóa thư mục yay sau khi cài đặt

# Cài đặt các gói phần mềm cần thiết
sudo pacman -S --needed zsh neovim git curl hyprland sddm swww fcitx5-qt fcitx5-im fcitx5-unikey unzip qt6-svg qt6-declarative

# Giải nén theme cho SDDM
sudo unzip ./configs/sddm/catppuccin-mocha.zip -d /usr/share/sddm/themes/

# Tạo và cấu hình file sddm.conf
sudo tee /etc/sddm.conf > /dev/null << EOF
[Theme]
Current=catppuccin-mocha
EOF

# Cài đặt Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Cài đặt các plugin Zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Sao chép file cấu hình Zsh
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.backup  # Lưu bản sao cũ nếu có
fi
cp ./configs/zsh/.zshrc ~/

# Tải lại cấu hình Zsh
source ~/.zshrc

# Cấu hình Alacritty
mkdir -p ~/.config/alacritty
cp -r ./configs/alacritty ~/.config/alacritty/

# Cài đặt các gói phần mềm từ AUR và chính thức
yay -S --noconfirm swaybg visual-studio-code-bin font-manager ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-win10

# Cài đặt Electron, Node.js, Python, ufw, và rsync
sudo pacman -S --needed python ufw rsync

# Cài đặt Electron từ AUR
yay -S --noconfirm electron wsysmon-git

# Cài đặt Bluetooth và Wi-Fi UI
sudo pacman -S --needed blueman networkmanager network-manager-applet pavucontrol brightnessctl

# Khởi động dịch vụ NetworkManager
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now sddm

yay -S github-desktop