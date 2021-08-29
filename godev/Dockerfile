# set the base box
FROM golang:1.17.0-alpine

# Setup some go environment
ENV GOBINARIES /go/bin
ENV GOPATH /go
ENV TOOLS /go/_tools

# Install our dependencies
RUN apk update && apk upgrade --no-cache && \
    apk add --no-cache \
    bash \
    git \
    openssh

# get reflex
RUN go get -u github.com/radovskyb/watcher/...

# setup the folder for tools
RUN mkdir -p $TOOLS
