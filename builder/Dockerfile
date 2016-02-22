FROM debian:jessie

COPY keys  /etc/apk/keys
RUN apt-get -qy update && apt-get install -qy curl qemu-user-static binfmt-support \
    && curl -L http://dl-3.alpinelinux.org/alpine/latest-stable/main/x86_64/apk-tools-static-2.6.5-r1.apk \
    | tar -C / -xzf - \
    && openssl dgst -sha1 -verify /etc/apk/keys/$(echo /sbin/apk.static.*|sed 's/.*SIGN.RSA.//') \
      -signature /sbin/apk.static.SIGN.RSA.* /sbin/apk.static
COPY build /bin/
ENTRYPOINT [ "/bin/build" ]
