dirmod="modules/$kver/kernel"

install -Dm755 $sysroot/usr/bin/losetup $workdir/usr/bin/losetup
cp -r $sysroot/usr/lib/libsmartcols.* $workdir/usr/lib/

echo Adding ISO modules...

mkdir -p $workdir/$liblink/$dirmod/fs/squashfs/
cp -r $sysroot/$liblink/$dirmod/fs/squashfs/squashfs* \
	$workdir/usr/lib/$dirmod/fs/squashfs
mkdir -p $workdir/$liblink/$dirmod/fs/overlayfs/
cp -r $sysroot/$liblink/$dirmod/fs/overlayfs/overlay* \
	$workdir/usr/lib/$dirmod/fs/overlayfs
mkdir -p $workdir/$liblink/$dirmod/drivers/block/
cp -r $sysroot/$liblink/$dirmod/drivers/block/loop* \
	$workdir/usr/lib/$dirmod/drivers/block/
