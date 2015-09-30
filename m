From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/8] regulator: Hi655x: Add support for Hi655x regulator
Date: Wed, 30 Sep 2015 18:58:57 +0100
Message-ID: <20150930175857.GK15635@sirena.org.uk>
References: <1443611111-3196-1-git-send-email-w.f@huawei.com>
 <1443611111-3196-5-git-send-email-w.f@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C7PTD44AewjTsiSV"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443611111-3196-5-git-send-email-w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fei Wang <w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, z.liuxinliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, william.wfei-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--C7PTD44AewjTsiSV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2015 at 07:05:07PM +0800, Fei Wang wrote:

> +config REGULATOR_HI655X
> +        tristate "Hisilicon HI655X PMIC regulators support"
> +        depends on ARCH_HISI
> +	depends on MFD_HI655X_PMIC && OF

You've got some tab/space confusion above.  Also, can't we have an ||
COMPILE_TEST here?

> +#define REG_VALUE_SETBITS(reg_value, pos, bits, bits_value) \
> +		(reg_value = (reg_value & \
> +		~((((unsigned int)1 << bits) - 1) << pos)) | \
> +		((unsigned int)(bits_value & \
> +		(((unsigned int)1 << bits) - 1)) << pos))
> +
> +#define REG_VALUE_GETBITS(reg_value, pos, bits) \
> +			((reg_value >> pos) & (((unsigned int)1 << bits) - 1))

These are just really hard to read, sorry, and they appear to duplicate
existing regmap functionality.  If there is a strong reason to add them
consider doing so in the core and if you can then please at least make
them regular inline functions rather than using macros.  It's much safer
and more readable.

> +static int hi655x_regulator_pmic_is_enabled(struct regulator_dev *rdev)
> +{
> +	int ret = 0;
> +	unsigned int value = 0;
> +
> +	struct hi655x_regulator *sreg = rdev_get_drvdata(rdev);
> +	struct hi655x_regulator_ctrl_regs  *ctrl_regs = &(sreg->ctrl_regs);
> +	struct hi655x_regulator_ctrl_data  *ctrl_data = &(sreg->ctrl_data);
> +
> +	/*
> +	* regulator is all set,but the pmu is only subset.
> +	* maybe this "buck"/"ldo"/"lvs" is not contrl by a core.
> +	* and in regulator have a "status" member ("okey" or "disable").
> +	*/

I'm having a hard time parsing the above comment.  Please also use the
normal kernel comment style (this is a problem throughout the driver).

> +	regmap_read(rdev->regmap, ctrl_regs->status_reg, &value);
> +	ret = (int)REG_VALUE_GETBITS(value, ctrl_data->shift,
> +					ctrl_data->mask);

This appears to just duplicate regulator core functionality for reading
enable state from a bitfield?  Also note that the cast here isn't a
great advert for the macros above.

> +static int hi655x_regulator_pmic_enable(struct regulator_dev *rdev)
> +{
> +	int ret = 0;
> +	unsigned char value_u8 = 0;
> +	unsigned int value_u32 = 0;
> +	struct hi655x_regulator *sreg = rdev_get_drvdata(rdev);
> +	struct hi655x_regulator_ctrl_regs  *ctrl_regs = &(sreg->ctrl_regs);
> +	struct hi655x_regulator_ctrl_data  *ctrl_data = &(sreg->ctrl_data);
> +
> +	REG_VALUE_SETBITS(value_u32, ctrl_data->shift, ctrl_data->mask, 0x1);
> +	value_u8  = (unsigned char)value_u32;
> +	regmap_write(rdev->regmap, ctrl_regs->enable_reg, value_u8);

I'm not *entirely* sure what this is supposed to be doing but it looks
like it's duplicating core functionality in a fashion that's really
quite hard to read.  Why not just use the core functions for setting
bits?

> +	udelay(sreg->off_on_delay);

Use the regualtor core delay functionality please.

> +static int hi655x_regulator_pmic_list_voltage_linear(struct regulator_dev *rdev,
> +				  unsigned int selector)

This is *definitely* duplicating core functionality, I think you want to
use regulator_list_voltage_linear_range() or possibly just plain
_linear() and use separate operations for the LVS regulator.

We at least need to restructure the code so that the core helper
functions are used and we don't have regulator type decisions everywhere
- the whole goal of having per regulator ops is to avoid having to open
code decisions about which regulator we're dealing with into each op
function.

> +static unsigned int hi655x_regulator_pmic_get_mode(
> +			struct regulator_dev *rdev)
> +{
> +	return REGULATOR_MODE_NORMAL;
> +}

Don't implement empty functions, remove all these.

> +	num_consumer_supplies = of_get_property(np,
> +				"hisilicon,num_consumer_supplies", NULL);
> +
> +	if ((NULL == num_consumer_supplies) || (0 == *num_consumer_supplies)) {
> +		dev_warn(dev, "%s no consumer_supplies\n", __func__);
> +		return init_data;
> +	}

Obviously the binding is completely undocumented but this is setting off
alarm bells - why is the driver even considering consumers?  Please make
sure you are using the core regulator bindings rather than open coding
something which translates into platform data (which is what this looks
like).

I'm not going to review any more of the DT code without binding
documentation.

> +	/*
> +	*initdata mem will release auto;
> +	*this is kernel 3.10 import.
> +	*/

Remove anything related to your vendor kernel support, this is not
relevant to upstream.

--C7PTD44AewjTsiSV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWDCLhAAoJECTWi3JdVIfQFqMH/jHWJlIR+ZTXgv9uV5eiYK+D
npW154vzDXFhj7uWoivcFNLp+V6yMgy3KwZaFYpcZUrXAB0Be/xNmLux7Zgv4CkN
0oFAABqOmIE2wgJ2ZI71/rLwbjZsLHHP7kSQLvRkZGN4JC7Z5YC7I5Oc7psQ2vKO
UU2OiZfOaPfigIA55P7WKwmy3eRgYQwXSqF0aKWxCMCEezjJHrvieFXU4kyMEiXo
0BkRUk3nT3Z1a3VWlIqYlNYiCkru4LUd+Uon5THRL5ReuURCt+rrY9j3hDshsgrZ
Sw7ssqU3wGhqXOoQhuBZo13H/JhqglkxQ4/TmzDjnfaB56hgRrDI2qebmGzC+a4=
=bXx/
-----END PGP SIGNATURE-----

--C7PTD44AewjTsiSV--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
