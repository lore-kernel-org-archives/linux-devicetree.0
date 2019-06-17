From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/7] regulator: qcom_spmi: Add support for PM8005
Date: Mon, 17 Jun 2019 16:05:02 +0100
Message-ID: <20190617150502.GU5316@sirena.org.uk>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190613212553.10541-1-jeffrey.l.hugo@gmail.com>
 <20190613212553.10541-2-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XUmrTyVHrg2/ImRG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613212553.10541-2-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: lgirdwood@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--XUmrTyVHrg2/ImRG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 13, 2019 at 02:25:53PM -0700, Jeffrey Hugo wrote:

> +static int spmi_regulator_ftsmps426_set_voltage(struct regulator_dev *rdev,
> +					      unsigned selector)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 buf[2];
> +	int mV;
> +
> +	mV = spmi_regulator_common_list_voltage(rdev, selector) / 1000;
> +
> +	buf[0] = mV & 0xff;
> +	buf[1] = mV >> 8;
> +	return spmi_vreg_write(vreg, SPMI_FTSMPS426_REG_VOLTAGE_LSB, buf, 2);
> +}

This could just be a set_voltage_sel(), no need for it to be a
set_voltage() operation....

> +static int spmi_regulator_ftsmps426_get_voltage(struct regulator_dev *rdev)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 buf[2];
> +
> +	spmi_vreg_read(vreg, SPMI_FTSMPS426_REG_VOLTAGE_LSB, buf, 2);
> +
> +	return (((unsigned int)buf[1] << 8) | (unsigned int)buf[0]) * 1000;
> +}

...or if the conversion is this trivial why do the list_voltage() lookup
above?

> +spmi_regulator_ftsmps426_set_mode(struct regulator_dev *rdev, unsigned int mode)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 mask = SPMI_FTSMPS426_MODE_MASK;
> +	u8 val;
> +
> +	switch (mode) {
> +	case REGULATOR_MODE_NORMAL:
> +		val = SPMI_FTSMPS426_MODE_HPM_MASK;
> +		break;
> +	case REGULATOR_MODE_FAST:
> +		val = SPMI_FTSMPS426_MODE_AUTO_MASK;
> +		break;
> +	default:
> +		val = SPMI_FTSMPS426_MODE_LPM_MASK;
> +		break;
> +	}

This should validate, it shouldn't just translate invalid values into
valid ones.

--XUmrTyVHrg2/ImRG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HrB0ACgkQJNaLcl1U
h9B0uAf/cYrB30Ayjn0Man4vuddPN/hR/NlbKN1B86AvFrFe6mrHPSuIJUdydTG+
MtukGFvwCTrnDhnBMxcXeCGsgNrpFpPMcmvk6+5+PZH08FVYBBS6TzPOwTZewmjn
WVDr6XBug+yYu5+2KMTskQgnfykO+iqMYHx6UyqaDuia/pYCUMoVz+5TVG0KUOYJ
knWxItKJ3NGD1DlALPCk0K7+P8krq+e09mJME8OSi5HqywdmqxTtPlNbwRr5/YKR
2ZXAyo4eDjJTE5MowrnA2yEl1d3eKFH6oYBy7btNQF7U8669XprdWTdsTLa+yj0x
FC/y90cEdM7bE2QMxfyOs5aaBDGroA==
=xcfk
-----END PGP SIGNATURE-----

--XUmrTyVHrg2/ImRG--
