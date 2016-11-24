From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: sunxi: add support for Orange Pi Zero
 board
Date: Thu, 24 Nov 2016 22:29:30 +0100
Message-ID: <20161124212930.truoiherpczbabh7@lukather>
References: <20161121162421.800-1-icenowy@aosc.xyz>
 <20161121162421.800-2-icenowy@aosc.xyz>
 <20161123075713.ks6gmud3rszjbdsh@lukather>
 <a4393a37-5008-ec76-9886-05f8686dadd5@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hiifsvkaxkwgukjb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a4393a37-5008-ec76-9886-05f8686dadd5-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--hiifsvkaxkwgukjb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 09:23:49AM +0000, Andre Przywara wrote:
> Hi Maxime,
>=20
> On 23/11/16 07:57, Maxime Ripard wrote:
> > On Tue, Nov 22, 2016 at 12:24:20AM +0800, Icenowy Zheng wrote:
> >> Orange Pi Zero is a board that came with the new Allwinner H2+ SoC.
> >>
> >> Add a device tree file for it.
> >>
> >> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >> ---
> >> Changes since v2:
> >> - Use generic pinconf binding instead of legacy allwinner pinctrl bind=
ing.
> >> - removed uart3, which is not accessible on Orange Pi Zero.
> >> - Removed sun8i-h2plus.dtsi and make Orange Pi Zero dts directly inclu=
de
> >>   sun8i-h3.dtsi.
> >> - Removed allwinner,sun8i-h3 compatible.
> >>
> >>  arch/arm/boot/dts/Makefile                       |   1 +
> >>  arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts | 137 ++++++++++++++=
+++++++++
> >=20
> > Ditto, h2-plus-orangepi-zero.
> >=20
> >>  2 files changed, 138 insertions(+)
> >>  create mode 100644 arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts
> >>
> >> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> >> index 802a10d..51a1dd7 100644
> >> --- a/arch/arm/boot/dts/Makefile
> >> +++ b/arch/arm/boot/dts/Makefile
> >> @@ -834,6 +834,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
> >>  	sun8i-a33-sinlinx-sina33.dtb \
> >>  	sun8i-a83t-allwinner-h8homlet-v2.dtb \
> >>  	sun8i-a83t-cubietruck-plus.dtb \
> >> +	sun8i-h2plus-orangepi-zero.dtb \
> >>  	sun8i-h3-bananapi-m2-plus.dtb \
> >>  	sun8i-h3-nanopi-neo.dtb \
> >>  	sun8i-h3-orangepi-2.dtb \
> >> diff --git a/arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts b/arch/a=
rm/boot/dts/sun8i-h2plus-orangepi-zero.dts
> >> new file mode 100644
> >> index 0000000..b428e47
> >> --- /dev/null
> >> +++ b/arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts
> >> @@ -0,0 +1,137 @@
> >> +/*
> >> + * Copyright (C) 2016 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >> + *
> >> + * Based on sun8i-h3-orangepi-one.dts, which is:
> >> + *   Copyright (C) 2016 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >> + *
> >> + * This file is dual-licensed: you can use it either under the terms
> >> + * of the GPL or the X11 license, at your option. Note that this dual
> >> + * licensing only applies to this file, and not this project as a
> >> + * whole.
> >> + *
> >> + *  a) This file is free software; you can redistribute it and/or
> >> + *     modify it under the terms of the GNU General Public License as
> >> + *     published by the Free Software Foundation; either version 2 of=
 the
> >> + *     License, or (at your option) any later version.
> >> + *
> >> + *     This file is distributed in the hope that it will be useful,
> >> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> + *     GNU General Public License for more details.
> >> + *
> >> + * Or, alternatively,
> >> + *
> >> + *  b) Permission is hereby granted, free of charge, to any person
> >> + *     obtaining a copy of this software and associated documentation
> >> + *     files (the "Software"), to deal in the Software without
> >> + *     restriction, including without limitation the rights to use,
> >> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> >> + *     sell copies of the Software, and to permit persons to whom the
> >> + *     Software is furnished to do so, subject to the following
> >> + *     conditions:
> >> + *
> >> + *     The above copyright notice and this permission notice shall be
> >> + *     included in all copies or substantial portions of the Software.
> >> + *
> >> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> >> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> >> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> >> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> >> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> >> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> >> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> >> + *     OTHER DEALINGS IN THE SOFTWARE.
> >> + */
> >> +
> >> +/dts-v1/;
> >> +#include "sun8i-h3.dtsi"
> >> +#include "sunxi-common-regulators.dtsi"
> >> +
> >> +#include <dt-bindings/gpio/gpio.h>
> >> +#include <dt-bindings/input/input.h>
> >> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> >> +
> >> +/ {
> >> +	model =3D "Xunlong Orange Pi Zero";
> >> +	compatible =3D "xunlong,orangepi-zero", "allwinner,sun8i-h2plus";
> >> +
> >> +	aliases {
> >> +		serial0 =3D &uart0;
> >> +	};
> >> +
> >> +	chosen {
> >> +		stdout-path =3D "serial0:115200n8";
> >> +	};
> >> +
> >> +	leds {
> >> +		compatible =3D "gpio-leds";
> >> +		pinctrl-names =3D "default";
> >> +		pinctrl-0 =3D <&leds_opi0>, <&leds_r_opi0>;
> >> +
> >> +		pwr_led {
> >> +			label =3D "orangepi:green:pwr";
> >> +			gpios =3D <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
> >> +			default-state =3D "on";
> >> +		};
> >> +
> >> +		status_led {
> >> +			label =3D "orangepi:red:status";
> >> +			gpios =3D <&pio 0 17 GPIO_ACTIVE_HIGH>;
> >> +		};
> >> +	};
> >> +};
> >> +
> >> +&ehci1 {
> >> +	status =3D "okay";
> >> +};
> >> +
> >> +&mmc0 {
> >> +	pinctrl-names =3D "default";
> >> +	pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin>;
> >> +	vmmc-supply =3D <&reg_vcc3v3>;
> >> +	bus-width =3D <4>;
> >> +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> >> +	cd-inverted;
> >> +	status =3D "okay";
> >> +};
> >> +
> >> +&ohci1 {
> >> +	status =3D "okay";
> >> +};
> >> +
> >> +&pio {
> >> +	leds_opi0: led_pins@0 {
> >> +		pins =3D "PA17";
> >> +		function =3D "gpio_out";
> >> +	};
> >> +};
> >> +
> >> +&r_pio {
> >> +	leds_r_opi0: led_pins@0 {
> >> +		pins =3D "PL10";
> >> +		function =3D "gpio_out";
> >> +	};
> >> +};
> >> +
> >> +&uart0 {
> >> +	pinctrl-names =3D "default";
> >> +	pinctrl-0 =3D <&uart0_pins_a>;
> >> +	status =3D "okay";
> >> +};
> >> +
> >> +&uart1 {
> >> +	pinctrl-names =3D "default";
> >> +	pinctrl-0 =3D <&uart1_pins>;
> >> +	status =3D "disabled";
> >> +};
> >> +
> >> +&uart2 {
> >> +	pinctrl-names =3D "default";
> >> +	pinctrl-0 =3D <&uart2_pins>;
> >> +	status =3D "disabled";
> >> +};
> >=20
> > I'm not sure you answered me on this one. Are those exposed on the
> > headers? why did you put them as disabled here?
>=20
> So they are on headers, though you have to solder the actual header pins
> yourself [1]. But also these are the normal pins multiplexed with GPIOs
> and other peripherals, so keeping them disabled is in line with the
> existing policy, if I got this correctly.
>=20
> I agree that the status=3D"disabled" is redundant, since we have that
> exact line already in the .dtsi. But I saw it in other DTs as well, most
> prominently in the sun8i-h3-orangepi-one.dts.
>=20
> So I think we should remove the "status=3D" lines here, dtc will generate
> an identical dtb out of it. But we should keep the uart descriptions in
> to make it easier for users to see which SoC pins are used for these
> pins labeled UART[012] in the board description and schematic. Also all
> it takes to enable those is to overwrite the status property, which can
> easily be done inline (without resizing the dtb).

