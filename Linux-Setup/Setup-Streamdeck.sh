#!/bin/bash


# Assumptions
#   1. Run with sudo privileges

if apt install streamdeck-ui 1>/dev/null 2>&1; then
    echo "Successfully installed streamdeck-ui."
else
    echo "Could not install streamdeck-ui."
    echo "Try running the script with sudo privileges."
    exit 2
fi

if apt install libxcb-xinerama0 1>/dev/null 2>&1; then
    echo "Successfully installed libxcb-xinerama0."
else
    echo "Could not install libxcb-xinerama0."
    echo "Try running the script with sudo privileges."
    exit 2
fi

if apt install libxcb-cursor0 1>/dev/null 2>&1; then
    echo "Successfully installed libxcb-xinerama0."
else
    echo "Could not install libxcb-cursor0."
    echo "Try running the script with sudo privileges."
    exit 2
fi

echo "Download successful."


