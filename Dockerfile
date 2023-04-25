FROM python:3.10-slim-buster

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PIP_NO_CACHE_DIR off
ENV PIP_DISABLE_PIP_VERSION_CHECK on

RUN mkdir /app
WORKDIR /app

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        build-essential \
        libpq-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install pdm globally
RUN pip install pdm

# install packages in venv
ENV VIRTUAL_ENV=/app/.venv
ENV PATH /app/.venv/bin:$PATH
RUN python -m venv .venv
COPY pyproject.toml pdm.lock .
RUN pdm sync
COPY . .
