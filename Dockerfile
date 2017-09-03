FROM jbonachera/vernemq
ENV ID_VERSION=v1.6.1
ADD https://github.com/vx-labs/identity/releases/download/${ID_VERSION}/client /usr/local/bin/pki-wrap
RUN chmod +x /usr/local/bin/pki-wrap
RUN apk -U add ca-certificates && \
    rm -rf /var/cache/apk/*
COPY vernemq.conf.j2 /etc/vernemq/vernemq.conf.j2
ENTRYPOINT ["/usr/local/bin/pki-wrap", "/sbin/entrypoint"]
