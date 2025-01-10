#! /bin/bash
path=$(zenity --file-selection --directory --title="Select folder")

if [ -n "$file_path" ]; then
    alacritty -e sh -c "cd $path && nvim"
fi

