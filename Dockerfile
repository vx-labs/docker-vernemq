FROM jbonachera/vernemq:v0.0.1
ENV ID_VERSION=v1.7.5
ADD https://github.com/vx-labs/identity/releases/download/${ID_VERSION}/client /usr/local/bin/pki-wrap
RUN chmod +x /usr/local/bin/pki-wrap
RUN apk -U add ca-certificates && \
    rm -rf /var/cache/apk/*
COPY vernemq.conf.j2 /etc/vernemq/vernemq.conf.j2
ENTRYPOINT ["/usr/local/bin/pki-wrap", "/sbin/entrypoint"]
