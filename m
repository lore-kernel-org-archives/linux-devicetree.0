From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: act8865: operating mode and suspend state
 support
Date: Mon, 12 Aug 2019 12:10:11 +0100
Message-ID: <20190812111011.GF4592@sirena.co.uk>
References: <1565423335-3213-1-git-send-email-raagjadav@gmail.com>
 <1565423335-3213-2-git-send-email-raagjadav@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QXO0/MSS4VvK6f+D"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565423335-3213-2-git-send-email-raagjadav@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Raag Jadav <raagjadav@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org


--QXO0/MSS4VvK6f+D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 10, 2019 at 01:18:54PM +0530, Raag Jadav wrote:

> +static int act8865_set_mode(struct regulator_dev *rdev, unsigned int mode)
> +{
> +	struct act8865 *act8865 = rdev_get_drvdata(rdev);
> +	struct regmap *regmap = rdev->regmap;
> +	int id = rdev_get_id(rdev);
> +	int reg, ret, val = 0;

This function doesn't check if the mode is _FIXED - if it is then I'd
expect to get an error when trying to set the mode (I'm assuming that
means fixed in hardware).

> +static unsigned int act8865_get_mode(struct regulator_dev *rdev)
> +{
> +	struct act8865 *act8865 = rdev_get_drvdata(rdev);
> +	int id = rdev_get_id(rdev);
> +
> +	if (id < ACT8865_ID_DCDC1 || id >= ACT8865_ID_MAX)
> +		return -EINVAL;
> +
> +	return act8865->op_mode[id];
> +}

This should be reading the value back from the hardware.

--QXO0/MSS4VvK6f+D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1RSRIACgkQJNaLcl1U
h9BhNQf7B2/bNkk+XZ0e/tSVOzn00nt73fznt5qCrh7/yAtFkVxdf6LjfSE1npvK
SueIulSiA0j0bCBr//JcD19lDdGzdrCH3+bc6vRFfFSOo5tJfqsm/gCYJg8k86uS
1uT4fRIJfp0dVtG0CADCY1mxAY3bltg8TRHKudtQHv9bV5Wm0iV7oQrcSrttowCk
HgsoWDMg6VHDp+kxoPt1GzP7vlIB85KOGpjq7wY0/LCPih+/rwbmvTC36KXtrD9o
3bm949Pf2aw/x1EQ8ImqVBpJmtq8gWTjhjMe7VWwhu5LuLu2UD22HvkkcA9pp7tB
LEr7wsIbp2dzxwUgLWZZgVDRzNRDyg==
=N1iA
-----END PGP SIGNATURE-----

--QXO0/MSS4VvK6f+D--
