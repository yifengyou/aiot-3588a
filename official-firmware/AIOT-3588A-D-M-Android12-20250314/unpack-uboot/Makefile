
all:
	dumpimage -l ../uboot.img
	dumpimage  ../uboot.img -T flat_dt -p 1  -o atf-1.bin
	dumpimage  ../uboot.img -T flat_dt -p 2  -o atf-2.bin
	dumpimage  ../uboot.img -T flat_dt -p 3  -o atf-3.bin
	dumpimage  ../uboot.img -T flat_dt -p 4 -o optee.bin
	dumpimage  ../uboot.img -T flat_dt -p 5 -o fdt
	file fdt
	dtc -I dtb -O dts fdt -o fds
	ls -alh


