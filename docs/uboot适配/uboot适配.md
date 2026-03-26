# uboot适配

## 官方uboot信息

```shell

=> 
=> 
=> reset 
DDR V1.12 52218f4949 cym 23/07/06-19:46:50
LPDDR4X, 1848MHz
channel[0] BW=16 Col=10 Bk=8 CS0 Row=16 CS=1 Die BW=16 Size=1024MB
channel[1] BW=16 Col=10 Bk=8 CS0 Row=16 CS=1 Die BW=16 Size=1024MB
channel[2] BW=16 Col=10 Bk=8 CS0 Row=16 CS=1 Die BW=16 Size=1024MB
channel[3] BW=16 Col=10 Bk=8 CS0 Row=16 CS=1 Die BW=16 Size=1024MB
Manufacturer ID:0x6
CH0 RX Vref:31.4%, TX Vref:21.8%,0.0%
CH1 RX Vref:31.4%, TX Vref:22.8%,0.0%
CH2 RX Vref:32.6%, TX Vref:20.8%,0.0%
CH3 RX Vref:31.4%, TX Vref:21.8%,0.0%
change to F1: 528MHz
change to F2: 1068MHz
change to F3: 1560MHz
change to F0: 1848MHz
out
U-Boot SPL board init
U-Boot SPL 2017.09-gc060f28d70-220414 #zyf (Apr 18 2022 - 18:13:34)
Failed to set cpub01
Failed to set cpub23
unknown raw ID phN
unrecognized JEDEC id bytes: 00, 00, 00
Trying to boot from MMC2
MMC: no card present
mmc_init: -123, time 0
spl: mmc init failed with error: -123
Trying to boot from MMC1
Trying fit image at 0x4000 sector
## Verified-boot: 0
## Checking atf-1 0x00040000 ... sha256(c902200be1...) + OK
## Checking uboot 0x00200000 ... sha256(18c2d02ce5...) + OK
## Checking fdt 0x00354750 ... sha256(8ecccd16d2...) + OK
## Checking atf-2 0x000f0000 ... sha256(aa71013e72...) + OK
## Checking atf-3 0xff100000 ... sha256(225d6bf071...) + OK
## Checking optee 0x08400000 ... sha256(66e30bf9e8...) + OK
Jumping to U-Boot(0x00200000) via ARM Trusted Firmware(0x00040000)
Total: 116.309 ms

INFO:    Preloader serial: 2
NOTICE:  BL31: v2.3():v2.3-639-g87bcc5dfe:derrick.huang
NOTICE:  BL31: Built : 18:06:16, Sep  9 2023
INFO:    spec: 0x1
INFO:    ext 32k is not valid
INFO:    ddr: stride-en 4CH
INFO:    GICv3 without legacy support detected.
INFO:    ARM GICv3 driver initialized in EL3
INFO:    valid_cpu_msk=0xff bcore0_rst = 0x0, bcore1_rst = 0x0
INFO:    l3 cache partition cfg-0
INFO:    system boots from cpu-hwid-0
INFO:    idle_st=0x21fff, pd_st=0x11fff9, repair_st=0xfff70001
ERROR:   dfs get fsp_params[0] error, 0xfead0003 != 0xfead0004
ERROR:   dfs get fsp_params[1] error, 0xa2c != 0xfead0004
ERROR:   dfs get fsp_params[2] error, 0xa34 != 0xfead0004
ERROR:   dfs get fsp_params[3] error, 0xadc != 0xfead0004
ERROR:   loader&trust unmatch!!! Please update loader if need enable dmc
ERROR:   current trust bl31 need match with loader ddr bin V1.13 or newer
ERROR:   current loader need match with trust bl31 V1.38-V1.40
INFO:    BL31: Initialising Exception Handling Framework
INFO:    BL31: Initializing runtime services
INFO:    BL31: Initializing BL32
I/TC: 
I/TC: OP-TEE version: 3.13.0-743-gb5340fd65 #hisping.lin (gcc version 10.2.1 20201103 (GNU Toolchain for the A-profile Architecture 10.2-2020.11 (arm-10.16))) #6 Mon Aug 28 18:01:38 CST 2023 aarch64
I/TC: Primary CPU initializing
I/TC: Primary CPU switching to normal world boot
INFO:    BL31: Preparing for EL3 exit to normal world
INFO:    Entry point address = 0x200000
INFO:    SPSR = 0x3c9


U-Boot 2017.09 (Jul 24 2024 - 11:37:01 +0800)

Model: Rockchip RK3588 Evaluation Board
MPIDR: 0x81000000
PreSerial: 2, raw, 0xfeb50000
DRAM:  4 GiB
Sysmem: init
Relocation Offset: ed9ce000
Relocation fdt: eb7fa420 - eb7fecd0
CR: M/C/I
Using default environment

optee api revision: 2.0
mmc@fe2c0000: 1, mmc@fe2e0000: 0
Bootdev(atags): mmc 0
MMC0: HS400 Enhanced Strobe, 200Mhz
PartType: EFI
TEEC: Waring: Could not find security partition
DM: v2
[smdt][drivers/smdt/smdt_compatible.c +80][smdt_saradc_hw_bom_id][xwliu]<hw_id_val=3752 hw_id=1 bom_id_val=3755 bom_id=1>

No misc partition
boot mode: normal
RESC: 'boot', blk@0x0001c945
resource: sha256+
rk-kernel.dtb
  blk_start:  0xebbea040
  blk_offset: 0x0000000a
  size:       0x00046725
  in_ram:     1
  hash_size:  20

arch/arm64/boot/dts/rockchip/rk3588_smdt_3588d_v11.dtb
  blk_start:  0xebbea040
  blk_offset: 0x0000023e
  size:       0x00046410
  in_ram:     1
  hash_size:  20

arch/arm64/boot/dts/rockchip/rk3588_smdt_3588d_v12.dtb
  blk_start:  0xebbea040
  blk_offset: 0x00000471
  size:       0x00046410
  in_ram:     1
  hash_size:  20

arch/arm64/boot/dts/rockchip/rk3588_smdt_3588d_v20.dtb
  blk_start:  0xebbea040
  blk_offset: 0x000006a4
  size:       0x00046a57
  in_ram:     1
  hash_size:  20

arch/arm64/boot/dts/rockchip/rk3588_smdt_3588ie_v10.dtb
  blk_start:  0xebbea040
  blk_offset: 0x000008da
  size:       0x00046a12
  in_ram:     1
  hash_size:  20

arch/arm64/boot/dts/rockchip/rk3588_smdt_3588a_v20.dtb
  blk_start:  0xebbea040
  blk_offset: 0x00000b10
  size:       0x00046711
  in_ram:     1
  hash_size:  20

arch/arm64/boot/dts/rockchip/rk3588_smdt_3588ie_v11.dtb
  blk_start:  0xebbea040
  blk_offset: 0x00000d44
  size:       0x00046ce1
  in_ram:     1
  hash_size:  20

logo.bmp
  blk_start:  0xebbea040
  blk_offset: 0x00000f7b
  size:       0x001fa834
  in_ram:     1
  hash_size:  20

logo_kernel.bmp
  blk_start:  0xebbea040
  blk_offset: 0x00001f50
  size:       0x001fa834
  in_ram:     1
  hash_size:  20

FIT: no signed, no conf required
[smdt][xwliu][hw_id/bom_id] <uboot read dtb_name=arch/arm64/boot/dts/rockchip/rk3588_smdt_3588a_v13.dtb f->name=<NULL>>
DTB: rk-kernel.dtb
HASH(c): OK
** Invalid partition 7 **
[smdt][drivers/smdt/smdt_param_api.c +90][smdt_fixup_fdt][oempriv] <can not from oempriv find file:/display_param.cfg>
Can't find the replaced string!
Can't find the replaced string!
Can't find the replaced string!
Can't find the replaced string!
Can't find the replaced string!
Can't find the replaced string!
Can't find the replaced string!
** Invalid partition 7 **
[smdt][drivers/smdt/smdt_param_api.c +179][smdt_fixup_fdt][oempriv] <can not from oempriv find file:/os_param.config>
[smdt][drivers/smdt/smdt_param_api.c +183][smdt_fixup_fdt][smdt_param]<smdt_param=null>
I2c0 speed: 100000Hz
vsel-gpios- not found!
en-gpios- not found!
vdd_cpu_big0_s0 800000 uV
vsel-gpios- not found!
en-gpios- not found!
vdd_cpu_big1_s0 800000 uV
I2c1 speed: 100000Hz
vsel-gpios- not found!
en-gpios- not found!
vdd_npu_s0 800000 uV
spi2: RK806: 2
ON=0x50, OFF=0x00
vdd_gpu_s0 750000 uV
vdd_cpu_lit_s0 750000 uV
vdd_log_s0 750000 uV
vdd_vdenc_s0 init 750000 uV
vdd_ddr_s0 850000 uV
Device 'gpio@fd8a0000': seq 0 is in use by 'gpio@fd8a0000'
[smdt][drivers/video/drm/rockchip_display.c +1932][rockchip_display_probe]xwliu route:route-edp0
Warn: can't find connect driver
Warn: can't get connect driver
[smdt][drivers/video/drm/rockchip_display.c +1932][rockchip_display_probe]xwliu route:route-hdmi1
rockchip_dw_hdmi_qp_probe: Cannot get backlight: -2
get vp0 plane mask:0x5, primary id:2, cursor_plane:-1, from dts
get vp1 plane mask:0xa, primary id:3, cursor_plane:-1, from dts
get vp2 plane mask:0x140, primary id:8, cursor_plane:-1, from dts
get vp3 plane mask:0x280, primary id:9, cursor_plane:-1, from dts
Could not find baseparameter partition
Model: AIOT_3588A V1.3
MPIDR: 0x81000000
** Invalid partition 7 **
[smdt][xwliu][oempriv] <can not from emmc find file:logo.bmp>
** Invalid partition 7 **
[smdt][xwliu][oempriv] <can not from emmc find file:logo.bmp>
Rockchip UBOOT DRM driver version: v1.0.1
starting USB...
Bus usb@fc000000: xwliu jump out
Bus usb@fc800000: xwliu jump out
Bus usb@fc840000: xwliu jump out
Bus usb@fc880000: Device 'gpio@fec30000': seq 2 is in use by 'gpio@fd8a0000'
[smdt][drivers/smdt/smdt_param_platform.c +374][smdt_set_otg_power_platform][xwliu][smdt_param] <request for USB_POWER1 failed:-16>
[smdt][drivers/smdt/smdt_param_platform.c +385][smdt_set_otg_power_platform][xwliu][smdt_param] <request for USB_POWER2 failed:-16>
I2c6 speed: 100000Hz
[smdt][drivers/smdt/smdt_param_platform.c +318][smdt_3588_nca9555_for_usb_power]i2c_get_chip_for_busnum i2c_bus_num=6 address=0x20 ret:0

USB EHCI 1.00
Bus usb@fc8c0000: xwliu jump out
Bus usb@fcd00000: xwliu jump out
Bus usb@fc400000: [smdt][drivers/smdt/smdt_param_platform.c +318][smdt_3588_nca9555_for_usb_power]i2c_get_chip_for_busnum i2c_bus_num=6 address=0x20 ret:0

Register 2000140 NbrPorts 2
Starting the controller
USB XHCI 1.10
scanning bus usb@fc880000 for devices... 1 USB Device(s) found
scanning bus usb@fc400000 for devices... 1 USB Device(s) found
       scanning usb for storage devices... 0 Storage Device(s) found
** Bad device usb 0 **
** Bad device usb 0 **
[smdt][drivers/smdt/smdt_param_api.c +42][smdt_param_read_from_usb][smdt_param]<can not form usb find param file>
vp0 have layer nr:2[0 2 ], primary plane: 2
vp1 have layer nr:2[1 3 ], primary plane: 3
vp2 have layer nr:2[6 8 ], primary plane: 8
vp3 have layer nr:2[7 9 ], primary plane: 9
i2c read err!
i2c read err!
i2c read err!
i2c read err!
i2c read err!
can't get edid block:0
[smdt][drivers/video/drm/dw_hdmi_qp.c +1411][_rockchip_dw_hdmi_qp_get_timing][xwliu][hdmi_resolution] hdmi@fdea0000 output:

failed to get edid
Could not find baseparameter partition
color_format:0
hdmi_select_link_config use tmds mode
mode:1920x1080 bus_format:0x100a
hdmi@fdea0000:  detailed mode clock 148500 kHz, flags[5]
    H: 1920 2008 2052 2200
    V: 1080 1084 1089 1125
bus_format: 100a
VOP update mode to: 1920x1080p60, type: HDMI1 for VP0
dclk:148500,if_pixclk_div;2,if_dclk_div:4
VP0 set crtc_clock to 148500KHz
VOP VP0 enable Esmart0[1920x1080->1920x1080@0x0] fmt[2] addr[0xee0fb000]
CEA mode used vic=16
mtmdsclock:148500000
hdptx_ropll_cmn_config bus_width:16a8c8 rate:1485000
hdptx phy pll locked!
dw_hdmi_setup HDMI mode
don't use dsc mode
dw hdmi qp use tmds mode
bus_width:0x16a8c8,bit_rate:1485000
hdptx phy lane locked!
CLK: (sync kernel. arm: enter 1008000 KHz, init 1008000 KHz, kernel 0N/A)
  b0pll 24000 KHz
  b1pll 24000 KHz
  lpll 24000 KHz
  v0pll 24000 KHz
  aupll 786431 KHz
  cpll 1500000 KHz
  gpll 1188000 KHz
  npll 850000 KHz
  ppll 1100000 KHz
  aclk_center_root 702000 KHz
  pclk_center_root 100000 KHz
  hclk_center_root 396000 KHz
  aclk_center_low_root 500000 KHz
  aclk_top_root 750000 KHz
  pclk_top_root 100000 KHz
  aclk_low_top_root 396000 KHz
Net:   eth1: ethernet@fe1c0000
Hit key to stop autoboot('CTRL+C'):  0 
=> <INTERRUPT>
=> <INTERRUPT>
=> <INTERRUPT>
=> <INTERRUPT>
=> <INTERRUPT>
=> <INTERRUPT>
=> <INTERRUPT>


```

