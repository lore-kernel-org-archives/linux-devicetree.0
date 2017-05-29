From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun5i: a13: Add Olimex SOM board dts support
Date: Mon, 29 May 2017 10:17:26 +0200
Message-ID: <20170529081726.4bqitk6hmpuibh7p@flea.lan>
References: <1495544437-32463-1-git-send-email-jteki@openedev.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qp2irzjuj6ut6fmg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1495544437-32463-1-git-send-email-jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--qp2irzjuj6ut6fmg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jagan,

On Tue, May 23, 2017 at 06:30:37PM +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
>=20
> Add support for Olimex A13-512-SOM board, and this particular
> design is like A13-SOM-WIFI can mount on-top of A13-SOM.
>=20
> https://www.olimex.com/Products/SOM/A13/A13-SOM-512/
> https://www.olimex.com/Products/SOM/A13/A13-SOM-WIFI/open-source-hardware

In general (and this is true in the A64 boards patches you sent too),
I'm not a big fan of putting the URLs in the commit log. They tend to
get outdated / broken very fast, and we can't fix them in the history.

Please remove them and/or put them in the "comment" part (after the
---).

> Features:
> - A13 Cortex A8 processor at 1GHz, 3D Mali400 GPU
> - 512MB DDR3 memory
> - MicroSD card connector
> - UART console connector
> - Status LEDs
> - BL-8188-8M WiFi wireless module with Realtek RTL8188CUS chip
> - USB-OTG with mini USB connector
>=20
> Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/sun5i-a13-olinuxino-som.dts | 174 ++++++++++++++++++++=
++++++
>  2 files changed, 175 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun5i-a13-olinuxino-som.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 9c5e1d9..45c6e65 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -830,6 +830,7 @@ dtb-$(CONFIG_MACH_SUN5I) +=3D \
>  	sun5i-a13-licheepi-one.dtb \
>  	sun5i-a13-olinuxino.dtb \
>  	sun5i-a13-olinuxino-micro.dtb \
> +	sun5i-a13-olinuxino-som.dtb \
>  	sun5i-a13-q8-tablet.dtb \
>  	sun5i-a13-utoo-p66.dtb \
>  	sun5i-gr8-chip-pro.dtb \
> diff --git a/arch/arm/boot/dts/sun5i-a13-olinuxino-som.dts b/arch/arm/boo=
t/dts/sun5i-a13-olinuxino-som.dts
> new file mode 100644
> index 0000000..3bb3b7d
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun5i-a13-olinuxino-som.dts
> @@ -0,0 +1,174 @@
> +/*
> + * Copyright 2012 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + * Copyright 2013 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> + * Copyright 2017 Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
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
> +#include "sun5i-a13.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	model =3D "Olimex A13-Olinuxino SOM";
> +	compatible =3D "olimex,a13-olinuxino-som", "allwinner,sun5i-a13";
> +
> +	aliases {
> +		serial0 =3D &uart1;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&led_pins_olinuxinom>;

We do not put GPIO pinctrl nodes in the DT anymore. Our GPIO/pinctrl
is currently broken, and fixing it properly would require removing all
those nodes and would break the existing DT. Until we make that
switch, we'd better not introduce more DT we'll break.

The rest looks good, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qp2irzjuj6ut6fmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZK9kWAAoJEBx+YmzsjxAgW2IP/RFILizmV2XflG6UJlur+6Sq
qfJs3A70aC9uc/lKzCLRW/ZvGK3rXBlaHxZzJ+jJhrdhyIYk9Un9Etf2Z2dUrzi8
B/yfPi0xjmw8FxKVYlw8k2pwc5aNsUr5ObXb2yAf5lsn62ugIJY3tMdB9uhtVBY/
Q9OISqcxuy8+dNy6jZee9wSiaTzn/Hc+sHNYEWcw0shWJdKSiApcZjoOUkgWZpAQ
z1Dzlo2pBhVaLnhlLIbmYXDtij/1uvAumtv8Frz2NHmtZlfi1Q48TyHbPfc2ZIKX
xKneYm/NZUnPr06K6iGYBtanK4RD5YEfKJ/Jn8SnW3hXvm9VlDdZ6210+djwDm5p
qECGnIsrCr/QNXti+2UcRhpqvHae/sjvhsA7iX+qx0vQtIA86Rq0XWqMYvp2AHIk
EyU5+QNowM8Tr4i77SB9DNI0T6AVQcxVdhD2GPLIMpcVsVvH7Htw4Wh8SnwR1wH4
rUSrSu+QZo8amq0G8zfgjLJFhdLbRsXGh5ekChDrAawCSQiyUDYqUXPHJ/k2pkwd
tLcsdWVknCP+/XaNt43EvQ53HVg9HNxudTGaLxg477/NPrtrdyCjs8HxsWME5ryo
u4ZKn1THjGiRw3ctQXYgLWf+G9VVCqWG5eY4rbPQc6lG1XDmfc4BpcDoKvNcGCCM
f4r5+lmZ0lX08l3mp0YZ
=B2uo
-----END PGP SIGNATURE-----

--qp2irzjuj6ut6fmg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
