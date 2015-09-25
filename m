From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v5 4/7] pinctrl: freescale: imx: allow mux_reg offset zero
Date: Fri, 25 Sep 2015 12:47:26 +0200
Message-ID: <20150925104726.GJ11805@pengutronix.de>
References: <1443128043-21063-1-git-send-email-aalonso@freescale.com>
 <1443128043-21063-4-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="va4/JQ6j8/8uipEp"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443128043-21063-4-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Adrian Alonso <aalonso@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com, devicetree@vger.kernel.org, Frank.Li@freescale.com, nitin.garg@freescale.com, Anson.Huang@freescale.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, yibin.gong@freescale.com
List-Id: devicetree@vger.kernel.org


--va4/JQ6j8/8uipEp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2015 at 03:54:00PM -0500, Adrian Alonso wrote:
> Allow mux_reg offset zero to be a valid pin_id, on imx7d
> mux_conf reg offset is zero for iomuxc-lspr controller
>=20
> Signed-off-by: Adrian Alonso <aalonso@freescale.com>
> ---
> Changes for V2: Resend
> Changes for V3: Resend
> Changes for V4: Simplify pin_id assigment when ZERO_OFFSET_VALID is set
> Changes for V5:
> - Drop patch pinctrl: freescale: imx: add ZERO_OFFSET_VALID flag
> - Allow mux_reg ZERO OFFSET as pin_id
>=20
>  drivers/pinctrl/freescale/pinctrl-imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/fr=
eescale/pinctrl-imx.c
> index b9c6deb..23348d8 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -550,7 +550,7 @@ static int imx_pinctrl_parse_groups(struct device_nod=
e *np,
>  				conf_reg =3D -1;
>  		}
> =20
> -		pin_id =3D mux_reg ? mux_reg / 4 : conf_reg / 4;
> +		pin_id =3D (mux_reg !=3D -1) ? mux_reg / 4 : conf_reg / 4;

This will break compatibility with imx35 and imx25 pinctrl drivers. They
have definitions where mux_reg can be 0x0. See imx35-pinfunc.h and
imx25-pinfunc.h:

	git grep -E "0x0+ 0x.* 0x.* 0x.* 0x.*"

This mux_reg behaviour was not described in the DT binding
documentation. But it is used by some platforms. So even if you change
the pincfunc headers to use "-1", it would break devicetrees compiled
with earlier kernel versions.

Regards,

Markus

>  		pin_reg =3D &info->pin_regs[pin_id];
>  		pin->pin =3D pin_id;
>  		grp->pin_ids[i] =3D pin_id;
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

--va4/JQ6j8/8uipEp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWBSY+AAoJEEpcgKtcEGQQi1oP/1xLdcApkQnCkQXArBj0fUn5
1Ru/fAkS1rPoI425kHk6fBlOCi5cpjvFSXWPKr7lP4m3oFFdhu+WOTDD4rdCEVe8
sHBsNw4LF6hF5LpvaQNxUecFlLxjIHruAHc9Id4ZTfqXdEv6zs0SueX/wBE3bdRb
ZuHQCdA8+NEFaYgNyX+xO05aMg2ONSO0gsn14Z7VM7or7qi0UKrZvi28BMHiEsTC
joMAvsb3CUF/4Du6YR2CyASu3O8EYrG6KnYwZh8+DCaDMXPJWDIQQzKurT1V3wQf
lyKp/NFgEO0IAS9KffJiZc3Yj8mrU4GpfEC+9LyXcWI6u5urHA/qKcDcmeMD46Xt
rAexs9YjGbVF5PQh5wQvAOq4Bd3zs6D9Y0BEyi05geJmkHBIKXze2YP8eMNyN/4O
S3NVEKyxf0xVT7CNWTIjAWKZEd7rST3wmCDvcTQfhByr6QhBTUMkoxyfXiqq2dUU
URG8GNg7hpIpHPdo+u0YOjBrxIrQ701JEfYTq27mDPam6pA3YLIX/LEpwBs165JV
sAXdSakdMeN3VPvozhUoj+Ck2zu55Ga5Ds+fumap1nOZFZFsG3SEvB+DW/75iO5c
pk8TNgk1QsbntncMn/r26/H7CU6Hw8Yc0IbNlE4d2DGROwCeP6sogblufXDpQkMH
tLrEofsZABuCu8aVQfmz
=fo/7
-----END PGP SIGNATURE-----

--va4/JQ6j8/8uipEp--
