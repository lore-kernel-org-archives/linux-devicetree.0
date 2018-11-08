From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/6] regulator: lochnagar: Move driver to binding from DT
Date: Thu, 8 Nov 2018 12:16:29 +0000
Message-ID: <20181108121629.GD6675@sirena.org.uk>
References: <20181108101405.14062-1-ckeepax@opensource.cirrus.com>
 <20181108101405.14062-3-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181108101405.14062-3-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 08, 2018 at 10:14:01AM +0000, Charles Keepax wrote:

> +static const struct of_device_id lochnagar_of_match[] = {
> +	{ .compatible = "cirrus,lochnagar-regulator" },
> +	{},
> +};

This is obviously just dumping the Linux driver model into the DT, the
regulators are clearly different.  If you want to explicitly list the
regulators in DT it'd be better to reflect the hardware and enumerate
the regulators individually - you can use one driver for all the MICVDDs
and a separate one for VDDCORE for example.

--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvkKRwACgkQJNaLcl1U
h9Bftgf/YG896fIVqX6Do66HLJIcHNJAzK00x3THF6XqoLUIBKhVrovcy7fW69jw
Vw2QDuIv8oet/R2vvKPFrx153wE1ADwU5CfBfufFigUi+OPJTAVKHzVZUurYEcnQ
ULPI+vcXMD8jDaKVFRIGIM9/CtPll/c1Rcu0T4WsCdAWXQ0C4lJ+gBe8Cge8kDTX
U3h0jvOIHd9mnWiK/GCfSINRDyeYGeVn1SXuMfYOlrmCkNou8TQVI/phg50Q6+2Q
C0f3oNXRlgQoQe01AqXussavzBQ7dAV1o8ClN3FFgfSkdZjfWy/APBcN5RuBmGAH
+Gjtsp7RPdWYoMk/weGZwBMXNt/8BQ==
=78JL
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--
