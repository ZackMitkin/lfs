# 4.3. Adding the LFS User
# https://www.linuxfromscratch.org/lfs/view/stable/chapter04/addinguser.html

# Adding the LFS User
groupadd lfs && useradd -s /bin/bash -g lfs -m -k /dev/null lfs
echo "lfs:admin" | chpasswd

# Grant lfs full access to all directories under $LFS by making lfs the directory owner:
chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools,sources}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac
