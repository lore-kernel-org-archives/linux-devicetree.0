From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add basic support for orion-r68
Date: Fri, 15 Jul 2016 09:00:13 +0800
Message-ID: <b6aa3694-1126-3152-5e1f-72368813fdf6@rock-chips.com>
References: <1468499302-16508-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468499302-16508-1-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, heiko@sntech.de, catalin.marinas@arm.com, will.deacon@arm.com
Cc: shawn.lin@rock-chips.com, devicetree@vger.kernel.org, mbrugger@suse.com, amstan@chromium.org, linux-rockchip@lists.infradead.org, chauveau.julien@gmail.com, briannorris@chromium.org, dianders@chromium.org, linux-kernel@vger.kernel.org, edubezval@gmail.com, olof@lixom.net, sudeep.holla@arm.com, zyw@rock-chips.com, romain.perier@gmail.com, jay.xu@rock-chips.com, afaerber@suse.de, linux-arm-kernel@lists.infradead.org, wxt@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Matthias,

Just some comment for mmc stuff. :)

=E5=9C=A8 2016/7/14 20:28, Matthias Brugger =E5=86=99=E9=81=93:
> This patch adds basic support for the Tronsmart orion r86 set-top-box=
=2E
>
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
> Changes since v1:
> - change memory node to 2GB
> - change compatible and file name
> - add uart4
> - add second led
>
>  Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  .../boot/dts/rockchip/rk3368-orion-r68-meta.dts    | 382 +++++++++++=
++++++++++
>  3 files changed, 387 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-orion-r68-met=
a.dts
>
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt b/Doc=
umentation/devicetree/bindings/arm/rockchip.txt
> index 715d960..1d5c65e0 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.txt
> +++ b/Documentation/devicetree/bindings/arm/rockchip.txt
> @@ -110,3 +110,7 @@ Rockchip platforms device tree bindings
>  - Rockchip RK3399 evb:
>      Required root node properties:
>        - compatible =3D "rockchip,rk3399-evb", "rockchip,rk3399";
> +
> +- Tronsmart Orion R68 Meta
> +    Required root node properties:
> +      - compatible =3D "tronsmart,orion-r68-meta", "rockchip,rk3368"=
;
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/=
dts/rockchip/Makefile
> index 7037a16..87669f6 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -1,5 +1,6 @@
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-evb-act8846.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-geekbox.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-orion-r68-meta.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-r88.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-evb.dtb
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts b=
/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
> new file mode 100644
> index 0000000..8c8671f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
> @@ -0,0 +1,382 @@
> +/*
> + * Copyright (c) 2016 Matthias Brugger <mbrugger@suse.com>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dua=
l
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License a=
s
> + *     published by the Free Software Foundation; either version 2 o=
f the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty o=
f
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentatio=
n
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom th=
e
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall b=
e
> + *     included in all copies or substantial portions of the Softwar=
e.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIN=
D,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTI=
ES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include "rk3368.dtsi"
> +
> +/ {
> +	model =3D "Rockchip Orion R68";
> +	compatible =3D "tronsmart,orion-r68-meta", "rockchip,rk3368";
> +
> +	chosen {
> +		stdout-path =3D "serial2:115200n8";
> +	};
> +
> +	memory {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x0 0x0 0x80000000>;
> +	};
> +
> +	emmc_pwrseq: emmc-pwrseq {
> +		compatible =3D "mmc-pwrseq-emmc";
> +		pinctrl-0 =3D <&emmc_reset>;
> +		pinctrl-names =3D "default";
> +		reset-gpios =3D <&gpio2 3 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	ext_gmac: external-gmac-clock {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "ext_gmac";
> +	};
> +
> +	keys: gpio-keys {
> +		compatible =3D "gpio-keys";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pwr_key>;
> +
> +		button@0 {
> +			gpio-key,wakeup =3D <1>;
> +			gpios =3D <&gpio0 5 GPIO_ACTIVE_HIGH>;
> +			label =3D "GPIO Power";
> +			linux,code =3D <116>;
> +		};
> +	};
> +
> +	leds: gpio-leds {
> +		compatible =3D "gpio-leds";
> +
> +		red {
> +			gpios =3D <&gpio3 29 GPIO_ACTIVE_HIGH>;
> +			label =3D "orion:red:led";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&led_ctl>;
> +			default-state =3D "on";
> +		};
> +
> +		blue {
> +			gpios =3D <&gpio0 12 GPIO_ACTIVE_HIGH>;
> +			label =3D "orion:blue:led";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&stby_pwren>;
> +			default-state =3D "off";
> +		};
> +	};
> +
> +	vcc_18: vcc18-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_18";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply =3D <&vcc_sys>;
> +	};
> +
> +	/* supplies both host and otg */
> +	vcc_host: vcc-host-regulator {
> +		compatible =3D "regulator-fixed";
> +		gpio =3D <&gpio0 4 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&host_vbus_drv>;
> +		regulator-name =3D "vcc_host";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply =3D <&vcc_sys>;
> +	};
> +
> +	vccio_sd: vcc-io-sd-regulator {
> +		regulator-name=3D "vccio_sd";
> +		gpio =3D <&gpio0 9 GPIO_ACTIVE_LOW>;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;

so, I guess your r68 board won't support sd 3.0?

> +	};
> +
> +	vcc_sd: vcc-sd-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_sd";
> +		gpio =3D <&gpio3 11 GPIO_ACTIVE_LOW>;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply =3D <&vcc_io>;
> +	};
> +
> +	vcc_io: vcc-io-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_io";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply =3D <&vcc_sys>;
> +	};
> +
> +	vcc_lan: vcc-lan-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_lan";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply =3D <&vcc_io>;
> +	};
> +
> +	vcc_sys: vcc-sys-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_sys";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vccio_wl: vccio-wl-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vccio_wl";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply =3D <&vcc_io>;
> +	};
> +
> +	vdd_10: vdd-10-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vdd_10";
> +		regulator-min-microvolt =3D <1000000>;
> +		regulator-max-microvolt =3D <1000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply =3D <&vcc_sys>;
> +	};
> +};
> +
> +&emmc {
> +	bus-width =3D <8>;
> +	cap-mmc-highspeed;
> +	disable-wp;
> +	mmc-pwrseq =3D <&emmc_pwrseq>;
> +	non-removable;
> +	num-slots =3D <1>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&emmc_clk &emmc_cmd &emmc_bus8>;
> +	status =3D "okay";
> +};
> +
> +&gmac {
> +	assigned-clocks =3D <&cru SCLK_MAC>;
> +	assigned-clock-parents =3D <&ext_gmac>;
> +	phy-supply =3D <&vcc_lan>;
> +	phy-mode =3D "rgmii";
> +	clock_in_out =3D "input";
> +	snps,reset-gpio =3D <&gpio3 12 0>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us =3D <0 10000 1000000>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&rgmii_pins>;
> +	tx_delay =3D <0x30>;
> +	rx_delay =3D <0x10>;
> +	status =3D "ok";
> +};
> +
> +&i2c0 {
> +	status =3D "okay";
> +
> +	vdd_cpu: syr827@40 {
> +		compatible =3D "silergy,syr827";
> +		reg =3D <0x40>;
> +		fcs,suspend-voltage-selector =3D <1>;
> +		regulator-name =3D "vdd_cpu";
> +		regulator-enable-ramp-delay =3D <300>;
> +		regulator-min-microvolt =3D <712500>;
> +		regulator-max-microvolt =3D <1500000>;
> +		regulator-ramp-delay =3D <8000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply =3D <&vcc_sys>;
> +	};
> +
> +	hym8563: hym8563@51 {
> +		compatible =3D "haoyu,hym8563";
> +		reg =3D <0x51>;
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <32768>;
> +		clock-output-names =3D "xin32k";
> +		/* rtc_int is not connected */
> +	};
> +};
> +
> +&pinctrl {
> +	pcfg_pull_none_drv_8ma: pcfg-pull-none-drv-8ma {
> +		bias-disable;
> +		drive-strength =3D <8>;
> +	};
> +
> +	pcfg_pull_up_drv_8ma: pcfg-pull-up-drv-8ma {
> +		bias-pull-up;
> +		drive-strength =3D <8>;
> +	};
> +
> +	emmc {
> +		emmc_bus8: emmc-bus8 {
> +			rockchip,pins =3D <1 18 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
> +					<1 19 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
> +					<1 20 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
> +					<1 21 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
> +					<1 22 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
> +					<1 23 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
> +					<1 24 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
> +					<1 25 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
> +		};
> +
> +		emmc-clk {
> +			rockchip,pins =3D <2 4 RK_FUNC_2 &pcfg_pull_none_drv_8ma>;
> +		};
> +
> +		emmc-cmd {
> +			rockchip,pins =3D <1 26 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
> +		};
> +
> +		emmc_reset: emmc-reset {
> +			rockchip,pins =3D <2 3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	keys {
> +		pwr_key: pwr-key {
> +			rockchip,pins =3D <0 5 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +	};
> +
> +	leds {
> +		stby_pwren: stby-pwren {
> +			rockchip,pins =3D <0 12 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		led_ctl: led-ctl {
> +			rockchip,pins =3D <3 29 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	sdmmc {
> +		sdmmc_clk: sdmmc-clk {
> +			rockchip,pins =3D <2 9 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
> +		};
> +
> +		sdmmc_cmd: sdmmc-cmd {
> +			rockchip,pins =3D <2 10 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
> +		};
> +
> +		sdmmc_cd: sdmmc-cd {
> +			rockchip,pins =3D <2 11 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
> +		};
> +
> +		sdmmc_bus1: sdmmc-bus1 {
> +			rockchip,pins =3D <2 5 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
> +		};
> +
> +		sdmmc_bus4: sdmmc-bus4 {
> +			rockchip,pins =3D <2 5 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
> +					<2 6 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
> +					<2 7 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
> +					<2 8 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
> +		};
> +	};
> +
> +	usb {
> +		host_vbus_drv: host-vbus-drv {
> +			rockchip,pins =3D <0 4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&saradc {
> +	vref-supply =3D <&vcc_18>;
> +	status =3D "okay";
> +};
> +
> +&sdmmc {
> +	clock-frequency =3D <50000000>;
> +	clock-freq-min-max =3D <400000 50000000>;
> +	cap-sd-highspeed;
> +	supports-sd;

This's not a upstream property.

> +	broken-cd;

sdmmc controller of rk3368 isn't broken. Could you remove it=EF=BC=9F


> +	card-detect-delay =3D <200>;
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
> +	bus-width =3D <4>;
> +	num-slots =3D <1>;
> +	ignore-pm-notify;

ignore-pm-notify is from AOSP but not upstream mmc. You should remove
it.

> +	keep-power-in-suspend;
> +
> +	vmmc-supply =3D <&vcc_sd>;
> +	vqmmc-supply =3D <&vccio_sd>;
> +	status =3D "okay";
> +};
> +
> +&uart2 {
> +	status =3D "okay";
> +};
> +
> +&uart4 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart4_xfer>;
> +};
> +
> +&usb_host0_ehci {
> +	status =3D "okay";
> +};
> +
> +&usb_otg {
> +	status =3D "okay";
> +};
> +
> +&wdt {
> +	status =3D "okay";
> +};
>


--=20
Best Regards
Shawn Lin
