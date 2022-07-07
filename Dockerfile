FROM python:3.9-alpine
RUN apk update
RUN pip install --upgrade pip
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY ./src/requirements.txt .
RUN pip install -r requirements.txt
ENV PYTHONUNBUFFERED 1
COPY ./src/main.py .