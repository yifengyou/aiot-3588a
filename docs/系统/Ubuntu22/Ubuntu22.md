# Ubuntu22


## 基本信息


```shell
root@RK3588:~# 
root@RK3588:~# uname -a
Linux RK3588 5.10.160 #418 SMP Wed Jul 24 11:37:41 CST 2024 aarch64 aarch64 aarch64 GNU/Linux
root@RK3588:~# 
root@RK3588:~# lsblk
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
mmcblk0      179:0    0 58.3G  0 disk 
├─mmcblk0p1  179:1    0   10M  0 part 
├─mmcblk0p2  179:2    0    4M  0 part 
├─mmcblk0p3  179:3    0    4M  0 part 
├─mmcblk0p4  179:4    0   64M  0 part 
├─mmcblk0p5  179:5    0  128M  0 part 
├─mmcblk0p6  179:6    0   32M  0 part 
├─mmcblk0p7  179:7    0  256M  0 part /oempriv
├─mmcblk0p8  179:8    0    8G  0 part /userdata
├─mmcblk0p9  179:9    0  128M  0 part 
└─mmcblk0p10 179:10   0 49.6G  0 part /
mmcblk0boot0 179:32   0    4M  1 disk 
mmcblk0boot1 179:64   0    4M  1 disk 
zram0        254:0    0    0B  0 disk 
root@RK3588:~# 
root@RK3588:~# df -h
文件系统        大小  已用  可用 已用% 挂载点
/dev/root        49G  5.3G   42G   12% /
tmpfs           1.9G     0  1.9G    0% /dev/shm
tmpfs           778M  2.5M  776M    1% /run
tmpfs           5.0M  4.0K  5.0M    1% /run/lock
tmpfs           1.9G   20K  1.9G    1% /tmp
/dev/mmcblk0p7  256M     0  256M    0% /oempriv
/dev/mmcblk0p8  7.8G  280K  7.6G    1% /userdata
tmpfs           389M   40K  389M    1% /run/user/0
tmpfs           389M   80K  389M    1% /run/user/1000
root@RK3588:~# 
root@RK3588:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: dummy0: <BROADCAST,NOARP> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 9a:f3:56:4c:3c:0d brd ff:ff:ff:ff:ff:ff
3: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 8c:fc:a0:f5:dc:17 brd ff:ff:ff:ff:ff:ff
    inet 192.168.49.102/24 brd 192.168.49.255 scope global noprefixroute eth0
       valid_lft forever preferred_lft forever
    inet 192.168.33.33/24 brd 192.168.33.255 scope global dynamic eth0
       valid_lft 6409sec preferred_lft 6409sec
    inet6 fe80::8efc:a0ff:fef5:dc17/64 scope link 
       valid_lft forever preferred_lft forever
4: macvlan_host@eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 9e:73:8e:7b:1f:64 brd ff:ff:ff:ff:ff:ff
    inet 192.168.49.253/32 scope global macvlan_host
       valid_lft forever preferred_lft forever
    inet6 fe80::9c73:8eff:fe7b:1f64/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
5: wlan0: <NO-CARRIER,BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state DORMANT group default qlen 1000
    link/ether 50:41:1c:15:8f:64 brd ff:ff:ff:ff:ff:ff
6: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether 02:42:8f:56:da:94 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:8fff:fe56:da94/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
root@RK3588:~# 
root@RK3588:~# inxi -Fxxxz
System:
  Kernel: 5.10.160 aarch64 bits: 64 compiler: N/A Console: pty pts/1
    wm: gnome-shell DM: GDM3 42.0 Distro: Ubuntu 22.04.4 LTS (Jammy Jellyfish)
Machine:
  Type: ARM System: AIOT_3588A V1.3 details: N/A serial: <filter>
CPU:
  Info: 3x 4-core model: N/A variant-1: cortex-a55 variant-2: cortex-a76
    bits: 64 type: MCP AMP smt: <unsupported> arch: ARMv8 rev: 0 cache:
    L1: 3x 256 KiB (768 KiB) L2: 3x 512 KiB (1.5 MiB) L3: 3x 3 MiB (9 MiB)
  Speed (MHz): avg: 408 min/max: 408/1800:2352:2256 cores: 1: 408 2: 408
    3: 408 4: 408 5: 408 6: 408 7: 408 8: 408 bogomips: N/A
  Features: Use -f option to see features
Graphics:
  Device-1: display-subsystem driver: rockchip_drm v: N/A bus-ID: N/A
    chip-ID: rockchip:display-subsystem class-ID: display-subsystem
  Device-2: mali-bifrost driver: mali v: N/A bus-ID: N/A
    chip-ID: arm:fb000000 class-ID: gpu
  Device-3: rk3588-dw-hdmi driver: dwhdmi_rockchip v: N/A bus-ID: N/A
    chip-ID: rockchip:fdea0000 class-ID: hdmi
  Display: server: X.org v: 1.21.1.4 compositor: gnome-shell driver: X:
    loaded: modesetting alternate: fbdev gpu: rockchip_drm,mali,dwhdmi_rockchip
    display-ID: localhost:11.0 screens: 1
  Screen-1: 0 s-res: 3840x2160 s-dpi: 144 s-size: 677x381mm (26.7x15.0")
    s-diag: 777mm (30.6")
  Monitor-1: default res: 3840x2160 dpi: 144 size: 677x380mm (26.7x15.0")
    diag: 776mm (30.6")
  OpenGL: renderer: llvmpipe (LLVM 14.0.0 128 bits)
    v: 4.5 Mesa 23.0.0-devel direct render: Yes
Audio:
  Device-1: rk3588-dw-hdmi driver: dwhdmi_rockchip bus-ID: N/A
    chip-ID: rockchip:fdea0000 class-ID: hdmi
  Device-2: hdmi driver: rk_hdmi_sound bus-ID: N/A
    chip-ID: rockchip:hdmi1-sound class-ID: hdmi1-sound
  Sound Server-1: ALSA v: k5.10.160 running: yes
  Sound Server-2: PulseAudio v: 15.99.1 running: yes
  Sound Server-3: PipeWire v: 0.3.48 running: yes
Network:
  Device-1: rk3588-gmac driver: rk_gmac_dwmac v: N/A port: N/A bus-ID: N/A
    chip-ID: rockchip:fe1c0000 class-ID: ethernet
  IF: eth0 state: up speed: 1000 Mbps duplex: full mac: <filter>
  Device-2: wlan-platdata driver: wlan_platdata v: N/A bus-ID: N/A
    chip-ID: wlan-platdata:wireless-wlan class-ID: wireless-wlan
  IF-ID-1: docker0 state: down mac: <filter>
  IF-ID-2: dummy0 state: down mac: <filter>
  IF-ID-3: macvlan_host state: up speed: 1000 Mbps duplex: full
    mac: <filter>
  IF-ID-4: wlan0 state: dormant mac: <filter>
Bluetooth:
  Device-1: rk3588-uart driver: dw_apb_uart bus-ID: N/A
    chip-ID: rockchip:febc0000 class-ID: serial
  Report: hciconfig ID: hci0 rfk-id: 3 state: up address: <filter>
    bt-v: 3.0 lmp-v: 5.0 sub-v: 6606 hci-v: 5.0 rev: 50
Drives:
  Local Storage: total: 58.25 GiB used: 5.29 GiB (9.1%)
  ID-1: /dev/mmcblk0 model: SD7311 size: 58.25 GiB type: SSD
    serial: <filter> rev: 0x8 scheme: GPT
Partition:
  ID-1: / size: 48.76 GiB used: 5.29 GiB (10.9%) fs: ext4
    dev: /dev/mmcblk0p10
Swap:
  Alert: No swap data was found.
Sensors:
  System Temperatures: cpu: 30.5 C mobo: N/A
  Fan Speeds (RPM): N/A
Info:
  Processes: 282 Uptime: 21m Memory: 3.81 GiB used: 894.7 MiB (22.9%)
  Init: systemd v: 249 runlevel: 5 target: graphical.target Compilers:
  gcc: 11.4.0 alt: 11 Packages: apt: 1602 Shell: Bash v: 5.1.16
  running-in: sshd (SSH) inxi: 3.3.13
root@RK3588:~# 
root@RK3588:~# 
root@RK3588:~# blkid
/dev/mmcblk0p9: LABEL="oem" UUID="9feb8ad3-49b8-403c-b172-534c152b6516" BLOCK_SIZE="1024" TYPE="ext4" PARTLABEL="oem" PARTUUID="60500000-0000-4358-8000-0bfa00004d23"
/dev/mmcblk0p10: UUID="444de732-a0b7-482f-9dc5-9877f0781819" BLOCK_SIZE="4096" TYPE="ext4" PARTLABEL="rootfs" PARTUUID="614e0000-0000-4b53-8000-1d28000054a9"
/dev/mmcblk0p7: SEC_TYPE="msdos" UUID="7C82-B289" BLOCK_SIZE="512" TYPE="vfat" PARTLABEL="oempriv" PARTUUID="03670000-0000-410f-8000-3feb00005458"
/dev/mmcblk0p8: LABEL="userdata" UUID="666fd70d-6c46-4fc0-aad1-35b7a3bd4de2" BLOCK_SIZE="1024" TYPE="ext4" PARTLABEL="userdata" PARTUUID="5a760000-0000-4c2b-8000-7bb600004902"
/dev/mmcblk0p5: PARTLABEL="recovery" PARTUUID="c3020000-0000-4166-8000-0821000021c8"
/dev/mmcblk0p3: PARTLABEL="smdt" PARTUUID="62120000-0000-435a-8000-305e00000b31"
/dev/mmcblk0p1: PARTLABEL="uboot" PARTUUID="9f4b0000-0000-482a-8000-3f6000002655"
/dev/mmcblk0p6: PARTLABEL="backup" PARTUUID="b3240000-0000-4b16-8000-74f100000cfd"
/dev/mmcblk0p4: PARTLABEL="boot" PARTUUID="7a3f0000-0000-446a-8000-702f00006273"
/dev/mmcblk0p2: PARTLABEL="misc" PARTUUID="a1120000-0000-402f-8000-451a00002480"
root@RK3588:~# 
root@RK3588:~# cat /proc/cmdline 
storagemedia=emmc androidboot.storagemedia=emmc androidboot.mode=normal  androidboot.verifiedbootstate=orange smdt_hw_id=1 smdt_bom_id=1 rw rootwait earlycon=uart8250,mmio32,0xfeb50000 console=ttyFIQ0 irqchip.gicv3_pseudo_nmi=0 root=PARTUUID=614e0000-0000
root@RK3588:~# 
root@RK3588:~# 


```


