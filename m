From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v1 1/2] ARM: dts: add cubietech cubieboard4
Date: Mon, 9 Mar 2015 19:03:44 +0100
Message-ID: <20150309180344.GV5085@lukather>
References: <1425918421-22876-1-git-send-email-tyler.baker@linaro.org>
 <1425918421-22876-2-git-send-email-tyler.baker@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jWL1oGPK2mPq0rME"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425918421-22876-2-git-send-email-tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jWL1oGPK2mPq0rME
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tyler,

On Mon, Mar 09, 2015 at 09:27:00AM -0700, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
> From: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> Add a Cubietech Cubieboard4 device tree and instruct make to build it. Th=
is
> device tree has been derived from the sun9i-a80-optimus.dts as they are v=
ery
> similar in design[1]. Notably, I2C3 is not used on Cubieboard4 and the LE=
D/PWM
> definitions will need to be updated in the future.
>=20
> [1] http://dl.cubieboard.org/model/cc-a80/Hardware/CC-A80-HW-V1.1.pdf
>=20
> Signed-off-by: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                  |  3 +-
>  arch/arm/boot/dts/sun9i-a80-cubieboard4.dts | 99 +++++++++++++++++++++++=
++++++
>  2 files changed, 101 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 4837044..0f67dab 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -553,7 +553,8 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-a23-ippo-q8h-v5.dtb \
>  	sun8i-a23-ippo-q8h-v1.2.dtb
>  dtb-$(CONFIG_MACH_SUN9I) +=3D \
> -	sun9i-a80-optimus.dtb
> +	sun9i-a80-optimus.dtb \
> +	sun9i-a80-cubieboard4.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) +=3D \
>  	tegra20-harmony.dtb \
>  	tegra20-iris-512.dtb \
> diff --git a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts b/arch/arm/boot/=
dts/sun9i-a80-cubieboard4.dts

Good catch on the file name.

> new file mode 100644
> index 0000000..5cdc165
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
> @@ -0,0 +1,99 @@
> +/*
> + * Copyright 2015 Tyler Baker
> + *
> + * Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> + * Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
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
> +#include "sun9i-a80.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	model =3D "Cubietech Cubieboard4";
> +	compatible =3D "cubietech,a80-cubieboard4", "allwinner,sun9i-a80";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		linux,stdout-path =3D &uart0;

Actually, you can just use stdout-path, and you can also provide the
baudrate configuration (and reuse the alias you just defined) by using

		stdout-path =3D "serial0:115200n8";

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--jWL1oGPK2mPq0rME
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU/eCAAAoJEBx+YmzsjxAg/kEP/0pAJ4CjFR67bQP8Se3zOzED
yTpWMUTTpapN5RX58FZW/rIc77a8FVJlVWUlwyO32EWNwXbv9WHT09vzIBD6d+5I
NAPNI3qUODE0Z0UVhcc+jEpZz2dYsvrz/pYNHPAsFibIR1762p6LD48rd6PZDLhm
+YjPY0CFOGLheoGAmLq7UNPPVqKipFF3A+IpXr4Wsw5wiH6srx9csPVoaCMpXarL
5BL0BraoTtzonxvjXS2mNY3yLdyFc7m36pq+g9hWoog4dJepTzh+kbeGTDjoEnIm
e9KjBTXn043raioO8nLnGEamsMGlQoSeAokq+fod08CogU5ViSRwXhnYqEmSrkTM
G2vLRC2eygMRmF52KMBeDRyJwUMEZj8NZx0UkH0W9BQ3d7ncKy+fjsPzGkVt1drb
qXH7iTNd27fwnbnKf3oTfw1jGJlPNUcLfJLdLG14OcYNR4KQs0inzXkVHw53W6F5
UIFzAWeIn/Nhv6kyBwcqLTsKfrNUvoIkagDP385OC6YxCIHV+EjIKV8Qg/cjGvJ1
ZFTCrDQwEzuRAwfFeBQsiCdljm9UKZONLt8GTNDi6WpPcGzTvOZNIhd/RCmUyfIP
QCq73JX44fZxjH7jqi33cjJHk8+iYaJ6erZc+9c9j2I07BxIuVwc9HyE606/lFKT
PKxnyGVxuz6icV9taYOf
=LB4W
-----END PGP SIGNATURE-----

--jWL1oGPK2mPq0rME--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
