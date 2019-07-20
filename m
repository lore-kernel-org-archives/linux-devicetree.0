From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 8/8] ARM: dts: sun8i: s3: add devicetree
 for Lichee zero plus w/ S3
Date: Sat, 20 Jul 2019 12:12:39 +0200
Message-ID: <20190720101239.dg2oe3jazzfmtzvw@flea>
References: <20190713034634.44585-1-icenowy@aosc.io>
 <20190713034634.44585-9-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yaksnqu7g5ezrkwd"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBGOSZPUQKGQE4XMBW5Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190713034634.44585-9-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--yaksnqu7g5ezrkwd
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Sat, Jul 13, 2019 at 11:46:34AM +0800, Icenowy Zheng wrote:
> Lichee zero plus is a core board made by Sipeed, which includes on-board
> TF slot or SMT SD NAND, and optional SPI NOR or eMMC, a UART debug
> header, a microUSB slot and a gold finger connector for expansion. It
> can use either Sochip S3 or Allwinner S3L SoC.
>
> Add the basic device tree for the core board, w/o optional onboard
> storage, and with S3 SoC.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> No changes in v4.
>
> Changes in v3:
> - Drop common regulator DTSI usage and added vcc3v3 regulator.
>
>  arch/arm/boot/dts/Makefile                    |  1 +
>  .../boot/dts/sun8i-s3-lichee-zero-plus.dts    |  8 ++++
>  .../dts/sun8i-s3-s3l-lichee-zero-plus.dtsi    | 46 +++++++++++++++++++
>  3 files changed, 55 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts
>  create mode 100644 arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 9159fa2cea90..e320460a952b 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1114,6 +1114,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-r16-nintendo-super-nes-classic.dtb \
>  	sun8i-r16-parrot.dtb \
>  	sun8i-r40-bananapi-m2-ultra.dtb \
> +	sun8i-s3-lichee-zero-plus.dtb \
>  	sun8i-t3-cqa3t-bv3.dtb \
>  	sun8i-v3s-licheepi-zero.dtb \
>  	sun8i-v3s-licheepi-zero-dock.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts b/arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts
> new file mode 100644
> index 000000000000..7d2f6b145190
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2019 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> + */
> +
> +/dts-v1/;
> +#include "sun8i-s3.dtsi"
> +#include "sun8i-s3-s3l-lichee-zero-plus.dtsi"

Why do we need to mention both the S3 and S3l in the name? What are
the differences between the two, and why do you need to share a DTSI?

> diff --git a/arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi b/arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi
> new file mode 100644
> index 000000000000..2677d319fb29
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2019 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reg_vcc3v3: vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +};
> +
> +&mmc0 {
> +	broken-cd;
> +	bus-width = <4>;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
> +	status = "okay";

How can it do OTG if there's no controlable VBUS?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--yaksnqu7g5ezrkwd--
