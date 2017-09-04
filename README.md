# What does this get me?
A rather opinionated setup for command line development of mostly scripting languages, but certainly works for anything you know how to setup.

Currently installs the following programming languages by default:

|Language|Versions|
--------|-------
|Python|3.6.2(default), 2.7.13|
|Ruby|2.3.4|
|Node|8.1.4|


Currently pyenv, rbenv, and nodenv are used to manage the installed versions. This means that you have user local installs for whichever versions of said languages you eventually end up installing.

Custom aliases.

Easy management of project development directories with automatic creation of basic tmuxinator configuration files. It's designed to help juggle multiple projects all at once that might require completely seperate sets of languages, dependencies and environments.

# Install

```
cd ~/
git clone https://github.com/mchristen/dotfiles
cd dotfiles
./install.sh
```

After the install your prompt should change to something like:
```

[username@hostname:~/dotfiles]
$
```

# Usage

First thing is first, your shell is now in vi mode, so you'll need to know how to navigate between normal and insert mode to take advantage of it's many features.

https://github.com/pkrumins/bash-vi-editing-mode-cheat-sheet/blob/master/bash-vi-editing-mode-cheat-sheet.txt

## Basic environment
If you look in the file `~/.local_home/.rc` you'll see the following variables being set.

|Variable|Used for|
---------|--------|
|BASE_DEV_DIR|The root directory where all your projects will live|
|VENV_DIR|The directory where all your python virtual environments live|

These are basis for most of the development environment management.

## Create a new development environment
`bootstrap_dev_env new-project`

If all goes well tmuxinator should start up, you'll know because there will be a highlighted bar at the bottom of your terminal with three labels for the three default tmux windows.

You should also be in the directory ~/work/new-project

If you look in the current directory you'll see 3 files

|File|What is it|
|-----|----------|
|.tmuxinator.yml|The default .tmuxinator.yml file, customize this to fit your project as it evolves|
|dev_setup.sh|This is the file that tmuxinator runs before it boots up the shell. You could use this to install project specific dependencies through tools like bundler, npm, etc.|
|env.sh|This file contains a list of environment variables that are specific to this project. It is your choice what you want to put in here, think carefully about putting credentials in it and what you do with this file|

## Starting/Resuming/Detaching from a development environment
`start_dev_env new-project` or `sde new-project` for short. Note that this command has tab completion, so it's easy to find long project names.

This will effectively cd into the project directory and startup tmux using tmuxinator.

If you get disconnected from your session for whatever reason, network related, accidental window closing, etc. tmux should keep your sessions running and the aforementioned command will get you right back into the session. If you want to leave your session whatever reason manually you can press `Ctrl+B D` to detach from your tmux session.
