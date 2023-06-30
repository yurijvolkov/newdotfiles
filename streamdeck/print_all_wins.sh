#!/bin/bash

# Get the list of all windows that can be activated
window_list=$(xdotool search --onlyvisible --all)

# Print each window ID and its associated window name
for window_id in $window_list; do
    window_name=$(xdotool getwindowname "$window_id")
    echo "Window ID: $window_id, Window Name: $window_name"
done

