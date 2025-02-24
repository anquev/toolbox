# Data Science DevContainer

A lightweight development environment for data science projects using uv for dependency management and ruff for linting.

## Quick Start

### Prerequisites
- [Docker](https://www.docker.com/products/docker-desktop)
- [VS Code](https://code.visualstudio.com/)
- [Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### Starting the DevContainer

1. Clone this repository
2. Open the project folder in VS Code
3. When prompted, click "Reopen in Container" or press F1 and select "Remote-Containers: Reopen in Container"
4. Wait for the container to build (this may take a few minutes the first time)

### Working with the Environment

- The Python virtual environment is automatically activated in terminal sessions
- All dependencies from `pyproject.toml` are pre-installed
- Jupyter notebooks can be created and run directly in VS Code

### Project Structure

By default, the following structure is created:
```
.
├── .devcontainer/     # Container configuration
├── data/              # Store your datasets here
├── notebooks/         # Jupyter notebooks
├── src/               # Source code
└── pyproject.toml     # Project dependencies
```

### Managing Dependencies

Add new dependencies to `pyproject.toml` and run:

```bash
uv pip install -e .
```

### Running Python Scripts

```bash
python your_script.py
```

## Features

- Python 3.12 environment
- Data science packages (numpy, pandas, polars, scikit-learn, duckdb)
- Visualization tools (matplotlib, seaborn)
- Jupyter notebooks support
- Fast dependency management with uv
- Code linting with ruff

## Troubleshooting

If you encounter issues with missing packages:

1. Verify you're using the correct Python interpreter:
   ```bash
   which python
   ```
   Should point to `/home/vscode/.venv/bin/python`

2. Reinstall dependencies:
   ```bash
   uv pip install -e .
   ```

3. Check VS Code Python interpreter settings (F1 → "Python: Select Interpreter")



Enjoy coding 😎