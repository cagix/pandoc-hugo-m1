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
        zip                                                     \
        libfreetype6                                            \
        libfontconfig1                                          \
        fontconfig                                              \
        librsvg2-bin                                            \
        xzdec                                                   \
        graphviz                                                \
        ghostscript                                             \
        fonts-noto-core                                         \
    && rm -rf /var/lib/apt/lists/*


## Pandoc and Hugo (linux/arm64/deb)
## https://github.com/jgm/pandoc/releases/latest/
wget https://github.com/jgm/pandoc/releases/download/2.18/pandoc-2.18-1-arm64.deb           && dpkg -i pandoc*.deb && rm pandoc*.deb

## https://github.com/gohugoio/hugo/releases/latest/
wget https://github.com/gohugoio/hugo/releases/download/v0.96.0/hugo_0.96.0_Linux-ARM64.deb && dpkg -i hugo*.deb   && rm hugo*.deb
