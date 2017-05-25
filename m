From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: allwinner: a64: Add initial
 Orangepi Win/WinPlus support
Date: Thu, 25 May 2017 23:30:15 +0100
Message-ID: <5e932649-bab6-7f3e-7519-4d45d3eb8f20@arm.com>
References: <1495740382-9061-1-git-send-email-jteki@openedev.com>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBB5XTXEQKGQERNN7P6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1495740382-9061-1-git-send-email-jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 25/05/17 20:26, Jagan Teki wrote:
> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> 
> Orangepi Win/WinPlus is an open-source single-board computer
> using the Allwinner A64 SOC.
> 
> A64 Orangepi Win/WinPlus has
> - A64 Quad-core Cortex-A53 64bit
> - 1GB(Win)/2GB(Win Plus) DDR3 SDRAM
> - Debug TTL UART
> - Four USB 2.0

I take it those are connected to a hub chip, and the micro-USB socket is
connected as a true OTG socket?
So you should enable the usb_otg node, but without the host mode
override we use for the Pine64.

> - HDMI
> - LCD
> - Audio and MIC
> - Wifi + BT

It looks like Wifi + BT are soldered on the board, so you should at
least enable the proper UART connected to the Bluetooth chip, probably
also MMC1 (which is surely connected to the WiFi chip) should be
described as an SDIO node.

> - IR receiver
> - 5V DC power supply

I guess the board uses the AXP803 as well? You might want to coordinate
with Icenowy what to do to describe this as well, given that her patches
might go in before.

Cheers,
Andre.

> http://www.orangepi.org/OrangePiWin_WinPlus/
> 
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>  .../boot/dts/allwinner/sun50i-a64-orangepi-win.dts | 102 +++++++++++++++++++++
>  2 files changed, 103 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index 244e8b7..4120ce9 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -1,5 +1,6 @@
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-bananapi-m64.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-plus.dtb sun50i-a64-pine64.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-orangepi-win.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-pc2.dtb
>  
>  always		:= $(dtb-y)
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
> new file mode 100644
> index 0000000..b16e606
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
> @@ -0,0 +1,102 @@
> +/*
> + * Copyright (C) 2017 Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This library is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This library is distributed in the hope that it will be useful,
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
> +
> +#include "sun50i-a64.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "OrangePi Win/Win Plus";
> +	compatible = "xunlong,orangepi-win", "allwinner,sun50i-a64";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	soc {
> +		reg_vcc3v3: vcc3v3 {
> +			compatible = "regulator-fixed";
> +			regulator-name = "vcc3v3";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +		};
> +	};
> +};
> +
> +&mmc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins>;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
> +	cd-inverted;
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pins_a>;
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins>;
> +	status = "okay";
> +};
> +
> +&usbphy {
> +       status = "okay";
> +};
> +
> +&ohci1 {
> +       status = "okay";
> +};
> +
> +&ehci1 {
> +       status = "okay";
> +};
> 
