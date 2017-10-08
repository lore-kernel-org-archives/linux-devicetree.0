From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH v2 5/7] pinctrl: mcp23s08: add open drain configuration
 for irq pinctrl
Date: Sun, 8 Oct 2017 23:16:55 +0200
Message-ID: <20171008211655.7o77rxdxvsf44xds@earth>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
 <1507266491-73971-6-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="esa4wbxilwcpwar2"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507266491-73971-6-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, poeschel@lemonage.de, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--esa4wbxilwcpwar2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 06, 2017 at 01:08:09PM +0800, Phil Reid wrote:
> The mcp23s08 series device can be configured for wired and interupts
> using an external pullup and open drain output via the IOCON_ODR bit.
> And "microchip,irq-open-drain" property to enable this.
>=20
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

-- Sebastian

> ---
>  drivers/pinctrl/pinctrl-mcp23s08.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
> index 8d356df..150f216 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -780,6 +780,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, s=
truct device *dev,
>  {
>  	int status, ret;
>  	bool mirror =3D false;
> +	bool open_drain =3D false;
> =20
>  	mutex_init(&mcp->lock);
> =20
> @@ -876,6 +877,8 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, s=
truct device *dev,
>  					      "microchip,irq-active-high");
> =20
>  		mirror =3D device_property_read_bool(dev, "microchip,irq-mirror");
> +		open_drain =3D device_property_read_bool(dev,
> +						    "microchip,irq-open-drain");
>  	}
> =20
>  	if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror ||
> @@ -891,6 +894,9 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, s=
truct device *dev,
>  		if (mirror)
>  			status |=3D IOCON_MIRROR | (IOCON_MIRROR << 8);
> =20
> +		if (open_drain)
> +			status |=3D IOCON_ODR | (IOCON_ODR << 8);
> +
>  		if (type =3D=3D MCP_TYPE_S18 || type =3D=3D MCP_TYPE_018)
>  			status |=3D IOCON_INTCC | (IOCON_INTCC << 8);
> =20
> --=20
> 1.8.3.1
>=20

--esa4wbxilwcpwar2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlnalccACgkQ2O7X88g7
+po/UQ/+PTslzdXCaU71U8tNGfO2DRGgpHM1EdGftRp3tVgHaV+YHlHMRWRX0om9
fyprn7yOyljSNv5U2U9/UGiqI4frO/Fmj13iWJR4ODXRlJ0EIwiNRZiptHVQq5HC
9w+vCnyo02D4qNQJ2kl3zWJApvUj7ANe+X1ydx3jCexMmm6RS94MQEvETEEl/yOu
D5MRW3rLe5K2eXaxECvL78HY4I/YRvnhY9AaQjY+8AejqilUQqMZrN6Q2YBoUaDm
TZAKRigtG5gO2k4oEnHBksf3lsf75W87GZrKy2EaAuXdiL/hB5nE89zM8Xpk43rg
peFORZRNq8cYm+8Kdo/SQcyZ/E/f614nqmMKxTodoSX/CsWP+WVjONaTorzar25p
zv8ZAnS/RyWkhknDBBZKWJHOUWi5gtIQazEYKjueYIKGZXdKxR4MuDV8NZ+Tj8nY
cuj+nXClSYpTUF2zdi52uQSLN3BYnF7PRpV13V3v0chEeYazdTAfUeKi6AplDU/X
MVCFO64zB2kGJ/TjIzqmefNAacxu6ehg7yklZ5tGQ0vXWbS3PLkodTAVIU5xL2Xg
t5z1ubDOC5wRVoV5mi3qhRt1eV1vNVzoSfCnt5867Dex5EUEoKZL0BaTiQDRA0QC
6FdVJiB9xUnIDgj+v4Rwgy69IvVznbqHzIFRlT0NYkTNP13hP5U=
=WbL2
-----END PGP SIGNATURE-----

--esa4wbxilwcpwar2--
