FROM ubuntu:20.04
RUN apt update -y \
  && apt install curl -y
