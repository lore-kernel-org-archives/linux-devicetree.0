From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] regulator: qcom-rpm: Regulator driver for the
 Qualcomm RPM
Date: Wed, 28 May 2014 17:55:29 +0100
Message-ID: <20140528165529.GC5099@sirena.org.uk>
References: <1401211721-19712-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1401211721-19712-4-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1401211721-19712-4-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Josh Cartwright <joshc@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 27, 2014 at 10:28:41AM -0700, Bjorn Andersson wrote:

> +static int rpm_reg_set_voltage(struct regulator_dev *rdev,
> +			       int min_uV, int max_uV,
> +			       unsigned *selector)
> +{
> +	struct qcom_rpm_reg *vreg = rdev_get_drvdata(rdev);
> +	const struct rpm_reg_parts *parts = vreg->parts;
> +	const struct request_member *req;
> +	int ret = 0;
> +	int sel;
> +	int val;
> +	int uV;
> +
> +	dev_dbg(vreg->dev, "set_voltage(%d, %d)\n", min_uV, max_uV);
> +
> +	if (parts->uV.mask == 0 && parts->mV.mask == 0)
> +		return -EINVAL;
> +
> +	/*
> +	 * Snap to the voltage to a supported level.
> +	 */

What is "snapping" a voltage?

> +	sel = regulator_map_voltage_linear_range(rdev, min_uV, max_uV);

Don't open code mapping the voltage, just implement set_voltage_sel().

> +	mutex_lock(&vreg->lock);
> +	if (parts->uV.mask)
> +		req = &parts->uV;
> +	else if (parts->mV.mask)
> +		req = &parts->mV;
> +	else
> +		req = &parts->enable_state;

Just implement separate operations for the regulators with different
register definitions.  It's going to simplify the code.

> +static int rpm_reg_set_mode(struct regulator_dev *rdev, unsigned int mode)
> +{
> +	struct qcom_rpm_reg *vreg = rdev_get_drvdata(rdev);
> +	const struct rpm_reg_parts *parts = vreg->parts;
> +	int max_mA = parts->ip.mask >> parts->ip.shift;
> +	int load_mA;
> +	int ret;
> +
> +	if (mode == REGULATOR_MODE_IDLE)
> +		load_mA = vreg->idle_uA / 1000;
> +	else
> +		load_mA = vreg->normal_uA / 1000;
> +
> +	if (load_mA > max_mA)
> +		load_mA = max_mA;
> +
> +	mutex_lock(&vreg->lock);
> +	ret = rpm_reg_write(vreg, &parts->ip, load_mA);
> +	if (!ret)
> +		vreg->mode = mode;
> +	mutex_unlock(&vreg->lock);

I'm not entirely sure what this is intended to do.  It looks like it's
doing something to do with current limits but it's a set_mode().  Some
documentation might help.  It should also be implementing only specific
modes and rejecting unsupported modes, if we do the same operation to
the device for two different modes that seems wrong.

> +static unsigned int rpm_reg_get_optimum_mode(struct regulator_dev *rdev,
> +					     int input_uV,
> +					     int output_uV,
> +					     int load_uA)
> +{
> +	struct qcom_rpm_reg *vreg = rdev_get_drvdata(rdev);
> +
> +	load_uA += vreg->load_bias_uA;
> +
> +	if (load_uA < vreg->hpm_threshold_uA) {
> +		vreg->idle_uA = load_uA;
> +		return REGULATOR_MODE_IDLE;
> +	} else {
> +		vreg->normal_uA = load_uA;
> +		return REGULATOR_MODE_NORMAL;
> +	}
> +}

This looks very broken - why are we storing anything here?  What is the
stored value supposed to do?

> +	if (vreg->parts->ip.mask) {
> +		initdata->constraints.valid_ops_mask |= REGULATOR_CHANGE_DRMS;
> +		initdata->constraints.valid_ops_mask |= REGULATOR_CHANGE_MODE;
> +		initdata->constraints.valid_modes_mask |= REGULATOR_MODE_NORMAL;
> +		initdata->constraints.valid_modes_mask |= REGULATOR_MODE_IDLE;

No, this is just plain broken.  Constraints are set by the *board*, you
don't know if these settings are safe on any given board.

> +static int __init rpm_reg_init(void)
> +{
> +	return platform_driver_register(&rpm_reg_driver);
> +}
> +arch_initcall(rpm_reg_init);
> +
> +static void __exit rpm_reg_exit(void)
> +{
> +	platform_driver_unregister(&rpm_reg_driver);
> +}
> +module_exit(rpm_reg_exit)

module_platform_driver() or if you must bodge the init order at least
use subsys_initcall() like everyone else.

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJThhT9AAoJELSic+t+oim9ntcP/1CpueDlvGeHv3rAo+3gEMzE
9fvLznXUXC5OUewfjQP64K4y8tjiYXgvCXm7nPz1TZCC/BZWfR+M22MOxvnW8OAT
VXqkXpG9IOLpOlOgHISQUPKzidBnFULfLDL9mXv6BWMJ/nN/7/0emPwQmGJcWkWu
R4FUnq9AwExkklyTFZBRQh7/qkrY/WJlw9DAdvFCYCTu5V4AxgYb8z405wWP9aQI
hyMDwmEgca7PkByruPCl8VLAKHBwAn3Z9LfmzoW7MPXfE3zFvMj2FQv8TpChAhQ8
IDc/fX3nJLZloSack8D+ZI+NbQTZtjgloQkoLgHQIVpTSeRJVOBgdUXPT11PQXeb
Pd1gmPIcN5sJSxdpQ11VFtEltoyXF30+OG7IaYWf0oMBxBH/3EczvP7+NR8q5bDc
41kEx1MSBWfg5qyP9sXPCQO+/Q2UjFhscZ0a3e3jKoWx1efez1Kp3n1y5kg31yIu
VwUA9bEySqqW+PIGpwrzlrWraYHM1EOcsFWrCWJIBVQnDSNsD2jCa+Ix5NwKvzQM
WmUG7nfntgKaxSY4G42om/kUAxbHDvEOpW2ZRREZ0xSfBHBYiihBui40X+oRWE3R
4nvcfp/e4Tg12cZVe/sbjwSml++EYtGoliz8Eu3JfL/96M/cYf0Du+e+OQTYB6o4
1XESNqZ2VvbWIrAJ+hi9
=Ww6k
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--
