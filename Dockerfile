FROM ubuntu:xenial

RUN apt-get update && \
    apt-get install -y syslog-ng fuse wget awscli jq ruby

RUN wget -q http://bit.ly/goofys-latest && \
    chmod +x goofys-latest && \
    mv goofys-latest /usr/bin/goofys

RUN wget -q https://github.com/kahing/catfs/releases/download/v0.8.0/catfs && \
    chmod +x catfs && \
    mv catfs /usr/bin/

RUN mkdir /tmp/mnt /tmp/cache

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bash"]
