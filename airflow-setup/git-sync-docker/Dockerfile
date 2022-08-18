FROM alpine:3.14

COPY entrypoint.sh /entrypoint

RUN apk update && apk add git && chmod +x /entrypoint

ENTRYPOINT ["sh", "/entrypoint"]
