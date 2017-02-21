################################################################################
# This is the Dockerfile for the example project for my GoDev docker box.
################################################################################

# set the base container to be the correct tag of the godev container
FROM bzvestey/godev:latest

# set the path that the project code will be living in, and the name of our
# built executable.
ENV BUILDPATH $GOPATH/src/godev-example
ENV OUTPUT_NAME godev-exmaple

# set the port to use, and expose it to the outside
ENV PORT 8080
EXPOSE $PORT

# We add our build script (build.sh) and its companion for running the program
# (run.sh) and make them executable so that we can run them when files change.
ADD build.sh $TOOLS
RUN chmod +x $TOOLS/build.sh
ADD run.sh $TOOLS
RUN chmod +x $TOOLS/run.sh

# Make sure that we have a directory at the build path and them set it to a
# volume so when the project container is run the code can be mounted
RUN mkdir -p $BUILDPATH
VOLUME $BUILDPATH
WORKDIR $BUILDPATH

# First we run through our build script so that the program can start out
# running, and then we run watcher to run build again once a file changes.
CMD . $TOOLS/build.sh && watcher -dotfiles=false -cmd $TOOLS/build.sh .
