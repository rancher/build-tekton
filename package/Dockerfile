FROM alpine:3.13.5
RUN apk -U add git openssh && adduser -u 1000 -D gituser
USER 1000
COPY bin/* /usr/bin/
ENTRYPOINT ["entrypoint"]
