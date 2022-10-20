# cookiecutter-tdsp

A [cookiecutter](https://cookiecutter.readthedocs.io/) template for a data science project file structure following Microsoft's [Team Data Science Process (TDSP)](https://docs.microsoft.com/en-us/azure/machine-learning/team-data-science-process/overview) guidelines.  This template allows for the easy creation of a full project directory that is both language- and cloud-agnostic.

## Usage

1.  Make sure you have git and [cookiecutter](https://cookiecutter.readthedocs.io/) installed by running the following commands in your terminal:
    * `sudo apt update && sudo apt install git -y`
    * `python3 -m pip install --upgrade pip`
    * `python3 -m pip install --user cookiecutter`
2.  Generate your project using the project template from this repository. You will be prompted for: **project name**, **customer/client name**, **description**, **authors** and **license**.
    * `cookiecutter https://github.com/lucasmtz/cookiecutter-tdsp`
        * **project_name** [Project Name]: `propensity-buy-ecommerce`
        * **customer_name** [Customer or Client Name]: `Some Big Company`
        * **description** [Project descriprion]: `A data science project for a big company`
        * **authors:** [author1_name <author1_email>, author2_name <author2_email>]: `author1 <author1@example.com>, author2 <author2@example.com>`
        * **license** [Choice Variable]: `1`
        * **python_version** [Valid values from pyenv install --list. Default is latest version of python 3]: `3.9.14`
3.  The project directory will be created in the current directory.  You can navigate to the project directory using the `cd` command and open VS Code using the `code` command.
    * `cd propensity_buy_ecommerce`
    * `code .`

## Template project structure

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