## usb信息



## dm 信息


```shell

=> dm tree
 Addr        Class      Probed    Driver                   Name
-------------------------------------------------------------------------
 ebbcad60    root       [ + ]   root_driver                root_driver *
 ebbcae70    rsa_mod_ex [   ]   mod_exp_sw                 |-- mod_exp_sw *
 ebbcaf60    ramdisk    [   ]   ramdisk-ro                 |-- ramdisk-ro *
 ebbcb070    blk        [   ]   ramdisk_blk                |   `-- ramdisk-ro.blk *
 ebbcb1f0    firmware   [ + ]   firmware                   |-- firmware *
 ebbcb2e0    scmi_agent [ + ]   scmi-over-smccc            |   `-- scmi *
 ebbcb3d0    clk        [ + ]   scmi_clk                   |       `-- protocol@14 *
 ebbcb480    firmware   [   ]   psci                       |-- psci *
 ebbcb570    sysreset   [   ]   psci-sysreset              |   `-- psci-sysreset *
 ebbcb620    clk        [ + ]   fixed_rate_clock           |-- xin24m *
 ebbcb730    syscon     [ + ]   rk3588_syscon              |-- syscon@fd58c000 *
 ebbcb7e0    syscon     [ + ]   rk3588_syscon              |-- syscon@fd5b0000 *
 ebbcb890    syscon     [   ]   rk3588_syscon              |-- syscon@fd5bc000 *
 ebbcb940    syscon     [   ]   rk3588_syscon              |-- syscon@fd5c4000 *
 ebbcb9f0    syscon     [   ]   syscon                     |-- syscon@fd5d0000 *
 ebbcbae0    phy        [   ]   rockchip_usb2phy           |   `-- usb2-phy@0 *
 ebbcbb90    phy        [   ]   rockchip_usb2phy_port      |       `-- otg-port *
 ebbcbc40    syscon     [ + ]   syscon                     |-- syscon@fd5f0000 *
 ebbcbcf0    clk        [ + ]   rockchip_rk3588_cru        |-- clock-controller@fd7c0000 *
 ebbcbda0    sysreset   [   ]   rockchip_sysreset          |   |-- sysreset *
 ebbcbeb0    reset      [ + ]   rockchip_reset             |   `-- reset *
 ebbcbfc0    spi        [   ]   rockchip_sfc               |-- spi@fe2b0000 *
 ebbcc110    mtd        [   ]   spi_nand                   |   |-- flash@0 *
 ebbcc200    blk        [   ]   mtd_blk                    |   |   `-- flash@0.blk *
 ebbcc380    spi_flash  [   ]   spi_flash_std              |   `-- flash@1 *
 ebbcc470    blk        [   ]   mtd_blk                    |       `-- flash@1.blk *
 ebbcc5f0    mmc        [ + ]   rockchip_rk3288_dw_mshc    |-- mmc@fe2c0000 *
 ebbcc7f0    blk        [   ]   mmc_blk                    |   `-- mmc@fe2c0000.blk *
 ebbcc930    mmc        [ + ]   rockchip_sdhci_5_1         |-- mmc@fe2e0000 *
 ebbccb30    blk        [ + ]   mmc_blk                    |   `-- mmc@fe2e0000.blk *
 ebbcccb0    misc       [   ]   rockchip_hw_decompress     |-- decompress@fea80000 *
 ebbccda0    serial     [   ]   ns16550_serial             |-- serial@feb50000 *
 ebbcceb0    adc        [ + ]   rockchip_saradc_v2         |-- saradc@fec10000 *
 ebbccfe0    pinctrl    [ + ]   rockchip_rk3588_pinctrl    |-- pinctrl *
 ebbcd0d0    gpio       [ + ]   gpio_rockchip              |   |-- gpio@fd8a0000 *
 ebbcd180    gpio       [   ]   gpio_rockchip              |   |-- gpio@fec20000 *
 ebbcd230    gpio       [   ]   gpio_rockchip              |   |-- gpio@fec30000 *
 ebbcd2e0    gpio       [   ]   gpio_rockchip              |   |-- gpio@fec40000 *
 ebbcd390    gpio       [   ]   gpio_rockchip              |   |-- gpio@fec50000 *
 ebbcd480    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up *
 ebbcd530    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none *
 ebbcd5e0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-2 *
 ebbcd690    pinconfig  [   ]   pinconfig                  |   `-- sdmmc *
 ebbcd740    pinconfig  [   ]   pinconfig                  |       |-- sdmmc-bus4 *
 ebbcd7f0    pinconfig  [   ]   pinconfig                  |       |-- sdmmc-clk *
 ebbcd8a0    pinconfig  [   ]   pinconfig                  |       |-- sdmmc-cmd *
 ebbcd950    pinconfig  [   ]   pinconfig                  |       |-- sdmmc-det *
 ebbcda00    pinconfig  [   ]   pinconfig                  |       `-- sdmmc-pwren *
 ebbcdab0    syscon     [   ]   rk3588_syscon              |-- syscon@fd5b8000 *
 ebbcdb60    syscon     [   ]   rk3588_syscon              |-- syscon@fd5c0000 *
 ebbcdc50    crypto     [ + ]   rockchip_crypto_v2         |-- crypto@fe370000 *
 ebbcdd40    rng        [   ]   rockchip-rng               |-- rng@fe378000 *
 ebbcde30    simple_bus [ + ]   adc_key_bus                |-- adc-keys *
 ebbcdf40    key        [ + ]   adc_key                    |   `-- volumeup-key *
 ebbce060    firmware   [   ]   firmware                   |-- firmware *
 ec24a090    simple_bus [ + ]   generic_simple_bus         |-- clocks 
 ec24a140    clk        [ + ]   fixed_rate_clock           |   |-- spll 
 ec24a1f0    clk        [ + ]   fixed_rate_clock           |   |-- xin32k 
 ec24a2c0    clk        [ + ]   fixed_rate_clock           |   |-- xin24m 
 ec24a390    clk        [ + ]   fixed_rate_clock           |   |-- mclkin-i2s0 
 ec24a460    clk        [ + ]   fixed_rate_clock           |   |-- mclkin-i2s1 
 ec24a530    clk        [ + ]   fixed_rate_clock           |   |-- mclkin-i2s2 
 ec24a600    clk        [ + ]   fixed_rate_clock           |   `-- mclkin-i2s3 
 ec24a710    video      [ + ]   rockchip_display           |-- display-subsystem 
 ec273a60    vidconsole [ + ]   vidconsole0                |   `-- display-subsystem.vidconsole0 
 ec24a7e0    firmware   [ + ]   firmware                   |-- firmware 
 ec24a890    scmi_agent [ + ]   scmi-over-smccc            |   `-- scmi 
 ec24a940    clk        [ + ]   scmi_clk                   |       `-- protocol@14 
 ec24a9f0    firmware   [   ]   psci                       |-- psci 
 ec24aaa0    sysreset   [   ]   psci-sysreset              |   `-- psci-sysreset 
 ec24ab90    nop        [   ]   dwc3-generic-wrapper       |-- usbdrd3_0 
 ec24acd0    usb        [   ]   dwc3-generic-host          |   `-- usb@fc000000 
 ec24ada0    usb        [   ]   ehci_generic               |-- usb@fc800000 
 ec24ae50    usb        [   ]   ohci_generic               |-- usb@fc840000 
 ec24af00    usb        [ + ]   ehci_generic               |-- usb@fc880000 
 ec277a90    usb_hub    [ + ]   usb_hub                    |   `-- usb_hub 
 ec24afb0    usb        [   ]   ohci_generic               |-- usb@fc8c0000 
 ec24b060    nop        [   ]   dwc3-generic-wrapper       |-- usbhost3_0 
 ec24b140    usb        [   ]   dwc3-generic-host          |   `-- usb@fcd00000 
 ec24b210    syscon     [   ]   syscon                     |-- syscon@fd588000 
 ec24b2c0    sysreset   [   ]   sysreset_syscon_reboot     |   `-- reboot-mode 
 ec24b370    syscon     [   ]   syscon                     |-- syscon@fd58a000 
 ec24b420    syscon     [   ]   rk3588_syscon              |-- syscon@fd58c000 
 ec24b4d0    syscon     [   ]   syscon                     |-- syscon@fd590000 
 ec24b580    syscon     [   ]   syscon                     |-- syscon@fd592000 
 ec24b630    syscon     [   ]   syscon                     |-- syscon@fd594000 
 ec24b6e0    syscon     [   ]   syscon                     |-- syscon@fd598000 
 ec24b790    syscon     [   ]   syscon                     |-- syscon@fd5a0000 
 ec24b840    syscon     [   ]   syscon                     |-- syscon@fd5a2000 
 ec24b8f0    syscon     [ + ]   rk3588_syscon              |-- syscon@fd5a4000 
 ec24b9a0    syscon     [ + ]   rk3588_syscon              |-- syscon@fd5a6000 
 ec24ba50    syscon     [ + ]   rk3588_syscon              |-- syscon@fd5a8000 
 ec24bb00    syscon     [ + ]   syscon                     |-- syscon@fd5ac000 
 ec24bbb0    syscon     [   ]   rk3588_syscon              |-- syscon@fd5b0000 
 ec24bc60    syscon     [   ]   syscon                     |-- syscon@fd5b4000 
 ec24bd10    syscon     [   ]   syscon                     |-- syscon@fd5b5000 
 ec24bdc0    syscon     [   ]   rk3588_syscon              |-- syscon@fd5bc000 
 ec24be70    syscon     [   ]   rk3588_syscon              |-- syscon@fd5c4000 
 ec24bf20    syscon     [   ]   syscon                     |-- syscon@fd5c8000 
 ec24bfd0    syscon     [   ]   syscon                     |-- syscon@fd5d0000 
 ec24c080    phy        [   ]   rockchip_usb2phy           |   `-- usb2-phy@0 
 ec24c130    phy        [   ]   rockchip_usb2phy_port      |       `-- otg-port 
 ec24c1e0    syscon     [   ]   syscon                     |-- syscon@fd5d8000 
 ec24c290    phy        [   ]   rockchip_usb2phy           |   `-- usb2-phy@8000 
 ec24c340    phy        [   ]   rockchip_usb2phy_port      |       `-- host-port 
 ec24c3f0    syscon     [ + ]   syscon                     |-- syscon@fd5dc000 
 ec24c4a0    phy        [ + ]   rockchip_usb2phy           |   `-- usb2-phy@c000 
 ec24c550    phy        [ + ]   rockchip_usb2phy_port      |       `-- host-port 
 ec24c600    syscon     [ + ]   syscon                     |-- syscon@fd5e0000 
 ec24c6b0    syscon     [   ]   syscon                     |-- syscon@fd5e8000 
 ec24c760    syscon     [   ]   syscon                     |-- syscon@fd5ec000 
 ec24c810    syscon     [ + ]   syscon                     |-- syscon@fd5f0000 
 ec24c8c0    clk        [ + ]   rockchip_rk3588_cru        |-- clock-controller@fd7c0000 
 ec24c970    sysreset   [   ]   rockchip_sysreset          |   |-- sysreset 
 ec24ca40    reset      [ + ]   rockchip_reset             |   `-- reset 
 ec24cb50    i2c        [ + ]   i2c_rockchip               |-- i2c@fd880000 
 ec24cc40    regulator  [ + ]   rk860x_regulator           |   |-- rk8602@42 
 ec24cd60    regulator  [ + ]   rk860x_regulator           |   `-- rk8603@43 
 ec24cec0    pwm        [   ]   rk_pwm                     |-- pwm@fd8b0010 
 ec24cf70    syscon     [ + ]   rk3588_syscon              |-- power-management@fd8d8000 
 ec24d060    CRTC       [ + ]   rockchip-vop               |-- vop@fdd90000 
 ec24d110    CRTC       [ + ]   rockchip-vp                |   |-- port@0 
 ec24d1c0    CRTC       [ + ]   rockchip-vp                |   |-- port@1 
 ec24d270    CRTC       [ + ]   rockchip-vp                |   |-- port@2 
 ec24d320    CRTC       [ + ]   rockchip-vp                |   `-- port@3 
 ec24d3d0    syscon     [   ]   syscon                     |-- qos@fdf35000 
 ec24d480    syscon     [   ]   syscon                     |-- qos@fdf35200 
 ec24d530    syscon     [   ]   syscon                     |-- qos@fdf35400 
 ec24d5e0    syscon     [   ]   syscon                     |-- qos@fdf35600 
 ec24d690    syscon     [   ]   syscon                     |-- qos@fdf36000 
 ec24d740    syscon     [   ]   syscon                     |-- qos@fdf39000 
 ec24d7f0    syscon     [   ]   syscon                     |-- qos@fdf3d800 
 ec24d8a0    syscon     [   ]   syscon                     |-- qos@fdf3e000 
 ec24d950    syscon     [   ]   syscon                     |-- qos@fdf3e200 
 ec24da00    syscon     [   ]   syscon                     |-- qos@fdf3e400 
 ec24dab0    syscon     [   ]   syscon                     |-- qos@fdf3e600 
 ec24db60    syscon     [   ]   syscon                     |-- qos@fdf40000 
 ec24dc10    syscon     [   ]   syscon                     |-- qos@fdf40200 
 ec24dcc0    syscon     [   ]   syscon                     |-- qos@fdf40400 
 ec24dd70    syscon     [   ]   syscon                     |-- qos@fdf40500 
 ec24de20    syscon     [   ]   syscon                     |-- qos@fdf40600 
 ec24ded0    syscon     [   ]   syscon                     |-- qos@fdf40800 
 ec24df80    syscon     [   ]   syscon                     |-- qos@fdf41000 
 ec24e030    syscon     [   ]   syscon                     |-- qos@fdf41100 
 ec24e0e0    syscon     [   ]   syscon                     |-- qos@fdf60000 
 ec24e190    syscon     [   ]   syscon                     |-- qos@fdf60200 
 ec24e240    syscon     [   ]   syscon                     |-- qos@fdf60400 
 ec24e2f0    syscon     [   ]   syscon                     |-- qos@fdf61000 
 ec24e3a0    syscon     [   ]   syscon                     |-- qos@fdf61200 
 ec24e450    syscon     [   ]   syscon                     |-- qos@fdf61400 
 ec24e500    syscon     [   ]   syscon                     |-- qos@fdf62000 
 ec24e5b0    syscon     [   ]   syscon                     |-- qos@fdf63000 
 ec24e660    syscon     [   ]   syscon                     |-- qos@fdf64000 
 ec24e710    syscon     [   ]   syscon                     |-- qos@fdf66000 
 ec24e7c0    syscon     [   ]   syscon                     |-- qos@fdf66200 
 ec24e870    syscon     [   ]   syscon                     |-- qos@fdf66400 
 ec24e920    syscon     [   ]   syscon                     |-- qos@fdf66600 
 ec24e9d0    syscon     [   ]   syscon                     |-- qos@fdf66800 
 ec24ea80    syscon     [   ]   syscon                     |-- qos@fdf66a00 
 ec24eb30    syscon     [   ]   syscon                     |-- qos@fdf66c00 
 ec24ebe0    syscon     [   ]   syscon                     |-- qos@fdf66e00 
 ec24ec90    syscon     [   ]   syscon                     |-- qos@fdf67000 
 ec24ed40    syscon     [   ]   syscon                     |-- qos@fdf67200 
 ec24edf0    syscon     [   ]   syscon                     |-- qos@fdf70000 
 ec24eea0    syscon     [   ]   syscon                     |-- qos@fdf71000 
 ec24ef50    syscon     [   ]   syscon                     |-- qos@fdf72000 
 ec24f000    syscon     [   ]   syscon                     |-- qos@fdf72200 
 ec24f0b0    syscon     [   ]   syscon                     |-- qos@fdf72400 
 ec24f160    syscon     [   ]   syscon                     |-- qos@fdf80000 
 ec24f210    syscon     [   ]   syscon                     |-- qos@fdf81000 
 ec24f2c0    syscon     [   ]   syscon                     |-- qos@fdf81200 
 ec24f370    syscon     [   ]   syscon                     |-- qos@fdf82000 
 ec24f420    syscon     [   ]   syscon                     |-- qos@fdf82200 
 ec24f530    ethernet   [ + ]   gmac_rockchip              |-- ethernet@fe1c0000 
 ec24f670    eth_phy_ge [ + ]   eth_phy_generic_drv        |   `-- phy@1 
 ec24f720    mmc        [   ]   rockchip_rk3288_dw_mshc    |-- mmc@fe2c0000 
 ec24f920    blk        [   ]   mmc_blk                    |   `-- mmc@fe2c0000.blk 
 ec24fa60    mmc        [   ]   rockchip_rk3288_dw_mshc    |-- mmc@fe2d0000 
 ec24fc60    blk        [   ]   mmc_blk                    |   `-- mmc@fe2d0000.blk 
 ec24fda0    mmc        [   ]   rockchip_sdhci_5_1         |-- mmc@fe2e0000 
 ec24ffa0    blk        [   ]   mmc_blk                    |   `-- mmc@fe2e0000.blk 
 ec2500e0    rng        [   ]   rockchip-rng               |-- rng@fe378000 
 ec250190    i2c        [ + ]   i2c_rockchip               |-- i2c@fea90000 
 ec250240    regulator  [ + ]   rk860x_regulator           |   `-- rk8602@42 
 ec250360    spi        [ + ]   rockchip_spi               |-- spi@feb20000 
 ec250470    pmic       [ + ]   rk806-pmic                 |   `-- rk806single@0 
 ec250540    regulator  [ + ]   rk8xx_spi_buck             |       |-- DCDC_REG1 
 ec250640    regulator  [ + ]   rk8xx_spi_buck             |       |-- DCDC_REG2 
 ec250740    regulator  [ + ]   rk8xx_spi_buck             |       |-- DCDC_REG3 
 ec250840    regulator  [ + ]   rk8xx_spi_buck             |       |-- DCDC_REG4 
 ec250940    regulator  [ + ]   rk8xx_spi_buck             |       |-- DCDC_REG5 
 ec250a40    regulator  [ + ]   rk8xx_spi_buck             |       |-- DCDC_REG6 
 ec250b40    regulator  [ + ]   rk8xx_spi_buck             |       |-- DCDC_REG7 
 ec250c40    regulator  [ + ]   rk8xx_spi_buck             |       |-- DCDC_REG8 
 ec250d40    regulator  [ + ]   rk8xx_spi_buck             |       |-- DCDC_REG9 
 ec250e40    regulator  [ + ]   rk8xx_spi_buck             |       |-- DCDC_REG10 
 ec250f40    regulator  [ + ]   rk8xx_spi_pldo             |       |-- PLDO_REG1 
 ec251040    regulator  [ + ]   rk8xx_spi_pldo             |       |-- PLDO_REG2 
 ec251140    regulator  [ + ]   rk8xx_spi_pldo             |       |-- PLDO_REG3 
 ec251240    regulator  [ + ]   rk8xx_spi_pldo             |       |-- PLDO_REG4 
 ec251340    regulator  [ + ]   rk8xx_spi_pldo             |       |-- PLDO_REG5 
 ec251440    regulator  [ + ]   rk8xx_spi_pldo             |       |-- PLDO_REG6 
 ec251540    regulator  [ + ]   rk8xx_spi_ldo              |       |-- NLDO_REG1 
 ec251640    regulator  [ + ]   rk8xx_spi_ldo              |       |-- NLDO_REG2 
 ec251740    regulator  [ + ]   rk8xx_spi_ldo              |       |-- NLDO_REG3 
 ec251840    regulator  [ + ]   rk8xx_spi_ldo              |       |-- NLDO_REG4 
 ec251940    regulator  [ + ]   rk8xx_spi_ldo              |       |-- NLDO_REG5 
 ec251a40    key        [ + ]   rk8xx_pwrkey               |       `-- pwrkey 
 ec251b60    serial     [   ]   ns16550_serial             |-- serial@feb40000 
 ec251c30    serial     [   ]   ns16550_serial             |-- serial@feb70000 
 ec251d00    serial     [   ]   ns16550_serial             |-- serial@feb90000 
 ec251dd0    serial     [   ]   ns16550_serial             |-- serial@feba0000 
 ec251ea0    serial     [   ]   ns16550_serial             |-- serial@febb0000 
 ec251f70    serial     [   ]   ns16550_serial             |-- serial@febc0000 
 ec252040    pwm        [   ]   rk_pwm                     |-- pwm@febd0030 
 ec2520f0    pwm        [   ]   rk_pwm                     |-- pwm@febf0000 
 ec2521a0    pwm        [   ]   rk_pwm                     |-- pwm@febf0030 
 ec252250    adc        [ + ]   rockchip_saradc_v2         |-- saradc@fec10000 
 ec252340    i2c        [ + ]   i2c_rockchip               |-- i2c@fec80000 
 ec252430    power_deli [   ]   fusb302                    |   |-- fusb302@22 
 ec2744d0    i2c_generi [ + ]   i2c_generic_chip_drv       |   `-- generic_20 
 ec252500    i2c        [   ]   i2c_rockchip               |-- i2c@fec90000 
 ec2525b0    misc       [ + ]   rockchip_otp               |-- otp@fecc0000 
 ec252690    phy        [   ]   rockchip_hdptx_phy         |-- phy@fed60000 
 ec252740    phy        [ + ]   rockchip_hdptx_phy_hdmi    |-- hdmiphy@fed60000 
 ec252810    clk        [ + ]   clk_hdptx                  |   `-- hdmiphypll_clk0 
 ec2528c0    phy        [   ]   rockchip_udphy             |-- phy@fed80000 
 ec252970    phy        [   ]   rockchip_udphy_dp_port     |   |-- dp-port 
 ec252a20    phy        [   ]   rockchip_udphy_u3_port     |   `-- u3-port 
 ec252ad0    phy        [   ]   samsung-mipi-dcphy         |-- phy@feda0000 
 ec252b80    phy        [   ]   samsung-mipi-dcphy         |-- phy@fedb0000 
 ec252c30    pinctrl    [ + ]   rockchip_rk3588_pinctrl    |-- pinctrl 
 ec252ce0    gpio       [ + ]   gpio_rockchip              |   |-- gpio@fd8a0000 
 ec252d90    gpio       [ + ]   gpio_rockchip              |   |-- gpio@fec20000 
 ec252e40    gpio       [ + ]   gpio_rockchip              |   |-- gpio@fec30000 
 ec252ef0    gpio       [ + ]   gpio_rockchip              |   |-- gpio@fec40000 
 ec252fa0    gpio       [ + ]   gpio_rockchip              |   |-- gpio@fec50000 
 ec253050    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up 
 ec253100    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down 
 ec2531b0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none 
 ec253260    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-0 
 ec253310    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-1 
 ec2533c0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-2 
 ec253470    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-3 
 ec253520    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-4 
 ec2535d0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-5 
 ec253680    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-6 
 ec253730    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-0 
 ec2537e0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-1 
 ec253890    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-2 
 ec253940    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-3 
 ec2539f0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-4 
 ec253aa0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-5 
 ec253b50    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-6 
 ec253c00    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-0 
 ec253cb0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-1 
 ec253d60    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-2 
 ec253e10    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-3 
 ec253ec0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-4 
 ec253f70    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-5 
 ec254020    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-6 
 ec2540d0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-smt 
 ec254180    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-smt 
 ec254230    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-smt 
 ec2542e0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-0-smt 
 ec254390    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-1-smt 
 ec254440    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-2-smt 
 ec2544f0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-3-smt 
 ec2545a0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-4-smt 
 ec254650    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-5-smt 
 ec254700    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-6-smt 
 ec2547b0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-output-high 
 ec254860    pinconfig  [   ]   pinconfig                  |   |-- pcfg-output-high-pull-up 
 ec254910    pinconfig  [   ]   pinconfig                  |   |-- pcfg-output-high-pull-down 
 ec2549c0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-output-high-pull-none 
 ec254a70    pinconfig  [   ]   pinconfig                  |   |-- pcfg-output-low 
 ec254b20    pinconfig  [   ]   pinconfig                  |   |-- pcfg-output-low-pull-up 
 ec254bd0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-output-low-pull-down 
 ec254c80    pinconfig  [   ]   pinconfig                  |   |-- pcfg-output-low-pull-none 
 ec254d30    pinconfig  [   ]   pinconfig                  |   |-- auddsm 
 ec254de0    pinconfig  [   ]   pinconfig                  |   |   `-- auddsm-pins 
 ec254e90    pinconfig  [   ]   pinconfig                  |   |-- bt1120 
 ec254f40    pinconfig  [   ]   pinconfig                  |   |   `-- bt1120-pins 
 ec254ff0    pinconfig  [   ]   pinconfig                  |   |-- can0 
 ec2550a0    pinconfig  [   ]   pinconfig                  |   |   |-- can0m0-pins 
 ec255150    pinconfig  [   ]   pinconfig                  |   |   `-- can0m1-pins 
 ec255200    pinconfig  [   ]   pinconfig                  |   |-- can1 
 ec2552b0    pinconfig  [   ]   pinconfig                  |   |   |-- can1m0-pins 
 ec255360    pinconfig  [   ]   pinconfig                  |   |   `-- can1m1-pins 
 ec255410    pinconfig  [   ]   pinconfig                  |   |-- can2 
 ec2554c0    pinconfig  [   ]   pinconfig                  |   |   |-- can2m0-pins 
 ec255570    pinconfig  [   ]   pinconfig                  |   |   `-- can2m1-pins 
 ec255620    pinconfig  [   ]   pinconfig                  |   |-- cif 
 ec2556d0    pinconfig  [   ]   pinconfig                  |   |   |-- cif-clk 
 ec255780    pinconfig  [   ]   pinconfig                  |   |   |-- cif-dvp-clk 
 ec255830    pinconfig  [   ]   pinconfig                  |   |   |-- cif-dvp-bus16 
 ec2558e0    pinconfig  [   ]   pinconfig                  |   |   `-- cif-dvp-bus8 
 ec255990    pinconfig  [   ]   pinconfig                  |   |-- clk32k 
 ec255a40    pinconfig  [   ]   pinconfig                  |   |   |-- clk32k-in 
 ec255af0    pinconfig  [   ]   pinconfig                  |   |   |-- clk32k-out0 
 ec255ba0    pinconfig  [   ]   pinconfig                  |   |   `-- clk32k-out1 
 ec255c50    pinconfig  [   ]   pinconfig                  |   |-- cpu 
 ec255d00    pinconfig  [   ]   pinconfig                  |   |   `-- cpu-pins 
 ec255db0    pinconfig  [   ]   pinconfig                  |   |-- ddrphych0 
 ec255e60    pinconfig  [   ]   pinconfig                  |   |   `-- ddrphych0-pins 
 ec255f10    pinconfig  [   ]   pinconfig                  |   |-- ddrphych1 
 ec255fc0    pinconfig  [   ]   pinconfig                  |   |   `-- ddrphych1-pins 
 ec256070    pinconfig  [   ]   pinconfig                  |   |-- ddrphych2 
 ec256120    pinconfig  [   ]   pinconfig                  |   |   `-- ddrphych2-pins 
 ec2561d0    pinconfig  [   ]   pinconfig                  |   |-- ddrphych3 
 ec256280    pinconfig  [   ]   pinconfig                  |   |   `-- ddrphych3-pins 
 ec256330    pinconfig  [   ]   pinconfig                  |   |-- dp0 
 ec2563e0    pinconfig  [   ]   pinconfig                  |   |   |-- dp0m0-pins 
 ec256490    pinconfig  [   ]   pinconfig                  |   |   |-- dp0m1-pins 
 ec256540    pinconfig  [   ]   pinconfig                  |   |   `-- dp0m2-pins 
 ec2565f0    pinconfig  [   ]   pinconfig                  |   |-- dp1 
 ec2566a0    pinconfig  [   ]   pinconfig                  |   |   |-- dp1m0-pins 
 ec256750    pinconfig  [   ]   pinconfig                  |   |   |-- dp1m1-pins 
 ec256800    pinconfig  [   ]   pinconfig                  |   |   `-- dp1m2-pins 
 ec2568b0    pinconfig  [   ]   pinconfig                  |   |-- emmc 
 ec256960    pinconfig  [   ]   pinconfig                  |   |   |-- emmc-rstnout 
 ec256a10    pinconfig  [   ]   pinconfig                  |   |   |-- emmc-bus8 
 ec256ac0    pinconfig  [   ]   pinconfig                  |   |   |-- emmc-clk 
 ec256b70    pinconfig  [   ]   pinconfig                  |   |   |-- emmc-cmd 
 ec256c20    pinconfig  [   ]   pinconfig                  |   |   `-- emmc-data-strobe 
 ec256cd0    pinconfig  [   ]   pinconfig                  |   |-- eth1 
 ec256d80    pinconfig  [   ]   pinconfig                  |   |   `-- eth1-pins 
 ec256e30    pinconfig  [   ]   pinconfig                  |   |-- fspi 
 ec256ee0    pinconfig  [   ]   pinconfig                  |   |   |-- fspim0-pins 
 ec256f90    pinconfig  [   ]   pinconfig                  |   |   |-- fspim0-cs1 
 ec257040    pinconfig  [   ]   pinconfig                  |   |   |-- fspim2-pins 
 ec2570f0    pinconfig  [   ]   pinconfig                  |   |   |-- fspim2-cs1 
 ec2571a0    pinconfig  [   ]   pinconfig                  |   |   |-- fspim1-pins 
 ec257250    pinconfig  [   ]   pinconfig                  |   |   `-- fspim1-cs1 
 ec257300    pinconfig  [ + ]   pinconfig                  |   |-- gmac1 
 ec2573b0    pinconfig  [ + ]   pinconfig                  |   |   |-- gmac1-miim 
 ec257460    pinconfig  [   ]   pinconfig                  |   |   |-- gmac1-clkinout 
 ec257510    pinconfig  [ + ]   pinconfig                  |   |   |-- gmac1-rx-bus2 
 ec2575c0    pinconfig  [ + ]   pinconfig                  |   |   |-- gmac1-tx-bus2 
 ec257670    pinconfig  [ + ]   pinconfig                  |   |   |-- gmac1-rgmii-clk 
 ec257720    pinconfig  [ + ]   pinconfig                  |   |   |-- gmac1-rgmii-bus 
 ec2577d0    pinconfig  [   ]   pinconfig                  |   |   |-- gmac1-ppsclk 
 ec257880    pinconfig  [   ]   pinconfig                  |   |   |-- gmac1-ppstrig 
 ec257930    pinconfig  [   ]   pinconfig                  |   |   |-- gmac1-ptp-ref-clk 
 ec2579e0    pinconfig  [   ]   pinconfig                  |   |   `-- gmac1-txer 
 ec257a90    pinconfig  [   ]   pinconfig                  |   |-- gpu 
 ec257b40    pinconfig  [   ]   pinconfig                  |   |   `-- gpu-pins 
 ec257bf0    pinconfig  [ + ]   pinconfig                  |   |-- hdmi 
 ec257ca0    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim0-rx-cec 
 ec257d50    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim0-rx-hpdin 
 ec257e00    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim0-rx-scl 
 ec257eb0    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim0-rx-sda 
 ec257f60    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim0-tx0-cec 
 ec258010    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim0-tx0-hpd 
 ec2580c0    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim0-tx0-scl 
 ec258170    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim0-tx0-sda 
 ec258220    pinconfig  [ + ]   pinconfig                  |   |   |-- hdmim0-tx1-hpd 
 ec2582d0    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim1-rx 
 ec258380    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim1-rx-cec 
 ec258430    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim1-rx-hpdin 
 ec2584e0    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim1-rx-scl 
 ec258590    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim1-rx-sda 
 ec258640    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim1-tx0-cec 
 ec2586f0    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim1-tx0-hpd 
 ec2587a0    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim1-tx0-scl 
 ec258850    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim1-tx0-sda 
 ec258900    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim1-tx1-cec 
 ec2589b0    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim1-tx1-hpd 
 ec258a60    pinconfig  [ + ]   pinconfig                  |   |   |-- hdmim1-tx1-scl 
 ec258b10    pinconfig  [ + ]   pinconfig                  |   |   |-- hdmim1-tx1-sda 
 ec258bc0    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim2-rx-cec 
 ec258c70    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim2-rx-hpdin 
 ec258d20    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim2-rx-scl 
 ec258dd0    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim2-rx-sda 
 ec258e80    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim2-tx0-scl 
 ec258f30    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim2-tx0-sda 
 ec258fe0    pinconfig  [ + ]   pinconfig                  |   |   |-- hdmim2-tx1-cec 
 ec259090    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim2-tx1-scl 
 ec259140    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim2-tx1-sda 
 ec2591f0    pinconfig  [   ]   pinconfig                  |   |   |-- hdmi-debug0 
 ec2592a0    pinconfig  [   ]   pinconfig                  |   |   |-- hdmi-debug1 
 ec259350    pinconfig  [   ]   pinconfig                  |   |   |-- hdmi-debug2 
 ec259400    pinconfig  [   ]   pinconfig                  |   |   |-- hdmi-debug3 
 ec2594b0    pinconfig  [   ]   pinconfig                  |   |   |-- hdmi-debug4 
 ec259560    pinconfig  [   ]   pinconfig                  |   |   |-- hdmi-debug5 
 ec259610    pinconfig  [   ]   pinconfig                  |   |   |-- hdmi-debug6 
 ec2596c0    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim0-tx1-cec 
 ec259770    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim0-tx1-scl 
 ec259820    pinconfig  [   ]   pinconfig                  |   |   |-- hdmim0-tx1-sda 
 ec2598d0    pinconfig  [   ]   pinconfig                  |   |   `-- hdmirx-det 
 ec259980    pinconfig  [ + ]   pinconfig                  |   |-- i2c0 
 ec259a30    pinconfig  [   ]   pinconfig                  |   |   |-- i2c0m0-xfer 
 ec259ae0    pinconfig  [ + ]   pinconfig                  |   |   |-- i2c0m2-xfer 
 ec259b90    pinconfig  [   ]   pinconfig                  |   |   `-- i2c0m1-xfer 
 ec259c40    pinconfig  [ + ]   pinconfig                  |   |-- i2c1 
 ec259cf0    pinconfig  [   ]   pinconfig                  |   |   |-- i2c1m0-xfer 
 ec259da0    pinconfig  [   ]   pinconfig                  |   |   |-- i2c1m1-xfer 
 ec259e50    pinconfig  [ + ]   pinconfig                  |   |   |-- i2c1m2-xfer 
 ec259f00    pinconfig  [   ]   pinconfig                  |   |   |-- i2c1m3-xfer 
 ec259fb0    pinconfig  [   ]   pinconfig                  |   |   `-- i2c1m4-xfer 
 ec25a060    pinconfig  [   ]   pinconfig                  |   |-- i2c2 
 ec25a110    pinconfig  [   ]   pinconfig                  |   |   |-- i2c2m0-xfer 
 ec25a1c0    pinconfig  [   ]   pinconfig                  |   |   |-- i2c2m2-xfer 
 ec25a270    pinconfig  [   ]   pinconfig                  |   |   |-- i2c2m3-xfer 
 ec25a320    pinconfig  [   ]   pinconfig                  |   |   |-- i2c2m4-xfer 
 ec25a3d0    pinconfig  [   ]   pinconfig                  |   |   `-- i2c2m1-xfer 
 ec25a480    pinconfig  [   ]   pinconfig                  |   |-- i2c3 
 ec25a530    pinconfig  [   ]   pinconfig                  |   |   |-- i2c3m0-xfer 
 ec25a5e0    pinconfig  [   ]   pinconfig                  |   |   |-- i2c3m1-xfer 
 ec25a690    pinconfig  [   ]   pinconfig                  |   |   |-- i2c3m2-xfer 
 ec25a740    pinconfig  [   ]   pinconfig                  |   |   |-- i2c3m4-xfer 
 ec25a7f0    pinconfig  [   ]   pinconfig                  |   |   `-- i2c3m3-xfer 
 ec25a8a0    pinconfig  [   ]   pinconfig                  |   |-- i2c4 
 ec25a950    pinconfig  [   ]   pinconfig                  |   |   |-- i2c4m0-xfer 
 ec25aa00    pinconfig  [   ]   pinconfig                  |   |   |-- i2c4m2-xfer 
 ec25aab0    pinconfig  [   ]   pinconfig                  |   |   |-- i2c4m3-xfer 
 ec25ab60    pinconfig  [   ]   pinconfig                  |   |   |-- i2c4m4-xfer 
 ec25ac10    pinconfig  [   ]   pinconfig                  |   |   `-- i2c4m1-xfer 
 ec25acc0    pinconfig  [   ]   pinconfig                  |   |-- i2c5 
 ec25ad70    pinconfig  [   ]   pinconfig                  |   |   |-- i2c5m0-xfer 
 ec25ae20    pinconfig  [   ]   pinconfig                  |   |   |-- i2c5m1-xfer 
 ec25aed0    pinconfig  [   ]   pinconfig                  |   |   |-- i2c5m2-xfer 
 ec25af80    pinconfig  [   ]   pinconfig                  |   |   |-- i2c5m3-xfer 
 ec25b030    pinconfig  [   ]   pinconfig                  |   |   `-- i2c5m4-xfer 
 ec25b0e0    pinconfig  [ + ]   pinconfig                  |   |-- i2c6 
 ec25b190    pinconfig  [ + ]   pinconfig                  |   |   |-- i2c6m0-xfer 
 ec25b240    pinconfig  [   ]   pinconfig                  |   |   |-- i2c6m1-xfer 
 ec25b2f0    pinconfig  [   ]   pinconfig                  |   |   |-- i2c6m3-xfer 
 ec25b3a0    pinconfig  [   ]   pinconfig                  |   |   |-- i2c6m4-xfer 
 ec25b450    pinconfig  [   ]   pinconfig                  |   |   `-- i2c6m2-xfer 
 ec25b500    pinconfig  [   ]   pinconfig                  |   |-- i2c7 
 ec25b5b0    pinconfig  [   ]   pinconfig                  |   |   |-- i2c7m0-xfer 
 ec25b660    pinconfig  [   ]   pinconfig                  |   |   |-- i2c7m2-xfer 
 ec25b710    pinconfig  [   ]   pinconfig                  |   |   |-- i2c7m3-xfer 
 ec25b7c0    pinconfig  [   ]   pinconfig                  |   |   `-- i2c7m1-xfer 
 ec25b870    pinconfig  [   ]   pinconfig                  |   |-- i2c8 
 ec25b920    pinconfig  [   ]   pinconfig                  |   |   |-- i2c8m0-xfer 
 ec25b9d0    pinconfig  [   ]   pinconfig                  |   |   |-- i2c8m2-xfer 
 ec25ba80    pinconfig  [   ]   pinconfig                  |   |   |-- i2c8m3-xfer 
 ec25bb30    pinconfig  [   ]   pinconfig                  |   |   |-- i2c8m4-xfer 
 ec25bbe0    pinconfig  [   ]   pinconfig                  |   |   `-- i2c8m1-xfer 
 ec25bc90    pinconfig  [   ]   pinconfig                  |   |-- i2s0 
 ec25bd40    pinconfig  [   ]   pinconfig                  |   |   |-- i2s0-idle 
 ec25bdf0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s0-lrck 
 ec25bea0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s0-mclk 
 ec25bf50    pinconfig  [   ]   pinconfig                  |   |   |-- i2s0-sclk 
 ec25c000    pinconfig  [   ]   pinconfig                  |   |   |-- i2s0-sdi0 
 ec25c0b0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s0-sdi1 
 ec25c160    pinconfig  [   ]   pinconfig                  |   |   |-- i2s0-sdi2 
 ec25c210    pinconfig  [   ]   pinconfig                  |   |   |-- i2s0-sdi3 
 ec25c2c0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s0-sdo0 
 ec25c370    pinconfig  [   ]   pinconfig                  |   |   |-- i2s0-sdo1 
 ec25c420    pinconfig  [   ]   pinconfig                  |   |   |-- i2s0-sdo2 
 ec25c4d0    pinconfig  [   ]   pinconfig                  |   |   `-- i2s0-sdo3 
 ec25c580    pinconfig  [   ]   pinconfig                  |   |-- i2s1 
 ec25c630    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m0-lrck 
 ec25c6e0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m0-mclk 
 ec25c790    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m0-sclk 
 ec25c840    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m0-sdi0 
 ec25c8f0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m0-sdi1 
 ec25c9a0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m0-sdi2 
 ec25ca50    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m0-sdi3 
 ec25cb00    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m0-sdo0 
 ec25cbb0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m0-sdo1 
 ec25cc60    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m0-sdo2 
 ec25cd10    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m0-sdo3 
 ec25cdc0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m1-lrck 
 ec25ce70    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m1-mclk 
 ec25cf20    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m1-sclk 
 ec25cfd0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m1-sdi0 
 ec25d080    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m1-sdi1 
 ec25d130    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m1-sdi2 
 ec25d1e0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m1-sdi3 
 ec25d290    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m1-sdo0 
 ec25d340    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m1-sdo1 
 ec25d3f0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s1m1-sdo2 
 ec25d4a0    pinconfig  [   ]   pinconfig                  |   |   `-- i2s1m1-sdo3 
 ec25d550    pinconfig  [   ]   pinconfig                  |   |-- i2s2 
 ec25d600    pinconfig  [   ]   pinconfig                  |   |   |-- i2s2m1-idle 
 ec25d6b0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s2m1-lrck 
 ec25d760    pinconfig  [   ]   pinconfig                  |   |   |-- i2s2m1-mclk 
 ec25d810    pinconfig  [   ]   pinconfig                  |   |   |-- i2s2m1-sclk 
 ec25d8c0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s2m1-sdi 
 ec25d970    pinconfig  [   ]   pinconfig                  |   |   |-- i2s2m1-sdo 
 ec25da20    pinconfig  [   ]   pinconfig                  |   |   |-- i2s2m0-idle 
 ec25dad0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s2m0-lrck 
 ec25db80    pinconfig  [   ]   pinconfig                  |   |   |-- i2s2m0-mclk 
 ec25dc30    pinconfig  [   ]   pinconfig                  |   |   |-- i2s2m0-sclk 
 ec25dce0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s2m0-sdi 
 ec25dd90    pinconfig  [   ]   pinconfig                  |   |   `-- i2s2m0-sdo 
 ec25de40    pinconfig  [   ]   pinconfig                  |   |-- i2s3 
 ec25def0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s3-idle 
 ec25dfa0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s3-lrck 
 ec25e050    pinconfig  [   ]   pinconfig                  |   |   |-- i2s3-mclk 
 ec25e100    pinconfig  [   ]   pinconfig                  |   |   |-- i2s3-sclk 
 ec25e1b0    pinconfig  [   ]   pinconfig                  |   |   |-- i2s3-sdi 
 ec25e260    pinconfig  [   ]   pinconfig                  |   |   `-- i2s3-sdo 
 ec25e310    pinconfig  [   ]   pinconfig                  |   |-- jtag 
 ec25e3c0    pinconfig  [   ]   pinconfig                  |   |   |-- jtagm0-pins 
 ec25e470    pinconfig  [   ]   pinconfig                  |   |   |-- jtagm1-pins 
 ec25e520    pinconfig  [   ]   pinconfig                  |   |   `-- jtagm2-pins 
 ec25e5d0    pinconfig  [   ]   pinconfig                  |   |-- litcpu 
 ec25e680    pinconfig  [   ]   pinconfig                  |   |   `-- litcpu-pins 
 ec25e730    pinconfig  [   ]   pinconfig                  |   |-- mcu 
 ec25e7e0    pinconfig  [   ]   pinconfig                  |   |   |-- mcum0-pins 
 ec25e890    pinconfig  [   ]   pinconfig                  |   |   `-- mcum1-pins 
 ec25e940    pinconfig  [   ]   pinconfig                  |   |-- mipi 
 ec25e9f0    pinconfig  [   ]   pinconfig                  |   |   |-- mipim0-camera0-clk 
 ec25eaa0    pinconfig  [   ]   pinconfig                  |   |   |-- mipim0-camera1-clk 
 ec25eb50    pinconfig  [   ]   pinconfig                  |   |   |-- mipim0-camera2-clk 
 ec25ec00    pinconfig  [   ]   pinconfig                  |   |   |-- mipim0-camera3-clk 
 ec25ecb0    pinconfig  [   ]   pinconfig                  |   |   |-- mipim0-camera4-clk 
 ec25ed60    pinconfig  [   ]   pinconfig                  |   |   |-- mipim1-camera0-clk 
 ec25ee10    pinconfig  [   ]   pinconfig                  |   |   |-- mipim1-camera1-clk 
 ec25eec0    pinconfig  [   ]   pinconfig                  |   |   |-- mipim1-camera2-clk 
 ec25ef70    pinconfig  [   ]   pinconfig                  |   |   |-- mipim1-camera3-clk 
 ec25f020    pinconfig  [   ]   pinconfig                  |   |   |-- mipim1-camera4-clk 
 ec25f0d0    pinconfig  [   ]   pinconfig                  |   |   |-- mipi-te0 
 ec25f180    pinconfig  [   ]   pinconfig                  |   |   `-- mipi-te1 
 ec25f230    pinconfig  [   ]   pinconfig                  |   |-- npu 
 ec25f2e0    pinconfig  [   ]   pinconfig                  |   |   `-- npu-pins 
 ec25f390    pinconfig  [   ]   pinconfig                  |   |-- pcie20x1 
 ec25f440    pinconfig  [   ]   pinconfig                  |   |   |-- pcie20x1m0-pins 
 ec25f4f0    pinconfig  [   ]   pinconfig                  |   |   |-- pcie20x1m1-pins 
 ec25f5a0    pinconfig  [   ]   pinconfig                  |   |   `-- pcie20x1-2-button-rstn 
 ec25f650    pinconfig  [   ]   pinconfig                  |   |-- pcie30phy 
 ec25f700    pinconfig  [   ]   pinconfig                  |   |   `-- pcie30phy-pins 
 ec25f7b0    pinconfig  [   ]   pinconfig                  |   |-- pcie30x1 
 ec25f860    pinconfig  [   ]   pinconfig                  |   |   |-- pcie30x1m0-pins 
 ec25f910    pinconfig  [   ]   pinconfig                  |   |   |-- pcie30x1m1-pins 
 ec25f9c0    pinconfig  [   ]   pinconfig                  |   |   |-- pcie30x1m2-pins 
 ec25fa70    pinconfig  [   ]   pinconfig                  |   |   |-- pcie30x1-0-button-rstn 
 ec25fb20    pinconfig  [   ]   pinconfig                  |   |   `-- pcie30x1-1-button-rstn 
 ec25fbd0    pinconfig  [   ]   pinconfig                  |   |-- pcie30x2 
 ec25fc80    pinconfig  [   ]   pinconfig                  |   |   |-- pcie30x2m0-pins 
 ec25fd30    pinconfig  [   ]   pinconfig                  |   |   |-- pcie30x2m1-pins 
 ec25fde0    pinconfig  [   ]   pinconfig                  |   |   |-- pcie30x2m2-pins 
 ec25fe90    pinconfig  [   ]   pinconfig                  |   |   |-- pcie30x2m3-pins 
 ec25ff40    pinconfig  [   ]   pinconfig                  |   |   `-- pcie30x2-button-rstn 
 ec25fff0    pinconfig  [   ]   pinconfig                  |   |-- pcie30x4 
 ec2600a0    pinconfig  [   ]   pinconfig                  |   |   |-- pcie30x4m0-pins 
 ec260150    pinconfig  [   ]   pinconfig                  |   |   |-- pcie30x4m1-pins 
 ec260200    pinconfig  [   ]   pinconfig                  |   |   |-- pcie30x4m2-pins 
 ec2602b0    pinconfig  [   ]   pinconfig                  |   |   |-- pcie30x4m3-pins 
 ec260360    pinconfig  [   ]   pinconfig                  |   |   |-- pcie30x4-button-rstn 
 ec260410    pinconfig  [   ]   pinconfig                  |   |   `-- pcie30x4-clkreqn-m1 
 ec2604c0    pinconfig  [   ]   pinconfig                  |   |-- pdm0 
 ec260570    pinconfig  [   ]   pinconfig                  |   |   |-- pdm0m0-clk 
 ec260620    pinconfig  [   ]   pinconfig                  |   |   |-- pdm0m0-clk1 
 ec2606d0    pinconfig  [   ]   pinconfig                  |   |   |-- pdm0m0-idle 
 ec260780    pinconfig  [   ]   pinconfig                  |   |   |-- pdm0m0-sdi0 
 ec260830    pinconfig  [   ]   pinconfig                  |   |   |-- pdm0m0-sdi1 
 ec2608e0    pinconfig  [   ]   pinconfig                  |   |   |-- pdm0m0-sdi2 
 ec260990    pinconfig  [   ]   pinconfig                  |   |   |-- pdm0m0-sdi3 
 ec260a40    pinconfig  [   ]   pinconfig                  |   |   |-- pdm0m1-clk 
 ec260af0    pinconfig  [   ]   pinconfig                  |   |   |-- pdm0m1-clk1 
 ec260ba0    pinconfig  [   ]   pinconfig                  |   |   |-- pdm0m1-idle 
 ec260c50    pinconfig  [   ]   pinconfig                  |   |   |-- pdm0m1-sdi0 
 ec260d00    pinconfig  [   ]   pinconfig                  |   |   |-- pdm0m1-sdi1 
 ec260db0    pinconfig  [   ]   pinconfig                  |   |   |-- pdm0m1-sdi2 
 ec260e60    pinconfig  [   ]   pinconfig                  |   |   `-- pdm0m1-sdi3 
 ec260f10    pinconfig  [   ]   pinconfig                  |   |-- pdm1 
 ec260fc0    pinconfig  [   ]   pinconfig                  |   |   |-- pdm1m0-clk 
 ec261070    pinconfig  [   ]   pinconfig                  |   |   |-- pdm1m0-clk1 
 ec261120    pinconfig  [   ]   pinconfig                  |   |   |-- pdm1m0-idle 
 ec2611d0    pinconfig  [   ]   pinconfig                  |   |   |-- pdm1m0-sdi0 
 ec261280    pinconfig  [   ]   pinconfig                  |   |   |-- pdm1m0-sdi1 
 ec261330    pinconfig  [   ]   pinconfig                  |   |   |-- pdm1m0-sdi2 
 ec2613e0    pinconfig  [   ]   pinconfig                  |   |   |-- pdm1m0-sdi3 
 ec261490    pinconfig  [   ]   pinconfig                  |   |   |-- pdm1m1-clk 
 ec261540    pinconfig  [   ]   pinconfig                  |   |   |-- pdm1m1-clk1 
 ec2615f0    pinconfig  [   ]   pinconfig                  |   |   |-- pdm1m1-idle 
 ec2616a0    pinconfig  [   ]   pinconfig                  |   |   |-- pdm1m1-sdi0 
 ec261750    pinconfig  [   ]   pinconfig                  |   |   |-- pdm1m1-sdi1 
 ec261800    pinconfig  [   ]   pinconfig                  |   |   |-- pdm1m1-sdi2 
 ec2618b0    pinconfig  [   ]   pinconfig                  |   |   `-- pdm1m1-sdi3 
 ec261960    pinconfig  [ + ]   pinconfig                  |   |-- pmic 
 ec261a10    pinconfig  [ + ]   pinconfig                  |   |   `-- pmic-pins 
 ec261ac0    pinconfig  [   ]   pinconfig                  |   |-- pmu 
 ec261b70    pinconfig  [   ]   pinconfig                  |   |   `-- pmu-pins 
 ec261c20    pinconfig  [   ]   pinconfig                  |   |-- pwm0 
 ec261cd0    pinconfig  [   ]   pinconfig                  |   |   |-- pwm0m0-pins 
 ec261d80    pinconfig  [   ]   pinconfig                  |   |   |-- pwm0m1-pins 
 ec261e30    pinconfig  [   ]   pinconfig                  |   |   `-- pwm0m2-pins 
 ec261ee0    pinconfig  [   ]   pinconfig                  |   |-- pwm1 
 ec261f90    pinconfig  [   ]   pinconfig                  |   |   |-- pwm1m0-pins 
 ec262040    pinconfig  [   ]   pinconfig                  |   |   |-- pwm1m1-pins 
 ec2620f0    pinconfig  [   ]   pinconfig                  |   |   `-- pwm1m2-pins 
 ec2621a0    pinconfig  [   ]   pinconfig                  |   |-- pwm2 
 ec262250    pinconfig  [   ]   pinconfig                  |   |   |-- pwm2m0-pins 
 ec262300    pinconfig  [   ]   pinconfig                  |   |   |-- pwm2m1-pins 
 ec2623b0    pinconfig  [   ]   pinconfig                  |   |   `-- pwm2m2-pins 
 ec262460    pinconfig  [   ]   pinconfig                  |   |-- pwm3 
 ec262510    pinconfig  [   ]   pinconfig                  |   |   |-- pwm3m0-pins 
 ec2625c0    pinconfig  [   ]   pinconfig                  |   |   |-- pwm3m1-pins 
 ec262670    pinconfig  [   ]   pinconfig                  |   |   |-- pwm3m2-pins 
 ec262720    pinconfig  [   ]   pinconfig                  |   |   `-- pwm3m3-pins 
 ec2627d0    pinconfig  [   ]   pinconfig                  |   |-- pwm4 
 ec262880    pinconfig  [   ]   pinconfig                  |   |   |-- pwm4m0-pins 
 ec262930    pinconfig  [   ]   pinconfig                  |   |   `-- pwm4m1-pins 
 ec2629e0    pinconfig  [   ]   pinconfig                  |   |-- pwm5 
 ec262a90    pinconfig  [   ]   pinconfig                  |   |   |-- pwm5m0-pins 
 ec262b40    pinconfig  [   ]   pinconfig                  |   |   |-- pwm5m1-pins 
 ec262bf0    pinconfig  [   ]   pinconfig                  |   |   `-- pwm5m2-pins 
 ec262ca0    pinconfig  [   ]   pinconfig                  |   |-- pwm6 
 ec262d50    pinconfig  [   ]   pinconfig                  |   |   |-- pwm6m0-pins 
 ec262e00    pinconfig  [   ]   pinconfig                  |   |   |-- pwm6m1-pins 
 ec262eb0    pinconfig  [   ]   pinconfig                  |   |   `-- pwm6m2-pins 
 ec262f60    pinconfig  [   ]   pinconfig                  |   |-- pwm7 
 ec263010    pinconfig  [   ]   pinconfig                  |   |   |-- pwm7m0-pins 
 ec2630c0    pinconfig  [   ]   pinconfig                  |   |   |-- pwm7m1-pins 
 ec263170    pinconfig  [   ]   pinconfig                  |   |   |-- pwm7m2-pins 
 ec263220    pinconfig  [   ]   pinconfig                  |   |   `-- pwm7m3-pins 
 ec2632d0    pinconfig  [   ]   pinconfig                  |   |-- pwm8 
 ec263380    pinconfig  [   ]   pinconfig                  |   |   |-- pwm8m0-pins 
 ec263430    pinconfig  [   ]   pinconfig                  |   |   |-- pwm8m1-pins 
 ec2634e0    pinconfig  [   ]   pinconfig                  |   |   `-- pwm8m2-pins 
 ec263590    pinconfig  [   ]   pinconfig                  |   |-- pwm9 
 ec263640    pinconfig  [   ]   pinconfig                  |   |   |-- pwm9m0-pins 
 ec2636f0    pinconfig  [   ]   pinconfig                  |   |   |-- pwm9m1-pins 
 ec2637a0    pinconfig  [   ]   pinconfig                  |   |   `-- pwm9m2-pins 
 ec263850    pinconfig  [   ]   pinconfig                  |   |-- pwm10 
 ec263900    pinconfig  [   ]   pinconfig                  |   |   |-- pwm10m0-pins 
 ec2639b0    pinconfig  [   ]   pinconfig                  |   |   |-- pwm10m1-pins 
 ec263a60    pinconfig  [   ]   pinconfig                  |   |   `-- pwm10m2-pins 
 ec263b10    pinconfig  [   ]   pinconfig                  |   |-- pwm11 
 ec263bc0    pinconfig  [   ]   pinconfig                  |   |   |-- pwm11m0-pins 
 ec263c70    pinconfig  [   ]   pinconfig                  |   |   |-- pwm11m1-pins 
 ec263d20    pinconfig  [   ]   pinconfig                  |   |   |-- pwm11m2-pins 
 ec263dd0    pinconfig  [   ]   pinconfig                  |   |   `-- pwm11m3-pins 
 ec263e80    pinconfig  [   ]   pinconfig                  |   |-- pwm12 
 ec263f30    pinconfig  [   ]   pinconfig                  |   |   |-- pwm12m0-pins 
 ec263fe0    pinconfig  [   ]   pinconfig                  |   |   `-- pwm12m1-pins 
 ec264090    pinconfig  [   ]   pinconfig                  |   |-- pwm13 
 ec264140    pinconfig  [   ]   pinconfig                  |   |   |-- pwm13m0-pins 
 ec2641f0    pinconfig  [   ]   pinconfig                  |   |   |-- pwm13m1-pins 
 ec2642a0    pinconfig  [   ]   pinconfig                  |   |   `-- pwm13m2-pins 
 ec264350    pinconfig  [   ]   pinconfig                  |   |-- pwm14 
 ec264400    pinconfig  [   ]   pinconfig                  |   |   |-- pwm14m0-pins 
 ec2644b0    pinconfig  [   ]   pinconfig                  |   |   |-- pwm14m1-pins 
 ec264560    pinconfig  [   ]   pinconfig                  |   |   `-- pwm14m2-pins 
 ec264610    pinconfig  [   ]   pinconfig                  |   |-- pwm15 
 ec2646c0    pinconfig  [   ]   pinconfig                  |   |   |-- pwm15m0-pins 
 ec264770    pinconfig  [   ]   pinconfig                  |   |   |-- pwm15m1-pins 
 ec264820    pinconfig  [   ]   pinconfig                  |   |   |-- pwm15m2-pins 
 ec2648d0    pinconfig  [   ]   pinconfig                  |   |   `-- pwm15m3-pins 
 ec264980    pinconfig  [   ]   pinconfig                  |   |-- refclk 
 ec264a30    pinconfig  [   ]   pinconfig                  |   |   `-- refclk-pins 
 ec264ae0    pinconfig  [   ]   pinconfig                  |   |-- sata 
 ec264b90    pinconfig  [   ]   pinconfig                  |   |   `-- sata-pins 
 ec264c40    pinconfig  [   ]   pinconfig                  |   |-- sata0 
 ec264cf0    pinconfig  [   ]   pinconfig                  |   |   |-- sata0m0-pins 
 ec264da0    pinconfig  [   ]   pinconfig                  |   |   `-- sata0m1-pins 
 ec264e50    pinconfig  [   ]   pinconfig                  |   |-- sata1 
 ec264f00    pinconfig  [   ]   pinconfig                  |   |   |-- sata1m0-pins 
 ec264fb0    pinconfig  [   ]   pinconfig                  |   |   `-- sata1m1-pins 
 ec265060    pinconfig  [   ]   pinconfig                  |   |-- sata2 
 ec265110    pinconfig  [   ]   pinconfig                  |   |   |-- sata2m0-pins 
 ec2651c0    pinconfig  [   ]   pinconfig                  |   |   `-- sata2m1-pins 
 ec265270    pinconfig  [   ]   pinconfig                  |   |-- sdio 
 ec265320    pinconfig  [   ]   pinconfig                  |   |   |-- sdiom1-pins 
 ec2653d0    pinconfig  [   ]   pinconfig                  |   |   `-- sdiom0-pins 
 ec265480    pinconfig  [ + ]   pinconfig                  |   |-- sdmmc 
 ec265530    pinconfig  [   ]   pinconfig                  |   |   |-- sdmmc-bus4 
 ec2655e0    pinconfig  [   ]   pinconfig                  |   |   |-- sdmmc-clk 
 ec265690    pinconfig  [   ]   pinconfig                  |   |   |-- sdmmc-cmd 
 ec265740    pinconfig  [   ]   pinconfig                  |   |   |-- sdmmc-det 
 ec2657f0    pinconfig  [   ]   pinconfig                  |   |   |-- sdmmc-pwren 
 ec2658a0    pinconfig  [ + ]   pinconfig                  |   |   `-- sd-s0-pwr 
 ec265950    pinconfig  [   ]   pinconfig                  |   |-- spdif0 
 ec265a00    pinconfig  [   ]   pinconfig                  |   |   |-- spdif0m0-tx 
 ec265ab0    pinconfig  [   ]   pinconfig                  |   |   `-- spdif0m1-tx 
 ec265b60    pinconfig  [   ]   pinconfig                  |   |-- spdif1 
 ec265c10    pinconfig  [   ]   pinconfig                  |   |   |-- spdif1m0-tx 
 ec265cc0    pinconfig  [   ]   pinconfig                  |   |   |-- spdif1m1-tx 
 ec265d70    pinconfig  [   ]   pinconfig                  |   |   `-- spdif1m2-tx 
 ec265e20    pinconfig  [   ]   pinconfig                  |   |-- spi0 
 ec265ed0    pinconfig  [   ]   pinconfig                  |   |   |-- spi0m0-pins 
 ec265f80    pinconfig  [   ]   pinconfig                  |   |   |-- spi0m0-cs0 
 ec266030    pinconfig  [   ]   pinconfig                  |   |   |-- spi0m0-cs1 
 ec2660e0    pinconfig  [   ]   pinconfig                  |   |   |-- spi0m1-pins 
 ec266190    pinconfig  [   ]   pinconfig                  |   |   |-- spi0m1-cs0 
 ec266240    pinconfig  [   ]   pinconfig                  |   |   |-- spi0m1-cs1 
 ec2662f0    pinconfig  [   ]   pinconfig                  |   |   |-- spi0m2-pins 
 ec2663a0    pinconfig  [   ]   pinconfig                  |   |   |-- spi0m2-cs0 
 ec266450    pinconfig  [   ]   pinconfig                  |   |   |-- spi0m2-cs1 
 ec266500    pinconfig  [   ]   pinconfig                  |   |   |-- spi0m3-pins 
 ec2665b0    pinconfig  [   ]   pinconfig                  |   |   |-- spi0m3-cs0 
 ec266660    pinconfig  [   ]   pinconfig                  |   |   `-- spi0m3-cs1 
 ec266710    pinconfig  [   ]   pinconfig                  |   |-- spi1 
 ec2667c0    pinconfig  [   ]   pinconfig                  |   |   |-- spi1m1-pins 
 ec266870    pinconfig  [   ]   pinconfig                  |   |   |-- spi1m1-cs0 
 ec266920    pinconfig  [   ]   pinconfig                  |   |   |-- spi1m1-cs1 
 ec2669d0    pinconfig  [   ]   pinconfig                  |   |   |-- spi1m2-pins 
 ec266a80    pinconfig  [   ]   pinconfig                  |   |   |-- spi1m2-cs0 
 ec266b30    pinconfig  [   ]   pinconfig                  |   |   |-- spi1m2-cs1 
 ec266be0    pinconfig  [   ]   pinconfig                  |   |   |-- spi1m0-pins 
 ec266c90    pinconfig  [   ]   pinconfig                  |   |   |-- spi1m0-cs0 
 ec266d40    pinconfig  [   ]   pinconfig                  |   |   `-- spi1m0-cs1 
 ec266df0    pinconfig  [ + ]   pinconfig                  |   |-- spi2 
 ec266ea0    pinconfig  [   ]   pinconfig                  |   |   |-- spi2m0-pins 
 ec266f50    pinconfig  [   ]   pinconfig                  |   |   |-- spi2m0-cs0 
 ec267000    pinconfig  [   ]   pinconfig                  |   |   |-- spi2m0-cs1 
 ec2670b0    pinconfig  [   ]   pinconfig                  |   |   |-- spi2m1-pins 
 ec267160    pinconfig  [   ]   pinconfig                  |   |   |-- spi2m1-cs0 
 ec267210    pinconfig  [   ]   pinconfig                  |   |   |-- spi2m1-cs1 
 ec2672c0    pinconfig  [ + ]   pinconfig                  |   |   |-- spi2m2-pins 
 ec267370    pinconfig  [ + ]   pinconfig                  |   |   |-- spi2m2-cs0 
 ec267420    pinconfig  [   ]   pinconfig                  |   |   `-- spi2m2-cs1 
 ec2674d0    pinconfig  [   ]   pinconfig                  |   |-- spi3 
 ec267580    pinconfig  [   ]   pinconfig                  |   |   |-- spi3m1-pins 
 ec267630    pinconfig  [   ]   pinconfig                  |   |   |-- spi3m1-cs0 
 ec2676e0    pinconfig  [   ]   pinconfig                  |   |   |-- spi3m1-cs1 
 ec267790    pinconfig  [   ]   pinconfig                  |   |   |-- spi3m2-pins 
 ec267840    pinconfig  [   ]   pinconfig                  |   |   |-- spi3m2-cs0 
 ec2678f0    pinconfig  [   ]   pinconfig                  |   |   |-- spi3m2-cs1 
 ec2679a0    pinconfig  [   ]   pinconfig                  |   |   |-- spi3m3-pins 
 ec267a50    pinconfig  [   ]   pinconfig                  |   |   |-- spi3m3-cs0 
 ec267b00    pinconfig  [   ]   pinconfig                  |   |   |-- spi3m3-cs1 
 ec267bb0    pinconfig  [   ]   pinconfig                  |   |   |-- spi3m0-pins 
 ec267c60    pinconfig  [   ]   pinconfig                  |   |   |-- spi3m0-cs0 
 ec267d10    pinconfig  [   ]   pinconfig                  |   |   `-- spi3m0-cs1 
 ec267dc0    pinconfig  [   ]   pinconfig                  |   |-- spi4 
 ec267e70    pinconfig  [   ]   pinconfig                  |   |   |-- spi4m0-pins 
 ec267f20    pinconfig  [   ]   pinconfig                  |   |   |-- spi4m0-cs0 
 ec267fd0    pinconfig  [   ]   pinconfig                  |   |   |-- spi4m0-cs1 
 ec268080    pinconfig  [   ]   pinconfig                  |   |   |-- spi4m1-pins 
 ec268130    pinconfig  [   ]   pinconfig                  |   |   |-- spi4m1-cs0 
 ec2681e0    pinconfig  [   ]   pinconfig                  |   |   |-- spi4m1-cs1 
 ec268290    pinconfig  [   ]   pinconfig                  |   |   |-- spi4m2-pins 
 ec268340    pinconfig  [   ]   pinconfig                  |   |   `-- spi4m2-cs0 
 ec2683f0    pinconfig  [   ]   pinconfig                  |   |-- tsadc 
 ec2684a0    pinconfig  [   ]   pinconfig                  |   |   |-- tsadcm1-shut 
 ec268550    pinconfig  [   ]   pinconfig                  |   |   |-- tsadc-shut 
 ec268600    pinconfig  [   ]   pinconfig                  |   |   `-- tsadc-shut-org 
 ec2686b0    pinconfig  [   ]   pinconfig                  |   |-- uart0 
 ec268760    pinconfig  [   ]   pinconfig                  |   |   |-- uart0m0-xfer 
 ec268810    pinconfig  [   ]   pinconfig                  |   |   |-- uart0m1-xfer 
 ec2688c0    pinconfig  [   ]   pinconfig                  |   |   |-- uart0m2-xfer 
 ec268970    pinconfig  [   ]   pinconfig                  |   |   |-- uart0-ctsn 
 ec268a20    pinconfig  [   ]   pinconfig                  |   |   `-- uart0-rtsn 
 ec268ad0    pinconfig  [   ]   pinconfig                  |   |-- uart1 
 ec268b80    pinconfig  [   ]   pinconfig                  |   |   |-- uart1m1-xfer 
 ec268c30    pinconfig  [   ]   pinconfig                  |   |   |-- uart1m1-ctsn 
 ec268ce0    pinconfig  [   ]   pinconfig                  |   |   |-- uart1m1-rtsn 
 ec268d90    pinconfig  [   ]   pinconfig                  |   |   |-- uart1m2-xfer 
 ec268e40    pinconfig  [   ]   pinconfig                  |   |   |-- uart1m2-ctsn 
 ec268ef0    pinconfig  [   ]   pinconfig                  |   |   |-- uart1m2-rtsn 
 ec268fa0    pinconfig  [   ]   pinconfig                  |   |   |-- uart1m0-xfer 
 ec269050    pinconfig  [   ]   pinconfig                  |   |   |-- uart1m0-ctsn 
 ec269100    pinconfig  [   ]   pinconfig                  |   |   `-- uart1m0-rtsn 
 ec2691b0    pinconfig  [   ]   pinconfig                  |   |-- uart2 
 ec269260    pinconfig  [   ]   pinconfig                  |   |   |-- uart2m0-xfer 
 ec269310    pinconfig  [   ]   pinconfig                  |   |   |-- uart2m1-xfer 
 ec2693c0    pinconfig  [   ]   pinconfig                  |   |   |-- uart2m2-xfer 
 ec269470    pinconfig  [   ]   pinconfig                  |   |   |-- uart2-ctsn 
 ec269520    pinconfig  [   ]   pinconfig                  |   |   `-- uart2-rtsn 
 ec2695d0    pinconfig  [   ]   pinconfig                  |   |-- uart3 
 ec269680    pinconfig  [   ]   pinconfig                  |   |   |-- uart3m0-xfer 
 ec269730    pinconfig  [   ]   pinconfig                  |   |   |-- uart3m1-xfer 
 ec2697e0    pinconfig  [   ]   pinconfig                  |   |   |-- uart3m2-xfer 
 ec269890    pinconfig  [   ]   pinconfig                  |   |   |-- uart3-ctsn 
 ec269940    pinconfig  [   ]   pinconfig                  |   |   `-- uart3-rtsn 
 ec2699f0    pinconfig  [   ]   pinconfig                  |   |-- uart4 
 ec269aa0    pinconfig  [   ]   pinconfig                  |   |   |-- uart4m0-xfer 
 ec269b50    pinconfig  [   ]   pinconfig                  |   |   |-- uart4m1-xfer 
 ec269c00    pinconfig  [   ]   pinconfig                  |   |   |-- uart4m2-xfer 
 ec269cb0    pinconfig  [   ]   pinconfig                  |   |   |-- uart4-ctsn 
 ec269d60    pinconfig  [   ]   pinconfig                  |   |   `-- uart4-rtsn 
 ec269e10    pinconfig  [   ]   pinconfig                  |   |-- uart5 
 ec269ec0    pinconfig  [   ]   pinconfig                  |   |   |-- uart5m0-xfer 
 ec269f70    pinconfig  [   ]   pinconfig                  |   |   |-- uart5m0-ctsn 
 ec26a020    pinconfig  [   ]   pinconfig                  |   |   |-- uart5m0-rtsn 
 ec26a0d0    pinconfig  [   ]   pinconfig                  |   |   |-- uart5m1-xfer 
 ec26a180    pinconfig  [   ]   pinconfig                  |   |   |-- uart5m1-ctsn 
 ec26a230    pinconfig  [   ]   pinconfig                  |   |   |-- uart5m1-rtsn 
 ec26a2e0    pinconfig  [   ]   pinconfig                  |   |   `-- uart5m2-xfer 
 ec26a390    pinconfig  [   ]   pinconfig                  |   |-- uart6 
 ec26a440    pinconfig  [   ]   pinconfig                  |   |   |-- uart6m1-xfer 
 ec26a4f0    pinconfig  [   ]   pinconfig                  |   |   |-- uart6m1-ctsn 
 ec26a5a0    pinconfig  [   ]   pinconfig                  |   |   |-- uart6m1-rtsn 
 ec26a650    pinconfig  [   ]   pinconfig                  |   |   |-- uart6m2-xfer 
 ec26a700    pinconfig  [   ]   pinconfig                  |   |   |-- uart6m0-xfer 
 ec26a7b0    pinconfig  [   ]   pinconfig                  |   |   |-- uart6m0-ctsn 
 ec26a860    pinconfig  [   ]   pinconfig                  |   |   `-- uart6m0-rtsn 
 ec26a910    pinconfig  [   ]   pinconfig                  |   |-- uart7 
 ec26a9c0    pinconfig  [   ]   pinconfig                  |   |   |-- uart7m1-xfer 
 ec26aa70    pinconfig  [   ]   pinconfig                  |   |   |-- uart7m1-ctsn 
 ec26ab20    pinconfig  [   ]   pinconfig                  |   |   |-- uart7m1-rtsn 
 ec26abd0    pinconfig  [   ]   pinconfig                  |   |   |-- uart7m2-xfer 
 ec26ac80    pinconfig  [   ]   pinconfig                  |   |   |-- uart7m0-xfer 
 ec26ad30    pinconfig  [   ]   pinconfig                  |   |   |-- uart7m0-ctsn 
 ec26ade0    pinconfig  [   ]   pinconfig                  |   |   `-- uart7m0-rtsn 
 ec26ae90    pinconfig  [   ]   pinconfig                  |   |-- uart8 
 ec26af40    pinconfig  [   ]   pinconfig                  |   |   |-- uart8m0-xfer 
 ec26aff0    pinconfig  [   ]   pinconfig                  |   |   |-- uart8m0-ctsn 
 ec26b0a0    pinconfig  [   ]   pinconfig                  |   |   |-- uart8m0-rtsn 
 ec26b150    pinconfig  [   ]   pinconfig                  |   |   |-- uart8m1-xfer 
 ec26b200    pinconfig  [   ]   pinconfig                  |   |   |-- uart8m1-ctsn 
 ec26b2b0    pinconfig  [   ]   pinconfig                  |   |   |-- uart8m1-rtsn 
 ec26b360    pinconfig  [   ]   pinconfig                  |   |   `-- uart8-xfer 
 ec26b410    pinconfig  [   ]   pinconfig                  |   |-- uart9 
 ec26b4c0    pinconfig  [   ]   pinconfig                  |   |   |-- uart9m1-xfer 
 ec26b570    pinconfig  [   ]   pinconfig                  |   |   |-- uart9m1-ctsn 
 ec26b620    pinconfig  [   ]   pinconfig                  |   |   |-- uart9m1-rtsn 
 ec26b6d0    pinconfig  [   ]   pinconfig                  |   |   |-- uart9m2-xfer 
 ec26b780    pinconfig  [   ]   pinconfig                  |   |   |-- uart9m2-ctsn 
 ec26b830    pinconfig  [   ]   pinconfig                  |   |   |-- uart9m2-rtsn 
 ec26b8e0    pinconfig  [   ]   pinconfig                  |   |   |-- uart9m0-xfer 
 ec26b990    pinconfig  [   ]   pinconfig                  |   |   |-- uart9m0-ctsn 
 ec26ba40    pinconfig  [   ]   pinconfig                  |   |   `-- uart9m0-rtsn 
 ec26baf0    pinconfig  [   ]   pinconfig                  |   |-- vop 
 ec26bba0    pinconfig  [   ]   pinconfig                  |   |   `-- vop-pins 
 ec26bc50    pinconfig  [   ]   pinconfig                  |   |-- bt656 
 ec26bd00    pinconfig  [   ]   pinconfig                  |   |   `-- bt656-pins 
 ec26bdb0    pinconfig  [   ]   pinconfig                  |   |-- gpio-func 
 ec26be60    pinconfig  [   ]   pinconfig                  |   |   `-- tsadc-gpio-func 
 ec26bf10    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-7 
 ec26bfc0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-8 
 ec26c070    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-9 
 ec26c120    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-10 
 ec26c1d0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-11 
 ec26c280    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-12 
 ec26c330    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-13 
 ec26c3e0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-14 
 ec26c490    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-none-drv-level-15 
 ec26c540    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-7 
 ec26c5f0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-8 
 ec26c6a0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-9 
 ec26c750    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-10 
 ec26c800    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-11 
 ec26c8b0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-12 
 ec26c960    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-13 
 ec26ca10    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-14 
 ec26cac0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-up-drv-level-15 
 ec26cb70    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-7 
 ec26cc20    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-8 
 ec26ccd0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-9 
 ec26cd80    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-10 
 ec26ce30    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-11 
 ec26cee0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-12 
 ec26cf90    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-13 
 ec26d040    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-14 
 ec26d0f0    pinconfig  [   ]   pinconfig                  |   |-- pcfg-pull-down-drv-level-15 
 ec26d1a0    pinconfig  [   ]   pinconfig                  |   |-- eth0 
 ec26d250    pinconfig  [   ]   pinconfig                  |   |   `-- eth0-pins 
 ec26d300    pinconfig  [   ]   pinconfig                  |   |-- gmac0 
 ec26d3b0    pinconfig  [   ]   pinconfig                  |   |   |-- gmac0-miim 
 ec26d460    pinconfig  [   ]   pinconfig                  |   |   |-- gmac0-clkinout 
 ec26d510    pinconfig  [   ]   pinconfig                  |   |   |-- gmac0-rx-bus2 
 ec26d5c0    pinconfig  [   ]   pinconfig                  |   |   |-- gmac0-tx-bus2 
 ec26d670    pinconfig  [   ]   pinconfig                  |   |   |-- gmac0-rgmii-clk 
 ec26d720    pinconfig  [   ]   pinconfig                  |   |   |-- gmac0-rgmii-bus 
 ec26d7d0    pinconfig  [   ]   pinconfig                  |   |   |-- gmac0-ppsclk 
 ec26d880    pinconfig  [   ]   pinconfig                  |   |   |-- gmac0-ppstring 
 ec26d930    pinconfig  [   ]   pinconfig                  |   |   |-- gmac0-ptp-refclk 
 ec26d9e0    pinconfig  [   ]   pinconfig                  |   |   `-- gmac0-txer 
 ec26da90    pinconfig  [   ]   pinconfig                  |   |-- cam 
 ec26db40    pinconfig  [   ]   pinconfig                  |   |   |-- mipicsi0-pwr 
 ec26dbf0    pinconfig  [   ]   pinconfig                  |   |   |-- mipicsi1-pwr 
 ec26dca0    pinconfig  [   ]   pinconfig                  |   |   `-- mipidcphy0-pwr 
 ec26dd50    pinconfig  [   ]   pinconfig                  |   |-- vga 
 ec26de00    pinconfig  [   ]   pinconfig                  |   |   `-- vga-hpdin-l 
 ec26deb0    pinconfig  [   ]   pinconfig                  |   |-- es8388 
 ec26df60    pinconfig  [   ]   pinconfig                  |   |   `-- es8388_gpio_ctl 
 ec26e010    pinconfig  [   ]   pinconfig                  |   |-- hym8563 
 ec26e0c0    pinconfig  [ + ]   pinconfig                  |   |-- lcd0_dsi0 
 ec26e170    pinconfig  [ + ]   pinconfig                  |   |   |-- lcd-pwr-dsi0 
 ec26e220    pinconfig  [   ]   pinconfig                  |   |   `-- lcd-rst-dsi0 
 ec26e2d0    pinconfig  [ + ]   pinconfig                  |   |-- lcd1_dsi1 
 ec26e380    pinconfig  [ + ]   pinconfig                  |   |   |-- lcd-pwr-dsi1 
 ec26e430    pinconfig  [   ]   pinconfig                  |   |   `-- lcd-bl-dsi1 
 ec26e4e0    pinconfig  [   ]   pinconfig                  |   |-- lcd2_edp 
 ec26e590    pinconfig  [   ]   pinconfig                  |   |   |-- lcd-pwr-edp 
 ec26e640    pinconfig  [   ]   pinconfig                  |   |   `-- lcd-bl-edp 
 ec26e6f0    pinconfig  [   ]   pinconfig                  |   |-- sdio-pwrseq 
 ec26e7a0    pinconfig  [   ]   pinconfig                  |   |   `-- wifi-enable-h 
 ec26e850    pinconfig  [   ]   pinconfig                  |   |-- touch 
 ec26e900    pinconfig  [   ]   pinconfig                  |   |   `-- touch-gpio 
 ec26e9b0    pinconfig  [   ]   pinconfig                  |   |-- wireless-bluetooth 
 ec26ea60    pinconfig  [   ]   pinconfig                  |   |   |-- uart9-gpios 
 ec26eb10    pinconfig  [   ]   pinconfig                  |   |   |-- bt-reset-gpio 
 ec26ebc0    pinconfig  [   ]   pinconfig                  |   |   |-- bt-wake-gpio 
 ec26ec70    pinconfig  [   ]   pinconfig                  |   |   `-- bt-irq-gpio 
 ec26ed20    pinconfig  [   ]   pinconfig                  |   |-- wireless-wlan 
 ec26edd0    pinconfig  [   ]   pinconfig                  |   |   `-- wifi-host-wake-irq 
 ec26ee80    pinconfig  [   ]   pinconfig                  |   |-- smdtio 
 ec26ef30    pinconfig  [   ]   pinconfig                  |   |   `-- smdtio-gpios 
 ec26efe0    pinconfig  [ + ]   pinconfig                  |   |-- usb-typec 
 ec26f090    pinconfig  [   ]   pinconfig                  |   |   |-- usbc0-int 
 ec26f140    pinconfig  [ + ]   pinconfig                  |   |   `-- typec5v-pwren 
 ec26f1f0    pinconfig  [ + ]   pinconfig                  |   `-- lt8668 
 ec26f2a0    pinconfig  [ + ]   pinconfig                  |       `-- lt8668-pwr 
 ec26f350    nop        [ + ]   dwc3-generic-wrapper       |-- usbdrd3_1 
 ec26f430    usb        [ + ]   dwc3-generic-host          |   `-- usb@fc400000 
 ec277be0    usb_hub    [ + ]   usb_hub                    |       `-- usb_hub 
 ec26f500    syscon     [   ]   rk3588_syscon              |-- syscon@fd5b8000 
 ec26f5b0    syscon     [   ]   rk3588_syscon              |-- syscon@fd5c0000 
 ec26f660    syscon     [ + ]   syscon                     |-- syscon@fd5cc000 
 ec26f710    syscon     [ + ]   syscon                     |-- syscon@fd5d4000 
 ec26f7c0    phy        [ + ]   rockchip_usb2phy           |   `-- usb2-phy@4000 
 ec26f870    phy        [ + ]   rockchip_usb2phy_port      |       `-- otg-port 
 ec26f920    syscon     [ + ]   syscon                     |-- syscon@fd5e4000 
 ec26fa10    display    [ + ]   rockchip_dw_hdmi_qp        |-- hdmi@fdea0000 
 ec26fae0    phy        [ + ]   rockchip_hdptx_phy_hdmi    |-- hdmiphy@fed70000 
 ec26fbb0    clk        [ + ]   clk_hdptx                  |   `-- hdmiphypll_clk1 
 ec26fc60    phy        [ + ]   rockchip_udphy             |-- phy@fed90000 
 ec26fd10    phy        [   ]   rockchip_udphy_dp_port     |   |-- dp-port 
 ec26fdc0    phy        [ + ]   rockchip_udphy_u3_port     |   `-- u3-port 
 ec26fe70    simple_bus [ + ]   adc_key_bus                |-- adc-keys 
 ec26ff40    key        [ + ]   adc_key                    |   |-- vol-up-key 
 ec270060    key        [ + ]   adc_key                    |   |-- vol-down-key 
 ec270180    key        [ + ]   adc_key                    |   |-- menu-key 
 ec2702a0    key        [ + ]   adc_key                    |   |-- back-key 
 ec2703c0    key        [ + ]   adc_key                    |   `-- uboot-key 
 ec270520    backlight  [   ]   pwm_backlight              |-- backlight-edp 
 ec2705d0    backlight  [   ]   pwm_backlight              |-- backlight-dsi0 
 ec270680    backlight  [   ]   pwm_backlight              |-- backlight-dsi1 
 ec270730    regulator  [ + ]   fixed regulator            |-- vcc12v-dcin 
 ec270860    regulator  [ + ]   fixed regulator            |-- vcc5v0-sys 
 ec270990    regulator  [ + ]   fixed regulator            |-- vcc5v0-usbdcin 
 ec270ac0    regulator  [ + ]   fixed regulator            |-- vcc5v0-usb 
 ec270bf0    regulator  [ + ]   fixed regulator            |-- vcc3v3-lcd-edp 
 ec270d60    panel      [   ]   rockchip_panel             |-- panel-edp 
 ec270e50    regulator  [ + ]   fixed regulator            |-- pcie20-avdd0v85 
 ec270f80    regulator  [ + ]   fixed regulator            |-- pcie20-avdd1v8 
 ec2710b0    regulator  [ + ]   fixed regulator            |-- pcie30-avdd0v75 
 ec2711e0    regulator  [ + ]   fixed regulator            |-- pcie30-avdd1v8 
 ec271310    regulator  [ + ]   fixed regulator            |-- vcc-1v1-nldo-s3 
 ec271440    regulator  [ + ]   fixed regulator            |-- vcc3v3-lcd-dsi0 
 ec271570    regulator  [ + ]   fixed regulator            |-- vcc3v3-lcd-dsi1 
 ec2716a0    regulator  [ + ]   fixed regulator            |-- vcc3v3-pcie30 
 ec2717d0    regulator  [ + ]   fixed regulator            |-- vcc5v0-host 
 ec271900    regulator  [ + ]   fixed regulator            |-- vcc5v0-peripherals 
 ec271a30    regulator  [ + ]   fixed regulator            |-- vcc-3v3-sd-s0-regulator 
 ec271b60    regulator  [ + ]   fixed regulator            |-- vcc-3v3-lt8668-s0-regulator 
 ec271c90    regulator  [ + ]   fixed regulator            |-- vbus5v0-typec 
 ec271dc0    regulator  [ + ]   fixed regulator            `-- vcc3v3-lcd 
=> 

```


