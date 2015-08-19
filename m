From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 7/8] pinctrl: freescale: imx: fix flat functions default
 return
Date: Wed, 19 Aug 2015 08:12:11 +0200
Message-ID: <20150819061211.GG11161@pengutronix.de>
References: <1439912939-17535-1-git-send-email-aalonso@freescale.com>
 <1439912939-17535-7-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Enx9fNJ0XV5HaWRu"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439912939-17535-7-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Adrian Alonso <aalonso@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com, devicetree@vger.kernel.org, Frank.Li@freescale.com, nitin.garg@freescale.com, Anson.Huang@freescale.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org, yibin.gong@freescale.com
List-Id: devicetree@vger.kernel.org


--Enx9fNJ0XV5HaWRu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2015 at 10:48:58AM -0500, Adrian Alonso wrote:
> Fix imx pinctrl dt flat functions default return value.
> If property fsl,pins is not found in function_np and
> pinctrl_np return false to indicate that DT is not using
> flat functions.

The for loop in this function checks the child nodes and the child's
child nodes. Therefore if we exit the for loop we didn't find any nodes
on any level with the 'fsl,pins' property.

So this 'default' return value is never used unless there is no fsl,pins
property anywhere. So this return value is not important but I wrote
true because we want to use the new flat dt option as default. The extra
indention doesn't make sense anymore.

Regards,

Markus

>=20
> Signed-off-by: Adrian Alonso <aalonso@freescale.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/fr=
eescale/pinctrl-imx.c
> index 1009b52..3e02887 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -641,7 +641,7 @@ static bool imx_pinctrl_dt_is_flat_functions(struct d=
evice_node *np)
>  		}
>  	}
> =20
> -	return true;
> +	return false;
>  }
> =20
>  static int imx_pinctrl_probe_dt(struct platform_device *pdev,
> --=20
> 2.1.4
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--Enx9fNJ0XV5HaWRu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV1B47AAoJEEpcgKtcEGQQ74gQAKfOXpQH7YhUX98AI8CW9hEl
F0WAMHjQr9KeQD6Yaa/SMBdlQ59zVCBgg35Wft9l3cHKaui5hzfEZH54CabOy8Pr
Ydwys4DwNe56Hw3C1jdgobGY/7gN6A8O7ovzXDaxgAcDqtEV0SjcizThETUOzhQd
E4YytlBKAJqGvM+iRmEIsK02LkoGKLveucu+6vfwtkwTxMVAkNCTISMaOSSdTBu2
Bdke78X0005kKk4Lxw3xd0IeeSQJLVASPzMNwm8oMTzFS1NJsTwq++rAK78a9cuo
nM6A9TvPlmCdro7bQ6asDSfRtehzFhsXsIPUuZMisddYFkslrhbJb9ASp1JI+Jjr
bKg0SntGgTcsbLsSprVTJ/5pEdR28ZiQQxUDM9CYKx1zo0DyBUGF9XALJuf2feof
L4DUmD4x8Nm1G6DWCo+MpRgORspFSBY2294PBHQiQis16L8i1GHo6TeXERpvDSnz
sANd7XdFFEp7Bp3LLfhCXkzXmblmkWK9mpgaN2fGSckPrZJe7XDxX6QCm9qq96uB
kejk+0vw6TBm0awDpuGEqru931ZNiEfl07c4ZGghaSShEwqhdpUvoFiTJhvbw6FG
jvud3D3+hM8HQjXG7TFLHNClrx+eVQmIm3bLzHsCJ1DP+oTexlAqM5x1GvPALkj0
pF22P4C/znani4hj8Xxn
=U3GW
-----END PGP SIGNATURE-----

--Enx9fNJ0XV5HaWRu--
