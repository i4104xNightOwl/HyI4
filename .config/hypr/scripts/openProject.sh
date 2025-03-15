#! /bin/bash
path=$(zenity --file-selection --directory --title="Select folder")

if [ -n "$file_path" ]; then
    kitty -e sh -c "cd $path && nvim"
fi

