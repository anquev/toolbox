#!/bin/bash

# Add virtual environment activation to bashrc
echo 'source /home/vscode/.venv/bin/activate' >> ~/.bashrc

# git configuration
git config --global init.defaultBranch main

# notebooks and data directories
mkdir -p /workspaces/toolbox/datascience/data
mkdir -p /workspaces/toolbox/datascience/notebooks
mkdir -p /workspaces/toolbox/datascience/src