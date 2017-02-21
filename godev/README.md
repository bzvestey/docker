# GoDev
A development container for your Go projects!  This is container will
continuously rebuild your Go code as you save the files.  You can also adjust
it from the example project to run any other commands you need to happen with
the bulding of the source.

I try and upload new version with Go releases at
[bzvestey/godev](https://hub.docker.com/r/bzvestey/godev/).

*NOTE:* This documentation is still in-progress, and will probably take me a
while to complete.

## How to Use
This container is designed to be a base for a project specific container, and
so you will need to setup your own Dockerfile with a few additional items.

#### Setup Project Container
The Dockerfile you create for your project will need add a build script and
attach your code file to the contaier so it can be built.

All files used here are part of an example project here:
[https://github.com/bzvestey/docker/blob/master/godev/example](https://github.com/bzvestey/docker/blob/master/godev/example).

*Example Dockerfile with explanations*
```Dockerfile
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
```

The example contains build.sh and run.sh files you can use as an example.

### Run the Example
Run ```docker-compose up``` in the example folder and point your browser
at ```http://localhost:8080``` on it is done to view this in action.  If you
modify the ```main.go``` file, then you will see it rebuild the app and you can
refresh you browser to see the change.

## A Thank You
I would like to thank Todd Rafferty for his post on his experiments in the area,
you can find this post [here](http://web-rat.com/posts/2016/08/23/self-compiling-go-docker/)
or the repo with his implementation [here](https://github.com/WreckingBallStudioLabs/SelfCompilingExample).
The decision to make this box was originally inspired by this post and my
interest in playing around with both Docker and Go.
