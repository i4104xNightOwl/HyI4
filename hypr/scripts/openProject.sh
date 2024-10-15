#! /bin/bash

path=$(zenity --file-selection --directory --title="Select folder")

alacritty -e sh -c "cd $path && nvim"
