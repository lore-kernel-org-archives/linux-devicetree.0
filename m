From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: sun8i: Add dts file for the NanoPi NEO SBC
Date: Mon, 5 Sep 2016 14:06:35 +0200
Message-ID: <20160905120635.GF6322@lukather>
References: <1472701734-1837-1-git-send-email-james@innovum.com.au>
 <1473049907-17540-1-git-send-email-james@innovum.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ExXT7PjY8AI4Hyfa"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473049907-17540-1-git-send-email-james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Pettigrew <james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ExXT7PjY8AI4Hyfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 05, 2016 at 02:31:47PM +1000, James Pettigrew wrote:
> The NanoPi NEO is a minimal H3 based SBC. It comes with 256/512M RAM, a
> micro SD slot, 10/100Mbit ethernet and a single USB-A port.
>=20
> Signed-off-by: James Pettigrew <james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>
> ---
> Changes in v3:
>=20
> Fixed syntax errors
> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts          | 125 +++++++++++++++=
++++++
>  3 files changed, 127 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docu=
mentation/devicetree/bindings/vendor-prefixes.txt
> index 1992aa9..7b6bda3 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -98,6 +98,7 @@ ezchip	EZchip Semiconductor
>  fcs	Fairchild Semiconductor
>  firefly	Firefly
>  focaltech	FocalTech Systems Co.,Ltd
> +friendlyarm	Guangzhou FriendlyARM Computer Tech Co., Ltd

This needs to be in a separate patch.

>  fsl	Freescale Semiconductor
>  ge	General Electric Company
>  geekbuying	GeekBuying
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7dd4a07..a35f986 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -792,6 +792,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-a83t-allwinner-h8homlet-v2.dtb \
>  	sun8i-a83t-cubietruck-plus.dtb \
>  	sun8i-h3-bananapi-m2-plus.dtb \
> +	sun8i-h3-nanopi-neo.dtb \
>  	sun8i-h3-orangepi-2.dtb \
>  	sun8i-h3-orangepi-lite.dtb \
>  	sun8i-h3-orangepi-one.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts b/arch/arm/boot/dt=
s/sun8i-h3-nanopi-neo.dts
> new file mode 100644
> index 0000000..3d64caf
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
> @@ -0,0 +1,125 @@
> +/*
> + * Copyright (C) 2016 James Pettigrew <james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>
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
> +#include "sun8i-h3.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	model =3D "FriendlyARM NanoPi NEO";
> +	compatible =3D "friendlyarm,nanopi-neo", "allwinner,sun8i-h3";
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
> +		pinctrl-0 =3D <&leds_opc>, <&leds_r_opc>;
> +
> +		pwr {
> +			label =3D "nanopi:green:pwr";
> +			gpios =3D <&r_pio 0 10 GPIO_ACTIVE_HIGH>; /* PL10 */
> +			default-state =3D "on";
> +		};
> +
> +		status {
> +			label =3D "nanopi:blue:status";
> +			gpios =3D <&pio 0 10 GPIO_ACTIVE_HIGH>; /* PA10 */
> +		};
> +	};
> +};
> +
> +&ehci3 {
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin>;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> +	cd-inverted;
> +	status =3D "okay";
> +};
> +
> +&ohci3 {
> +	status =3D "okay";
> +};
> +
> +&pio {
> +	leds_opc: led-pins {
> +		allwinner,pins =3D "PA10";
> +		allwinner,function =3D "gpio_out";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +};
> +
> +&r_pio {
> +	leds_r_opc: led-pins {
> +		allwinner,pins =3D "PL10";
> +		allwinner,function =3D "gpio_out";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&usbphy {
> +	/* USB VBUS is always on */
> +	status =3D "okay";
> +};
> --=20
> 1.9.1
>=20

Looks good otherwise, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ExXT7PjY8AI4Hyfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXzV/LAAoJEBx+YmzsjxAgpIMQAKxk4IDxgc1vabEjCqHP8Eea
J8u/ZobwYn6KRC7FWVMQajpKT5p2ID9bsgPTagszD6wYh7CZdC3v30niC7HbR3rK
JMXfxmlYk4WiWuLShZ7La4Y9DWt1AMz6Y8Q9Ab2pe3OUgn9e4EfMLWT2GNGgpwFc
LOMd1QCvfVvrvyGHs7gGycc8y32ok+AO+R4M7rNB8qDn7LzCIA03eqBIyDcWU/td
nhUYIfwHeLvxF7ye8CeMtZirDxsZmzs2Fi5QrZt81TenjuED182ihahsWABVEdJV
acRhcBK8FjH+bdGMd+t8LD6duS9HymWeE08by4jZJiv4lyewGBM4BifmKYZwuUe2
czXGCqVHBv4CA5IxruSG+tzca3kDO61/FbWrB5Jlnv1jn42n5yFlu0gbtUeMoYxt
jqYuOzfwoAvoas7awbvhHPK2S89x1ykY3QOdghrwaRFckfMxeaP4MnM8yZSNblq7
4NwQ/FFYmUAAtvit1rS6dEcYzfZ4IsY2ZkUGD5sXL+i+VYqxxrwyHs/YxYOy/klj
09V+Pqxu+F1UaWpOfSk+/t9EwAEkT0hXepw9oCwutDEkvMB1Pqj4cI1lp73AgZIt
iJLaixg1Tg4QzfWrxESkJHKmT+KU+VaF8EZtZ5sbw3nrwYTqCW46LPCtj8L2/XOV
Blpscf30q7IICgQYwN2v
=JKm5
-----END PGP SIGNATURE-----

--ExXT7PjY8AI4Hyfa--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
