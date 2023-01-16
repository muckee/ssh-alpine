FROM alpine:3.14
RUN apk update && apk add --no-cache \
                  openssh-client \
                  git \
                  nodejs \
                  npm
RUN addgroup -S 1000 && \
    adduser -S 1000 -G 1000 && \
    mkdir /home/1000/.ssh && \
    chown -R 1000:1000 /home/1000
ENV HOME /home/1000
USER 1000
