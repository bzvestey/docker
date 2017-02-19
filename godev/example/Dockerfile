################################################################################
# test is a test
################################################################################

# set the base box
FROM bzvestey/godev

# env variables
ENV BUILDPATH $GOPATH/src/godev-example
ENV OUTPUT_NAME godev-exmaple

# networking
ENV PORT 8080
EXPOSE $PORT

# add files
ADD build.sh $TOOLS
RUN chmod +x $TOOLS/build.sh
ADD run.sh $TOOLS
RUN chmod +x $TOOLS/run.sh

# run things
RUN mkdir -p $BUILDPATH
VOLUME $BUILDPATH
WORKDIR $BUILDPATH
CMD . $TOOLS/build.sh && watcher -dotfiles=false -cmd $TOOLS/build.sh .
