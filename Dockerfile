FROM python:3.6-alpine

RUN apk add --no-cache gcc \
                       git \
                       libffi-dev \
                       openssl-dev \
                       musl-dev

COPY . /app
WORKDIR /app
RUN pip install -e .

ENTRYPOINT ["gcalcli"]
