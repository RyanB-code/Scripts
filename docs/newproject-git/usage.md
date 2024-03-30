# How to Use

## Options

### -w <directory\>

Set the working directory. 

If this option is not present, the working directory is the current directory.

#### Example

```
$ newproject-git -w /home/john/project/
```

***NOTE:*** This will do nothing as no other options are included, however this is the correct syntax.

### -i

Initialize the Git repository with a `main` branch

### -g

Add a `.gitignore` file. The `.gitignore` will contain the following directories to be ignored

- `.vscode`
- `bin`

### -u <url\>

Connect a remote repository to an existing local Git repository. You will be asked to confirm the URL before the attempt is made

#### Example

```
$ newproject-git -u https://github.com/RyanB-code/Scripts.git 
```

***NOTE:*** Without an existing local Git repository, this command by itself will fail. 

### -p

Stage, commit, and push everything in the working directory. If no remote repository is connected, this will fail, but the changes will still be committed locally.
