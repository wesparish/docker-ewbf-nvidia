FROM wesparish/nvidia:384.90

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update \
 && apt-get install -yqq --no-install-recommends \
	vim-tiny \
	flip \
	libcurl3 \
        curl \
 && apt-get -yqq clean \
 && rm -rf /var/lib/apt/lists/*

ENV EWBF_VERSION="0.3.4b"

WORKDIR /opt
ADD https://github.com/nanopool/ewbf-miner/releases/download/v$EWBF_VERSION/Zec.miner.$EWBF_VERSION.Linux.Bin.tar.gz /opt

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/*

ENV SERVER="zec-us-east1.nanopool.org" \
    USER="t1QwLHE4p5G1yM6mHk4gHUAiFVpkeZsdsUJ.unset" \
    PORT="6666"

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
#CMD ["-mode", "1", "-ftime", "10" ]
