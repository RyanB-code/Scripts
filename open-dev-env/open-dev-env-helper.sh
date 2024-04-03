#! /bin/bash

code /mnt/NAS/1-Project-Related/Project-Source-Directories/

cd ~
tmux new-session \; split-window -h 'time-tracker' \;
