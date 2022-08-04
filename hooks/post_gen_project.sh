#!/bin/sh
# -----------------------------------------------------------------------------------------------------------------
# Update poetry and set config virtualenvs.in-project to true
# -----------------------------------------------------------------------------------------------------------------
echo "Updating poetry..."
poetry self update
poetry config virtualenvs.in-project true

# -----------------------------------------------------------------------------------------------------------------
# Start a git repository if it not exists and copy .gitignore and .pre-commit-config.yaml
# -----------------------------------------------------------------------------------------------------------------
inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
if [ "$inside_git_repo" ]; then
    echo "Git repository already exists. Deleting .gitignore and .pre-commit-config.yaml..."
    rm -f .gitignore .pre-commit-config.yaml
else
    echo "Initializing new git repository..."
    git init -b main
fi

# -----------------------------------------------------------------------------------------------------------------
# Create virtual environment for project
# -----------------------------------------------------------------------------------------------------------------
echo "Creating virtual environment for project..."
poetry install
poetry env info

# -----------------------------------------------------------------------------------------------------------------
# Install pre-commit
# -----------------------------------------------------------------------------------------------------------------
echo "Installing pre-commit..."
poetry run pre-commit install
poetry run pre-commit install --hook-type commit-msg

# -----------------------------------------------------------------------------------------------------------------
# Add VScode settings to .gitignore
# -----------------------------------------------------------------------------------------------------------------
sed -i 's/# .vscode/\.vscode/g' .gitignore

# -----------------------------------------------------------------------------------------------------------------
# Display success message
# -----------------------------------------------------------------------------------------------------------------
echo "{{cookiecutter.project_name}}[{{cookiecutter.__package_name}}] TDSP project template created. Happy coding!"
