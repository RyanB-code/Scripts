#!/bin/bash

# Assumptions
#   1. Run with sudo privileges

username='Bradley Ryan'
email=ryan.bradley.e@gmail.com

echo "Attempting to install git..."

# ==========================================
# Direct normal input to null, and only display errors to stdout
if apt install git 1>/dev/null 2>&1; then
    echo "Successfully installed git."
else
    echo "Could not install git."
    echo "Try running the script with sudo privileges."
    exit 2
fi


# ==========================================
# Parse optional arguments
while getopts ":u:e:" option; do
    case $option in
        u) 
            # Set username
            username="$OPTARG"
            ;;
        e) 
            # Set file path
            email="$OPTARG"
            ;;
        ?) 
            echo "Invalid option found."
            echo "Process aborted."
            exit 2
            ;;
    esac
done

echo ""

# ==========================================
# Confirm and set user name
read -p "Confirm global username as \"$username\"? [y/N]: " input
case $input in
    [yY]*)
        # Continue execution
        ;;
    *)
        echo "Process aborted."
        exit 2
        ;;
esac

if git config --global user.name $username; then
    echo "Successfully set global username."
else
    echo "Failed to set global username to \"$username\"."
    echo "Process aborted".
    exit 2
fi


# ==========================================
# Confirm and set email
read -p "Confirm global email as \"$email\"? [y/N]: " input
case $input in
    [yY]*)
        # Continue execution
        ;;
    *)
        echo "Process aborted."
        exit 2
        ;;
esac


if git config --global user.email $email; then
    echo "Successfully set global email."
else
    echo "Failed to set global email to \"$email\"."
    echo "Process aborted".
    exit 2
fi

