FROM ubuntu:23.04

# make bash symlink
RUN ln -sf /bin/bash /bin/sh

# install packages
WORKDIR /tmp
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential python3 texinfo gawk wget m4 && \
  wget http://launchpadlibrarian.net/140087283/libbison-dev_2.7.1.dfsg-1_amd64.deb && \
  wget http://launchpadlibrarian.net/140087282/bison_2.7.1.dfsg-1_amd64.deb && \
  dpkg -i libbison-dev_2.7.1.dfsg-1_amd64.deb && \
  dpkg -i bison_2.7.1.dfsg-1_amd64.deb

# 4.4 remove default bashrc
RUN [ ! -e /etc/bash.bashrc ] || mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE

WORKDIR /scripts
COPY scripts .
RUN --mount=type=cache,target=/mnt/lfs bash setup.sh

USER lfs
RUN bash /scripts/4.4.sh

ENTRYPOINT [ "/scripts/4.4.sh", "/bin/sh" ]