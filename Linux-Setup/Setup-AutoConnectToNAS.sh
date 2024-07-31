#!/bin/bash

# Assumptions 
#  1. Arg 1 = credentials file path

# If no argument exists, exit
if [ "$#" -eq 0 ]
then
  echo "No arguments provided."
  echo "Process aborted."
  exit 2
fi

# Variables
IP=172.25.69.10
serverDirectory=general-purpose
fstabFile=/etc/fstab
mountDirectory=/mnt/NAS
user=bradley
credentialsFile=$1


while getopts ":i:D:d:u:" option; do
    case $option in
        i) 
            # Set IP
            IP="$OPTARG"
            ;;
        D) 
            # Set serverDirectory name
            serverDirectory="$OPTARG"
            ;;
        d)
            # Set mount directory
            mountDirectory="$OPTARG"
            ;;
        u)
            # Assign linux user
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
# Install cifs-utils

echo "Attempting to install cifs-utils..."
echo ""

# Install cifs-utils
apt install cifs-utils

# Direct normal input to null, and only display errors to stdout
if apt install cifs-utils >/dev/null 2>&1; then
    echo "Successfully installed cifs-utils."
    echo ""
else
    echo ""
    echo "Could not install cifs-utils"
    echo "Try running the script with sudo privileges."
    exit 2
fi


# ==========================================
# Confirm IP
read -p "Confirm setup of auto connect to IP $IP? [y/N]: " input
case $input in
    [yY]*)
        # Continue execution
        ;;
    *)
        echo "Process aborted."
        exit 2
        ;;
esac


# ==========================================
# Confirm Server Dir
read -p "Confirm server-side directory as \"$serverDirectory\"? [y/N]: " input
case $input in
    [yY]*)
        # Continue execution
        ;;
    *)
        echo "Process aborted."
        exit 2
        ;;
esac



# ==========================================
# Ensure mount directory
read -p "Confirm mount directory as \"$mountDirectory\"? [y/N]: " input
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
# Check if credentials file exists
if [ -f "$credentialsFile" ]
then
    # Continue
    echo "Credentials file found."
else
    echo "Could not locate credentials file \"$credentialsFile\"."
    echo "Process aborted."
    exit 2
fi

# ==========================================
# Ensure mount location
if [ -d "$mountDirectory" ]
then
    echo "Mount directory found."
else

    # Create if not found
    if mkdir "$mountDirectory"; then
        echo "Created directory \"$mountDirectory\"."
        echo ""
    else
        echo "Could not create desired mount directory \"$mountDirectory\"."
        echo "Process aborted."
        exit 2
    fi
fi

# ==========================================
# Ensure user exists
if id "$user" >/dev/null 2>&1; then
    echo "User \"$user\" found."
else
    echo "User \"$user\" not found."
    echo "Process aborted."
    exit 2
fi


# ==========================================
# Ensure /etc/fstab file exists
if [ -f "$fstabFile" ]
then
    # Continue
    echo "fstab file found."
else
    echo "Could not locate file \"$fstabFile\"."
    echo "Process aborted."
    exit 2
fi


# Append to fstab file
echo "Appending file..."
echo "" >> $fstabFile
echo "# Added by setup script" >> $fstabFile
echo "//$IP/$serverDirectory/ $mountDirectory cifs uid=$user,credentials=$credentialsFile,iocharset=utf8,vers=3.0,noperm,nofail 0 0" >> $fstabFile

echo ""
echo "Successful."


