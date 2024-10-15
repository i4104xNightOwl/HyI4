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

# Chạy script Grub
sudo ./grub/install.sh

echo '


██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗         ██╗  ██╗██╗   ██╗██████╗ ██████╗ ██╗      █████╗ ███╗   ██╗██████╗ 
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║         ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║         ███████║ ╚████╔╝ ██████╔╝██████╔╝██║     ███████║██╔██╗ ██║██║  ██║
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║         ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║     ██╔══██║██║╚██╗██║██║  ██║
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗    ██║  ██║   ██║   ██║     ██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ 


'

echo "Installing Hyprland Config..."
rm -rf ~/.config/hypr
cp -r ./hypr ~/.config

echo '


██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗         ████████╗██╗  ██╗███████╗███╗   ███╗███████╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║         ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║            ██║   ███████║█████╗  ██╔████╔██║█████╗  
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║            ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗       ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝       ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝


'

# Cài đặt các themes và icons
mkdir -p ~/.themes ~/.icons
echo "Unzip Cursor Theme..."
tar -xf ./themes/Bibata-Modern-Ice.tar.xz -C ~/.icons/

echo "Unzip Icon Theme..."
tar -xf ./themes/Win10Sur.tar.xz -C ~/.icons/

echo "Unzip Gtk Theme..."
tar -xf ./themes/CatppuccinMocha.tar.gz -C ~/.themes/

echo "Loading GTK Config..."
rm -rf ~/.config/gtk-3.0
cp -r ./themes/gtk-3.0 ~/.config/
nwg-look -a

echo "Done!"



echo '


██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗         ██████╗  █████╗  ██████╗██╗  ██╗ █████╗  ██████╗ ███████╗███████╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║         ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔════╝ ██╔════╝██╔════╝
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║         ██████╔╝███████║██║     █████╔╝ ███████║██║  ███╗█████╗  ███████╗
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║         ██╔═══╝ ██╔══██║██║     ██╔═██╗ ██╔══██║██║   ██║██╔══╝  ╚════██║
 ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗    ██║     ██║  ██║╚██████╗██║  ██╗██║  ██║╚██████╔╝███████╗███████║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝


'

yay -S --noconfirm swaybg nwg-look zenity thunar vencord vesktop selectdefaultapplication visual-studio-code-bin cliphist font-manager ttf-jetbrains-mono ttf-jetbrains-mono-nerd
yay -S --noconfirm pipewire pipewire-module-xrdp pipewire-full-ffmpeg-git pipewire-screenaudio-git pipewire-session-manager xdg-desktop-portal-hyprland
yay -S --noconfirm electron wsysmon-git aylurs-gtk-shell github-desktop obs-studio ffmpeg vlc cava tty-clock opera opera-ffmpeg-codes
yay -S --noconfirm grimblast-git gpu-screen-recorder hyprpicker matugen-bin python-gpustat grimblast swappy
sudo pacman -S --needed python ufw rsync docker docker-compose
sudo pacman -S --needed libgtop bluez bluez-utils btop networkmanager dart-sass wl-clipboard brightnessctl python gnome-bluetooth-3.0 pacman-contrib power-profiles-daemon
sudo pacman -S --needed blueman networkmanager network-manager-applet pavucontrol brightnessctl
sudo pacman -S --needed typescript npm meson gjs gtk3 gtk-layer-shell gnome-bluetooth-3.0 upower gobject-introspection libdbusmenu-gtk3 libsoup3

read -p "Do you want to install window font? (Bạn có muốn cài đặt font của window không?) [Y/n]: " answer
answer=${answer:-y}

if [[ "$answer" == 'y' || "$answer" == "Y" ]]; then
	yay -S --noconfirm ttf-win10
fi	


echo '


██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗         ██████╗ ██╗   ██╗███╗   ██╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║         ██╔══██╗██║   ██║████╗  ██║
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║         ██████╔╝██║   ██║██╔██╗ ██║
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║         ██╔══██╗██║   ██║██║╚██╗██║
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗    ██████╔╝╚██████╔╝██║ ╚████║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝

'

# Cài đặt bun.sh
curl -fsSL https://bun.sh/install | bash
sudo ln -s ~/.bun/bin/bun /usr/bin/bun

rm -rf ~/HyprPanel
git clone https://github.com/Jas-SinghFSU/HyprPanel.git ~/HyprPanel && ln -s ~/HyprPanel $HOME/.config/ags

# Cài đặt Oh My Zsh
echo '


██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗         ███╗   ██╗██╗   ██╗██╗███╗   ███╗       ██████╗  ██████╗ ███████╗██╗       ███████╗███████╗██╗  ██╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║         ████╗  ██║██║   ██║██║████╗ ████║       ██╔══██╗██╔═══██╗██╔════╝██║       ╚══███╔╝██╔════╝██║  ██║
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║         ██╔██╗ ██║██║   ██║██║██╔████╔██║       ██████╔╝██║   ██║█████╗  ██║         ███╔╝ ███████╗███████║
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║         ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║       ██╔══██╗██║   ██║██╔══╝  ██║        ███╔╝  ╚════██║██╔══██║
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║▄█╗    ██║  ██║╚██████╔╝██║     ██║▄█╗    ███████╗███████║██║  ██║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝    ╚══════╝╚══════╝╚═╝  ╚═╝

'

read d -p "Now, I will install zsh. It will take quite a bit of time (Bây giờ tôi sẽ cài đặt zsh, nó sẽ tốn khá nhiều thời gian) [Enter]"
read -p "******* PLEASE READ THE FOLLOWING INSTRUCTIONS CAREFULLY ******* [Enter]"
echo "  "
read -p "- Press 'y' when asked if you want to set zsh as the default shell (Nhập y khi được hỏi có muốn đặt zsh là mặc định) [Enter]"
read -p "- After the installion process is complete, it will automatically swith to zsh. Please enter 'exit' and press Enter to continue (Sau khi cài đặt hoàn tất sẽ tự động chuyển sang zsh, nhập lệnh exit rồi enter để tiếp tục) [Enter]"
echo "  "
read -p "******* PLEASE READ THE FOLLOWING INSTRUCTIONS CAREFULLY ******* [Enter]"

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Cài đặt các plugin Zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Sao chép file cấu hình Zsh
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.backup  # Lưu bản sao cũ nếu có
fi
cp ./configs/zsh/.zshrc ~/
cp -r ./configs/alacritty ~/.config
cp -r ./configs/rofi ~/.config
cp -r ./configs/nvim ~/.config

# Kích hoạt các dịch vụ cần thiết
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now docker
sudo systemctl enable --now sddm

reboot
