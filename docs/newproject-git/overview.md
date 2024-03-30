# Overview for newproject-git

## Purpose

newproject-git - an easy way to intially setup Git and optionally connect to a remote GitHub repository

## Description

This script is a quick way to initialize a Git repository for a project. It allows you to optionally

- Initialize a Git repository
- Create a default .gitignore file
- Connect a remote GitHub repository
- Commit and push everything to remote repository 

Can be used in an empty directory, or one created with [newproject](../newproject/overview.md). This script will not create a new directory for you.

## Detailed Analysis

A guide can be found [here](usage.md) to interact with the script. This section will not go over usage, just an analysis of what the script does.

This script will do all of following and provide a breakdown of the code being executed in the script

- Initialize a Git repository
    - This will do `git init -b main` in the desired directory
- Create a default .gitignore file
    - Check if a `.gitignore` file exists, if it does not, it will create one
    - If one is created, the `.gitignore` will be setup to ignore:
        - `.vscode` directory
        - `bin` directory

- Connect a remote GitHub repository
    - This will call `git remote add origin <url>`
- Commit and push everything to remote repository
    - The commands being executed are as follows

``` 
git add .
git commit -m "Automated Commit" -m "Automated commit from newproject-git script"
git push -u origin main
```