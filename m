From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH 2/3] regulator: Add support for stm32-vrefbuf
Date: Tue, 29 Aug 2017 19:57:19 +0100
Message-ID: <20170829185719.h5fxvzmxbysyxwml@sirena.org.uk>
References: <1503925133-30722-1-git-send-email-fabrice.gasnier@st.com>
 <1503925133-30722-3-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="otah7lm27avz6sqa"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503925133-30722-3-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, alexandre.torgue@st.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--otah7lm27avz6sqa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 28, 2017 at 02:58:52PM +0200, Fabrice Gasnier wrote:

> +	ret = clk_prepare_enable(priv->clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "clk prepare failed\n");

If you're printing an error include the error code, it'll help users
figure out what went wrong.

> +	dev_info(&pdev->dev, "STM32 VREFBUF initialized\n");

This is just noise, remove it.

> +static int __init stm32_vrefbuf_init(void)
> +{
> +	return platform_driver_register(&stm32_vrefbuf_driver);
> +}
> +subsys_initcall(stm32_vrefbuf_init);

Why is this at subsys_initcall()?

--otah7lm27avz6sqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlmluQ4ACgkQJNaLcl1U
h9D+awf6A0t7trQWkJ9xCOwswbRCLOcGxHKLETL+dyXAcLBVJuJ+HKhhigWTI3h5
krOCNIty2QwPrkozDNUSryhiXlZVGTMgxbgnpfYez/+lLL5qGwy0itJm3Qjaz20E
x/VbFlkvQM42FDkXVod5lZVBRYIlXtL9RpXo+0QuUvIO9yrpukTqYg7+K3ZsHoyj
Y7unMNaAvXe+pkfrbv6PuJKR7yOhLQQHdNgvYX44DClAOdIKc2060QONccEaDLXb
RHFdkX5Z6QVrVDjmydlq5Q0hLzwIfqR2sN1euUjyv55lblQGe287QFfoYriieCcY
GqZYJldlMlTU0FOiyBuVqBdXu5TzUA==
=SRV0
-----END PGP SIGNATURE-----

--otah7lm27avz6sqa--