## 分区信息

```text
mmcblk0      179:0    0 58.3G  0 disk 
├─mmcblk0p1  179:1    0   10M  0 part   0x00005000@0x00004000(uboot),
├─mmcblk0p2  179:2    0    4M  0 part   0x00002000@0x00009000(misc)
├─mmcblk0p3  179:3    0    4M  0 part   0x00002000@0x0000B000(smdt)
├─mmcblk0p4  179:4    0   64M  0 part   0x00020000@0x0000D000(boot)
├─mmcblk0p5  179:5    0  128M  0 part   0x00040000@0x0002D000(recovery)
├─mmcblk0p6  179:6    0   32M  0 part   0x00010000@0x0006D000(backup)
├─mmcblk0p7  179:7    0  256M  0 part   0x00080000@0x0007D000(oempriv)    /oempriv 
├─mmcblk0p8  179:8    0    8G  0 part   0x01000000@0x000FD000(userdata)   /userdata 
├─mmcblk0p9  179:9    0  128M  0 part   0x00040000@0x010FD000(oem)
└─mmcblk0p10 179:10   0 49.6G  0 part   -@0x0113D000(rootfs:grow)         /

 0x00005000@0x00004000(uboot), # uboot
 0x00002000@0x00009000(misc), # 空分区
 0x00002000@0x0000B000(smdt), # 空分区
 0x00020000@0x0000D000(boot), # 内核
 0x00040000@0x0002D000(recovery),
 0x00010000@0x0006D000(backup), # 空分区
 0x00080000@0x0007D000(oempriv), # fat分区
 0x01000000@0x000FD000(userdata),
 0x00040000@0x010FD000(oem),  # 厂家演示文件
 -@0x0113D000(rootfs:grow)
 
 
 root@RK3588:~# hexdump -C /dev/mmcblk0p2
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00400000
root@RK3588:~# hexdump -C /dev/mmcblk0p3
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00400000

root@RK3588:~# hexdump -C /dev/mmcblk0p6
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
02000000

root@RK3588:~# hexdump -C /dev/mmcblk0p7
00000000  eb 3c 90 6d 6b 66 73 2e  66 61 74 00 02 08 08 00  |.<.mkfs.fat.....|
00000010  02 00 02 00 00 f8 00 01  20 00 40 00 00 00 00 00  |........ .@.....|
00000020  00 00 08 00 80 01 29 89  b2 82 7c 4e 4f 20 4e 41  |......)...|NO NA|
00000030  4d 45 20 20 20 20 46 41  54 31 36 20 20 20 0e 1f  |ME    FAT16   ..|
00000040  be 5b 7c ac 22 c0 74 0b  56 b4 0e bb 07 00 cd 10  |.[|.".t.V.......|
00000050  5e eb f0 32 e4 cd 16 cd  19 eb fe 54 68 69 73 20  |^..2.......This |
00000060  69 73 20 6e 6f 74 20 61  20 62 6f 6f 74 61 62 6c  |is not a bootabl|
00000070  65 20 64 69 73 6b 2e 20  20 50 6c 65 61 73 65 20  |e disk.  Please |
00000080  69 6e 73 65 72 74 20 61  20 62 6f 6f 74 61 62 6c  |insert a bootabl|
00000090  65 20 66 6c 6f 70 70 79  20 61 6e 64 0d 0a 70 72  |e floppy and..pr|
000000a0  65 73 73 20 61 6e 79 20  6b 65 79 20 74 6f 20 74  |ess any key to t|
000000b0  72 79 20 61 67 61 69 6e  20 2e 2e 2e 20 0d 0a 00  |ry again ... ...|
000000c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
000001f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 55 aa  |..............U.|
00000200  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00001000  f8 ff ff ff 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00001010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00021000  f8 ff ff ff 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00021010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
10000000
root@RK3588:~# 
root@RK3588:~# 

```

