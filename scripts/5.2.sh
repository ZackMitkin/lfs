# 5.2. Binutils-2.39 - Pass 1
# https://www.linuxfromscratch.org/lfs/view/stable/chapter05/binutils-pass1.html



cd $LFS/sources

tar -xvf binutils-2.39.tar.xz && cd binutils-2.39

mkdir -v build
cd       build

../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --enable-gprofng=no \
             --disable-werror

make
make install