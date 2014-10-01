From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC 7/7] regulator: qcom-smd-rpm: Regulator driver for the
 Qualcomm RPM
Date: Wed, 1 Oct 2014 19:13:46 +0100
Message-ID: <20141001181346.GI4273@sirena.org.uk>
References: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1412037291-16880-8-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eG1/bcghN0MjPhCR"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1412037291-16880-8-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: devicetree@vger.kernel.org


--eG1/bcghN0MjPhCR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 29, 2014 at 05:34:51PM -0700, Bjorn Andersson wrote:

> According to the datasheet for the PMIC the regulators are indeed programmed in
> steps, but the steps seems to vary between different regulators and the details
> are hidden by the RPM that exposes contiguous voltage ranges.

> Either we run with this, add a few more compatibles to encode the steps or have
> the step coming from devicetree. I prefer the current implementation as that is
> the cleanest of these.

We have support for this sort of regulator in the core anyway so just
keep on doing what you're doing.

> +	if (vreg->desc.ops->set_voltage &&
> +	    (!initdata->constraints.min_uV || !initdata->constraints.max_uV)) {
> +		dev_err(&pdev->dev, "no voltage specified for regulator\n");
> +		return -EINVAL;
> +	}

You shouldn't need to do this - it should be perfectly legal to have the
ability to set voltages but not use that ability.

--eG1/bcghN0MjPhCR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJULERZAAoJECTWi3JdVIfQkaUH/R8H4Om12BaxasTXJ9kZKzON
MEc99qV8yvzviRBVokPzsAyt76abtvh2LFCD1adSnjefHCI0/aKqBPKSvhC0y0ll
VJKwAG6FU04ty3a4Rc3l0DIfAFNmLl/SY1NOIzBPuxr42SjWmdLzqYtmpIXRO3Pv
xwxZ8koKJI2JAofGu4oEpamsTmRFEheTpWXOgyqJmqdar07Yeo5ZpBxf21r/E2AS
CRR7hS9SfWtsrPMuiXrcAoTIkiCYWRPnyGkds6bLob96y3eoo04dBq7kJPlt4a7r
jrGfri6ay0/4XLC/yZ5lF2H1v8DGYfr6naiwTJkzf3EKYYJUG+2byPmeqgATqbQ=
=c9/Q
-----END PGP SIGNATURE-----

--eG1/bcghN0MjPhCR--
