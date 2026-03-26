# WIFI驱动

ap6398s


## dts


```text
    wireless-bluetooth {
        compatible = "bluetooth-platdata";
        clocks = <0x1f3>;
        clock-names = "ext_clock";
        uart_rts_gpios = <0xee 0x14 0x01>;
        pinctrl-names = "default\0rts_gpio";
        pinctrl-0 = <0x1f9 0x1fa 0x1fb 0x1fc>;
        pinctrl-1 = <0x1fd>;
        BT,reset_gpio = <0x15f 0x16 0x00>;
        BT,wake_gpio = <0x15f 0x15 0x00>;
        BT,wake_host_irq = <0x15f 0x00 0x00>;
        status = "okay";
        phandle = <0x4bc>;
    };

    wireless-wlan {
        compatible = "wlan-platdata";
        wifi_chip_type = "ap6398s";
        pinctrl-names = "default";
        pinctrl-0 = <0x1fe>;
        WIFI,host_wake_irq = <0x15f 0x0a 0x00>;        status = "okay";
        phandle = <0x4bd>;    };

```