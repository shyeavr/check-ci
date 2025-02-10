#!/bin/bash
set -e  # Exit on error

# Load the environment variables properly
export HOME=/home/jenkins  # Ensure this is correct for your Jenkins user
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

# Initialize pyenv
if [ -d "$PYENV_ROOT" ]; then
    eval "$(pyenv init --path)"
fi

# Debugging: Print available Python versions
pyenv versions

# Set the desired Python version
pyenv install -s 3.10.0  # Install only if missing
pyenv global 3.10.0

# Create and activate virtual environment
python3 -m venv myenv
source myenv/bin/activate

echo '#### Checking Python ####'
which python3
python3 -V

echo '#### Installing requirements ####'
pip install -r ./requirements.txt

echo '#### Run tests ####'
pytest tests --alluredir=./allure_results --junitxml=./xmlReport/output.xml

echo '### Deactivating virtual environment ###'
deactivate

echo '### Resetting pyenv to system default ###'
pyenv global system
