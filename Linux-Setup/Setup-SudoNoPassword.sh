#!/bin/bash

user=bradley

# ==========================================
# Parse optional arguments
while getopts ":u:" option; do
    case $option in
        u) 
            # Set file path
            user="$OPTARG"
            ;;
        ?) 
            echo "Invalid option found."
            echo "Process aborted."
            exit 2
            ;;
    esac
done

# ==========================================
# Confirm user
read -p "Make changes with user \"$user\"? [y/N]: " input
case $input in
    [yY]*)
        # Continue execution
        echo ""
        ;;
    *)
        echo "Process aborted."
        exit 2
        ;;
esac


# ==========================================
# Add user by amending file
if echo -e "\n# Remove Password Requirement for bradley\n# Added from setup script\n$user ALL=(ALL) NOPASSWD: ALL" | sudo EDITOR='tee -a' visudo 1>/dev/null; then
    echo "Successfully amended file."
    exit 1;
else
    echo "Could not ammend file."
    echo "Try running the script with sudo privileges."
    exit 2 
fi