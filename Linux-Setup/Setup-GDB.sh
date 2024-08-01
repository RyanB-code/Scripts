#!/bin/bash

# Assumptions
#   1. Run with sudo privileges

echo "Attempting to install GDB..."

# Direct normal input to null, and only display errors to stdout
if apt install gdb 1>/dev/null 2>&1; then
    echo "Successfully installed gdb."
else
    echo "Could not install gdb."
    echo "Try running the script with sudo privileges."
    exit 2
fi

