FROM alpine:3.18.12

RUN apk update && apk upgrade &&    \
    apk add --no-cache              \
    postgresql12-client &&          \
    rm -rf /var/cache/apk

USER 1001