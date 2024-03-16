# General Scripts Overview


## The Purpose

This is a page dedicated to all scripts that I created for my own personal use. There is no guarantee everything will be accurate and explain in full depth to someone who is not
familiar with these projects/scripts. 

The intent is for me to be able to refer back to these pages when necessary, without having to look at the source code every time. This requires me to update the documentation with every push, and that is something I need to get better at currently.

## File Locations

General file locations for these scripts will be in the `/usr/local/bin` directory, with necessary helper files located in either the same directory, or under `/usr/local/share/<Project Name>` for files that need to be stored.

Additional information can be found with the script.

### Example
A project with the name "Time Tracker" or "Time-Tracker" would have helper files under `/usr/local/share/Time-Tracker` or `/usr/local/bin/Time-Tracker-Files` 


## General Setup


### Script only
1. Copy script file into necessary $PATH location (generally `/usr/local/bin`)
2. Give approriate permissions the script
    - Make script executable using `sudo chmod +x <file name>` to allow for all to be able to execute it
    - To restrict access you can do `sudo chmod 774 <file name>` to allow only the group and owner to be able to read, write, and execute, and only others to just read and execute.
3. Run

### Clone Repository
This option is for if you want to be able to contribute to the project from this device. Prequisite of having git SSH and user setup.

1. Clone repository to file using `git clone <url>`
2. Compile current project state
    - ***NOTE*** that sometimes I have a test setup for file locations and then a release location commented out. **This is a terrible practice I am aware**, however it suits my needs with the time that I desire to spend on projects.
    - Ensure the correct locations are given
3. Refer to *Script Only* procedures for directions on where to put the output file

