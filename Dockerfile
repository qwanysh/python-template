FROM python:3.9.5-slim
RUN pip install pipenv

RUN useradd --create-home --home-dir /app --shell /bin/bash app
WORKDIR /app

COPY Pipfile Pipfile.lock ./
RUN pipenv install --system --deploy --ignore-pipfile --dev

USER app
COPY . .
