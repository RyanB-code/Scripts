# Setup

## Script Only

To use the script, the only requisites are that the `newproject` executable is in the same location as the `newproject-files` directory, as well as the `tasks-linux.txt` file inside the `newproject-files` directory is populated with whatever you want the default VS Code `tasks.json` file to be.

## Setup as a Command

To use the script as a normal linux command, follow these steps

1. Move `newproject` script and `newproject-files` directory into `/bin/bash`
2. Change script permissions to be executable. 
    - Only allow the owner to read, write, and execute permissions by doing `chmod 775 newproject`. All others will only be able to read and execute.
3. Run the script

