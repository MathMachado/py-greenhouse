FROM python:3.9.2-alpine3.13 AS base
ARG APP_DIR=/usr/app/
USER root
RUN mkdir ${APP_DIR}
WORKDIR ${APP_DIR}
RUN apk update && apk add py-pip
#RUN apt-get update
#RUN apt-get install -y build-essential
COPY requirements.txt ${APP_DIR}
RUN pip install -r requirements.txt
