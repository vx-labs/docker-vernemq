FROM jbonachera/vernemq
ADD https://github.com/jbonachera/iot-pki/releases/download/v1.0.2/client /usr/local/bin/pki-wrap
RUN chmod +x /usr/local/bin/pki-wrap
RUN apk -U add ca-certificates && \
    rm -rf /var/cache/apk/*
ENTRYPOINT ["/usr/local/bin/pki-wrap", "/sbin/entrypoint"]
