#!/bin/sh
dirmod="modules/$kver/kernel"
add_fs() {
	mkdir -p $workdir/usr/lib/$dirmod/fs/$1
	cp -r $sysroot/$liblink/$dirmod/fs/$1/$1* \
		$workdir/usr/lib/$dirmod/fs/$1/
}

add_crypto() {
	mkdir -p $workdir/usr/lib/$dirmod/crypto
	cp -r $sysroot/$liblink/$dirmod/crypto/$1* \
		$workdir/usr/lib/$dirmod/crypto/
}

echo "Adding ext-based modules..."
# Ext2 
mkdir -p $workdir/usr/lib/$dirmod/fs
cp -r $sysroot/$liblink/$dirmod/fs/mbcache* \
	$workdir/usr/lib/$dirmod/fs/
add_fs ext2
# Ext3/Ext4
add_fs jbd2
add_fs ext4
add_crypto crc32c_generic

# echo "Adding btrfs modules..."
# add_fs btrfs 
# add_crypto xor 

# mkdir -p $workdir/usr/lib/$dirmod/lib/raid6
# cp -r $sysroot/$liblink/$dirmod/lib/libcrc32c* \
# 	$workdir/usr/lib/$dirmod/lib/
# cp -r $sysroot/$liblink/$dirmod/lib/raid6/raid6_pq* \
# 	$workdir/usr/lib/$dirmod/lib/raid6

echo "Adding fat/exfat/nls modules"
add_fs fat
add_fs exfat
add_fs nls 
