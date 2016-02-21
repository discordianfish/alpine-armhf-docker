FROM alpine

RUN apk --update add qemu-arm \
      && mkdir -p /tmp/etc \
      && cp -r /etc/apk /tmp/etc/ \
      && apk --root /tmp --arch armhf --initdb --update-cache add apk-tools-static

COPY build /bin
ENTRYPOINT [ "/bin/build" ]
