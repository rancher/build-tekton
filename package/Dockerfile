FROM alpine:3.16.0
RUN apk -U add git openssh && adduser -u 1000 -D gituser
USER 1000
COPY bin/* /usr/bin/
ENTRYPOINT ["entrypoint"]
