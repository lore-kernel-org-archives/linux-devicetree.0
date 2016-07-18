From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] arm64: dts: rockchip: Add basic support for orion-r68
Date: Mon, 18 Jul 2016 18:24:11 +0200
Message-ID: <56da15b4-cb95-2bcf-ab62-bb4b74a48889@gmail.com>
References: <1468577391-5096-1-git-send-email-matthias.bgg@gmail.com>
 <24940135-f3a9-547f-641b-29cd6b17b663@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <24940135-f3a9-547f-641b-29cd6b17b663-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, mbrugger-IBi9RG/b67k@public.gmane.org, chauveau.julien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 07/18/2016 03:13 AM, Shawn Lin wrote:
> =D4=DA 2016/7/15 18:09, Matthias Brugger =D0=B4=B5=C0:
>> This patch adds basic support for the Tronsmart orion r86 set-top-bo=
x.
>>
>> Signed-off-by: Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>
>> ---
>> Changes since v2:
>> - gpio-keys cleanpup
>> - set sdmmc properties correctly
>
> It seems there are two "cap-mmc-highspeed;" for emmc.
>

True, I will fix it in the next version.

Thanks,
Matthias

>>
>>  Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
>>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>>  .../boot/dts/rockchip/rk3368-orion-r68-meta.dts    | 385
>> +++++++++++++++++++++
>>  3 files changed, 390 insertions(+)
>>  create mode 100644
>> arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
>>
>> diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt
>> b/Documentation/devicetree/bindings/arm/rockchip.txt
>> index 715d960..1d5c65e0 100644
>> --- a/Documentation/devicetree/bindings/arm/rockchip.txt
>> +++ b/Documentation/devicetree/bindings/arm/rockchip.txt
>> @@ -110,3 +110,7 @@ Rockchip platforms device tree bindings
>>  - Rockchip RK3399 evb:
>>      Required root node properties:
>>        - compatible =3D "rockchip,rk3399-evb", "rockchip,rk3399";
>> +
>> +- Tronsmart Orion R68 Meta
>> +    Required root node properties:
>> +      - compatible =3D "tronsmart,orion-r68-meta", "rockchip,rk3368=
";
>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
>> b/arch/arm64/boot/dts/rockchip/Makefile
>> index 7037a16..87669f6 100644
>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>> @@ -1,5 +1,6 @@
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-evb-act8846.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-geekbox.dtb
>> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-orion-r68-meta.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-r88.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-evb.dtb
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
>> b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
>> new file mode 100644
>> index 0000000..d5e1af5
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
>> @@ -0,0 +1,385 @@
>> +/*
>> + * Copyright (c) 2016 Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>
>> + *
>> + * This file is dual-licensed: you can use it either under the term=
s
>> + * of the GPL or the X11 license, at your option. Note that this du=
al
>> + * licensing only applies to this file, and not this project as a
>> + * whole.
>> + *
>> + *  a) This file is free software; you can redistribute it and/or
>> + *     modify it under the terms of the GNU General Public License =
as
>> + *     published by the Free Software Foundation; either version 2 =
of
>> the
>> + *     License, or (at your option) any later version.
>> + *
>> + *     This file is distributed in the hope that it will be useful,
>> + *     but WITHOUT ANY WARRANTY; without even the implied warranty =
of
>> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See th=
e
>> + *     GNU General Public License for more details.
>> + *
>> + * Or, alternatively,
>> + *
>> + *  b) Permission is hereby granted, free of charge, to any person
>> + *     obtaining a copy of this software and associated documentati=
on
>> + *     files (the "Software"), to deal in the Software without
>> + *     restriction, including without limitation the rights to use,
>> + *     copy, modify, merge, publish, distribute, sublicense, and/or
>> + *     sell copies of the Software, and to permit persons to whom t=
he
>> + *     Software is furnished to do so, subject to the following
>> + *     conditions:
>> + *
>> + *     The above copyright notice and this permission notice shall =
be
>> + *     included in all copies or substantial portions of the Softwa=
re.
>> + *
>> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KI=
ND,
>> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANT=
IES
>> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE O=
R
>> + *     OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/input/input.h>
>> +#include "rk3368.dtsi"
>> +
>> +/ {
>> +    model =3D "Rockchip Orion R68";
>> +    compatible =3D "tronsmart,orion-r68-meta", "rockchip,rk3368";
>> +
>> +    chosen {
>> +        stdout-path =3D "serial2:115200n8";
>> +    };
>> +
>> +    memory {
>> +        device_type =3D "memory";
>> +        reg =3D <0x0 0x0 0x0 0x80000000>;
>> +    };
>> +
>> +    emmc_pwrseq: emmc-pwrseq {
>> +        compatible =3D "mmc-pwrseq-emmc";
>> +        pinctrl-0 =3D <&emmc_reset>;
>> +        pinctrl-names =3D "default";
>> +        reset-gpios =3D <&gpio2 3 GPIO_ACTIVE_HIGH>;
>> +    };
>> +
>> +    ext_gmac: external-gmac-clock {
>> +        compatible =3D "fixed-clock";
>> +        #clock-cells =3D <0>;
>> +        clock-frequency =3D <125000000>;
>> +        clock-output-names =3D "ext_gmac";
>> +    };
>> +
>> +    keys: gpio-keys {
>> +        compatible =3D "gpio-keys";
>> +        pinctrl-names =3D "default";
>> +        pinctrl-0 =3D <&pwr_key>;
>> +
>> +        power {
>> +            wakeup-source;
>> +            gpios =3D <&gpio0 5 GPIO_ACTIVE_HIGH>;
>> +            label =3D "GPIO Power";
>> +            linux,code =3D <KEY_POWER>;
>> +        };
>> +    };
>> +
>> +    leds: gpio-leds {
>> +        compatible =3D "gpio-leds";
>> +
>> +        red {
>> +            gpios =3D <&gpio3 29 GPIO_ACTIVE_HIGH>;
>> +            label =3D "orion:red:led";
>> +            pinctrl-names =3D "default";
>> +            pinctrl-0 =3D <&led_ctl>;
>> +            default-state =3D "on";
>> +        };
>> +
>> +        blue {
>> +            gpios =3D <&gpio0 12 GPIO_ACTIVE_HIGH>;
>> +            label =3D "orion:blue:led";
>> +            pinctrl-names =3D "default";
>> +            pinctrl-0 =3D <&stby_pwren>;
>> +            default-state =3D "off";
>> +        };
>> +    };
>> +
>> +    vcc_18: vcc18-regulator {
>> +        compatible =3D "regulator-fixed";
>> +        regulator-name =3D "vcc_18";
>> +        regulator-min-microvolt =3D <1800000>;
>> +        regulator-max-microvolt =3D <1800000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        vin-supply =3D <&vcc_sys>;
>> +    };
>> +
>> +    /* supplies both host and otg */
>> +    vcc_host: vcc-host-regulator {
>> +        compatible =3D "regulator-fixed";
>> +        gpio =3D <&gpio0 4 GPIO_ACTIVE_LOW>;
>> +        pinctrl-names =3D "default";
>> +        pinctrl-0 =3D <&host_vbus_drv>;
>> +        regulator-name =3D "vcc_host";
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        vin-supply =3D <&vcc_sys>;
>> +    };
>> +
>> +    vccio_sd: vcc-io-sd-regulator {
>> +        compatible =3D "regulator-fixed";
>> +        regulator-name=3D "vccio_sd";
>> +        regulator-min-microvolt =3D <1800000>;
>> +        regulator-max-microvolt =3D <3300000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        vin-supply =3D <&vcc_io>;
>> +    };
>> +
>> +    vcc_sd: vcc-sd-regulator {
>> +        compatible =3D "regulator-fixed";
>> +        regulator-name =3D "vcc_sd";
>> +        gpio =3D <&gpio3 11 GPIO_ACTIVE_LOW>;
>> +        regulator-min-microvolt =3D <1800000>;
>> +        regulator-max-microvolt =3D <3300000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        vin-supply =3D <&vcc_io>;
>> +    };
>> +
>> +    vcc_io: vcc-io-regulator {
>> +        compatible =3D "regulator-fixed";
>> +        regulator-name =3D "vcc_io";
>> +        regulator-min-microvolt =3D <3300000>;
>> +        regulator-max-microvolt =3D <3300000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        vin-supply =3D <&vcc_sys>;
>> +    };
>> +
>> +    vcc_lan: vcc-lan-regulator {
>> +        compatible =3D "regulator-fixed";
>> +        regulator-name =3D "vcc_lan";
>> +        regulator-min-microvolt =3D <3300000>;
>> +        regulator-max-microvolt =3D <3300000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        vin-supply =3D <&vcc_io>;
>> +    };
>> +
>> +    vcc_sys: vcc-sys-regulator {
>> +        compatible =3D "regulator-fixed";
>> +        regulator-name =3D "vcc_sys";
>> +        regulator-min-microvolt =3D <5000000>;
>> +        regulator-max-microvolt =3D <5000000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +    };
>> +
>> +    vccio_wl: vccio-wl-regulator {
>> +        compatible =3D "regulator-fixed";
>> +        regulator-name =3D "vccio_wl";
>> +        regulator-min-microvolt =3D <3300000>;
>> +        regulator-max-microvolt =3D <3300000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        vin-supply =3D <&vcc_io>;
>> +    };
>> +
>> +    vdd_10: vdd-10-regulator {
>> +        compatible =3D "regulator-fixed";
>> +        regulator-name =3D "vdd_10";
>> +        regulator-min-microvolt =3D <1000000>;
>> +        regulator-max-microvolt =3D <1000000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        vin-supply =3D <&vcc_sys>;
>> +    };
>> +};
>> +
>> +&emmc {
>> +    bus-width =3D <8>;
>> +    cap-mmc-highspeed;
>> +    disable-wp;
>> +    mmc-pwrseq =3D <&emmc_pwrseq>;
>> +    non-removable;
>> +    num-slots =3D <1>;
>> +    pinctrl-names =3D "default";
>> +    pinctrl-0 =3D <&emmc_clk &emmc_cmd &emmc_bus8>;
>> +    keep-power-in-suspend;
>> +    cap-mmc-highspeed;
>> +    mmc-hs200-1_2v;
>> +    mmc-hs200-1_8v;
>> +    status =3D "okay";
>> +};
>> +
>> +&gmac {
>> +    assigned-clocks =3D <&cru SCLK_MAC>;
>> +    assigned-clock-parents =3D <&ext_gmac>;
>> +    phy-supply =3D <&vcc_lan>;
>> +    phy-mode =3D "rgmii";
>> +    clock_in_out =3D "input";
>> +    snps,reset-gpio =3D <&gpio3 12 0>;
>> +    snps,reset-active-low;
>> +    snps,reset-delays-us =3D <0 10000 1000000>;
>> +    pinctrl-names =3D "default";
>> +    pinctrl-0 =3D <&rgmii_pins>;
>> +    tx_delay =3D <0x30>;
>> +    rx_delay =3D <0x10>;
>> +    status =3D "ok";
>> +};
>> +
>> +&i2c0 {
>> +    status =3D "okay";
>> +
>> +    vdd_cpu: syr827@40 {
>> +        compatible =3D "silergy,syr827";
>> +        reg =3D <0x40>;
>> +        fcs,suspend-voltage-selector =3D <1>;
>> +        regulator-name =3D "vdd_cpu";
>> +        regulator-enable-ramp-delay =3D <300>;
>> +        regulator-min-microvolt =3D <712500>;
>> +        regulator-max-microvolt =3D <1500000>;
>> +        regulator-ramp-delay =3D <8000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        vin-supply =3D <&vcc_sys>;
>> +    };
>> +
>> +    hym8563: hym8563@51 {
>> +        compatible =3D "haoyu,hym8563";
>> +        reg =3D <0x51>;
>> +        #clock-cells =3D <0>;
>> +        clock-frequency =3D <32768>;
>> +        clock-output-names =3D "xin32k";
>> +        /* rtc_int is not connected */
>> +    };
>> +};
>> +
>> +&pinctrl {
>> +    pcfg_pull_none_drv_8ma: pcfg-pull-none-drv-8ma {
>> +        bias-disable;
>> +        drive-strength =3D <8>;
>> +    };
>> +
>> +    pcfg_pull_up_drv_8ma: pcfg-pull-up-drv-8ma {
>> +        bias-pull-up;
>> +        drive-strength =3D <8>;
>> +    };
>> +
>> +    emmc {
>> +        emmc_bus8: emmc-bus8 {
>> +            rockchip,pins =3D <1 18 RK_FUNC_2 &pcfg_pull_up_drv_8ma=
>,
>> +                    <1 19 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
>> +                    <1 20 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
>> +                    <1 21 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
>> +                    <1 22 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
>> +                    <1 23 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
>> +                    <1 24 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
>> +                    <1 25 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
>> +        };
>> +
>> +        emmc-clk {
>> +            rockchip,pins =3D <2 4 RK_FUNC_2 &pcfg_pull_none_drv_8m=
a>;
>> +        };
>> +
>> +        emmc-cmd {
>> +            rockchip,pins =3D <1 26 RK_FUNC_2 &pcfg_pull_up_drv_8ma=
>;
>> +        };
>> +
>> +        emmc_reset: emmc-reset {
>> +            rockchip,pins =3D <2 3 RK_FUNC_GPIO &pcfg_pull_none>;
>> +        };
>> +    };
>> +
>> +    keys {
>> +        pwr_key: pwr-key {
>> +            rockchip,pins =3D <0 5 RK_FUNC_GPIO &pcfg_pull_down>;
>> +        };
>> +    };
>> +
>> +    leds {
>> +        stby_pwren: stby-pwren {
>> +            rockchip,pins =3D <0 12 RK_FUNC_GPIO &pcfg_pull_none>;
>> +        };
>> +
>> +        led_ctl: led-ctl {
>> +            rockchip,pins =3D <3 29 RK_FUNC_GPIO &pcfg_pull_none>;
>> +        };
>> +    };
>> +
>> +    sdmmc {
>> +        sdmmc_clk: sdmmc-clk {
>> +            rockchip,pins =3D <2 9 RK_FUNC_1 &pcfg_pull_none_drv_8m=
a>;
>> +        };
>> +
>> +        sdmmc_cmd: sdmmc-cmd {
>> +            rockchip,pins =3D <2 10 RK_FUNC_1 &pcfg_pull_up_drv_8ma=
>;
>> +        };
>> +
>> +        sdmmc_cd: sdmmc-cd {
>> +            rockchip,pins =3D <2 11 RK_FUNC_1 &pcfg_pull_up_drv_8ma=
>;
>> +        };
>> +
>> +        sdmmc_bus1: sdmmc-bus1 {
>> +            rockchip,pins =3D <2 5 RK_FUNC_1 &pcfg_pull_up_drv_8ma>=
;
>> +        };
>> +
>> +        sdmmc_bus4: sdmmc-bus4 {
>> +            rockchip,pins =3D <2 5 RK_FUNC_1 &pcfg_pull_up_drv_8ma>=
,
>> +                    <2 6 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
>> +                    <2 7 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
>> +                    <2 8 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
>> +        };
>> +    };
>> +
>> +    usb {
>> +        host_vbus_drv: host-vbus-drv {
>> +            rockchip,pins =3D <0 4 RK_FUNC_GPIO &pcfg_pull_none>;
>> +        };
>> +    };
>> +};
>> +
>> +&saradc {
>> +    vref-supply =3D <&vcc_18>;
>> +    status =3D "okay";
>> +};
>> +
>> +&sdmmc {
>> +    clock-frequency =3D <50000000>;
>> +    clock-freq-min-max =3D <400000 50000000>;
>> +    cap-sd-highspeed;
>> +    card-detect-delay =3D <200>;
>> +
>> +    pinctrl-names =3D "default";
>> +    pinctrl-0 =3D <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
>> +    bus-width =3D <4>;
>> +    num-slots =3D <1>;
>> +    keep-power-in-suspend;
>> +
>> +    vmmc-supply =3D <&vcc_sd>;
>> +    vqmmc-supply =3D <&vccio_sd>;
>> +    status =3D "okay";
>> +};
>> +
>> +&uart2 {
>> +    status =3D "okay";
>> +};
>> +
>> +&uart4 {
>> +    status =3D "okay";
>> +    pinctrl-names =3D "default";
>> +    pinctrl-0 =3D <&uart4_xfer>;
>> +};
>> +
>> +&usb_host0_ehci {
>> +    status =3D "okay";
>> +};
>> +
>> +&usb_otg {
>> +    status =3D "okay";
>> +};
>> +
>> +&wdt {
>> +    status =3D "okay";
>> +};
>>
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
