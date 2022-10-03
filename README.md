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

```
{{cookiecutter.__package_name}}
├─ .gitignore
├─ .pre-commit-config.yaml
├─ .vscode
│  ├─ extensions.json
│  └─ settings.json
├─ README.md
├─ docs
│  ├─ 01_business_understanding
│  │  └─ project_charter.md
│  ├─ 02_architecture
│  │  └─ system_architecture_report.md
│  ├─ 03_data
│  │  ├─ data_definition.md
│  │  ├─ data_dictionary.md
│  │  └─ data_summary_report.md
│  ├─ 04_modeling
│  │  ├─ final_model_report.md
│  │  └─ models
│  │  ├─ baseline_model.md
│  │  └─ model_1.md
│  ├─ 05_deployment
│  │  └─ deployment_report.md
│  ├─ 06_acceptance
│  │  └─ project_exit_report.md
│  └─ README.md
├─ pyproject.toml
├─ tests
│  ├─ __init__.py
│  └─ test_{{cookiecutter.__package_name}}.py
└─ {{cookiecutter.__package_name}}
   └─ __init__.py
```
