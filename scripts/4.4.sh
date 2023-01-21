#!/bin/bash

# 4.4. Setting Up the Environment
# https://www.linuxfromscratch.org/lfs/view/stable/chapter04/settingenvironment.html

# replace default login shell
cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

# Create bashrc
cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE

# global variables
CORES=$(grep -c ^processor /proc/cpuinfo)
export MAKEFLAGS="-j${CORES}"
EOF

source ~/.bash_profile