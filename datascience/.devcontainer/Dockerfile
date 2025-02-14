# Python 3.12 for Data Science
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

# pipx for poetry and uv installation
ENV PIPX_HOME=/usr/local/pipx \
    PIPX_BIN_DIR=/usr/local/pipx/bin \
    PATH="${PATH}:/home/vscode/.local/bin"
RUN python -m pip install --no-cache-dir pipx && \
    pipx ensurepath && \
    pipx install poetry && \
    pipx install uv

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
RUN poetry config virtualenvs.in-project true && \
    uv venv