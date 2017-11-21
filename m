From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v3 3/5] pinctrl: mcp23s08: add open drain configuration
 for irq output
Date: Tue, 21 Nov 2017 13:57:14 +0100
Message-ID: <20171121125714.heedzksfauguufyl@earth>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
 <1511252491-79952-4-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mcafpix7gshk3qkc"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1511252491-79952-4-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--mcafpix7gshk3qkc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 21, 2017 at 04:21:29PM +0800, Phil Reid wrote:
> The mcp23s08 series device can be configured for wired and interrupts
> using an external pull-up and open drain output via the IOCON_ODR bit.
> And "drive-open-drain" property to enable this.
>=20
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

-- Sebastian

>  drivers/pinctrl/pinctrl-mcp23s08.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
> index cc1f9f6..8ff9b77 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -772,6 +772,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, s=
truct device *dev,
>  	int status, ret;
>  	bool mirror =3D false;
>  	bool irq_active_high =3D false;
> +	bool open_drain =3D false;
> =20
>  	mutex_init(&mcp->lock);
> =20
> @@ -867,10 +868,11 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp,=
 struct device *dev,
>  					      "microchip,irq-active-high");
> =20
>  		mirror =3D device_property_read_bool(dev, "microchip,irq-mirror");
> +		open_drain =3D device_property_read_bool(dev, "drive-open-drain");
>  	}
> =20
>  	if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror ||
> -	     irq_active_high) {
> +	     irq_active_high || open_drain) {
>  		/* mcp23s17 has IOCON twice, make sure they are in sync */
>  		status &=3D ~(IOCON_SEQOP | (IOCON_SEQOP << 8));
>  		status |=3D IOCON_HAEN | (IOCON_HAEN << 8);
> @@ -882,6 +884,9 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, s=
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

--mcafpix7gshk3qkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAloUIqkACgkQ2O7X88g7
+poWtQ/8DIVazVg0aazKCjmSkbkuGjj10VcfcVMbL2X0fjNj0LPMUegJsytfafNy
ZP+zFKAPopnmNyfNMlVEJq001OMKwHRjXyTbstGltQQ2XQ/HAnVb8s4VpMvNtFPk
YYHyuM/DC2CNZOR01ND6kkY+tCeR1gGn9wsCMgu/CCkTrtKctxK8RP0XihsE+4Lu
ZT4//ZfWV+qXEOjeMAxldajdokJUskozhU0EOv6gx4Ba28Krj4J+94SV8XSGQZsK
YCpQWOD5l9zK4mQcNIFWaYaVSIlWrH6v3NkNomioRyZT1JsT4ZXxcYFkZz8qHYS0
ISkgd3IJ80JObJdeTiBFV4da1VeWBnQCJO0yDg2mxBmimMOqM+SNstqLMOoXrATc
AFBmtMq/0CmWXQSeD/x/Gj5zhEkVfVGycrvjdIqlA1z1aYRHMw6/LE4tC3ZXlc58
1ZVAE+Rwiu9kRA9P25O8CI+e2WEXoskrjjQ82QkXxqyLe87TcZ5lXNNvUHjEbomL
oJaXNMXOrUYmFM9iaPdmo4Hn+MnSna+PPksPzU1r6ZTVSR3qVZNQyWmlfLe2vEbO
YZlDvaJppAVx2PfwKoW8zi6n+G+/KCcHXTxQRbtx9GiuORuagVOTljxuL7aUcjNn
nBVr2zGH4W6XsleiSVc7kF2VO3Z2XtXwMsR9gJNzss6fAHo7GvA=
=UhIo
-----END PGP SIGNATURE-----

--mcafpix7gshk3qkc--
