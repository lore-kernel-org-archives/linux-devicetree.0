From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 8/8] pinctrl: freescale: imx: fix system crash if enable
 two pinctl instances
Date: Wed, 19 Aug 2015 08:14:58 +0200
Message-ID: <20150819061458.GH11161@pengutronix.de>
References: <1439912939-17535-1-git-send-email-aalonso@freescale.com>
 <1439912939-17535-8-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OfrWf2Fun5Ae4m0Y"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439912939-17535-8-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Adrian Alonso <aalonso@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com, devicetree@vger.kernel.org, Frank.Li@freescale.com, nitin.garg@freescale.com, Anson.Huang@freescale.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org, yibin.gong@freescale.com
List-Id: devicetree@vger.kernel.org


--OfrWf2Fun5Ae4m0Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2015 at 10:48:59AM -0500, Adrian Alonso wrote:
> From: Robin Gong <b38343@freescale.com>
>=20
> Remove 'static' for 'grp_index', otherwise, it cause the groups whose num=
ber is
> smaller than the number of groups of the last pinctl instance never to be
> intialized, thus cause system crash as below

grp_index is used as array index. If you remove 'static' from this
variable doesn't it always write to array element 0 and overwrite the
last group?

Regards,

Markus

>=20
> [    0.661012] [<802a6cb0>] (strcmp) from [<802cc80c>] (imx_dt_node_to_ma=
p+0x58/0x208)
> [    0.668879] [<802cc80c>] (imx_dt_node_to_map) from [<802cbe24>] (pinct=
rl_dt_to_map+0x174/0x2b0)
> [    0.677654] [<802cbe24>] (pinctrl_dt_to_map) from [<802c8f18>] (pinctr=
l_get+0x100/0x424)
> [    0.685878] [<802c8f18>] (pinctrl_get) from [<802c9510>] (pinctrl_regi=
ster+0x26c/0x480)
> [    0.694104] [<802c9510>] (pinctrl_register) from [<802ccf3c>] (imx_pin=
ctrl_probe+0x580/0x6e8)
> [    0.702706] [<802ccf3c>] (imx_pinctrl_probe) from [<80351b58>] (platfo=
rm_drv_probe+0x44/0xa4)
> [    0.711455] [<80351b58>] (platform_drv_probe) from [<803503ec>] (drive=
r_probe_device+0x174/0x2b4)
> [    0.720405] [<803503ec>] (driver_probe_device) from [<803505fc>] (__dr=
iver_attach+0x8c/0x90)
> [    0.728982] [<803505fc>] (__driver_attach) from [<8034e930>] (bus_for_=
each_dev+0x6c/0xa0)
> [    0.737381] [<8034e930>] (bus_for_each_dev) from [<8034fb88>] (bus_add=
_driver+0x148/0x1f0)
> [    0.745804] [<8034fb88>] (bus_add_driver) from [<80350c00>] (driver_re=
gister+0x78/0xf8)
> [    0.753880] [<80350c00>] (driver_register) from [<800097d0>] (do_one_i=
nitcall+0x8c/0x1d4)
> [    0.762282] [<800097d0>] (do_one_initcall) from [<80987dac>] (kernel_i=
nit_freeable+0x144/0x1e4)
> [    0.771061] [<80987dac>] (kernel_init_freeable) from [<806d9c7c>] (ker=
nel_init+0x8/0xe8)
> [    0.779285] [<806d9c7c>] (kernel_init) from [<8000f628>] (ret_from_for=
k+0x14/0x2c)
> [    0.786981] Code: e3520000 e5e32001 1afffffb e12fff1e (e4d03001)
>=20
> Signed-off-by: Robin Gong <b38343@freescale.com>
> Signed-off-by: Adrian Alonso <aalonso@freescale.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/fr=
eescale/pinctrl-imx.c
> index 3e02887..cdb5463 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -595,7 +595,7 @@ static int imx_pinctrl_parse_functions(struct device_=
node *np,
>  	struct device_node *child;
>  	struct imx_pmx_func *func;
>  	struct imx_pin_group *grp;
> -	static u32 grp_index;
> +	u32 grp_index =3D 0;
>  	u32 i =3D 0;
> =20
>  	dev_dbg(info->dev, "parse function(%d): %s\n", index, np->name);
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

--OfrWf2Fun5Ae4m0Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV1B7iAAoJEEpcgKtcEGQQ9eoQAKjliOzoR4rRsE4ATikLPrDv
6qYH5V+uyviR+HV9kLc3VL/SOcTwHr1ecW9K7uYiynq+y7/ANDzDTuP5QlHOUPE5
lMv3WMTNQCngI2KXPDjqcOQOvJGap6xnB3/+8bRkjgmzTDFQ7QP86ea59x4ELalc
OPKTNwFcf/n2VOP5Ok2hSHQeh1tc7erM2JwJlge8ta/TxvqMZqy9GvY5a438p/Eo
eOm1sCzJndraylxfZyvqYtXhPs1IGu5xhvO20X42PZNwTGC0ixlNG/lYuDfjhG+/
ZaM0ZjPX8VawdOC2Wf01gE7l6+LxjPZUrZpriQgM8PidBu9leda5uFpB3qV1A0GX
YMnrUF0oGOl449CDQ6PgrtJCIBCi09QxoOYmSlPEbh9dp3S0mE8ysBka+8djbDLQ
bnETK7fbAd8F23h8qEQ7VFrQzgmjnIf1+UcbBrqf/1BeG/fhcrEOyFbg1xNqeaSp
XDlxJNqd7z015wW9wddgIs/7ETJ18IXUCp1aOloqtSkBplD7eOTg6A5JOS+pF2Kn
fpLKzAc+BIZXT8oYqpopFRFNtCrkfJtf5in8azIBppRRrmBb3I4w/jY9A3v0pF9G
UctbMGwCJmfWgdFoTMBoiPQktmDkCEg3Py46HyFNyy1bjh4O+04tiQO7+iAwlV6k
TWuq26BrFqEz6E1hUnfi
=sH+O
-----END PGP SIGNATURE-----

--OfrWf2Fun5Ae4m0Y--
