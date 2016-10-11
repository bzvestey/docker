################################################################################
# godev is used by me as part of my development cycle when working with go
# projects.  This is especially useful on windows (since I use it sometimes) to
# build with dependencies that do not work there...  This box was originaly
# based on the one talked about here:
# https://github.com/WreckingBallStudioLabs/SelfCompilingExample
################################################################################

# set the base box
FROM golang:1.7-alpine

# Setup some go environment
ENV GOBINARIES /go/bin
ENV GOPATH /go
ENV TOOLS /go/_tools

# Install our dependencies
RUN apk update && apk upgrade && \
    apk add --no-cache \
    bash \
    git \
    openssh

# get reflex
RUN go get github.com/cespare/reflex

# setup the folder for tools
RUN mkdir -p $TOOLS
