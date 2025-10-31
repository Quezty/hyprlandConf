#!/usr/bin/env bash

# Get window information and format for dmenu
window_list=$(hyprctl clients -j | jq -r '.[] | "\(.title) (class: \(.class), address: \(.address))"' | sort)

# Pipe to dmenu and get selected window
selected_window=$(echo -e "$window_list" | dmenu -i -l 10 -p "Switch to window:")

# Extract the window address from the selected string
window_address=$(echo "$selected_window" | grep -oP 'address: \K[^)]+')

# Focus the selected window if an address was found
if [ -n "$window_address" ]; then
    hyprctl dispatch focuswindow "$window_address"
fi
