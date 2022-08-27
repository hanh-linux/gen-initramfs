#!/bin/sh

mkdir -p $workdir/usr/lib/modules/$kver/kernel/net/packet
mkdir -p $workdir/usr/lib/modules/$kver/kernel/drivers/net 
mkdir -p $workdir/usr/lib/modules/$kver/kernel/virtio 

for x in ethernet phy hyperv vmxnet3; do
	cp -r $sysroot/$liblink/$dirmod/drivers/net/$x \
		$workdir/usr/lib/$dirmod/drivers/net
done
cp -r $sysroot/$liblink/$dirmod/net/packet/af_packet.ko* \
	$workdir/usr/lib/$dirmod/net/packet
cp -r $sysroot/$liblink/$dirmod/drivers/virtio/virtio_pci.ko* \
	$workdir/usr/lib/$dirmod/drivers/virtio
cp -r $sysroot/$liblink/$dirmod/drivers/net/virtio_net.ko* \
	$workdir/usr/lib/$dirmod/drivers/net
