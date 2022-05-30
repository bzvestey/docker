# GoDev

A development container for your Go projects!  This is container will continuously rebuild your Go code as you save the files.

All containers are now published to GitHub Container Registry.

*NOTE:* This documentation is still in-progress, and will probably take me a while to complete.

## How to Use

This container is designed to be generic and usable by projects, but can also be used as a for custom containers when needed.

In general you just need to use this container and set a few specific pieces:

1. Mount your code as a volume to `/service`.
2. If your module is not in the top level directory of the mount, then set the `BUILDPATH` environment variable to be `/service/<directory in volume for your module>`.
3. Set the `OUTPUT_NAME` environment variable to be the name generated for your module from `go install -v`.

## A Thank You

I would like to thank Todd Rafferty for his post on his experiments in the area,
you can find this post [here](http://web-rat.com/posts/2016/08/23/self-compiling-go-docker/)
or the repo with his implementation [here](https://github.com/WreckingBallStudioLabs/SelfCompilingExample).
The decision to make this box was originally inspired by this post and my
interest in playing around with both Docker and Go.
