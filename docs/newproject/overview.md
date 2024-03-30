# Overview for newproject

## Purpose

newproject - the fast way to setup necessary files and directories for C++ in VSCode

## Description

This script is a way to easily create necessary directories for a C++ project with a `tasks.json` file for use in VSCode using the g++ compiler.

Can be used in conjunction with [newproject-git](../newproject-git/newproject-git.md) script to initialize git and create a remote GitHub repository for all project files.

## Detailed Analysis

A guide can be found [here](usage.md) to interact with the script. This section will not go over usage, just an analysis of what the script does.

The script will create a new directory in a specified location with the following subdirectories:

- include
- bin
- lib
- docs
- src
- builds
- .vscode

A `tasks.json` file will be created inside the `.vscode` directory. 

The `tasks.json` file will be a copy of the `tasks-linux.txt` file located inside the `newproject-files` directory (this will be referred to as the template directory). 

- ***NOTE:*** that this directory is found in the script relative to the executable itself. If the script is located in the `/usr/local/bin/` directory, the path of the template directory should be `/usr/local/bin/newproject-files/`. See [Setup](setup.md) for more information.

After subdirectories and the tasks file have been created, the newly created project directory should be opened in Visual Studio Code.