I'd rather have the status still in the DTS. It's true that it's
redundant, but it's also explicit. A node without any status would
give the impression that it is actually enabled, especially since a
node without a status is going to be probed.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hiifsvkaxkwgukjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYN1u2AAoJEBx+YmzsjxAg8u8P/0Cly2RRsOg8sJfcUa2Sze6S
P/Qcgan+qNMi4eqJqNmlMlqyhS9fJ2eudq8MlThYJEy6t2jTM7hbx5zPiZ7wQRo8
pZZIozeEDP0mNTLti0kcelLgGp34lIZB4nFdVuLyPtFmu4fGbNWDwFgKBAhMzV9Y
oSltB0p0ayKr7hi6VrZ0iOmPGnzM7q2QuCQZJHhAbInLRRPLPBcZkGmJ/8im2o02
cJ0WDIlB8c8QBr/TXH+xXgH7fIBlukGJit9BgnN2yCk3Io9A+XNwrDvufQC/sOrX
4BBRBMU1f+n2EQ+qE4uZUvyfMz0c06OY3hhVpFkyfwjRXy4HyXz2//UvIfnSNEFX
6ueS0zrD2sx3Qxbn+yj4Waij44ZpzAaOZTiTKUz2Ts8cr9i9toKsoN/gcCvo8Xch
oYPqmZu1+lLv44bX/VaDZdS/OCEkmrdK7KDp0ld7S603G5P6iE9REihxhs6Q7CDi
AmE6KiLA9P9DkzgMvAgZcE27KYFe+ynq2HAKUuCklGCJG5rid+K43cXO4G3epkSj
J6pRS/nVEbDnPALEvCovLDQQbxECxGb78Kdppf8KONDqd+Wly5di6HE5FqcivlBy
rKFo4F3A6TGP5DVEow2j23p9pYUnevEku+RZKPufiKgb3pU3Jas1+ZWtU5eD8nJ/
WQuAteQ47pHvVDzP9MEU
=9+M2
-----END PGP SIGNATURE-----

--hiifsvkaxkwgukjb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
