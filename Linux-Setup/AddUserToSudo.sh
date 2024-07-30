#!/bin/bash

# Assumptions 
#   1. Arg 1 = user to add
#   2. Script is run with `sudo` prefix


# Variables
user=$1

# If no argument exists, exit
if [ "$#" -eq 0 ]
then
  echo "No username provided."
  exit 2
fi



# Confirm user
read -p "Confirm adding user \"$user\" to sudo group? [y/N]: " input
case $input in
    [yY]*)
        # Continue execution
        ;;
    *)
        echo "Process aborted."
        exit 2
        ;;
esac

# Check if the user exists
if id "$user" >/dev/null 2>&1; then
    echo "User \"$user\" found."
else
    echo "User \"$user\" not found."
    echo "Process aborted."
    exit 2
fi

# Add user to sudo group
if usermod -aG sudo $user; then
    echo "Successfully added \"$user\" to sudo group"
    exit 1
else
    echo "Could not add \"$user\" to sudo group."
    echo "Try running the script with sudo privileges."
    exit 2
fi
