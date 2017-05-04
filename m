From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 10/10] ARM: dts: sun8i: Add board dts
 file for Banana Pi M2 Ultra
Date: Thu, 4 May 2017 16:39:50 +0200
Message-ID: <20170504143950.xqx2st42xtgl5nsq@lukather>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-11-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bswfwok7jnut67sp"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBN72VTEAKGQEHCILJ4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170504135006.16483-11-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--bswfwok7jnut67sp
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, May 04, 2017 at 09:50:06PM +0800, Icenowy Zheng wrote:
> From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> 
> The Banana Pi M2 Ultra is an SBC based on the Allwinner R40 SoC. The
> form factor and position of various connectors, leds and buttons is
> similar to the Banana Pi M1+, Banana Pi M3, and is exactly the same
> as the latest Banana Pi M64.
> 
> It features:
> 
>   - X-Powers AXP221s PMIC connected to i2c0
>   - 2 GB DDR3 DRAM
>   - 8 GB eMMC
>   - micro SD card slot
>   - DC power jack
>   - HDMI output
>   - MIPI DSI connector
>   - 2x USB 2.0 hosts
>   - 1x USB 2.0 OTG
>   - gigabit ethernet with Realtek RTL8211E transceiver
>   - WiFi/Bluetooth with AP6212 chip, with external antenna connector
>   - SATA and power connectors for native SATA support
>   - camera sensor connector
>   - consumer IR receiver
>   - audio out headphone jack
>   - onboard microphone
>   - red, green, and blue LEDs
>   - debug UART pins
>   - Li-Po battery connector
>   - Raspberry Pi B+ compatible GPIO header
>   - power, reset, and boot control buttons
> 
> This patch adds a dts file that enables debug UART and MMC support.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                        |   1 +
>  arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 161 ++++++++++++++++++++++
>  2 files changed, 162 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 9c5e1d944d1c..07a662494eed 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -905,6 +905,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-h3-orangepi-plus.dtb \
>  	sun8i-h3-orangepi-plus2e.dtb \
>  	sun8i-r16-parrot.dtb \
> +	sun8i-r40-bananapi-m2-ultra.dtb \
>  	sun8i-v3s-licheepi-zero.dtb
>  dtb-$(CONFIG_MACH_SUN9I) += \
>  	sun9i-a80-optimus.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> new file mode 100644
> index 000000000000..1d824830a1ad
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> @@ -0,0 +1,161 @@
> +/*
> + * Copyright (C) 2017 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> + * Copyright (C) 2017 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include "sun8i-r40.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +/ {
> +	model = "Banana Pi BPI-M2-Ultra";
> +	compatible = "sinovoip,bpi-m2-ultra", "allwinner,sun8i-r40";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	wifi_pwrseq: wifi_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&pio 6 10 GPIO_ACTIVE_LOW>; /* PG10 WIFI_EN */
> +	};
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	axp22x: pmic@68 {
> +		compatible = "x-powers,axp221";
> +		reg = <0x34>;
> +		interrupt-parent = <&nmi_intc>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +#include "axp22x.dtsi"
> +
> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <2700000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "avcc";
> +};
> +
> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-name = "vcc-3v0";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1000000>;
> +	regulator-max-microvolt = <1300000>;
> +	regulator-name = "vdd-cpu";
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1000000>;
> +	regulator-max-microvolt = <1300000>;
> +	regulator-name = "vdd-sys";
> +};
> +
> +&reg_dcdc5 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1500000>;
> +	regulator-max-microvolt = <1500000>;
> +	regulator-name = "vcc-dram";
> +};
> +
> +&reg_dldo1 {
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-wifi-io";
> +};
> +
> +&reg_dldo2 {
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-wifi";
> +};
> +
> +&mmc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins>;

If there is multiple options, then it should be suffixed. If there's
only a single option, then it should be set in the DTSI. Either way,
this is wrong.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--bswfwok7jnut67sp--
