# {{cookiecutter.project_name}}
{{cookiecutter.description}}

## Tests
The tests can be run after installation with:
```sh
pytest
```
To verify coverage:
```sh
coverage run -m pytest
coverage report -m --fail-under 80
coverage html
```

## Project Structure
```text
{{cookiecutter.__package_name}}/
├── data
│   └── README.md
├── data.dvc
├── docs
│   ├── acceptance
│   │   └── project_exit_report.md
│   ├── business_understanding
│   │   └── project_charter.md
│   ├── data
│   │   └── data_summary_report.md
│   ├── modeling
│   │   └── final_model_report.md
│   ├── README.md
│   ├── src
│   │   └── {{cookiecutter.__package_name}}
│   │       └── index.html
│   └── system_architecture
│       └── system_architecture_report.md
├── models
│   └── README.md
├── models.dvc
├── notebooks
│   └── README.md
├── pipelines
│   └── README.md
├── poetry.lock
├── pyproject.toml
├── README.md
├── src
│   └── {{cookiecutter.__package_name}}
│       └── __init__.py
└── tests
    ├── data_validation
    │   └── __init__.py
    ├── __init__.py
    └── unit
        ├── __init__.py
        └── test_{{cookiecutter.__package_name}}.py
```
