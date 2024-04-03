#! /bin/bash

firefox -new-tab "https://github.com/" -new-tab "https://en.cppreference.com/w/" &

flatpak run md.obsidian.Obsidian &

gnome-terminal -- bash -c "/mnt/NAS/1-Project-Related/Project-Source-Directories/Scripts/open-dev-env/open-dev-env-helper.sh; exec bash"
