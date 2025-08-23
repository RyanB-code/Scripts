#!/bin/bash

cd ~

tmux new-session -d -s Development -n 'time-tracker' 'time-tracker ; bash -i'
tmux new-window -t Development:1 -n 'Directory' 'cd /mnt/NAS/1-Project-Related/Project-Source-Directories/; bash -i'
tmux new-window -t Development:2 -n 'nvim' '/opt/nvim-linux-x86_64/bin/nvim /mnt/NAS/1-Project-Related/Project-Source-Directories/ ; bash -i' 
tmux attach-session -t Development 

