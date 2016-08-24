From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] ARM: dts: sun8i: Add dts file for inet-d978_rev2
 tablets
Date: Wed, 24 Aug 2016 21:32:35 +0200
Message-ID: <20160824193235.GR8103@lukather>
References: <20160823064451.25997-1-icenowy@aosc.xyz>
 <20160823064451.25997-2-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1112758581321400460=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160823064451.25997-2-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1112758581321400460==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hnpg0BSo5EvPlUVi"
Content-Disposition: inline


--Hnpg0BSo5EvPlUVi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 23, 2016 at 02:44:50PM +0800, Icenowy Zheng wrote:
> The inet-d978_rev2 is a pcb used in generic A33 based tablets. It features
> volume buttons, micro-usb otg, headphone connector and a power button.
>=20
> On the board a Realtek RTL8723BS SDIO Wi-Fi module are soldered, and there
> is also a accompanied board which has a Goodix GT9271 soldered.
>=20
> As this board is desired to create tablets with a Home key dealed by
> GT9271, a LED is present at the front panel at the position of the
> Home key.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  arch/arm/boot/dts/Makefile                     |  1 +
>  arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts | 87 ++++++++++++++++++++=
++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index faacd52..d1812a0 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -782,6 +782,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-a23-q8-tablet.dtb \
>  	sun8i-a33-et-q8-v1.6.dtb \
>  	sun8i-a33-ga10h-v1.1.dtb \
> +	sun8i-a33-inet-d978-rev2.dtb \
>  	sun8i-a33-ippo-q8h-v1.2.dtb \
>  	sun8i-a33-q8-tablet.dtb \
>  	sun8i-a33-sinlinx-sina33.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts b/arch/arm/bo=
ot/dts/sun8i-a33-inet-d978-rev2.dts
> new file mode 100644
> index 0000000..78823d8
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
> @@ -0,0 +1,87 @@
> +/*
> + * Copyright 2015 Hans de Goede <hdegoede@redhat.com>

I guess you are the author too :)

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
> +#include "sun8i-reference-design-tablet.dtsi"
> +
> +/ {
> +	model =3D "INet-D978 Rev 02";
> +	compatible =3D "primux,inet-d978-rev2", "allwinner,sun8i-a33";
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&led_pin_d978>;
> +
> +		home {
> +			label =3D "d978:home";

This is not the proper format for the led labels.

It's supposed to be <board>:<color>:<function>

> +			gpios =3D <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* PL5 */
> +		};
> +	};
> +};
> +
> +&mmc1_pins_a {
> +	allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
> +};
> +
> +&mmc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc1_pins_a>;
> +	vmmc-supply =3D <&reg_dldo1>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +
> +	rtl8723bs: sdio_wifi@1 {
> +		reg =3D <1>;
> +	};

Don't you need an alias to this node to have the MAC address set?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--Hnpg0BSo5EvPlUVi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvfZTAAoJEBx+YmzsjxAgArEP/3aJIhlhbT7rMOc5aENL/8j/
mO7O4Y7/Ndr1cSg+3KUQpmsUJWbur8M1mbj1OYJL9AkdCYnycCigM+RA3ztGmc9/
UKMTptIJYtPMOM3KRd3sEnYmKAYadg0xXwX8Hu6nDA/revn7fPfIOsLUyL7B/Ny8
0vSxnSOgJBZXCWn+XZxYiribEzuF36/qQbqcsccEIyFqcPqFpeE5CWO52gj3ennY
tlvS/OExt9nV5+e/XU0730xsxZ0iHQJ2LkgF/TdGYfIhSWAZkwmZ/iV12xCPopXd
kUy1VX0RuMh6ehFgIv+f/L23FL7Fp//qbXk/qlMwkyB7zlO9sz4OUJKEVDpja6SJ
6XGGHxS6wntezOLFJ/QXy3YgK+L2gDq/RhdyuWZY7Wr+9bjoyj440Tq7plC5qzpI
3NsTSkGE3Eq23xxsU3HwGSpk3PP7pdayEGShUN6+TpKcDJ3OY+tXalnPPqFvSJiU
4+RYdqGY9OQaden5fBRjhIp65ivYSPxKfaLKSc4iiDAGuq+geGnyR4w6YQzVPQhS
TE0ygkCihX0BJFQTD4HBAe68FwDpk/BKw69mb0UJUk2z2kR5cDMFAZkKuxocTJU0
fVsP+d6IpIbpIDmtSEPpoNOlt6blpbgeyfhKrwCxSI0uf6T4bEYNy8YelbJuoRwX
ObikKUxw1LxhaysLApzk
=xEq4
-----END PGP SIGNATURE-----

--Hnpg0BSo5EvPlUVi--


--===============1112758581321400460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1112758581321400460==--
