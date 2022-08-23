#!/bin/sh

mkdir -p $workdir/$liblink/modules/$kver/kernel/net/packet
mkdir -p $workdir/$liblink/modules/$kver/kernel/drivers/net 


for x in ethernet phy hyperv vmxnet3; do
	addmod drivers/net/$x
done
addmod net/packet/af_packet.ko*
addmod drivers/virtio/virtio_pci.ko*
addmod kernel/drivers/net/virtio_net.ko*
