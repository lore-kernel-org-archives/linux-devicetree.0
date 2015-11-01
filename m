From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 5/6] regulator: tps65086: Add regulator driver for the
 TPS65086 PMIC
Date: Sun, 1 Nov 2015 11:37:35 +0900
Message-ID: <20151101023735.GE28319@sirena.org.uk>
References: <1446244904-29315-1-git-send-email-afd@ti.com>
 <1446244904-29315-6-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cHOhevsz5PKyTXvv"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446244904-29315-6-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--cHOhevsz5PKyTXvv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 30, 2015 at 05:41:43PM -0500, Andrew F. Davis wrote:

> +struct tps65086_regulator {
> +	struct regulator_desc desc;
> +	unsigned int decay_reg;
> +	unsigned int decay_mask;

The decay_reg and decay_mask fields appear to be entirely write only,
why are they present?

> +	ret = of_regulator_match(&pdev->dev, pdev->dev.of_node,
> +				 tps65086_matches,
> +				 ARRAY_SIZE(tps65086_matches));
> +	if (ret < 0) {
> +		dev_err(tps->dev, "Error parsing regulator init data\n");
> +		return ret;
> +	}

Please match regulators using the fields in the regulator_desc rather
than open coding.

--cHOhevsz5PKyTXvv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWNXruAAoJECTWi3JdVIfQ6akH/1bHKm0IO3b4+1k8ucZj2yZ4
LZXQ5M5R5sqP7nJFMQBW0d09/XYRJlY/22mGiM251ZWbhru0/XXiLVUG/D/2raGw
fRPFlTJFINPS/GI6SsHCudJmP0E1I0lh0oAgOmiTPv9NyEprmWABHTRU0pd9Y2Oi
nmuIbi09MKsoom4WgK3FwJXgUvPuEbt829K2701IpvJPLom6573Ejgcr+HvLTcx9
ytdp7i9IpO37tpan4sa6o2CvnOEwxTKuHLDoDHs+13IMPLNMMfmog5aguEHVssJm
miQBi7gQOk8Hjw8JH5olEUH6gbqeIN5Bc6nO4CReP4ubdDIaekCay/NcfbB12l0=
=9eMl
-----END PGP SIGNATURE-----

--cHOhevsz5PKyTXvv--
