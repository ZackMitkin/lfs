# 3.1 Introduction
# https://www.linuxfromscratch.org/lfs/view/stable/chapter03/introduction.html

# sources
export wget_list_sysv=https://www.linuxfromscratch.org/lfs/view/stable/wget-list-sysv
export md5sums=https://www.linuxfromscratch.org/lfs/view/stable/md5sums

# make sources directory with "sticky"
mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources

# download and verify sources
wget $wget_list_sysv $md5sums
wget --input-file=wget-list-sysv --continue --directory-prefix=$LFS/sources
pushd $LFS/sources
  md5sum -c ../md5sums
popd
rm wget-list-sysv md5sums