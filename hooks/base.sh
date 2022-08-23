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
addmod drivers/acpi/thermal*

# SATA modules
addmod drivers/ata

# SCSI and block modules 
addmod block/t10-pi*
for modscsi in scsi_mod sd_mod sr_mod; do 
	addmod drivers/scsi/$modscsi*
done

# NVMe modules
addmod drivers/nvme \ 

# CD modules 
addmod drivers/cdrom/cdrom* 
addmod fs/isofs/isofs*

# USB modules 
addmod drivers/usb/core/usbcore*
addmod drivers/usb/common/usb-common*

# Mouse modules
cp -r $sysroot/$liblink/$dirmod/drivers/input/mousedev* \
	$workdir/usr/lib/$dirmod/drivers/input/

# HCD modules
addmod drivers/usb/host/* 
addmod drivers/usb/storage/*

# All HID modules
addmod drivers/hid/* 

# Copy all modules information files 
cp -r $sysroot/$liblink/modules/$kver/modules.* \
	$workdir/usr/lib/modules/$kver/
