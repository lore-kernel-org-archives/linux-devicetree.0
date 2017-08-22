From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: sun7i: Add dts file for
 A20-OLinuXino-MICRO-exGB
Date: Tue, 22 Aug 2017 22:28:33 +0200
Message-ID: <20170822202833.3amv4wx3gbtc6kz3@flea.home>
References: <20170822114313.9038-1-stefan@olimex.com>
 <20170822114313.9038-3-stefan@olimex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ms5xhwzxssa3wh46"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170822114313.9038-3-stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ms5xhwzxssa3wh46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2017 at 02:43:12PM +0300, Stefan Mavrodiev wrote:
> A20-OLinuXino-MICRO has option with onboard eMMC chip. For
> now it's only shipped with 4BG chip, but in the future this
> may change.
>=20
> Currently the board is called "A20-OLinuXino-MICRO-e4GB".
> The dts is named "-exGB" to represent all eMMC configurations -
> e4GB, e8GB, etc.
>=20
> Signed-off-by: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                         |  1 +
>  .../boot/dts/sun7i-a20-olinuxino-micro-exgb.dts    | 81 ++++++++++++++++=
++++++
>  2 files changed, 82 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-olinuxino-micro-exgb.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 4b17f35dc9a7..90cbfc57948e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -880,6 +880,7 @@ dtb-$(CONFIG_MACH_SUN7I) +=3D \
>  	sun7i-a20-olinuxino-lime2.dtb \
>  	sun7i-a20-olinuxino-lime2-emmc.dtb \
>  	sun7i-a20-olinuxino-micro.dtb \
> +	sun7i-a20-olinuxino-micro-exgb.dtb \

Apart from the discussion that happened on the 3rd patch, I'm really
not fond of that name. I'd rather have an emmc suffix. It's trivial
enough so that everyone can understand it, and it covers pretty much
everything that is covered by exgb (ie, it's an emmc of various
capacities).

>  	sun7i-a20-orangepi.dtb \
>  	sun7i-a20-orangepi-mini.dtb \
>  	sun7i-a20-pcduino3.dtb \
> diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro-exgb.dts b/arch/=
arm/boot/dts/sun7i-a20-olinuxino-micro-exgb.dts
> new file mode 100644
> index 000000000000..2c592748e474
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro-exgb.dts

> @@ -0,0 +1,81 @@
> +/*
> + * Copyright 2017 Olimex Ltd.
> + *
> + * Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
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
> +#include "sun7i-a20-olinuxino-micro.dts"
> +
> +/ {
> +	model =3D "Olimex A20-OLinuXino-MICRO-exGB";
> +	compatible =3D "olimex,a20-olinuxino-micro-exgb", "allwinner,sun7i-a20";
> +
> +	mmc2_pwrseq: pwrseq {
> +		pinctrl-0 =3D <&mmc2_pins_nrst>;
> +		pinctrl-names =3D "default";

You don't need the pinctrl node for a gpio, and we're trying to remove
them from our DTs. A huge number of them are still here, but let's not
add more of them :)

> +		compatible =3D "mmc-pwrseq-emmc";
> +		reset-gpios =3D <&pio 2 16 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&pio {
> +	mmc2_pins_nrst: mmc2-rst-pin {
> +		pins =3D "PC16";
> +		function =3D "gpio_out";
> +	};
> +};
> +
> +&mmc2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc2_pins_a>;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	vqmmc-supply =3D <&reg_vcc3v3>;

You don't need both vmmc and vqmmc set to the same regulator.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ms5xhwzxssa3wh46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZnJPxAAoJEBx+YmzsjxAgUd8P/3W02zh2NGYYba3QAwr2zRZO
kfyB/ZLT2BI7u73NuPWTejAUXdR2AOLGttct+qxUtdmFwEqyqdhdF9AZdSwVDpG6
KNtsIdc+sn/bfM4L7Sl86Ycg/lS/tRTQ4hdu3b+ZVLIHfMZBFJmLWfCCz7hCNHCL
cP+W5WrURQXgc4DO2NU+mT100g0caQAng2DIYB6l5mqe7Dvsnmb+i4IlR20wyEAX
btpNp05PFcSeN7OPlJ6ZX4qh+vTfQQvpceznZLI2Fy19ksy+gOOALZMapeNt4ZfT
ugVznjLp1GBYfmPjdskee011M/Vh9WwLSrmGnIjQuChIdjBAV6aFwD6vCvvyi5dl
C9kGixmX9dLmRXogeZI8XnADeCV4CAnnMzDwPGakEcxTqHrtxWgW34pKC4gjYCM3
gSzKUYMa8+vhysEAasjwTLn+RoBDfkk9LNXg5ULY43zp+wAribXTadNDJsao2v3H
UgJ3h8533G+Pvnt9ox/9O9OsceEgrPYXO/8LDCpj60vEtzJsJaFO/0wWYDhjAvSJ
wrnZe9LQwFhqTX0iqd4gq/K7KcSkvcm0PxIqz1GdK5I9bPfMutT/Knc1096hznsl
Yyu4qQmyaJqJ+ndUK3z25ZuzR1qnBgXFdMl7rAKBajnwHr2u0WpvpLc8giEv7oKi
gRmKcnNH6wB1XTKQH3mq
=+Fzl
-----END PGP SIGNATURE-----

--ms5xhwzxssa3wh46--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
