# syntax=docker/dockerfile:1

FROM ruby:alpine

WORKDIR /home/scripts

RUN apk update
RUN apk --no-cache add git curl nano openssh
RUN gem install httparty
