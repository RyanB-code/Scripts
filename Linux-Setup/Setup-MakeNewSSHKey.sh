#!/bin/bash

# Assumptions
#   1. Arg 1 - Description of the Key

description=$1

if [ "$#" != 1 ]
then
  echo "Requires a description as argument one."
  echo "Process aborted."
  exit 2
fi

# ==========================================
# Confirm Description
read -p "Confirm description as \"$description\"? [y/N]: " input
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
# Generate file
echo ""
if ssh-keygen -t ed25519 -C "$description"; then
    echo ""
else
    echo "Could not create SSH key/file."
    echo "Process aborted."
    exit 2
fi

# ==========================================
# Add file to ssh agent
echo "Enter file name to add to SSH agent. "
read -p "Note: Must use the private key, NOT the public key (.pub) file: " input
if [ -f "$input" ]; then
    if ssh-add $input; then
        echo "Successfully added \"$input\" to SSH agent."
        exit 1
    else
        echo "Could not add \"$input\" to SSH agent."
        echo "Process aborted."
        exit 2
    fi
else
    echo "Could not find file \"$input\"."
    echo "Process aborted."
    exit 2
fi

echo "Directions to add SSH Key to GitHub:"
echo " 1. Navigate to GitHub profile Settings"
echo " 2. Go to 'SSH and GPG keys' section"
echo " 3. Click the 'New SSH Key' button"
echo " 4. Copy the contents of the .pub file into the text box"
echo " 5. Create an appropriate title and that's it"