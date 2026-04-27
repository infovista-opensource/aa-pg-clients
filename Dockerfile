FROM alpine:3.23

RUN apk update && apk upgrade &&    \
    apk add --no-cache              \
    postgresql18-client &&          \
    rm -rf /var/cache/apk

USER 1001