OEM：

```shell
root@RK3588:~# mount /dev/mmcblk0p9 /mnt
root@RK3588:~# ls /mnt/
200frames_count.h264            game_test.gba  piano2-CoolEdit.mp3  SampleJPGImage_500kbmb.jpg
belle-nuit-testchart-1080p.png  lost+found     retroarch.cfg        SampleVideo_1280x720_5mb.mp4
root@RK3588:~# 
root@RK3588:~# 
```



## 因无法挂载进入救援模式

* 若分区被修改，部分分区在/etc/fstab中的，挂在失败，会进入救援模式

```shell
[  OK  ] Reached target Host and Network Name Lookups...
         Starting Notify NFS peers of a restart...
[  OK  ] Started Notify NFS peers of a restart. for ifupdown...
You are in emergency mode. After logging in, type "journalctl -xb" to view
system logs, "systemctl reboot" to reboot, "systemctl default" or "exit"
to boot into default mode.d Manager for Device Events and Files.
?? root ?????] rk_hdmirx fdee0000.hdmirx-controller: hdmirx_cancel_cpu_limit_freq freq qos nod add
(?? Control-D ???): ce Slice /system/systemd-backlight.
?????    Starting Load/Save Screen … of backlight:backlight-edp...
[  OK  ] Finished Load/Save Screen …ss of backlight:backlight-edp.
?? root ?????ting Load/Save Screen …of backlight:backlight-dsi0...
(?? Control-D ???): ad/Save Screen …of backlight:backlight-dsi1...
?????  ] Finished Load/Save Screen …s of backlight:backlight-dsi0.
[  OK  ] Finished Load/Save Screen …s of backlight:backlight-dsi1.
?? root ?????d device /dev/ttyFIQ0.
(?? Control-D ???): n Load/Save RF …itch Status /dev/rfkill Watch.
         Starting Load/Save RF Kill Switch Status...
?????  ] Started Load/Save RF Kill Switch Status.
[  OK  ] Reached target Hardware activated USB gadget.
?? root ?????d out waiting for device 
(?? Control-D ???): 

?????

?? root ?????
(?? Control-D ???): 

?????

?? root ?????
(?? Control-D ???): 

```






---