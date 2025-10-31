#!/usr/bin/env bash

windowID=$(hyprctl clients -j | grep -oP '"id": \s*\K\S+')
windowName=$(hyprctl clients -j | grep -oP '"initialTitle": \K.*')

echo $windowName
echo $windowID
