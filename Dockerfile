FROM python:3.9-alpine
RUN apk update \
  apk add \
    build-base \
    libpq
RUN pip install --upgrade pip
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY ./requirements.txt .
RUN pip install -r requirements.txt
ENV PYTHONUNBUFFERED 1
COPY main.py .