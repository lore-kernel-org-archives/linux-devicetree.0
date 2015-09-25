From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v5 3/7] ARM: dts: imx: imx7d-sbd add iomuxc-lpsr hoggrp-2
 pads
Date: Fri, 25 Sep 2015 12:49:22 +0200
Message-ID: <20150925104922.GK11805@pengutronix.de>
References: <1443128043-21063-1-git-send-email-aalonso@freescale.com>
 <1443128043-21063-3-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUvfsPTz/SzOZDdw"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443128043-21063-3-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Adrian Alonso <aalonso@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com, devicetree@vger.kernel.org, Frank.Li@freescale.com, nitin.garg@freescale.com, Anson.Huang@freescale.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, yibin.gong@freescale.com
List-Id: devicetree@vger.kernel.org


--fUvfsPTz/SzOZDdw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2015 at 03:53:59PM -0500, Adrian Alonso wrote:
> Add imx7d-sdb iomuxc-lpsr hoggrp-2 default pads settings
>=20
> Signed-off-by: Adrian Alonso <aalonso@freescale.com>
> ---
> Changes for V2: Resend
> Changes for V3: Resend
> Changes for V4: Resend
> Changes for V5: Resend
>=20
>  arch/arm/boot/dts/imx7d-sdb.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sd=
b.dts
> index 8059458..c8a178c 100644
> --- a/arch/arm/boot/dts/imx7d-sdb.dts
> +++ b/arch/arm/boot/dts/imx7d-sdb.dts
> @@ -419,3 +419,18 @@
> =20
>  	};
>  };
> +
> +&iomuxc_lpsr {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_hog_2>;
> +
> +	imx7d-sdb {
> +		pinctrl_hog_2: hoggrp-2 {
> +			fsl,pins =3D <
> +				MX7D_PAD_GPIO1_IO05__GPIO1_IO5    0x14
> +				MX7D_PAD_GPIO1_IO07__GPIO1_IO7    0x59
> +				MX7D_PAD_GPIO1_IO00__WDOD1_WDOG_B 0x74

In my opinion this should still be in the pincontrol for the watchdog
instead of hogging. Also it is not obvious what the GPIOs are for.

Regards,

Markus

> +			>;
> +		};
> +	};
> +};
> --=20
> 2.1.4
>=20
>=20
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--fUvfsPTz/SzOZDdw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWBSayAAoJEEpcgKtcEGQQa1gP+QGgUas1Z23SNPvhGzauJ+Nu
9zgKFc6YkWBOY8IJiHBaV+mo5VfbBXBion6/Q0OTjKTPV7jCnP4pQKd4yDe47c5Z
sUEDSvO7XTELYofcxAeyp5cJF2gnG5qmUeyvv/QbrdiTBcmxwlpQPBqXOIJnihYV
/DhbFsunDO16sb3i3GyUEa3258qxuWAo56PoL/++ocma5DdSi4Uq/iC0tjUzaHEi
lNwQgM8Y9AJJ4oMpGf8mJfCIxA3PTvIA8N75CRnoRDGI0y3Bln9l7mJy7+1sijWA
wCEq+D9lSCdW7/8Nbm4dsMHEsvdj7Wq/3cMqWwMSWjR6t0FMrHIPIGpWShlhX7Lt
HLnB44hmZ3w2RiO1NFiV7ySn8ZcaWMPNqQVyooXjDci6uCbfcwF0Fu6aUlO2OyIS
VgXdhdYNel+/OT5v3Pao+XKxpMIUC6r74XgGIMBVOEpwc95svXs0QrNav3lQQY0V
HVGQU3DuIr5EnfiQNJzZHh7Ntv93BaE3O234KtBvHADnDTPk5v7X46sXCXo2nh1J
AX4Hq9hwiVafYoteZhyGiluJGJR11GyifgprZLgpc/oOlEnYYD+80NGdqPQJ+L/i
Mj2GRBKdiqcs50XcG5rvSEXw5OkspSyDJhrFgW41XLh3zfFtS5YiAGOCZF2kB09E
rXOSTcoDgf6f/aXgKjg8
=WQPW
-----END PGP SIGNATURE-----

--fUvfsPTz/SzOZDdw--
