#! /bin/bash

path=$(zenity --file-selection --directory --title="Chọn folder")

alacritty -e sh -c "cd \"$path\" && nvim"
