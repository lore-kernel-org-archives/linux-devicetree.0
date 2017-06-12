From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] arm64: allwinner: a64: Add initial Orangepi
 Win/WinPlus support
Date: Mon, 12 Jun 2017 10:38:38 +0200
Message-ID: <20170612083838.e7gynimxjjzk3zxg@flea.home>
References: <1497172565-13125-1-git-send-email-jteki@openedev.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oxzrtjzfipkd2czo"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497172565-13125-1-git-send-email-jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: zhaoyifan <zhao_steven-Y9sIeH5OGRo@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--oxzrtjzfipkd2czo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2017 at 02:46:05PM +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>=20
> Orangepi Win/WinPlus is an open-source single-board computer
> using the Allwinner A64 SOC.
>=20
> A64 Orangepi Win/WinPlus has
> - A64 Quad-core Cortex-A53 64bit
> - 1GB(Win)/2GB(Win Plus) DDR3 SDRAM
> - Debug TTL UART
> - Four USB 2.0
> - HDMI
> - LCD
> - Audio and MIC
> - Wifi + BT
> - IR receiver
> - 5V DC power supply
>=20
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
> Changes for v2:
> - Remove http link from commit message
> - Re-arrange nodes in ascending order
>=20
>  arch/arm64/boot/dts/allwinner/Makefile             |  1 +
>  .../boot/dts/allwinner/sun50i-a64-orangepi-win.dts | 97 ++++++++++++++++=
++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win=
=2Edts
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index 8adba9c..2fb5057 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pine64-plus.dtb =
sun50i-a64-pine64.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-sopine-baseboard.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-pc2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-prime.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-orangepi-win.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-nanopi-neo2.dtb
> =20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts b/=
arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
> new file mode 100644
> index 0000000..31166b5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
> @@ -0,0 +1,97 @@
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
> +	model =3D "OrangePi Win/Win Plus";
> +	compatible =3D "xunlong,orangepi-win", "allwinner,sun50i-a64";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	soc {

Same thing here, it doesn't need to be in that node.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--oxzrtjzfipkd2czo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZPlMOAAoJEBx+YmzsjxAgNJoP/2KNJK1vA4+bsRU0QJ45UBLD
GhDdN6Xgq8SZlsrDlBUWXBxqxh0TEhucktm9mt4HbHtEl4BYKeunw6q3XWEgmvPy
kPvPwU9LD7xuimol98Dz/6444pq3HZoqUHC60DORcGuuVoCRYE3CPkwzaxWw26Iu
GSjkEGeuVVONuQ1pPtZphg536P6Vav+xhq9fud9AVGP+RWIoL4l673v4xTOzyw2l
9bVfIoZ1MLQe7CQLLGzWxLBYulcFypRnQA2wmqS7ZWGW3osSw7Y98C2K4bExFX7q
rNkGhV7Po87QH4YR5HY83014A6JOkqcWzNh/DhLlGKqY/SVKYClDIuSWLZybUZoS
a3eGmVMUUPO10SUYJqOWAfQN04og4yuLV4xQsZf4SlD+TXgAeKJXiWOBkGkwgz/J
hLNf4lKzAqt99+YvPjx5Xa8vNPsY5umjwRF7Gm+iTIk7GhaNW74l+buUyiHNk1YD
YfoKpjU7PvemPePBCFPhTvNk577YTtpLRcxBwJPvFQKBQzuQ8b0Hy1q0CcESwr8Q
0c9IYCjHwRQN4GLBf7LgNzAee/SFmZQpvNuh1Fs2bezbCtuvIL3QgFB7+Mvvp4IK
14m+/3gxK+CqE3bwRJ+IS5uCB8gEgAidp4eeqjd72syK7q1nXMtKILnx6IlsWFDk
pfy6vumZxpM+gnt5KqY0
=DdPR
-----END PGP SIGNATURE-----

--oxzrtjzfipkd2czo--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
