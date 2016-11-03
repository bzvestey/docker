# GoDev
A development container for your Go projects!  This is container will
continuously rebuild your Go code as you save the files.

I try and upload new version with Go releases at [bzvestey/godev](https://hub.docker.com/r/bzvestey/godev/).

*NOTE:* This does not work on Windows when made, as the filesystem notifications
are not passed over samba (how volumes work in windows).

*NOTE:* This documentation is still in-progress, and will probably take me a
while to complete.

## How to Use
This container is designed to be a base for a project specific container, and
so you will need to setup your own Dockerfile with a few additional items.

#### Setup Project Container
The Dockerfile you create for your project will need add option build script
and reflex config file, and attach your code file to the contaier so it can be
built.

*Example Dockerfile with explanations*
```dockerfile
# set the base container to be the correct tag of the godev container
FROM bzvestey/godev:latest

# set the path that the project code will be living
ENV BUILDPATH $GOPATH/src/godev-example

# set the port to use, and expose it to the outside
ENV PORT 8080
EXPOSE $PORT

# here I add a build.sh file to the tools directory, explained below this is
# used by reflex build and run the project on file change.  We also need to make
# it executable
ADD build.sh $TOOLS
RUN chmod +x $TOOLS/build.sh

# Adding a reflex configuration file, though you can also pass this information
# when you call reflex in the CMD call.
ADD reflex.conf $TOOLS

# Make sure that we have a directory at the build path and them set it to a
# volume so when the project container is run the code can be mounted
RUN mkdir -p $BUILDPATH
VOLUME $BUILDPATH
WORKDIR $BUILDPATH

# Run reflex as the main command for the container, and make sure to tell it
# where the configuration is.
CMD reflex -c $TOOLS/reflex.conf
```

The example contains build.sh and reflex.conf files you can use as an example.

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
