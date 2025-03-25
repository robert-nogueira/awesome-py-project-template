# 🐍 Awesome python project template

## 📑 Table of Contents

- [⚙️ Setup Instructions](#-setup-instructions)
  - [📥 Prerequisites](#-prerequisites)
  - [🛠️ Using Cookiecutter](#-using-cookiecutter-to-generate-the-project)
  - [🔧 Post-Generation Script (`post_gen_project.sh`)](#-post-generation-script-post-gen-projectsh)
  - [⚙️ Pre-commit Setup](#-pre-commit-setup)
- [🛠️ Tools and Configurations](#-tools-and-configurations)
  - [📦 Poetry Configuration](#-poetry-configuration)
  - [🖋️ Pre-commit Hooks](#-pre-commit-hooks)
  - [⚙️ Taskipy](#-taskipy)
  - [🧪 Testing with Pytest](#-testing-with-pytest)
  - [📊 Coverage](#-coverage)
  - [🛡️ Bandit, Vulture, and Safety](#-bandit-vulture-and-safety)
  - [🔧 Conventional Commits and Gitmoji](#-conventional-commits-and-gitmoji)
- [🔜 Future Package Manager Support](#-future-package-manager-support)
- [🤝 How to Contribute](#-how-to-contribute)
- [📝 License](#-license)

## 🧑‍💻 Project Overview

This template provides a modern setup for Python projects with an emphasis on code quality, security, testing, and automated workflows. It integrates a range of tools to streamline the development process.

### Included Tools:

- 📦 **Poetry**: Dependency management and packaging.
- 🔧 **Taskipy**: Task automation and management.
- 🖋️ **Pre-commit hooks**: Automate linting, formatting, and checks before commits.
- 🧪 **Pytest**: Testing framework for Python.
- 📊 **Coverage**: Measure and track test coverage.
- 🛡️ **Bandit**: Security analysis of Python code.
- 🗑️ **Vulture**: Detect unused code (dead code).
- 🔐 **Safety**: Check for vulnerabilities in dependencies.

## ⚙️ Setup Instructions

### 📥 Prerequisites

Ensure you have Python 3.13 or higher installed. Additionally, you'll need **Poetry** to manage dependencies and environments.

To install **Poetry**, follow the instructions here:
[Poetry Installation Guide](https://python-poetry.org/docs/#installation)

### 🛠️ Using Cookiecutter to Generate the Project

To generate a new project using this template with **Cookiecutter**, run:

```bash
cookiecutter https://github.com/robert-nogueira/awesome-py-project-template
```

You will be prompted to customize your project setup, with options to choose:

- ✅ **Linters** (e.g., `ruff`, `flake8`, `pylint`).
- ✅ **Formatters** (e.g., `black`, `ruff`).
- ✅ **Type Checkers** (e.g., `mypy`, `pyright`).
- ✅ **Additional tools** (e.g., **isort**).

The `cookiecutter` template will automatically configure the necessary tools based on your selections.

### 🔧 Post-Generation Script (`post_gen_project.sh`)

After generating the project, **Cookiecutter** will run a post-generation script (`post_gen_project.sh`) that:

1. Installs and updates dependencies via **Poetry**.
2. Sets up **pre-commit hooks**.
3. Customizes configurations based on your choices during project setup (e.g., linters, formatters, and other tools).

The script is executed automatically after running `cookiecutter`. If you need to run it manually, use:

```bash
./post_gen_project.sh
```

### ⚙️ Pre-commit Setup

**Pre-commit** is configured to run hooks automatically before each commit. The post-generation script will install **pre-commit** and set up hooks as defined in `.pre-commit-config.yaml`.


## 🛠️ Tools and Configurations

### 📦 Poetry Configuration

All dependencies and environment settings are managed by **Poetry**, and the `pyproject.toml` file contains both runtime and development dependencies.

### 🖋️ Pre-commit Hooks

The `.pre-commit-config.yaml` file defines the hooks that run before each commit, including linters, formatters, and checks for common issues.

### ⚙️ Taskipy

**Taskipy** is configured to help you automate project tasks. You can define and run any task you need, including running tests, code analysis, and more. Tasks are defined in the `tasks.py` file.

### 🧪 Testing with Pytest

**Pytest** is the recommended framework for testing in this template. It supports fixtures, plugins, and extensive test case setups.

### 📊 Coverage

The **coverage** tool integrates with pytest to measure how much of your code is tested. The reports can be viewed in the terminal or as an HTML file.

### 🛡️ Bandit, Vulture, and Safety

- **Bandit** checks for common security flaws in Python code.
- **Vulture** identifies dead code that should be removed.
- **Safety** checks for known security vulnerabilities in the project’s dependencies.

### 🔧 Conventional Commits and Gitmoji

This project follows the **Conventional Commits** specification, ensuring that commit messages are standardized and easily understood. Additionally, **Gitmoji** is used to add emojis to commit messages, providing a more visual and expressive way of representing changes.

**Example commit messages:**

- 🎉 feat(api): add new user authentication feature
- 🐛 fix(security): resolve issue with password hashing
- 📦 chore: update dependencies
- 📝 docs: improve README.md with new setup instructions

For more details on **Conventional Commits** and **Gitmoji**, check these resources:

- [Conventional Commits Specification](https://www.conventionalcommits.org/en/v1.0.0/)
- [Gitmoji - Emojis for Commit Messages](https://gitmoji.dev/)

## 🔜 Future Package Manager Support

We plan to add support for other package managers in the future, such as **UV** and **Hatch**, to provide more flexibility and compatibility with various environments.

## 🤝 How to Contribute

1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Run all tests, linters, and static analysis tools.
5. Submit a pull request.

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
