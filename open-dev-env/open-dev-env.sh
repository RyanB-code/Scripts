#!/bin/bash

gnome-terminal -- bash -c "/opt/nvim-linux-x86_64/bin/nvim /mnt/NAS/1-Project-Related/Project-Source-Directories/ ; exec bash"

tmux new-session -d -s Development 'time-tracker ; bash -i' \; new-window 'cd /mnt/NAS/1-Project-Related/Project-Source-Directories/; bash -i' \;
tmux attach-session -t Development


