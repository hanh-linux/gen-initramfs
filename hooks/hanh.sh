# Copy the core library
for library in libc.so ld-musl-x86_64.so.1; do
       cp -r $sysroot/usr/lib/$library $workdir/usr/lib/$library
done
cp -r $sysroot/usr/lib/libunwind* $workdir/usr/lib/ 

# Copy kmod and libraries
for binary in kmod depmod insmod rmmod modprobe modinfo; do
	cp -r $sysroot/usr/bin/$binary $workdir/usr/bin/$binary
done
cp -r $sysroot/usr/lib/libkmod* $workdir/usr/lib/
cp -r $sysroot/usr/lib/libz* $workdir/usr/lib
cp -r $sysroot/usr/lib/liblzma* $workdir/usr/lib
cp -r $sysroot/usr/lib/libcrypto* $workdir/usr/lib

# Copy switch_root and libraries
install -Dvm755 $sysroot/usr/bin/switch_root $workdir/usr/bin/switch_root

cp -r $sysroot/usr/lib/libcurses* $workdir/usr/lib
cp -r $sysroot/usr/lib/libterminfo* $workdir/usr/lib

# Copy mksh and do symlink to sh (due to busybox
# ash shell doesn't working)

cp -r $sysroot/usr/bin/mksh $workdir/usr/bin
ln -sf mksh $workdir/usr/bin/sh

