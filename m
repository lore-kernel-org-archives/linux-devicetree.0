From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: sun8i: Add dts file for Olimex A33-OLinuXino
Date: Wed, 22 Jun 2016 15:22:22 +0200
Message-ID: <20160622132222.GX26668@lukather>
References: <1466418769-8384-1-git-send-email-stefan.mavrodiev@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mlvFMpb4NrD3AMcD"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466418769-8384-1-git-send-email-stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Mavrodiev <stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-AbSShOkvfpQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mlvFMpb4NrD3AMcD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 20, 2016 at 01:32:49PM +0300, Stefan Mavrodiev wrote:
> A33-OLinuXino is A33 development board designed by Olimex LTD.
>=20
> It has AXP233 PMU, 1GB DRAM, a micro SD card, one USB-OTG connector,
> headphone and mic jacks, connector for LiPo battery and optional
> 4GB NAND Flash.
>=20
> It has two 40-pin headers. One for LCD panel, and one for
> additional modules. Also there is CSI/DSI connector.

Oh? So it ships already? Nice!

> Signed-off-by: Stefan Mavrodiev <stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes for v2:
> 	- Removed unused power nodes
> 	- Removed default-trigger for green led
> 	- Removed "always-on" option for LCD power
>=20
> Changes for v3:
> 	- Nodes are sorted alphabetically
>=20
>  arch/arm/boot/dts/Makefile                |   1 +
>  arch/arm/boot/dts/sun8i-a33-olinuxino.dts | 207 ++++++++++++++++++++++++=
++++++
>  2 files changed, 208 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-a33-olinuxino.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 970e906..b78f363 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -760,6 +760,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-a33-ippo-q8h-v1.2.dtb \
>  	sun8i-a33-q8-tablet.dtb \
>  	sun8i-a33-sinlinx-sina33.dtb \
> +	sun8i-a33-olinuxino.dtb \

This should be ordered alphabetically.

>  	sun8i-a83t-allwinner-h8homlet-v2.dtb \
>  	sun8i-a83t-cubietruck-plus.dtb \
>  	sun8i-h3-orangepi-2.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-a33-olinuxino.dts b/arch/arm/boot/dt=
s/sun8i-a33-olinuxino.dts
> new file mode 100644
> index 0000000..586ffd3
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
> @@ -0,0 +1,207 @@
> +/*
> + * Copyright 2016 - Stefan Mavrodiev <stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + *                  Olimex LTD. <support-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
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
> +#include "sun8i-a33.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	model =3D "A33-OLinuXino";

Olimex A33-Olinuxino

> +	compatible =3D "allwinner,sun8i-a33";

And you should have an extra compatible for your board here.

> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&led_pin_olinuxino>;
> +
> +		green {
> +			label =3D "olinuxino:green:usr";

The first part of the label is usually the board name, a33-olinuxino
in that case.

> +			gpios =3D <&pio 1 7 GPIO_ACTIVE_HIGH>; /* LED2 */
> +		};
> +	};
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_olinuxino>;
> +	vmmc-supply =3D <&reg_dcdc1>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
> +	cd-inverted;
> +	status =3D "okay";
> +};
> +
> +&ohci0 {
> +	status =3D "okay";
> +};
> +
> +&pio {
> +	led_pin_olinuxino: led_pins@0 {
> +		allwinner,pins =3D "PB7";
> +	        allwinner,function =3D "gpio_out";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +    };
> +
> +	mmc0_cd_pin_olinuxino: mmc0_cd_pin@0 {
> +		allwinner,pins =3D "PB4";
> +		allwinner,function =3D "gpio_in";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +};
> +
> +&r_rsb {
> +	status =3D "okay";
> +
> +	axp22x: pmic@3a3 {
> +		compatible =3D "x-powers,axp223";
> +		reg =3D <0x3a3>;
> +		interrupt-parent =3D <&nmi_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +		eldoin-supply =3D <&reg_dcdc1>;
> +	};
> +};
> +
> +#include "axp22x.dtsi"
> +
> +&reg_aldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <3300000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-name =3D "vcc-io";
> +};
> +
> +&reg_aldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <2350000>;
> +	regulator-max-microvolt =3D <2650000>;
> +	regulator-name =3D "vdd-dll";
> +};
> +
> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <3300000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-name =3D "vcc-avcc";
> +};
> +
> +&reg_dc1sw {
> +	regulator-name =3D "vcc-lcd";
> +};
> +
> +&reg_dc5ldo {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <900000>;
> +	regulator-max-microvolt =3D <1400000>;
> +	regulator-name =3D "vdd-cpus";
> +};
> +
> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <3300000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-name =3D "vcc-dsi";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <900000>;
> +	regulator-max-microvolt =3D <1400000>;
> +	regulator-name =3D "vdd-sys";
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <900000>;
> +	regulator-max-microvolt =3D <1400000>;
> +	regulator-name =3D "vdd-cpu";
> +};
> +
> +&reg_dcdc5 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1500000>;
> +	regulator-max-microvolt =3D <1500000>;
> +	regulator-name =3D "vcc-dram";
> +};
> +
> +&reg_rtc_ldo {
> +	regulator-name =3D "vcc-rtc";
> +};
> +
> +&simplefb_lcd {
> +	vcc-lcd-supply =3D <&reg_dc1sw>;
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pins_b>;
> +	status =3D "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};
> +
> +&usbphy {
> +	usb0_vbus-supply =3D <&reg_vcc5v0>;
> +	status =3D "okay";
> +
> +};

It doesn't work as USB OTG ?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--mlvFMpb4NrD3AMcD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXapEOAAoJEBx+YmzsjxAgoYcQAJMcPs/jJLk9Xpg0/ytcvrxL
0Ppoc0scEoTy5la3u3TxSVhd4V0kLwavuUad7caEwn1oiAUIOurHAQLXnR6kD6kh
OR7w+wMe6CPUyFOcizcfEO9yYG8VK1HT+ETNTfvM8HMdIKlm0stXlJe455C2u8DM
7Irly0rMWvxvrhc7rVF1BDh6gjKuXlsd+YzHsgNwnLuh/4VFRfsb54mCJoOfOd9V
F09NDXyGBILDJkH+l/aW/QKZwCAk9Rw8AkoUE3oWirT2K3IlV3KvbVnCeoUwxAcz
yPEjUA1sYiC+okC+BF6nsYzkIat36sOvk1au4z1qwNE2u/oq5lXJcFeMWNElW0G3
elKLcm70TvPNso3oVcHaJv+2ajqo5jxgHyZ8rMY3FrqBPBOLc6e50UuUKRiMExLL
crgV9QM1AlCAW+xs4BclaLmjC+D/9wjP4p1I8gJZrLD/sXIG5Bc4ABQGzzxGpec9
gqLzIbyrhZEIFc1Hbn0ZRyryRqCUvhkwfPpEjisM93ZcQD3wYZOplXaKCDGleloI
k1Fe49f3qUn5yhEwpyAEWDzfX7Xy2BpDu7ZdK9WCVBqLt3nuW//1a2oaaTUIUqmi
xrljWN2F+DhjXKcZQHz/GPdchcd6dQ+RQpgE4eAzeoiNmt5+v3IUIYYEepfxvq1u
+rIF9sWhOJIQh1cARGKf
=bL79
-----END PGP SIGNATURE-----

--mlvFMpb4NrD3AMcD--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
