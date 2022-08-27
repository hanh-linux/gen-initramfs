for x in drivers/mmc/core drivers/soc/qcom \
	drivers/char/hw_random lib/math \
	drivers/misc/eeprom; do 
	mkdir -p $workdir/usr/lib/$dirmod/
done
for x in drivers/net/wireless drivers/mmc/core/mmc_core.ko* \
	net/mac80211/mac80211.ko* net/rfkill/rfkill.ko* \
	drivers/soc/qcom/qmi_helpers.ko* drivers/hwmon/hwmon.ko* \
	drivers/bcma/bcma.ko* drivers/ssb/ssb.ko* \
	drivers/char/hw_random/rng-core.ko* lib/math/cordic.ko* \
	drivers/virtio/virtio.ko* drivers/virtio/virtio_ring.ko* \
	lib/crc-ccitt.ko* drivers/net/mii.ko* drivers/net/usb/usbnet.ko* \
	drivers/net/usb/rndis_host.ko* drivers/misc/eeprom/eeprom_93cx6.ko* \
	lib/crc-itu-t.ko*; do

	cp -r $sysroot/$liblink/$dirmod/$x \
		$workdir/usr/lib/$dirmod/$(dirname $x) 
done
