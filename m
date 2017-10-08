From: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v2 3/7] gpio: mcp23s08: add support for mcp23018
Date: Sun, 8 Oct 2017 23:18:22 +0200
Message-ID: <20171008211821.vege3ytdu5bnu35p@earth>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
 <1507266491-73971-4-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xviwyby347e4j52l"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1507266491-73971-4-git-send-email-preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xviwyby347e4j52l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 06, 2017 at 01:08:07PM +0800, Phil Reid wrote:
> This adds the required definitions for the mcp23018 which is the i2c
> variant of the mcp23s18.
>=20
> Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

-- Sebastian

>  drivers/pinctrl/pinctrl-mcp23s08.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
> index 3e40d42..8d356df 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -25,6 +25,7 @@
>  #define MCP_TYPE_008	2
>  #define MCP_TYPE_017	3
>  #define MCP_TYPE_S18    4
> +#define MCP_TYPE_018    5
> =20
>  #define MCP_MAX_DEV_PER_CS	8
> =20
> @@ -837,6 +838,13 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, =
struct device *dev,
>  		mcp->chip.ngpio =3D 16;
>  		mcp->chip.label =3D "mcp23017";
>  		break;
> +
> +	case MCP_TYPE_018:
> +		mcp->regmap =3D devm_regmap_init_i2c(data, &mcp23x17_regmap);
> +		mcp->reg_shift =3D 1;
> +		mcp->chip.ngpio =3D 16;
> +		mcp->chip.label =3D "mcp23018";
> +		break;
>  #endif /* CONFIG_I2C */
> =20
>  	default:
> @@ -883,7 +891,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, s=
truct device *dev,
>  		if (mirror)
>  			status |=3D IOCON_MIRROR | (IOCON_MIRROR << 8);
> =20
> -		if (type =3D=3D MCP_TYPE_S18)
> +		if (type =3D=3D MCP_TYPE_S18 || type =3D=3D MCP_TYPE_018)
>  			status |=3D IOCON_INTCC | (IOCON_INTCC << 8);
> =20
>  		ret =3D mcp_write(mcp, MCP_IOCON, status);
> @@ -964,6 +972,10 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, =
struct device *dev,
>  		.compatible =3D "microchip,mcp23017",
>  		.data =3D (void *) MCP_TYPE_017,
>  	},
> +	{
> +		.compatible =3D "microchip,mcp23018",
> +		.data =3D (void *) MCP_TYPE_018,
> +	},
>  /* NOTE: The use of the mcp prefix is deprecated and will be removed. */
>  	{
>  		.compatible =3D "mcp,mcp23008",
> @@ -1013,6 +1025,7 @@ static int mcp230xx_probe(struct i2c_client *client,
>  static const struct i2c_device_id mcp230xx_id[] =3D {
>  	{ "mcp23008", MCP_TYPE_008 },
>  	{ "mcp23017", MCP_TYPE_017 },
> +	{ "mcp23018", MCP_TYPE_018 },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(i2c, mcp230xx_id);
> --=20
> 1.8.3.1
>=20

--xviwyby347e4j52l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlnalh0ACgkQ2O7X88g7
+prc8xAAgPLOtvbJ9ADyCNoRmSwH8r330k0rOfg6IdmZvAlGz5k/dQonVN1kfY9P
IoJ6gMPpCllu9FzMEAWkrLkA3VIwFuzU62gIhOf5m1s554zdH+lbw6Fa35PMQAXB
/MrWMZedL4TJDeSs6SkfmROKijKvSdcw4Xuz+NBlmJbxCSGC2IWTFQoOV0qZYF/H
sPshCaMGQW5x7iCS5sufB5AQ7C/aRJz7+9XIgxVWPe9XWcUUQKXJkQUGNM8BU6YH
HVs6BCDmp/nFwDnilLtgbvw84HB6QXqvOljghJ5rlyTF+Y4kIwr0kIib3yOY4MpX
s/aqRzfrBmhnPU/TLV/e6mIcAqH876J2bm4lB/lrCfYo5iYh/mjwZoLRK1yKAOJR
RfkR2h2iXfYJdPKubBUOn3AdZa1YdcDb1P56whmvs5LbKi4IyaWzXWMMg/bRIsBZ
5vJk7eq+tjtCZ+XtbL7MCGgpw/kRFrNYvEPrXV3txL0FYc3eDLg9bMUc2B1f6XLD
obSHA/UOvvLlx7KeuaXH41ChiXFnvwHPYiLstgJlQqfGhVJPH5PPmc/2GPi3f0cB
bpMV7Ozuv+QahyLBJRjxDlb8u9WnsfnAlnRFv9m1/+3Q7Abn2zFtVU/gKhSSp2oP
FUuof85wmozbKokm3Fv4LORq+YE8G1DzaVNo/JiivMif2zHWidk=
=/+dz
-----END PGP SIGNATURE-----

--xviwyby347e4j52l--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
