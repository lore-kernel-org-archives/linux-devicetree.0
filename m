From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V1 3/3] regulator: slg51000: add slg51000 regulator driver
Date: Tue, 16 Apr 2019 16:24:48 +0100
Message-ID: <20190416152448.GC4834@sirena.org.uk>
References: <cover.1555389447.git.eric.jeong.opensource@diasemi.com>
 <5e4a6a007e45feac6d35203305cafd865be48755.1555389447.git.eric.jeong.opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5e4a6a007e45feac6d35203305cafd865be48755.1555389447.git.eric.jeong.opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Jeong <eric.jeong.opensource@diasemi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-KERNEL <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2019 at 01:37:27PM +0900, Eric Jeong wrote:

> +static int slg51000_regulator_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct slg51000 *chip =3D rdev_get_drvdata(rdev);
> +	int ret, id =3D rdev_get_id(rdev);
> +	unsigned int state;
> +
> +	ret =3D regmap_read(chip->regmap, es_reg[id].sreg, &state);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "Failed to read status register(%d)\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	if (!(state & SLG51000_STA_ILIM_FLAG_MASK) &&
> +	    (state & SLG51000_STA_VOUT_OK_FLAG_MASK))
> +		return 1;
> +	else
> +		return 0;

This looks like it should be a get_status() operation as it's reading
status bits rather than the command we sent to the device - for that
just use regulator_is_enabled_regmap(). =20

Otherwise this all looks great.

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAly188AACgkQJNaLcl1U
h9A9kgf/SxzEZiZ5nf8g1+aL08hUyDRPIRQDtAHgEU9JWSsQXFe/aVf4ofnAVIo/
N+oy8hSnaOanH3WXRikr4FqJ61ola2ffeugPM5rT3Tw55CSwgqLPaEOMSn+XzXPd
y37fxJR/x+ebkcYwzzOIM/R6xMcn8LMrCZHH6X4eZGKYnB9+FlmUMzWt1oVxkdVI
9TPDB6Lskkplp8DFTv08A1sCC5giDARen1gBNIGYGueryRjAoU+K2+8ChoEi+IWf
Qq4vPgrqWdiwNQXmHSvW76gtkzWKZWCiPFvXMPZWlzy2l/mmUGl6K+eEcMVMPWpF
ICzk5mRS58a90vDSNOmTgisvnxgvnQ==
=shk/
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--
