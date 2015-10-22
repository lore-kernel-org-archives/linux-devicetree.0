From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Fri, 23 Oct 2015 01:47:24 +0900
Message-ID: <20151022164724.GZ8232@sirena.org.uk>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5FDiZl1vRbLRjwwc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443731874-21362-5-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--5FDiZl1vRbLRjwwc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2015 at 03:37:53PM -0500, Andrew F. Davis wrote:

> +static const struct of_device_id tps65912_regulator_of_match_table[] = {
> +	{ .compatible = "ti,tps65912-regulator", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, tps65912_regulator_of_match_table);

Does this IP block exist outside of the tps65912?  If not why is it
directly represented in DT?  It seems like this is describing how Linux
loads drivers not how the hardware is constructed but DT should describe
the hardware.

--5FDiZl1vRbLRjwwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWKRMcAAoJECTWi3JdVIfQSHYH/0HgOh93Kz9laCFWEjnU7LCy
cYbTBuyM+ES5KjHtXXt/TVbqN06rfZDpC8efLd+cBGtLvpAPGeLmDjO1Ofsp0Da3
vUKdNAICwoPe6WzI4UEic7X7JS7JQQo97CYKkH/bcRC6IlsGnlMn2G8fwt8vFCSP
ARyy2/3vzKhwhdvbbdwLfYIl2Fqe1WIzrlHUcdrIE8GC8GxKvdkRAN9Ss4tNL/54
AH2xGWvQlMehu9lqWKXou2HySJdavQNjZdP5ePxi8MQ+qzMtM1EP5URBWBQRXNkL
UYZLE/iIMjG4LV+H/D6OS3YoMNH93NTKw+BAgv1lgb68ocS86TbS3cdSMN4c0Rc=
=kzM9
-----END PGP SIGNATURE-----

--5FDiZl1vRbLRjwwc--
