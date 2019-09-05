From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] regulator: fixed: add possibility to enable by clock
Date: Thu, 5 Sep 2019 19:06:15 +0100
Message-ID: <20190905180615.GG4053@sirena.co.uk>
References: <20190903080336.32288-1-philippe.schenker@toradex.com>
 <20190903080336.32288-2-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MiFvc8Vo6wRSORdP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190903080336.32288-2-philippe.schenker@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Max Krummenacher <max.krummenacher@toradex.com>, Rob Herring <robh+dt@kernel.org>, Stefan Agner <stefan.agner@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>, Luka Pivk <luka.pivk@toradex.com>
List-Id: devicetree@vger.kernel.org


--MiFvc8Vo6wRSORdP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 08:03:46AM +0000, Philippe Schenker wrote:
> This commit adds the possibility to choose the compatible
> "regulator-fixed-clock" in devicetree.
>=20
> This is a special regulator-fixed that has to have a clock, from which
> the regulator gets switched on and off.

This seems conceptually fine.  Minor issues though:

> +static int reg_clock_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct fixed_voltage_data *priv =3D rdev_get_drvdata(rdev);
> +
> +	if (priv->clk_enable_counter > 0)
> +		return 1;
> +
> +	return 0;
> +}

This could just be return priv->clk_enable_counter > 0 - ideally the
clock API would let us query if the clock is enabled but that might be a
bit confused anyway given that it's possibly shared.

--MiFvc8Vo6wRSORdP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1xTpYACgkQJNaLcl1U
h9AsqAf/caqc82p8eTjLhI9qV1ov43qSU0Lx+x0l1/34fodrmhwX+985ieiCqPdK
YcQ+SBMd4NxLjLcIW7g6JNEhl7jK9Rf/JCdFqzTfLwH5PtuU9N7/NSkDVnHJT+Il
7vZxg1enEl9P7kopxqGJeWD9TIdwrLbLTrHeT+k65BfrXkYZqdCFwgRySuA2bJv1
ReQyGwWgKs9dHDKvFOcMUuFN8NII62VgdZ3v5nhNVtzsBqDjDpId9rk/2HhTUB6O
Cxandr5b4mTQ2E2XZ4zNY++IFnMACM+Jk82jFpbaBX6faVMdJnb2TobZt2C+pGOp
xTpfGM2727C2Yx2TU0BTn9qgDEHuNg==
=FHl0
-----END PGP SIGNATURE-----

--MiFvc8Vo6wRSORdP--
