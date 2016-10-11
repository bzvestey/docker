################################################################################
# test is a test
################################################################################

# set the base box
FROM bzvestey/godev

# env variables
ENV BUILDPATH $GOPATH/src/godev-example

# networking
ENV PORT 8080
EXPOSE $PORT

# add files
ADD build.sh $TOOLS
ADD reflex.conf $TOOLS
RUN chmod +x $TOOLS/build.sh

# run things
RUN mkdir -p $BUILDPATH
VOLUME $BUILDPATH
WORKDIR $BUILDPATH
CMD reflex -c $TOOLS/reflex.conf
