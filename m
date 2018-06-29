From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] regulator: uniphier: add regulator driver for
 UniPhier SoC
Date: Fri, 29 Jun 2018 12:03:41 +0100
Message-ID: <20180629110341.GA6556@sirena.org.uk>
References: <1530260533-19415-1-git-send-email-hayashi.kunihiko@socionext.com>
 <1530260533-19415-3-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530260533-19415-3-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 29, 2018 at 05:22:13PM +0900, Kunihiko Hayashi wrote:

> +++ b/drivers/regulator/uniphier-regulator.c
> @@ -0,0 +1,251 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Regulator controller driver for UniPhier SoC
> + * Copyright 2018 Socionext Inc.
> + * Author: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> + */

Please make the entire header a C++ comment so that it looks intentional
rather than mixing C and C++ like this.

> +static int uniphier_regulator_enable(struct regulator_dev *rdev)
> +{
> +	struct uniphier_regulator_priv *priv = rdev_get_drvdata(rdev);
> +	u32 val;
> +
> +	val = readl_relaxed(priv->base + rdev->desc->enable_reg);
> +	val &= ~rdev->desc->enable_mask;
> +	val |= rdev->desc->enable_val;
> +	writel_relaxed(val, priv->base + rdev->desc->enable_reg);
> +
> +	return 0;
> +}

Could you use a MMIO regmap for this driver?  All the operations look
like they're just straight up operations of the sort the standard
helpers support them and it means the driver will be able to take
advantage of any improvements the core makes for free.

Otherwise this looks great, and the above two issues can be fixed as
followup patches so I'll apply.

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAls2EgoACgkQJNaLcl1U
h9AsXgf+MRnX8FkOk0vX/KB9mHeOwDsvFGJLp/N7zOdoizH96U9cZwHFYB5CNPW1
Tm5bYkEGJwexsgKJaMxTmjLBoy6Fn0hFNezTIdkNccPqGRrFslRXDXmbtMqSbXP8
Ms9dDrcL/muaMlMwLvmdmsKwwyLT+Lc9av7O+IK2Nrvf598P0nT8TlG1OUT9IoS9
AN1LdRxou4r/Bua8fl8q71+oewZ3x7NOOOH/WI6kHUSp/6AqrMNwabixa//R3rK8
phi3VVo7q4iwgun7Uakyj2fdmpQeAc5jbnGdKQ/qdFlMY9PalH8LPoM2VFgMSgZd
+TatjwzgoeFOtMpFOat2c0KUgDxv+Q==
=F2Hb
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
