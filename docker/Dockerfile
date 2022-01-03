FROM ubuntu:21.10

# Scripts
COPY install-packages.sh    /root/install-packages.sh
COPY texlive.profile        /root/texlive.profile
COPY install-texlive.sh     /root/install-texlive.sh

# Base Ubuntu Packages
ENV DEBIAN_FRONTEND noninteractive
RUN /root/install-packages.sh

# TexLive and Packages
ENV PATH="/opt/texlive/texdir/bin/aarch64-linux:${PATH}"
RUN /root/install-texlive.sh

# Clean up
RUN rm -f /root/install-packages.sh     \
          /root/texlive.profile         \
          /root/install-texlive.sh

# Entrypoint
ENTRYPOINT ["sh", "-c"]
