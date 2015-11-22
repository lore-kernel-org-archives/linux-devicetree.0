From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add dts file for the
 lamobo-r1 board
Date: Sun, 22 Nov 2015 20:59:25 +0100
Message-ID: <20151122195925.GR32142@lukather>
References: <1448046713-13579-1-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lh55S0yADJsuIVGW"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBH55ZCZAKGQECFT2EMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448046713-13579-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--lh55S0yADJsuIVGW
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Fri, Nov 20, 2015 at 08:11:53PM +0100, Hans de Goede wrote:
> From: Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
> 
> The lamobo-r1 board, sometimes called the BPI-R1 but not labelled as such
> on the PCB, is meant as a A20 based router board. As such the board comes
> with a built-in switch chip giving it 5 gigabit ethernet boards, and it
> has a large empty area on the pcb with mounting holes which will fit a
> 2.5 inch harddisk. To complete its networking features it has a
> Realtek RTL8192CU for WiFi 802.11 b/g/n.
> 
> Signed-off-by: Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                |   1 +
>  arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts | 297 ++++++++++++++++++++++++++++++
>  2 files changed, 298 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 28b0403..7572c29 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -639,6 +639,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
>  	sun7i-a20-hummingbird.dtb \
>  	sun7i-a20-i12-tvbox.dtb \
>  	sun7i-a20-icnova-swac.dtb \
> +	sun7i-a20-lamobo-r1.dtb \
>  	sun7i-a20-m3.dtb \
>  	sun7i-a20-mk808c.dtb \
>  	sun7i-a20-olimex-som-evb.dtb \
> diff --git a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
> new file mode 100644
> index 0000000..975b0b2
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
> @@ -0,0 +1,297 @@
> +/*
> + * Copyright 2015 Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
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
> +#include "sun7i-a20.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	model = "Lamobo R1";
> +	compatible = "lamobo,lamobo-r1", "allwinner,sun7i-a20";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart3;
> +		serial2 = &uart7;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&led_pins_lamobo_r1>;
> +
> +		green {
> +			label = "lamobo_r1:green:usr";
> +			gpios = <&pio 7 24 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	reg_gmac_3v3: gmac-3v3 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gmac_power_pin_lamobo_r1>;
> +		regulator-name = "gmac-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		startup-delay-us = <100000>;
> +		enable-active-high;
> +		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
> +	};
> +};
> +
> +&ahci_pwr_pin_a {
> +	allwinner,pins = "PB3";
> +};
> +
> +&ahci {
> +	target-supply = <&reg_ahci_5v>;
> +	status = "okay";
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc2>;
> +	operating-points = <
> +		/* kHz	  uV */
> +		960000	1400000
> +		912000	1400000
> +		864000	1350000
> +		720000	1250000
> +		528000	1150000
> +		312000	1100000
> +		144000	1050000
> +		>;

Why are you using a custom set of OPPs here, the default ones were
unstable?

> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&gmac {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac_pins_rgmii_a>;
> +	phy = <&phy1>;
> +	phy-mode = "rgmii";
> +	phy-supply = <&reg_gmac_3v3>;
> +	status = "okay";
> +
> +	phy1: ethernet-phy@1 {
> +		reg = <1>;
> +	};
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins_a>;
> +	status = "okay";
> +
> +	axp209: pmic@34 {
> +		reg = <0x34>;
> +		interrupt-parent = <&nmi_intc>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins_a>;
> +	status = "okay";
> +};

What is connected on i2c2? Is i2c1 used at all? Would it make sense to
add aliases for the i2c buses as well?

> +&ir0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ir0_rx_pins_a>;
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_lamobo_r1>;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	bus-width = <4>;
> +	cd-gpios = <&pio 7 10 GPIO_ACTIVE_HIGH>; /* PH10 */
> +	cd-inverted;
> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&ohci1 {
> +	status = "okay";
> +};
> +
> +&otg_sram {
> +	status = "okay";
> +};
> +
> +&pio {
> +	usb0_id_detect_pin: usb0_id_detect_pin@0 {
> +		allwinner,pins = "PH4";
> +		allwinner,function = "gpio_in";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
> +	};
> +
> +	mmc0_cd_pin_lamobo_r1: mmc0_cd_pin@0 {
> +		allwinner,pins = "PH10";
> +		allwinner,function = "gpio_in";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
> +	};
> +
> +	gmac_power_pin_lamobo_r1: gmac_power_pin@0 {
> +		allwinner,pins = "PH23";
> +		allwinner,function = "gpio_out";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +
> +	led_pins_lamobo_r1: led_pins@0 {
> +		allwinner,pins = "PH24";
> +		allwinner,function = "gpio_out";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +};
> +
> +#include "axp209.dtsi"
> +
> +&reg_ahci_5v {
> +	gpio = <&pio 1 3 0>; /* PB3 */
> +	status = "okay";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1000000>;
> +	regulator-max-microvolt = <1400000>;
> +	regulator-name = "vdd-cpu";
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1000000>;
> +	regulator-max-microvolt = <1400000>;
> +	regulator-name = "vdd-int-dll";
> +};
> +
> +&reg_ldo1 {
> +	regulator-name = "vdd-rtc";
> +};
> +
> +&reg_ldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-name = "avcc";
> +};
> +
> +&reg_usb0_vbus {
> +	status = "okay";
> +};
> +
> +&reg_usb1_vbus {
> +	status = "okay";
> +};
> +
> +&reg_usb2_vbus {
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pins_a>,
> +		    <&spi0_cs0_pins_a>,
> +		    <&spi0_cs1_pins_a>;
> +	status = "okay";
> +};

I guess the same question about i2c also applies for SPI :)

Looks good otherwise, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--lh55S0yADJsuIVGW--
