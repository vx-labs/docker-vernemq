FROM jbonachera/vernemq
ENV ID_VERSION=v1.0.3
ADD https://github.com/jbonachera/iot-pki/releases/download/${ID_VERSION}/client /usr/local/bin/pki-wrap
RUN chmod +x /usr/local/bin/pki-wrap
RUN apk -U add ca-certificates && \
    rm -rf /var/cache/apk/*
ENTRYPOINT ["/usr/local/bin/pki-wrap", "/sbin/entrypoint"]
