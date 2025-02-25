# Data Science config
FROM python:3.12-slim-bullseye

# Define ARG before usage
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update && apt-get install -y --no-install-recommends \
    git=1:2.39.5-0+deb12u2 \
    gcc=14.2 \
    libopenblas-dev=0.3.21+ds-4 \
    libgomp1=10.2.1-6 \
    libgl1=1.3.2-1 \
    && rm -rf /var/lib/apt/lists/*

# pipx directory and install tools as root
ENV PIPX_HOME=/usr/local/pipx \
    PIPX_BIN_DIR=/usr/local/pipx/bin \
    PATH="/usr/local/pipx/bin:${PATH}:/home/vscode/.local/bin" \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    UV_SYSTEM_PYTHON=0 \
    VIRTUAL_ENV=/home/vscode/.venv \
    UV_VIRTUALENV=/home/vscode/.venv

RUN mkdir -p /usr/local/pipx && \
    python -m pip install --no-cache-dir pipx==1.4.3 && \
    pipx ensurepath && \
    pipx install uv==0.6.3 && \
    pipx install ruff==0.4.10

# User (non-root)
RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME && \
    chown -R $USERNAME:$USERNAME /usr/local/pipx

# Create .venv directory
RUN mkdir -p /home/vscode/.venv && \
    chown -R $USERNAME:$USERNAME /home/vscode/.venv

# non-root context
USER $USERNAME
WORKDIR /workspace

# Create venv in VIRTUAL_ENV path
RUN python -m venv /home/vscode/.venv

COPY --chown=$USERNAME:$USERNAME pyproject.toml .

# Install dependencies from pyproject
# hadolint ignore=SC1091
RUN . /home/vscode/.venv/bin/activate && \
    uv pip install -e .