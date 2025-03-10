FROM alpine:3.21.3

RUN apk update && apk upgrade &&    \
    apk add --no-cache              \
    postgresql17-client &&          \
    rm -rf /var/cache/apk

USER 1001