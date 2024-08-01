#!/bin/bash

# Assumptions
#   1. Run with sudo privileges

echo "Attempting to install tmux..."

# Direct normal input to null, and only display errors to stdout
if apt install tmux 1>/dev/null 2>&1; then
    echo "Successfully installed tmux."
else
    echo "Could not install tmux."
    echo "Try running the script with sudo privileges."
    exit 2
fi
