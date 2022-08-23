dirmod="modules/$kver/kernel"

install -Dm755 $sysroot/usr/bin/losetup $(pwd)/usr/bin/losetup
cp -r $sysroot/usr/lib/libsmartcols.* $(pwd)/usr/lib/

echo Adding ISO modules...

mkdir -p $workdir/$liblink/$dirmod/fs/squashfs/
addmod fs/squashfs/squashfs*
mkdir -p $workdir/$liblink/$dirmod/fs/overlayfs/
addmod fs/overlayfs/overlay*
mkdir -p $workdir/$liblink/$dirmod/drivers/block/
addmod drivers/block/loop*
