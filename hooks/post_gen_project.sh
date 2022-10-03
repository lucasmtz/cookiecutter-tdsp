#!/bin/sh
# -----------------------------------------------------------------------------------------------------------------
# If python_version is blank, then set it to the latest stable version of Python
# -----------------------------------------------------------------------------------------------------------------
if [ -n "$(pyenv install --list | egrep "^\s{0,}{{cookiecutter.python_version}}$")" ]; then
    PYTHON_VERSION=$(pyenv install --list | egrep "^\s{0,}{{cookiecutter.python_version}}$" | xargs)
    printf "\n\nInstalling $PYTHON_VERSION..."
else
    PYTHON_VERSION=$(pyenv install --list | egrep "^  3\.[0-9]{1,}\.[0-9]{1,}$" | tail -1 | xargs)
    printf "\n\nNo version of {{cookiecutter.python_version}} found. Installing latest python version ($PYTHON_VERSION).."
fi

# -----------------------------------------------------------------------------------------------------------------
# Install python_version
# -----------------------------------------------------------------------------------------------------------------
pyenv install $PYTHON_VERSION -s
pyenv global $PYTHON_VERSION

# -----------------------------------------------------------------------------------------------------------------
# Start a git repository if it not exists and copy .gitignore and .pre-commit-config.yaml
# -----------------------------------------------------------------------------------------------------------------
inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
if [ "$inside_git_repo" ]; then
    printf "\n\nGit repository already exists. Deleting .gitignore and .pre-commit-config.yaml..."
    rm -f .gitignore .pre-commit-config.yaml
else
    printf "\n\nInitializing new git repository.."
    git init -b main
fi

# -----------------------------------------------------------------------------------------------------------------
# Create virtual environment for project
# -----------------------------------------------------------------------------------------------------------------
printf "\n\nCreating virtual environment for project."
poetry install
poetry env info

# -----------------------------------------------------------------------------------------------------------------
# Install pre-commit
# -----------------------------------------------------------------------------------------------------------------
printf "\n\nInstalling pre-commit... "
poetry run pre-commit install
poetry run pre-commit install --hook-type commit-msg

# -----------------------------------------------------------------------------------------------------------------
# Add VScode settings to .gitignore
# -----------------------------------------------------------------------------------------------------------------
sed -i 's/# .vscode/\.vscode/g' .gitignore

# -----------------------------------------------------------------------------------------------------------------
# Display success message
# -----------------------------------------------------------------------------------------------------------------
printf "\n\n{{cookiecutter.project_name}}[{{cookiecutter.__package_name}}] TDSP project template created. Happy codin"
