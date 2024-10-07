#! /bin/bash

file_path=$(zenity --file-selection --title="Chọn file")

rm ~/.config/hypr/themes/background.png
cp $file_path ~/.config/hypr/themes/background.png

swaybg -i ~/.config/hypr/themes/background.png
