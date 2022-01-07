FROM alpine AS builder
ARG PKGVER=3.6.6
ARG PATHCVER=0.3
ARG NKFVER=2.1.5
ARG NKFDIR=70406
RUN apk add --no-cache curl gcc make groff musl-dev ncurses-dev bison flex linux-headers util-linux patch git && \
    curl -sL http://jaist.dl.osdn.jp/nkf/${NKFDIR}/nkf-${NKFVER}.tar.gz | tar zx && \
    cd nkf-${NKFVER} && \
    make && \
    make install && \
    cd / && \
    git clone http://scm.osdn.net/gitroot/jnethack/source.git && \
    cd source && \
    sed -e 's|^WINTTYLIB.*|WINTTYLIB = -lncurses|' \
        -e 's/cp -n/cp/g' \
        -e '/^PREFIX/s|=.*|=/nethack|' \
        -i sys/unix/hints/linux
COPY ./NetHack.patch /NetHack.patch
RUN if [ -s NetHack.patch ]; then \
        patch -u -p1 -d source < NetHack.patch; \
    fi && \
    cd source && \
    ./configure && \
    make all && \
    make install && \
    cd .. && \
    rm -rf source

FROM alpine
RUN apk add --no-cache ncurses-libs tzdata bash
COPY --from=builder /nethack /nethack
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
