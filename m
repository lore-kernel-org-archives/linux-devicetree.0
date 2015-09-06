From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun4i: Add dts file for the pov
 protab2-ips9 tablet
Date: Sun, 6 Sep 2015 18:30:23 +0200
Message-ID: <20150906163023.GR31584@lukather>
References: <1441441319-10658-1-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cYG5ZC/RuVsIq1ir"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBCOVWGXQKGQE6ECMZLA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441441319-10658-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--cYG5ZC/RuVsIq1ir
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Sep 05, 2015 at 10:21:59AM +0200, Hans de Goede wrote:
> The Point of View protab2-ips9 is a tablet with a 9" ips 1024x768 lcd screen,
> microsd slot, headphones, mini hdmi, mini usb b and power barrel connectors.
> 
> It uses a rtl8188cus usb wifi chip and a RDA 5875Y bluetooth chip attached
> to uart2. It has a bma250 accelerometer attached to i2c1 addr 0x18.
> 
> It has a pixcir,pixcir_tangoc compatible touchscreen attached to i2c2 addr
> 0x5c. This is not enabled in this dts, because this variant of the
> pixcir_tangoc has separate wakeup and enable pins both of which need
> to be driven low before the touchscreen will work. Before we can enable
> this the pixcir driver and devicetree-bindings need to be extended to
> support these pins.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                       |   3 +-
>  arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts | 209 +++++++++++++++++++++++
>  2 files changed, 211 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index e981fd6..c08883c 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -561,7 +561,8 @@ dtb-$(CONFIG_MACH_SUN4I) += \
>  	sun4i-a10-mk802.dtb \
>  	sun4i-a10-mk802ii.dtb \
>  	sun4i-a10-olinuxino-lime.dtb \
> -	sun4i-a10-pcduino.dtb
> +	sun4i-a10-pcduino.dtb \
> +	sun4i-a10-pov-protab2-ips9.dtb
>  dtb-$(CONFIG_MACH_SUN5I) += \
>  	sun5i-a10s-auxtek-t003.dtb \
>  	sun5i-a10s-auxtek-t004.dtb \
> diff --git a/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts b/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
> new file mode 100644
> index 0000000..223515e
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
> @@ -0,0 +1,209 @@
> +/*
> + * Copyright 2015 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
> +#include "sun4i-a10.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	model = "Point of View Protab2-IPS9";
> +	compatible = "pov,protab2-ips9", "allwinner,sun4i-a10";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins_a>;
> +	status = "okay";
> +
> +	axp209: pmic@34 {
> +		reg = <0x34>;
> +		interrupts = <0>;
> +	};
> +};
> +
> +#include "axp209.dtsi"
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins_a>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins_a>;
> +	status = "okay";
> +};
> +
> +&lradc {
> +	vref-supply = <&reg_ldo2>;
> +	status = "okay";
> +
> +	button@400 {
> +		label = "Volume Up";
> +		linux,code = <KEY_VOLUMEUP>;
> +		channel = <0>;
> +		voltage = <400000>;
> +	};
> +
> +	button@800 {
> +		label = "Volume Down";
> +		linux,code = <KEY_VOLUMEDOWN>;
> +		channel = <0>;
> +		voltage = <800000>;
> +	};
> +};
> +
> +&mmc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_reference_design>;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	bus-width = <4>;
> +	cd-gpios = <&pio 7 1 GPIO_ACTIVE_HIGH>; /* PH1 */
> +	cd-inverted;
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
> +	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
> +		allwinner,pins = "PH5";
> +		allwinner,function = "gpio_in";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
> +	};
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
> +	regulator-min-microvolt = <1250000>;
> +	regulator-max-microvolt = <1250000>;
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
> +&reg_ldo3 {
> +	/*
> +	 * We need to always power the camera sensor, otherwhise all access
> +	 * to i2c1 is blocked.
> +	 */
> +	regulator-always-on;
> +	regulator-min-microvolt = <2800000>;
> +	regulator-max-microvolt = <2800000>;
> +	regulator-name = "vdd-csi";
> +};

What is connected on i2c1 ? Just the camera sensor? or it has some
other devices there?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--cYG5ZC/RuVsIq1ir--
