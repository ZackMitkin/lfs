# working directory
export LFS=/mnt/lfs
export SCRIPTS=$(pwd)

# Download and verify sources
[ ! -e $LFS/sources ] && bash $SCRIPTS/3.1.sh

# Creating a limited directory layout in LFS filesystem
bash $SCRIPTS/4.2.sh
# Create and login as LFS user
bash $SCRIPTS/4.3.sh
# Build and install Binutils
bash $SCRIPTS/5.2.sh