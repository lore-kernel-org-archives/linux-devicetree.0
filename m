From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 10/12] arm64: allwinner: a64: add DTSI file for AXP803
 PMIC
Date: Tue, 18 Apr 2017 09:08:31 +0200
Message-ID: <20170418070831.pt6fj6hufaoboiqv@lukather>
References: <20170417115747.7300-1-icenowy@aosc.io>
 <20170417115747.7300-11-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xdnd65ycsgarkylo"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170417115747.7300-11-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xdnd65ycsgarkylo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 07:57:45PM +0800, Icenowy Zheng wrote:
> As nearly all A64 boards are using AXP803 PMIC, add a DTSI file for it,
> like the old DTSI files for AXP20x/22x, for the common parts of the
> PMIC.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/axp803.dtsi | 150 ++++++++++++++++++++++++=
++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/axp803.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/axp803.dtsi b/arch/arm64/boot/=
dts/allwinner/axp803.dtsi
> new file mode 100644
> index 000000000000..f0e53a7fffbd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/axp803.dtsi
> @@ -0,0 +1,150 @@
> +/*
> + * Copyright 2017 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
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
> +/*
> + * AXP803 Integrated Power Management Chip
> + * http://files.pine64.org/doc/datasheet/pine64/AXP803_Datasheet_V1.0.pdf
> + */
> +
> +&axp803 {
> +	interrupt-controller;
> +	#interrupt-cells =3D <1>;
> +
> +	regulators {
> +		/* Default work frequency for buck regulators */
> +		x-powers,dcdc-freq =3D <3000>;
> +
> +		reg_dcdc1: dcdc1 {
> +			regulator-name =3D "dcdc1";
> +		};
> +
> +		reg_dcdc2: dcdc2 {
> +			regulator-name =3D "dcdc2";
> +		};
> +
> +		reg_dcdc3: dcdc3 {
> +			regulator-name =3D "dcdc3";
> +		};
> +
> +		reg_dcdc4: dcdc4 {
> +			regulator-name =3D "dcdc4";
> +		};
> +
> +		reg_dcdc5: dcdc5 {
> +			regulator-name =3D "dcdc5";
> +		};
> +
> +		reg_dcdc6: dcdc6 {
> +			regulator-name =3D "dcdc6";
> +		};
> +
> +		reg_dc1sw: dc1sw {
> +			regulator-name =3D "dc1sw";
> +		};
> +
> +		reg_aldo1: aldo1 {
> +			regulator-name =3D "aldo1";
> +		};
> +
> +		reg_aldo2: aldo2 {
> +			regulator-name =3D "aldo2";
> +		};
> +
> +		reg_aldo3: aldo3 {
> +			regulator-name =3D "aldo3";
> +		};

Please sort them by alphabetical order.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xdnd65ycsgarkylo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY9btrAAoJEBx+YmzsjxAglyIQAKa7r4yHL+XWz+TNjmkK0XDw
k4BmfaGt8jD+KlPeTm74/DKpyWygy9C94v5/f00/S/UCuN3K6m652c1dvrORbK9a
vLjCgoJdC/j6HNLmMJTKLDV2KrmyCOZ4Jopeqnnoi2WjvIQnjKJb43vxDlJJpOza
RhYcdzs1Yhm48M7ElUV9rmcJl2c47kCZgZwFHXsF65W7Pv+GvMkjwOHefteIpXF2
zSUwmGsdIPoHxrFCYEealD2vPkagaHnyCILX6gCrtLonlAMIt5Mfx7KNku08iwZk
x9U2YgY12tO8E4klxqUoBZK4WAZWX1G8n7UEQvWMfC7g1zGDf9s3TBSoFsAEHzpC
Oj5Xlti56cqKFLkT28+R7zof/8Kqhm3igbe9Oakuz9ISqSZOU2L1252ZzfYp7uoQ
BqZeYGK0uK/62WXuOU6K/fkwlgYDVVkJYxxrHtr3vK6niCgFiRly4IJveZtwPE+D
9FuWpjVEWxVOb7a7yGru3lM3nLM4OqK/KmrtQDqKjl40SkrPkA7d8l1sGkKu7HEE
fy9WYiHGN6LiaX/zQ+oG4MYLu2Paat9NXzzyUjup2JdFXYA39xmFx9dRljQ3DiR3
Sb4RCasOFM2ns6tigMMFyEwtFbz/eFeZH/1CMvAuEoktUcI0xZXtLESnbssW1mca
qmQoE06mflkBsu9tgwXU
=gORs
-----END PGP SIGNATURE-----

--xdnd65ycsgarkylo--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
