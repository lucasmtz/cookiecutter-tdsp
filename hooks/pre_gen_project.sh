#!/bin/sh
# -----------------------------------------------------------------------------------------------------------------
# Install Python build dependencies - PyEnv builds Python from source so you need to install all the build dependencies
# -----------------------------------------------------------------------------------------------------------------
printf "\n\nInstalling Python build dependencies..."
sudo apt-get update -y
sudo apt-get install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y

# -----------------------------------------------------------------------------------------------------------------
# Install PyEnv - PyEnv is a tool that allows you to install multiple versions of Python on the same machine
# -----------------------------------------------------------------------------------------------------------------
if [ -x "$(command -v pyenv)" ]; then
    printf "\n\nPyEnv is installed. Updating..."
    pyenv update
else
    printf "\n\nPyEnv is not installed."
    # Install PyEnv
    printf "\n\nInstalling PyEnv..."
    curl https://pyenv.run | bash
    # Set up your shell environment for Pyenv
    printf "\n\nSetting up your shell environment for Pyenv"
    # bashrc
    grep -qxF 'export PYENV_ROOT="$HOME/.pyenv"' ~/.bashrc || echo 'export PYENV_ROOT="$HOME/.pyenv"' >>~/.bashrc
    grep -qxF 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' ~/.bashrc || echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >>~/.bashrc
    grep -qxF 'eval "$(pyenv init -)"' ~/.bashrc || echo 'eval "$(pyenv init -)"' >>~/.bashrc
    # profile
    grep -qxF 'export PYENV_ROOT="$HOME/.pyenv"' ~/.profile || echo 'export PYENV_ROOT="$HOME/.pyenv"' >>~/.profile
    grep -qxF 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' ~/.profile || echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >>~/.profile
    grep -qxF 'eval "$(pyenv init -)"' ~/.profile || echo 'eval "$(pyenv init -)"' >>~/.profile
    # bash_profile
    grep -qxF 'export PYENV_ROOT="$HOME/.pyenv"' ~/.bash_profile || echo 'export PYENV_ROOT="$HOME/.pyenv"' >>~/.bash_profile
    grep -qxF 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' ~/.bash_profile || echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >>~/.bash_profile
    grep -qxF 'eval "$(pyenv init -)"' ~/.bash_profile || echo 'eval "$(pyenv init -)"' >>~/.bash_profile
fi

# -----------------------------------------------------------------------------------------------------------------
# Install Poetry - Poetry is a tool for dependency management and packaging in Python
# -----------------------------------------------------------------------------------------------------------------
# Unninstall Poetry if installed using the deprecated get-poetry.py script
printf "\n\nUninstalling Poetry if installed using the deprecated get-poetry.py script..."
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 - --uninstall
if [ -x "$(command -v poetry)" ]; then
    printf "\n\nPoetry is installed. Updating..."
    poetry self update
else
    printf "\n\nPoetry is not installed. Installing..."
    curl -sSL https://install.python-poetry.org | python3 -
    # Set up your shell environment for Poetry
    printf "\n\nSetting up your shell environment for Poetry"
    grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc || echo 'export PATH="$HOME/.local/bin:$PATH"' >>~/.bashrc
    grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' ~/.profile || echo 'export PATH="$HOME/.local/bin:$PATH"' >>~/.profile
    grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' ~/.bash_profile || echo 'export PATH="$HOME/.local/bin:$PATH"' >>~/.bash_profile
    # Enable tab completion for Bash
    poetry completions bash >>~/.bash_completion
fi
# Change config toc reate the virtualenv inside the project’s root directory
printf "\n\nChanging poetry config to create the virtualenv inside the project's root directory..."
poetry config virtualenvs.in-project true
poetry config virtualenvs.prefer-active-python true
