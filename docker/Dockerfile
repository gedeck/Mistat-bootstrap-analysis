FROM python:3.11-slim
RUN apt-get update && \
  apt upgrade -y && \
  apt -y install build-essential vim && \
  pip3 install --upgrade pip && \
  mkdir /src


COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt

WORKDIR /src