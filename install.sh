#!/bin/bash

# Cập nhật hệ thống và các gói phần mềm
sudo pacman -Syu --noconfirm

# Cài đặt git và base-devel nếu chưa có
sudo pacman -S --needed git base-devel

# Tải và cài đặt yay (AUR helper)
git clone https://aur.archlinux.org/yay.git
cd yay || exit 1  # Dừng script nếu không vào được thư mục yay
makepkg -si --noconfirm
cd .. || exit 1  # Dừng script nếu không trở về thư mục gốc
rm -rf yay  # Xóa thư mục yay sau khi cài đặt

# Cập nhật lại hệ thống với yay
yay -Syu --noconfirm

# Cài đặt các gói phần mềm cần thiết
sudo pacman -S --needed zsh neovim git curl hyprland sddm swww fcitx5-qt fcitx5-im fcitx5-unikey unzip qt6-svg qt6-declarative

# Giải nén theme cho sddm
sudo unzip -o ./configs/sddm/catppuccin-mocha.zip -d /usr/share/sddm/themes/

# Tạo và cấu hình file sddm.conf
sudo tee /etc/sddm.conf > /dev/null << EOF
[Theme]
Current=catppuccin-mocha
EOF

# Cài đặt Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Cài đặt các plugin Zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

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

# Cấu hình Rofi
mkdir -p ~/.config/rofi
cp -r ./configs/rofi ~/.config/rofi

# Cấu hình Neovim
mkdir -p ~/.config/nvim
cp -r ./configs/nvim ~/.config/nvim

# Cấu hình Hyprland
rm -rf ~/.config/hypr
mkdir -p ~/.config/hypr
cp -r ./hypr ~/.config/hypr

# Cài đặt các gói phần mềm từ AUR và chính thức
yay -S --noconfirm swaybg nwg-look zenity thunar selectdefaultapplication visual-studio-code-bin cliphist font-manager ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-win10

# Cài đặt các themes và icons
mkdir -p ~/.themes ~/.icons
tar -xf ./icons/Bibata-Modern-Ice.tar.xz -C ~/.icons/
tar -xf ./icons/Win10Sur.tar.xz -C ~/.icons/
tar -xf ./themes/CatppuccinMocha.tar.gz -C ~/.themes/

# Cấu hình GTK
rm -rf ~/.config/gtk-3.0
cp -r ./icons/gtk-3.0 ~/.config/

# Cài đặt các gói phần mềm bổ sung
sudo pacman -S --needed python ufw rsync docker docker-compose
yay -S --noconfirm electron wsysmon-git aylurs-gtk-shell github-desktop obs-studio ffmpeg vlc cava tty-clock opera opera-ffmpeg-codes dropbox
sudo pacman -S --needed libgtop bluez bluez-utils btop networkmanager dart-sass wl-clipboard brightnessctl python gnome-bluetooth-3.0 pacman-contrib power-profiles-daemon
yay -S --noconfirm grimblast-git gpu-screen-recorder hyprpicker matugen-bin python-gpustat grimblast swappy

# Cài đặt bun.sh
curl -fsSL https://bun.sh/install | bash

# Cài đặt và cấu hình các gói bổ sung
sudo pacman -S --needed blueman networkmanager network-manager-applet pavucontrol brightnessctl
sudo pacman -S --needed typescript npm meson gjs gtk3 gtk-layer-shell gnome-bluetooth-3.0 upower gobject-introspection libdbusmenu-gtk3 libsoup3

# Kích hoạt các dịch vụ cần thiết
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now sddm
sudo systemctl enable --now docker

# Chạy script Grub
sudo ./grub/install.sh
