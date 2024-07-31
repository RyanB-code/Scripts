#!/bin/bash

#Assumptions
#   1. Arg 1 - username to log into server
#   2. Arg 2 - password to log into server

# Ensure there are both arguments
if [ "$#" -lt 2 ]
then
  echo "Must provide two arguments."
  echo "Process aborted."
  exit 2
fi

# ==========================================
# Parse non-optional arguments first
INDEX=0
while [ -n "$1" -a "${1:0:1}" != "-" ]; do
    ARGUMENT[$((++INDEX))]="$1"
    shift
done
if [ "$INDEX" -ne 2 ]; then
    echo "Error parsing arguments."
    echo "Process aborted."
    exit 2
fi



# Varibales
username="${ARGUMENT[1]}"
password="${ARGUMENT[2]}"
filePath=/home/bradley/.smb/credentials.txt


# ==========================================
# Parse optional arguments
while getopts ":f:" option; do
    case $option in
        f) 
            # Set file path
            filePath="$OPTARG"
            ;;
        ?) 
            echo "Invalid option found."
            echo "Process aborted."
            exit 2
            ;;
    esac
done

# ==========================================
# Ensure file exists
if [ -f "$filePath" ]
then
    # Continue
    echo "File \"$filePath\" was found."
else

    # Attempt to create file
    touch $filePath
    if [ -f "$filePath" ]
    then
        echo "Created file \"$filePath\"."
    else
        echo "Could not create file \"$filePath\"."
        echo "Process aborted."
        exit 2
    fi
fi

# ==========================================
# Confirm editing file
echo ""
echo "WARNING:  This will overwrite the file \"$filePath\" with fhe following credentials:" 
echo "  user=$username"
echo "  password=$password"
read -p "Do you wish to continue? [y/N]: " input
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
# Write to file
echo "user=$username" > $filePath
echo "password=$password" >> $filePath
echo "Successfully setup NAS credentials at \"$filePath\"."

