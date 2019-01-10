FROM python:3.6-alpine

ENV TZ=America/Chicago
RUN apk add --no-cache gcc \
                       git \
                       libffi-dev \
                       openssl-dev \
                       musl-dev \
                       tzdata

COPY . /app
WORKDIR /app
RUN pip install -e .
RUN rm -rf /var/cache/apk/*

ENTRYPOINT ["gcalcli"]
