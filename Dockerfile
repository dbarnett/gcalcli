FROM python:3.11-alpine

ENV TZ=America/Chicago

RUN apk add --no-cache gcc \
                       git \
                       libffi-dev \
                       openssl-dev \
                       musl-dev \
                       tzdata

ENV VIRTUAL_ENV=/venv
RUN python3 -m venv $VIRTUAL_ENV && \
        pip install -U pip
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

ENV POETRY_VENV=/poetry_venv
RUN python3 -m venv $POETRY_VENV && \
        $POETRY_VENV/bin/pip install -U pip poetry
ENV PATH="$POETRY_VENV/bin:$PATH"

WORKDIR /app
COPY poetry.lock pyproject.toml /app
RUN poetry install

COPY . /app
RUN pip install -U pip
RUN $VIRTUAL_ENV/bin/python setup.py install
RUN rm -rf /var/cache/apk/*

ENTRYPOINT ["gcalcli"]
