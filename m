From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] regulator: st-flashss: Add a regulator driver for
 flashss vsense.
Date: Wed, 13 Apr 2016 07:15:14 +0100
Message-ID: <20160413061514.GI14664@sirena.org.uk>
References: <1460474204-5351-1-git-send-email-peter.griffin@linaro.org>
 <1460474204-5351-3-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2xeD/fx0+7k8I/QN"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460474204-5351-3-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--2xeD/fx0+7k8I/QN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2016 at 04:16:41PM +0100, Peter Griffin wrote:

> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 61bfbb9..10be29b 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -108,6 +108,6 @@ obj-$(CONFIG_REGULATOR_WM831X) +=3D wm831x-ldo.o
>  obj-$(CONFIG_REGULATOR_WM8350) +=3D wm8350-regulator.o
>  obj-$(CONFIG_REGULATOR_WM8400) +=3D wm8400-regulator.o
>  obj-$(CONFIG_REGULATOR_WM8994) +=3D wm8994-regulator.o
> -
> +obj-$(CONFIG_REGULATOR_ST_FLASHSS) +=3D st-flashss.o

Please keep Kconfig and Makefile sorted.  :/

> +static int st_set_voltage_sel(struct regulator_dev *dev, unsigned int se=
lector)

This and the get_voltage_sel() look like you can just use a MMIO regmap.

> +	voltage =3D st_type_voltages[selector];

No bounds checking on the array, though since you're working with
selectors it doesn't seem like there's any need to do this.

> +	value |=3D vsense->en_psw_mask;

Enable should be a separate operation.

> +static void st_get_satinize_powerup_voltage(struct st_vsense *vsense)
> +{
> +	void __iomem *ioaddr =3D vsense->ioaddr;
> +	u32 value =3D readl_relaxed(ioaddr);
> +
> +	dev_dbg(vsense->dev, "Initial start-up value: (0x%08x)\n", value);
> +
> +	/* Sanitize voltage values forcing what is provided from start-up */
> +	if (value & TOP_VSENSE_CONFIG_LATCHED_PSW_EMMC)
> +		value |=3D TOP_VSENSE_CONFIG_REG_PSW_EMMC;
> +	else
> +		value &=3D ~TOP_VSENSE_CONFIG_REG_PSW_EMMC;
> +
> +	if (value & TOP_VSENSE_CONFIG_LATCHED_PSW_NAND)
> +		value |=3D TOP_VSENSE_CONFIG_REG_PSW_NAND;
> +	else
> +		value &=3D ~TOP_VSENSE_CONFIG_REG_PSW_NAND;
> +
> +	if (value & TOP_VSENSE_CONFIG_LATCHED_PSW_SPI)
> +		value |=3D TOP_VSENSE_CONFIG_REG_PSW_SPI;
> +	else
> +		value &=3D ~TOP_VSENSE_CONFIG_REG_PSW_SPI;

This looks like a very complicated way of writing

	value &=3D TOP_VSENSE_CONFIG_LATCHED_PSW_SPI |=20
		TOP_VSENSE_CONFIG_LATCHED_PSW_NAND |
		TOP_VSENSE_CONFIG_REG_PSW_EMMC

or am I missing something?  Why do we need to do this anyway, it's very
surprsing?

> +	if (device->data) {
> +		const struct st_vsense *data =3D device->data;
> +
> +		vsense->en_psw_mask =3D data->en_psw_mask;
> +		vsense->psw_mask =3D data->psw_mask;
> +		vsense->latched_mask =3D data->latched_mask;
> +	} else
> +		return -ENODEV;

Coding style, { } on both sides.

> +
> +	if (of_property_read_string(np, "regulator-name",
> +				    (const char **)&vsense->name))
> +		return -EINVAL;

Don't make this mandatory, that's not what it's for.  Use the compatible
if you really need something, or just make the framework cope with a
missing name (eg, by using dev_name() or something).

> +	config.init_data =3D of_get_regulator_init_data(&pdev->dev, np, rdesc);
> +	if (!config.init_data) {
> +		dev_err(dev, "Failed to parse regulator init data\n");
> +		return -ENOMEM;
> +	}

Don't error out, carry on and let the driver work in read only mode for
diagnostics.

> +	/* register regulator */
> +	rdev =3D regulator_register(rdesc, &config);

devm_regulator_register().

> +	dev_info(dev, "%s  vsense voltage regulator registered\n", rdesc->name);

Remove this, it's just making the boot noisy.

> +static int __init st_vsense_init(void)
> +{
> +	return platform_driver_register(&st_vsense_driver);
> +}
> +
> +subsys_initcall(st_vsense_init);

module_platform_driver().

--2xeD/fx0+7k8I/QN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXDePxAAoJECTWi3JdVIfQ64cH/ihZ4665GfmcCEoE1pOq68Ap
406+3ejHdbKOsm7Y5nS9wAwfBTX1xO653bhf1XuIRZuwUBeQHLLwl3Gn/x6Tt0q/
+aiK8tSux1IhbwGICLy3f9/QdweN4BJRrzF3BOSx2WheemrOYsTWhglCQJX3Rh/J
uUILxoR8d+Q+gPi56PsoqGSPV7/xyBeX635/X/vtk80G+cILPKjnzp9Fi5NzBt5Y
3fTTbwuW0eZvad9wnti5R46jMTOQ27eW9DhM3fYKOh3HgvPQ2mU8PzEFAWq75kke
dTXVh5YXmfD3K9YZwnBcca5/Bzob3FAmCHErMBtLlUaxpYupx3HjTLJ8Vk0G9OQ=
=AbXV
-----END PGP SIGNATURE-----

--2xeD/fx0+7k8I/QN--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
