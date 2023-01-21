# 4.2. Creating a limited directory layout in LFS filesystem
# https://www.linuxfromscratch.org/lfs/view/stable/chapter04/creatingminlayout.html

mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac

# cross compiler support required for chapter 6
mkdir -pv $LFS/tools