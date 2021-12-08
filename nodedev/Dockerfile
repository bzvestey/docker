ARG version=latest
ARG os

FROM node:$version$os

LABEL org.opencontainers.image.source="github.com/bzvestey/docker" \
 org.opencontainers.image.description="Node Development Docker Container"

RUN mkdir /tools
COPY tools/run.sh /tools/run.sh
RUN chmod +x /tools/run.sh

RUN mkdir /code
WORKDIR /code
VOLUME /code

# set the port to use, and expose it to the outside
ENV PORT 3000
EXPOSE $PORT

CMD . /tools/run.sh

