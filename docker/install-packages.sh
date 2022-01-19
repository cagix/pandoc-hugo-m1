#!/bin/sh

## Install make and graphviz (dot)
apt-get -q --no-allow-insecure-repositories update              \
    && apt-get install --assume-yes --no-install-recommends     \
        software-properties-common                              \
        ca-certificates                                         \
        gnupg                                                   \
        gzip                                                    \
        build-essential                                         \
        make                                                    \
        bash                                                    \
        git                                                     \
        wget                                                    \
        perl                                                    \
        tar                                                     \
        libfreetype6                                            \
        libfontconfig1                                          \
        fontconfig                                              \
        librsvg2-bin                                            \
        xzdec                                                   \
        graphviz                                                \
        ghostscript                                             \
        fonts-noto-core                                         \
    && rm -rf /var/lib/apt/lists/*


## Pandoc and Hugo
wget https://github.com/jgm/pandoc/releases/download/2.17.0.1/pandoc-2.17.0.1-1-arm64.deb   && dpkg -i pandoc*.deb && rm pandoc*.deb
wget https://github.com/gohugoio/hugo/releases/download/v0.92.0/hugo_0.92.0_Linux-ARM64.deb && dpkg -i hugo*.deb   && rm hugo*.deb
