From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] regulator: qcom_spmi: Add support for PM8005
Date: Tue, 21 May 2019 19:50:54 +0100
Message-ID: <20190521185054.GD16633@sirena.org.uk>
References: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
 <20190521165315.14379-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190521165315.14379-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: lgirdwood@gmail.com, agross@kernel.org, david.brown@linaro.org, bjorn.andersson@linaro.org, jcrouse@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
List-Id: devicetree@vger.kernel.org


--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2019 at 09:53:15AM -0700, Jeffrey Hugo wrote:

> -	spmi_vreg_read(vreg, SPMI_COMMON_REG_VOLTAGE_RANGE, &range_sel, 1);
> +	/* second common devices don't have VOLTAGE_RANGE register */
> +	if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS2) {
> +		spmi_vreg_read(vreg, SPMI_COMMON2_REG_VOLTAGE_LSB, &lsb, 1);
> +		spmi_vreg_read(vreg, SPMI_COMMON2_REG_VOLTAGE_MSB, &msb, 1);
> +
> +		uV = (((int)msb << 8) | (int)lsb) * 1000;

This overlaps with some changes that Jorge (CCed) was sending for the
PMS405.  As I was saying to him rather than shoving special cases for
different regulator types into the ops (especially ones that don't have
any of the range stuff) it'd be better to just define separate ops for
the regulators that look quite different to the existing ones.

> +static int spmi_regulator_common_list_voltage(struct regulator_dev *rdev,
> +					      unsigned selector);
> +
> +static int spmi_regulator_common2_set_voltage(struct regulator_dev *rdev,
> +					      unsigned selector)

Eeew, can we not have better names?

> +static unsigned int spmi_regulator_common2_get_mode(struct regulator_dev *rdev)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 reg;
> +
> +	spmi_vreg_read(vreg, SPMI_COMMON2_REG_MODE, &reg, 1);
> +
> +	if (reg == SPMI_COMMON2_MODE_HPM_MASK)
> +		return REGULATOR_MODE_NORMAL;
> +
> +	if (reg == SPMI_COMMON2_MODE_AUTO_MASK)
> +		return REGULATOR_MODE_FAST;
> +
> +	return REGULATOR_MODE_IDLE;
> +}

This looks like you want to write a switch statement.

> +spmi_regulator_common2_set_mode(struct regulator_dev *rdev, unsigned int mode)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 mask = SPMI_COMMON2_MODE_MASK;
> +	u8 val = SPMI_COMMON2_MODE_LPM_MASK;
> +
> +	if (mode == REGULATOR_MODE_NORMAL)
> +		val = SPMI_COMMON2_MODE_HPM_MASK;
> +	else if (mode == REGULATOR_MODE_FAST)
> +		val = SPMI_COMMON2_MODE_AUTO_MASK;

This needs to be a switch statement, then it can have a default case to
catch errors too.

--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzkSI0ACgkQJNaLcl1U
h9D4Pwf+N0VEAMaUrHu9DiDBqWU4jYSrQlR7BPtYN4DHzRzhYd/GSW4c1RhNMsz4
og7GQSz83ppbsfv22Sf1/2ivsR/0VihEhoOVduEnH2MJcowZwd4vUnNfTvOuAcvN
nN/THjD7Nz4GpP9QBetIwsInrafl+bbpMedq0fI/u6EsUSNOmoHnFxgJM8aXxYJQ
WzquUkwu8XTUi5UNspFDXXTRYmjfKAiY0fYSsATVZOZHtSCktsijI35IN77oxvSB
l2UT7XH3xXPQ7UyeF64U4Yp7L+NeYrh7eX6qZGb5NaUq1k/CiruEZK/OUkNkkNsR
sQWT5yGgYmgS2BOIlXy3SsNbouafeQ==
=vCWU
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--
