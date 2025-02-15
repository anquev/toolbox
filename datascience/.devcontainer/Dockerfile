# Data Science config
FROM python:3.12-slim-bullseye

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    gcc \
    g++ \
    make \
    libopenblas-dev \
    libgomp1 \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

# uv and ruff install
ENV PIPX_HOME=/usr/local/pipx \
    PIPX_BIN_DIR=/usr/local/pipx/bin \
    PATH="${PATH}:/home/vscode/.local/bin" \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    UV_SYSTEM_PYTHON=1

RUN python -m pip install --no-cache-dir pipx && \
    pipx ensurepath && \
    pipx install uv && \
    pipx install ruff \

# User (non-root)
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && chown -R $USERNAME:$USERNAME /usr/local/pipx

# Switch to non-root user context
USER $USERNAME
WORKDIR /workspace

# venv config
RUN uv venv

COPY pyproject.toml .
RUN uv pip install -e