# Data Science config
FROM python:3.12-slim-bullseye

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    gcc \
    libopenblas-dev \
    libgomp1 \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

# environment variables
ENV PIPX_HOME=/usr/local/pipx \
    PIPX_BIN_DIR=/usr/local/pipx/bin \
    PATH="/usr/local/pipx/bin:${PATH}:/home/vscode/.local/bin" \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    VIRTUAL_ENV=/home/vscode/.venv \
    UV_VIRTUALENV=/home/vscode/.venv

# pipx, uv and ruff install
RUN mkdir -p /usr/local/pipx && \
    python -m pip install --no-cache-dir pipx==1.4.3 && \
    pipx ensurepath && \
    pipx install uv==0.1.21 && \
    pipx install ruff==0.3.7

# define user
RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME && \
    chown -R $USERNAME:$USERNAME /usr/local/pipx

# .venv directory
RUN mkdir -p /home/vscode/.venv && \
    chown -R $USERNAME:$USERNAME /home/vscode/.venv

# switch to non-root user
USER $USERNAME
WORKDIR /workspace

# create venv
RUN python -m venv /home/vscode/.venv

COPY --chown=$USERNAME:$USERNAME datascience/pyproject.toml .

# install dependencies from pyproject with uv
RUN . /home/vscode/.venv/bin/activate && \
    uv pip install -e .