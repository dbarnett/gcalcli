FROM python:3.11-alpine

ENV TZ=America/Chicago
RUN apk add --no-cache gcc \
                       git \
                       libffi-dev \
                       openssl-dev \
                       musl-dev \
                       tzdata

COPY . /app
WORKDIR /app
RUN python setup.py install
RUN rm -rf /var/cache/apk/*

ENTRYPOINT ["gcalcli"]
