#!/bin/bash
set -e  # Exit immediately if a command fails

# Ensure Python 3.10 is installed
if ! command -v python3.10 &>/dev/null; then
    echo "Error: Python 3.10 is not installed. Install it and retry."
    exit 1
fi

# Create a virtual environment
python3.10 -m venv myenv || { echo "Error: Failed to create virtual environment"; exit 1; }

# Activate the virtual environment
source myenv/bin/activate || { echo "Error: Virtual environment activation failed"; exit 1; }

echo '#### Checking Python ####'
which python3
python3 -V || { echo "Error: Python version check failed"; exit 1; }

echo '#### Installing requirements ####'
pip install --upgrade pip
pip install -r ./requirements.txt || { echo "Error: Failed to install requirements"; exit 1; }

echo '#### Run tests ####'
pytest tests --alluredir=./allure_results --junitxml=./xmlReport/output.xml || { echo "Error: Tests failed"; exit 1; }

echo '### Deactivating virtual environment ###'
deactivate
