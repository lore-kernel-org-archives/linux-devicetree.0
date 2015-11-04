From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND 16/16] regulator: add LM363X driver
Date: Wed, 4 Nov 2015 13:59:11 +0000
Message-ID: <20151104135911.GC1717@sirena.org.uk>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-17-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446441875-1256-17-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2015 at 02:24:35PM +0900, Milo Kim wrote:

This looks mostly good, just a few fairly small things:

> +lm363x_regulator_of_get_init_data(struct device *dev,
> +			struct lm363x_regulator *lm363x_regulator, int id)
> +{
> +	struct device_node *np = dev->of_node;
> +	int count;
> +
> +	count = of_regulator_match(dev, np, &lm363x_regulator_matches[id], 1);
> +	if (count <= 0)
> +		return ERR_PTR(-ENODEV);
> +
> +	return lm363x_regulator_matches[id].init_data;
> +}

Don't open code DT matching, use of_match in the regulator_desc and let
the core do it for you.

> +	/*
> +	 * Check LCM_EN1/2_GPIO is configured.
> +	 * Those pins are used for enabling VPOS/VNEG LDOs.
> +	 */
> +	if (id == LM3632_LDO_POS)
> +		gpio = of_get_named_gpio(np, "ti,lcm-en1-gpio", 0);
> +	else if (id == LM3632_LDO_NEG)
> +		gpio = of_get_named_gpio(np, "ti,lcm-en2-gpio", 0);

This looks like it should be a switch statement.

> +	rdev = regulator_register(&lm363x_regulator_desc[id], &cfg);
> +	if (IS_ERR(rdev)) {

Use devm_regulator_register().

> +static const struct of_device_id lm363x_regulator_of_match[] = {
> +	{ .compatible = "ti,lm363x-regulator" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, lm363x_regulator_of_match);

You shouldn't need a compatible string for a device like this, the MFD
should just register a platform device based on the compatible string
for the MFD.

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWOg8uAAoJECTWi3JdVIfQahQH/RcbMR6g3gAcvApQiYSNMn0p
AesBCEMUjNBQvyokVRnAg2KVJVgUX98YTwGa+g04igD5vEz04ji6MAefSz944m5T
SmElpGN4ZU4jKOCaFNwOHf+RCSee7/K/iQPYd3UyUJ1djL3U798uso34yrRd6L2s
dR24lfWG2+CoSZuTw1xTeVemtdvZAbsO6BWVmJICUIzGZ3QXewAPJOdEkUXAs2LH
4Rng3M4H8LQLSOFTMijC5QMKkIBinu9r8U+gY68aU1hyzbK+ZzKVAYZYJWJbyu6/
6s3H/iLZNfpyS8luMTAqpXbvwAmSlh+GEY1nFFne+g+Xa4WaOP/z00usFerisLM=
=KV7e
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--
