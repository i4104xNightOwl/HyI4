#!/usr/bin/env bash

## Available Styles
#
## style-1     style-2     style-3     style-4     style-5
## style-6     style-7     style-8     style-9     style-10
## style-11    style-12    style-13    style-14    style-15

dir="$HOME/.config/rofi/launchers"
theme='style-2'

## Run
rofi \
    -dmenu \
    -theme ${dir}/${theme}.rasi
