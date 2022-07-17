FROM python:3.9-alpine
RUN apk update
RUN pip install --upgrade pip
RUN apk add curl
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY ./src/requirements.txt .
COPY ./src/healthcheck.sh .
RUN pip install -r requirements.txt
ENV PYTHONUNBUFFERED 1
COPY ./src/main.py .
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=2 CMD /bin/sh /usr/src/app/healthcheck.sh