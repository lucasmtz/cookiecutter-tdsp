# {{cookiecutter.project_name}}
{{cookiecutter.description}}


## Project Structure
```markdown
{{cookiecutter.__package_name}}
 ┣ .vscode
 ┃ ┣ extensions.json
 ┃ ┗ settings.json
 ┣ data
 ┃ ┣ interim
 ┃ ┣ processed
 ┃ ┣ raw
 ┃ ┗ README.md
 ┣ docs
 ┃ ┣ acceptance
 ┃ ┃ ┗ project_exit_report.md
 ┃ ┣ business_understanding
 ┃ ┃ ┗ project_charter.md
 ┃ ┣ data
 ┃ ┃ ┗ data_summary_report.md
 ┃ ┣ media
 ┃ ┣ modeling
 ┃ ┃ ┗ final_model_report.md
 ┃ ┣ references
 ┃ ┣ src
 ┃ ┣ system_architecture
 ┃ ┃ ┗ system_architecture_report.md
 ┃ ┗ README.md
 ┣ models
 ┃ ┗ README.md
 ┣ notebooks
 ┃ ┗ README.md
 ┣ pipelines
 ┃ ┗ README.md
 ┣ src
 ┃ ┗ {{cookiecutter.__package_name}}
 ┃ ┃ ┗ __init__.py
 ┣ tests
 ┃ ┣ data_validation
 ┃ ┃ ┗ __init__.py
 ┃ ┣ unit
 ┃ ┃ ┣ __init__.py
 ┃ ┃ ┗ test_{{cookiecutter.__package_name}}.py
 ┃ ┗ __init__.py
 ┣ .gitignore
 ┣ .pre-commit-config.yaml
 ┣ README.md
 ┗ pyproject.toml
```
