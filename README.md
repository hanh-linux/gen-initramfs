<img src="https://raw.githubusercontent.com/hanh-linux/hanh-linux.github.io/main/assets/img/logo.svg" width="200" align=right href="https://hanh-linux.github.io/"/>

## gen-initramfs
Default tool for generating initial RAM filesystem in Hanh Linux. 
### Usage 
```
Usage: gen-initramfs [options] 
Options: 
------------------------------------------------------------
opts              purpose                      def
------------------------------------------------------------
kver="string"     Set kernel version           $(uname -r)  
sysroot="dir"     Set system root              /
hooks="files"     Specify hooks to add
bin="file"        Specify binaries to add
lib="file"        Specify libraries to add
```
### Dependencies 
- busybox (read INSTALL)
- cpio 
- kmod
- eudev 
- findutils
- gzip 
- coreutils
- util-linux
