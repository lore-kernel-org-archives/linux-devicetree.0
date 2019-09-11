From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: fsl_mqs: Add MQS component driver
Date: Wed, 11 Sep 2019 11:12:30 +0100
Message-ID: <20190911101230.GT2036@sirena.org.uk>
References: <cff8bff1e8d3334fa308ddfcec266a5284e3c858.1568169346.git.shengjiu.wang@nxp.com>
 <08524f143c18521680b724ab98375828fc18ab2b.1568169346.git.shengjiu.wang@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HywJcj55HbA57jnN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <08524f143c18521680b724ab98375828fc18ab2b.1568169346.git.shengjiu.wang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--HywJcj55HbA57jnN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 11, 2019 at 10:42:39AM -0400, Shengjiu Wang wrote:

This looks good, a few minor comments below but nothing major -
it's mostly nits with the DT binding.

> --- /dev/null
> +++ b/sound/soc/fsl/fsl_mqs.c
> @@ -0,0 +1,336 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ALSA SoC IMX MQS driver
> + *
> + * Copyright (C) 2014-2019 Freescale Semiconductor, Inc.
> + *

Please make the entire comment block a C++ comment so things look
neater.

> +	/* On i.MX6sx the MQS control register is in GPR domain
> +	 * But in i.MX8QM/i.MX8QXP the control register is moved
> +	 * to its own domain.
> +	 */
> +	if (of_device_is_compatible(np, "fsl,imx8qm-mqs"))
> +		mqs_priv->use_gpr = false;
> +	else
> +		mqs_priv->use_gpr = true;

The GPR was listed as a required property in the binding document
but it is only needed here so the binding document should say
"required if compatible is...".

> +	} else {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		regs = devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(regs))

You can use devm_platform_ioremap_resource() here.

> +		mqs_priv->ipg = devm_clk_get(&pdev->dev, "core");
> +		if (IS_ERR(mqs_priv->ipg)) {
> +			dev_err(&pdev->dev, "failed to get the clock: %ld\n",
> +				PTR_ERR(mqs_priv->ipg));
> +			goto out;
> +		}

The core clock wasn't listed in the bindings document.

--HywJcj55HbA57jnN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl14yI0ACgkQJNaLcl1U
h9BO/Af/aIFQPppNc8K51nmTQbe5/qlY6KawrXb2O2vnWrT0cZMpaXII/WfVHarC
N5tQrIStSR99l5V93WUkKolVo3SJS2Gg5Opo4XLHTFt9vHlhOYX8iRt0xz5B+UF9
qKo8AHuR0kOSAsRy2w9lEFq07cRPSFR9bQH3axNxUybh7v6YEbo473gX0rRf3qUL
HRfeAMEzjuK5CQz74088qfUQmfiDoVbCC+cbvkUeWhR0/VbZA3zdeos3wbUDRqrA
KJGMzwAyQISn8+uXAEUNzmepdcKl/tec9JJCjZHh/lSTnMQwAwj6/NPhDhIZwCmy
5GYinXK/xsebKn2yLidfvP2yyzICdw==
=GpDq
-----END PGP SIGNATURE-----

--HywJcj55HbA57jnN--
