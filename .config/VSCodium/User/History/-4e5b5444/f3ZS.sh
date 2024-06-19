#!/bin/bash

# Get screen dimensions
screen_width=$(xrandr | awk '/\*/ {print $1}' | cut -d 'x' -f1)
screen_height=$(xrandr | awk '/\*/ {print $1}' | cut -d 'x' -f2)

# Calculate center position
center_x=$((screen_width / 2))
center_y=$((screen_height / 2))

# Open Rofi in the center of the screen


# rofi -show drun -location 0 -xoffset $((center_x - 200)) -yoffset $((center_y - 200))

rofi -show drun -xoffset $((center_x - 200)) -yoffset $((center_y - 200))

