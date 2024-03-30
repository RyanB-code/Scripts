# How to Use

## Provide a Project Name

Create a fresh project in the default directory by providing just a name for a new project. 

- ***NOTE:*** Any spaces will be replaced with dashes 

```newproject <Project Name>```

### Example

``` newproject "Test Project Name" ```

The name for the project will be `Test-Project-Name`

## Specifying a Project Directory

The default location to store projects is currently `/mnt/NAS/1. Project Related/Project Source Directories/`, and no argument is needed if you wish to store your project in that location. 

However, the default location can be overridden by providing a separate directory as the second argument by doing:

```newproject <Project Name> [directory path]```

### Example

```newproject "Test Project Name" /usr/local/share/Projects```

This will store the project `Test-Project-Name` in the directory `/usr/local/share/Projects/`


## Confirm Project Creation

Upon providing at least the name of the new project, some information will be shown to you.

### Example

```
$ newproject "Test Project Name" /usr/local/share/Projects
Directory is set to "/usr/local/share/Projects"
Confirm name as "Test-Project-Name" [y/N]:
```

This will tell you the current specified directory to store the project, along with the amended project name.

Submit your response. Entry is not case sensitive, and option other than 'Y' or 'y' will terminate the process. 

**This is your last interaction with the script.**

## Further Information

After confirming the name of the project, some more actions will take place and information will be shown to you. If you wish to see exactly what will take, you can do so [here](newproject.md#detailed-analysis).

```
Confirm name as "Test-Project-Name" [y/N]: y
Project can be found at "/usr/local/share/Projects/Test-Project-Name"
Opening in VS Code...
```

This will tell you the final path to the newly created directory, and that the script is attempting to open that location in Visual Studio Code.