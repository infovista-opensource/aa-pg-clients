FROM alpine:3.20.6

RUN apk update && apk upgrade &&    \
    apk add --no-cache              \
    postgresql14-client &&          \
    rm -rf /var/cache/apk

USER 1001