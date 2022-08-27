dirmod="modules/$kver/kernel"

# Create directories structure 
for x in drivers block fs/isofs; do 
	mkdir -p $workdir/usr/lib/$dirmod/$x 
done

cp -r $sysroot/$liblink/modules/$kver/modules.* $workdir/lib/modules/$kver/

for x in acpi scsi cdrom \
	usb/common usb/core/ input \
	usb/host usb/storage hid; do
	mkdir -p $workdir/usr/lib/$dirmod/drivers/$x 
done

mkdir -p $workdir/usr/lib/$dirmod/fs/isofs 

# Thermal modules
cp -r $sysroot/$liblink/$dirmod/drivers/acpi/thermal.ko* \
	$workdir/usr/lib/$dirmod/drivers/acpi/ 

# SATA modules
cp -r $sysroot/$liblink/$dirmod/drivers/ata \
	$workdir/usr/lib/$dirmod/drivers/

# SCSI and block modules 
cp -r $sysroot/$liblink/$dirmod/block/t10-pi*
for modscsi in scsi_mod sd_mod sr_mod; do 
	cp -r $sysroot/$liblink/$dirmod/drivers/scsi/$modscsi* \
		$workdir/usr/lib/$dirmod/drivers/scsi
done

# NVMe modules
cp -r $sysroot/$liblink/$dirmod/drivers/nvme \
	$workdir/usr/lib/$dirmod/drivers/nvme

# CD modules 
cp -r $sysroot/$liblink/$dirmod/drivers/cdrom/cdrom* \
	$workdir/usr/lib/$dirmod/drivers/cdrom
cp -r $sysroot/$liblink/$dirmod/fs/isofs/isofs* \
	$workdir/usr/lib/$dirmod/fs/isofs

# USB modules 
cp -r $sysroot/$liblink/$dirmod/drivers/usb/core/usbcore* \
	$workdir/usr/lib/$dirmod/drivers/usb/core
cp -r $sysroot/$liblink/$dirmod/drivers/usb/common/usb-common* \
	$workdir/usr/lib/$dirmod/drivers/usb/common

# Mouse modules
cp -r $sysroot/$liblink/$dirmod/drivers/input/mousedev* \
	$workdir/usr/lib/$dirmod/drivers/input/

# HCD modules
cp -r $sysroot/$liblink/$dirmod/drivers/usb/host/* \
	$workdir/usr/lib/$dirmod/drivers/usb/host
cp -r $sysroot/$liblink/$dirmod/drivers/usb/storage/* \
	$workdir/usr/lib/$dirmod/drivers/usb/storage

# All HID modules
cp -r $sysroot/$liblink/$dirmod/drivers/hid/* \
	$workdir/usr/lib/$dirmod/drivers/hid

# Copy all modules information files 
cp -r $sysroot/$liblink/modules/$kver/modules.* \
	$workdir/usr/lib/modules/$kver/
