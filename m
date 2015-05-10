From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: dts: sun8i: Add ET-Q8 A33 support
Date: Sun, 10 May 2015 12:47:13 +0200
Message-ID: <20150510104713.GH11057@lukather>
References: <1431240383-12763-1-git-send-email-vishnupatekar0510@gmail.com>
 <1431240383-12763-7-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wXC5D88JtmMokAwr"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBWXPXSVAKGQEC5OKNDQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431240383-12763-7-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--wXC5D88JtmMokAwr
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sun, May 10, 2015 at 12:16:23PM +0530, Vishnu Patekar wrote:
> ET-Q8_A33 is A33 based cheap tablet in common Q8 format.
> 
> It has 512MB RAM, 4GB Nand, 7" Display, RDA5900P wifi, GSL1680 touch, etc.
> 
> Signed-off-by: VishnuPatekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile            |   3 +-
>  arch/arm/boot/dts/sun8i-a33-et-q8.dts | 108 ++++++++++++++++++++++++++++++++++
>  2 files changed, 110 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/sun8i-a33-et-q8.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 82f4b9b..d44b1d6 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -570,7 +570,8 @@ dtb-$(CONFIG_MACH_SUN7I) += \
>  	sun7i-a20-wexler-tab7200.dtb
>  dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-a23-ippo-q8h-v5.dtb \
> -	sun8i-a23-ippo-q8h-v1.2.dtb
> +	sun8i-a23-ippo-q8h-v1.2.dtb \
> +	sun8i-a33-et-q8.dtb
>  dtb-$(CONFIG_MACH_SUN9I) += \
>  	sun9i-a80-optimus.dtb \
>  	sun9i-a80-cubieboard4.dtb
> diff --git a/arch/arm/boot/dts/sun8i-a33-et-q8.dts b/arch/arm/boot/dts/sun8i-a33-et-q8.dts
> new file mode 100644
> index 0000000..260d5a3
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-a33-et-q8.dts
> @@ -0,0 +1,108 @@
> +/*
> + * Copyright 2015 Vishnu Patekar
> + * Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
> +#include "sun8i-a33.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	model = "ET Q8 A33 ";

There's one trailing space here.

> +	compatible = "et-q8-q33", "allwinner,sun8i", "allwinner,sun8i-a33";

All compatibles must be under the vendor,IP format.

What is the maker of your board? That should also be in the DT name,
under the format sun8i-a33-vendor-board.dts

> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		bootargs = "earlyprintk console=ttyS0,115200";
> +	};

Please use stdout-path here, just like we're doing on the other
boards.

> +};
> +
> +&lradc {
> +	vref-supply = <&reg_vcc3v0>;
> +	status = "okay";
> +
> +	button@200 {
> +		label = "Volume Up";
> +		linux,code = <KEY_VOLUMEUP>;
> +		channel = <0>;
> +		voltage = <200000>;
> +	};
> +
> +	button@400 {
> +		label = "Volume Down";
> +		linux,code = <KEY_VOLUMEDOWN>;
> +		channel = <0>;
> +		voltage = <400000>;
> +	};
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins_a>;
> +	status = "okay";
> +};
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
> +	/* pull-ups and devices require PMIC regulator */
> +	status = "failed";
> +};

Is this still true, or is it just a copy/paste mistake?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--wXC5D88JtmMokAwr--
