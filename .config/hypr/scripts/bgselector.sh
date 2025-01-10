#! /bin/bash
file_path=$(zenity --file-selection --title="Select image file as background")

if [ -n "$file_path" ]; then
    rm ~/.config/hypr/themes/background.png
    cp "$file_path" ~/.config/hypr/themes/background.png
    swaybg -i ~/.config/hypr/themes/background.png
fi
