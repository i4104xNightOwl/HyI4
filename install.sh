#!/bin/bash

# Cập nhật hệ thống và các gói phần mềm
sudo pacman -Syu --noconfirm

# Cài đặt git và base-devel nếu chưa có
sudo pacman -S --needed git base-devel curl

# Tải và cài đặt yay (AUR helper)
git clone https://aur.archlinux.org/yay.git
cd yay || exit 1
makepkg -si --noconfirm
cd .. || exit 1 
rm -rf yay

# Cập nhật lại hệ thống với yay
yay -Syu --noconfirm

# Cài đặt các gói phần mềm cần thiết
sudo pacman -S --needed --noconfirm kitty zsh neovim 
sudo pacman -S --needed --noconfirm fcitx5-qt fcitx5-im fcitx5-unikey unzip 
sudo pacman -S --needed --noconfirm hyprland swww unzip tar fastfetch waybar
sudo pacman -S --needed --noconfirm sddm qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg qt6-declarative

# Giải nén theme cho sddm
sudo unzip -o ./themes/sddm/catppuccin-mocha.zip -d /usr/share/sddm/themes/

# Tạo và cấu hình file sddm.conf
sudo tee /etc/sddm.conf > /dev/null << EOF
[Theme]
Current=catppuccin-mocha
EOF

# Chạy script Grub
sudo ./grub/install.sh

echo '


██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗         ██████╗  █████╗  ██████╗██╗  ██╗ █████╗  ██████╗ ███████╗███████╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║         ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔════╝ ██╔════╝██╔════╝
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║         ██████╔╝███████║██║     █████╔╝ ███████║██║  ███╗█████╗  ███████╗
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║         ██╔═══╝ ██╔══██║██║     ██╔═██╗ ██╔══██║██║   ██║██╔══╝  ╚════██║
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗    ██║     ██║  ██║╚██████╗██║  ██╗██║  ██║╚██████╔╝███████╗███████║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝


'

sudo pacman -S --needed python ufw rsync docker docker-compose
sudo pacman -S --needed libgtop bluez bluez-utils networkmanager dart-sass wl-clipboard brightnessctl gnome-bluetooth-3.0 pacman-contrib power-profiles-daemon
sudo pacman -S --needed blueman networkmanager network-manager-applet pavucontrol brightnessctl
sudo pacman -S --needed typescript npm meson gjs gtk3 gtk-layer-shell gnome-bluetooth-3.0 upower gobject-introspection libdbusmenu-gtk3 libsoup3

packages=(
    swaybg nwg-look zenity nemo vencord vesktop selectdefaultapplication visual-studio-code-bin cliphist rofi
    font-manager ttf-jetbrains-mono ttf-jetbrains-mono-nerd
    pipewire pipewire-module-xrdp pipewire-screenaudio-git pipewire-session-manager xdg-desktop-portal-hyprland
    electron obs-studio ffmpeg vlc cava tty-clock opera opera-ffmpeg-codecs
    grimblast-git gpu-screen-recorder hyprpicker matugen-bin python-gpustat grimblast swappy btop peazip
    github-desktop gnome-keyring cmus nwg-shell flatpak
)

install_package() {
    local package="$1"
    manager="yay"

    if $manager -S --noconfirm --needed "$package"; then
        echo "$package has been installed."
    else
        echo "Trying to install $package..."
        if $manager -S --noconfirm --needed "$package"; then
            echo "$package has been installed."
        else
            echo "Failed to install $package, please install it manually."
        fi
    fi
}

for package in "${packages[@]}"; do
    install_package "$package"
done


read -p "Do you want to install window font? (Bạn có muốn cài đặt font của window không?) [Y/n]: " answer
answer=${answer:-y}

if [[ "$answer" == 'y' || "$answer" == "Y" ]]; then
	yay -S --noconfirm ttf-win10
fi	

echo '


██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗         ███╗   ██╗██╗   ██╗██╗███╗   ███╗       ██████╗  ██████╗ ███████╗██╗       ███████╗███████╗██╗  ██╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║         ████╗  ██║██║   ██║██║████╗ ████║       ██╔══██╗██╔═══██╗██╔════╝██║       ╚══███╔╝██╔════╝██║  ██║
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║         ██╔██╗ ██║██║   ██║██║██╔████╔██║       ██████╔╝██║   ██║█████╗  ██║         ███╔╝ ███████╗███████║
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║         ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║       ██╔══██╗██║   ██║██╔══╝  ██║        ███╔╝  ╚════██║██╔══██║
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║▄█╗    ██║  ██║╚██████╔╝██║     ██║▄█╗    ███████╗███████║██║  ██║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝    ╚══════╝╚══════╝╚═╝  ╚═╝

'

# Thông báo và yêu cầu người dùng xác nhận trước khi cài đặt zsh
read -p "Now, I will install zsh. It will take quite a bit of time. [Enter]"
read -p "******* PLEASE READ THE FOLLOWING INSTRUCTIONS CAREFULLY ******* [Enter]"
echo
echo "- Press 'y' when asked if you want to set zsh as the default shell."
echo "- After the installation process is complete, it will automatically switch to zsh. PLEASE enter 'exit' and press Enter to continue."
echo
read -p "******* PLEASE READ THE FOLLOWING INSTRUCTIONS CAREFULLY ******* [Enter]"

# Cài đặt Zsh và Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Cài đặt các plugin Zsh
for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
    git clone "https://github.com/zsh-users/$plugin.git" ~/.oh-my-zsh/custom/plugins/$plugin
done

# Sao chép file cấu hình Zsh
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.backup  # Lưu bản sao cũ nếu có
fi

cp ./themes/zsh/.zshrc ~/
cp -r ./.config ~/

echo '


██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗         ████████╗██╗  ██╗███████╗███╗   ███╗███████╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║         ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║            ██║   ███████║█████╗  ██╔████╔██║█████╗  
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║            ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗       ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝       ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝


'
mkdir -p ~/.themes ~/.icons

tar -xf ./themes/Bibata-Modern-Ice.tar.xz -C ~/.icons/
tar -xf ./themes/Win10Sur.tar.xz -C ~/.icons/
tar -xf ./themes/CatppuccinMocha.tar.gz -C ~/.themes/

if [ -d ~/.config/gtk-3.0 ]; then
    rm -rf ~/.config/gtk-3.0
fi

cp -r ./themes/gtk-3.0 ~/.config/
nwg-look -a
echo "Done!"

# Kích hoạt các dịch vụ cần thiết
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now docker
sudo systemctl enable --now sddm
