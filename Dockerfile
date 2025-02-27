FROM alpine:3.19.7

RUN apk update && apk upgrade &&    \
    apk add --no-cache              \
    postgresql13-client &&          \
    rm -rf /var/cache/apk

USER 1001