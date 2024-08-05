#!/bin/bash

# Variables
sysdConfigDir=$HOME/.local/share/systemd/user/
sysdFile=$HOME/.local/share/systemd/user/streamdeck.service
sysdFileTemplate="Config Files/StreamdeckSysdConfig.txt"
bashRC=$HOME/.bashrc

echo "Now setting up streamdeck as a systemd service."


# ==========================================
# Add to bash RC file
echo ""
echo "Editing .bashrc file..."
echo "# Added by script for setup of streamdeck-ui" >>$bashRC
echo "PATH=$PATH:$HOME/.local/bin" >>$bashRC


# ==========================================
# Create udev rule to discover elgato devices
echo "Creating udev rules..."
sudo sh -c 'echo "SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"0fd9\", TAG+=\"uaccess\"" > /etc/udev/rules.d/70-streamdeck.rules'
sudo udevadm trigger

# ==========================================
# Make service directory
mkdir -p $sysdConfigDir
if [ -d "$sysdConfigDir" ]
then
    echo "Found directory \"$sysdConfigDir\"."
else
    echo "Could not find directory\"$sysdConfigDir\"."
    echo "Process aborted."
    exit 2
fi

# ==========================================
# Copy template into sysd config file
if [ -f "$sysdFileTemplate" ]
then
    echo "Found template file."
else
    echo "Could not find template file \"$sysdFileTemplate\"."
    echo "Process aborted."
    exit 2
fi

cp "$sysdFileTemplate" "$sysdFile"

# ==========================================
# Check file exists
if [ -f "$sysdFile" ]
then
    echo "Made systemd service file \"$sysdFile\"."
else
    echo "Could not find file \"$sysdFile\"."
    echo "Process aborted."
    exit 2
fi

# ==========================================
# Make configuration take effect
echo "Configuring systemd with new settings..."
systemctl --user daemon-reload
systemctl --user enable streamdeck

# ==========================================
# Start systemctl streamdeck
echo ""
echo "Starting streamdeck service..."
systemctl --user start streamdeck

# ==========================================
# echo status systemctl streamdeck
echo "Streamdeck systemd service status: "
systemctl --user status streamdeck

echo ""
echo "You can stop the service by doing \"systemctl --user stop streamdeck\"."