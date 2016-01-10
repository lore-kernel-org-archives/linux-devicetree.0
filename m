From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 6/6] regulator: max77620: add regulator driver for
 max77620/max20024
Date: Sun, 10 Jan 2016 12:40:14 +0000
Message-ID: <20160110124014.GZ6588@sirena.org.uk>
References: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com>
 <1452177524-23192-7-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cv++WRjpEUwHXUCE"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452177524-23192-7-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org


--Cv++WRjpEUwHXUCE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 07, 2016 at 08:08:44PM +0530, Laxman Dewangan wrote:

This looks mostly good, a few fairly small things:

> +	if (rinfo->type == MAX77620_REGULATOR_TYPE_SD)
> +		addr = rinfo->cfg_addr;

Please write things like this as switch statement so if we end up adding
more variants the code looks more natural.

> +	case REGULATOR_MODE_IDLE:
> +	case REGULATOR_MODE_STANDBY:
> +		if (rpdata->glpm_enable)
> +			power_mode = MAX77620_POWER_MODE_GLPM;
> +		else
> +			power_mode = MAX77620_POWER_MODE_LPM;
> +		break;

If there's no difference between two modes just don't implement one of
the modes and let the framework worry about what to do for the other
one.

> +static int max77620_get_regulator_dt_data(struct platform_device *pdev,
> +		struct max77620_regulator *max77620_regs)
> +{
> +	struct device_node *np;
> +	u32 prop;
> +	int id;
> +	int ret;
> +
> +	np = of_get_child_by_name(pdev->dev.parent->of_node, "regulators");
> +	if (!np) {
> +		dev_err(&pdev->dev, "Device is not having regulators node\n");
> +		return -ENODEV;
> +	}
> +	pdev->dev.of_node = np;
> +
> +	ret = of_regulator_match(&pdev->dev, np, max77620_regulator_matches,
> +			ARRAY_SIZE(max77620_regulator_matches));
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Parsing of regulator node failed: %d\n",
> +			ret);
> +		return ret;
> +	}

Don't open code this, use the core support via regulators and of_match.

> +		if (reg_pdata->disable_remote_sense_on_suspend &&
> +				(rinfo->remote_sense_addr != 0xFF)) {

Weird indentation here, the second line doesn't seem to be aligned with
anything.

--Cv++WRjpEUwHXUCE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWklEtAAoJECTWi3JdVIfQ+1oH/3eSQoArzQBo7MC8zeoazryT
u8lvmt1K2pm7XDgla6UIbg5e5h6BQXONam1Dx6kf1faRqe37xFGYCuH+gyDgqJyZ
SldfbFegoXhDK8t8EC4cl6cSAEVHCj1VBedTdPm29B8ZiliuTKlr4GFXTY8vcivV
u77tctfgMFHcc9mFmlPH5itpfFaM5+XfFkbhANNL7E+VOqvIy3ElbG9llIALXAMY
HnSvhEK4vkASeHAGSYtuPSAgoOEJKY/+Rl2rF18yzbRNZNIV3pFQlVNty+U/ubgp
l348I2VJew/OG0j7QpmdZLEV2WqDnQWnLAkW6/DVB4cUjRYSuJlvkv92fZPC3pk=
=xgMx
-----END PGP SIGNATURE-----

--Cv++WRjpEUwHXUCE--
