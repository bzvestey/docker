ARG version=latest

FROM node:$version-alpine

ENV UID=1000
ENV GID=1000

RUN deluser --remove-home node && \
  addgroup -g ${GID} foundry && \
  adduser -u ${UID} -G foundry -D foundry

USER foundry
RUN mkdir -p /home/foundry/data && mkdir -p /home/foundry/app

WORKDIR /home/foundry/app

EXPOSE 80:30000
CMD ["node", "/home/foundry/app/resources/app/main.js", "--headless", "--dataPath=/home/foundry/data" ]