ARG version=latest
ARG os 

# set the base box
FROM golang:$version$os 

LABEL org.opencontainers.image.source="github.com/bzvestey/docker" \
 org.opencontainers.image.description="Go Development Docker Container"


# Setup some go environment
ENV GOBINARIES /go/bin
ENV GOPATH /go

# Install our dependencies
RUN apk update && apk upgrade --no-cache && \
    apk add --no-cache \
    bash \
    git \
    openssh

# get reflex
RUN go install github.com/bzvestey/watcher/...@latest

# set the path that the project code will be living in, and the name of our
# built executable.
ENV VOLUMEPATH /service
ENV BUILDPATH /service 
ENV OUTPUT_NAME service

# set the port to use, and expose it to the outside
ENV PORT 8080
EXPOSE $PORT

# We add our build script (build.sh) and its companion for running the program
# (run.sh) and make them executable so that we can run them when files change.
ENV TOOLS /go/_tools
RUN mkdir -p $TOOLS
ADD tools/build.sh $TOOLS
RUN chmod +x $TOOLS/build.sh
ADD tools/run.sh $TOOLS
RUN chmod +x $TOOLS/run.sh

# Make sure that we have a directory at the build path and them set it to a
# volume so when the project container is run the code can be mounted
RUN mkdir -p $BUILDPATH
VOLUME $VOLUMEPATH
WORKDIR $BUILDPATH

# First we run through our build script so that the program can start out
# running, and then we run watcher to run build again once a file changes.
CMD . $TOOLS/build.sh && watcher -dotfiles=false --max-events=1 -cmd $TOOLS/build.sh .

