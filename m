From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND v6 3/6] regulator: axp20x: prepare
 support for multiple AXP chip families
Date: Wed, 13 May 2015 16:30:29 +0100
Message-ID: <20150513153029.GE3394@x1>
References: <1428638946-24890-1-git-send-email-wens@csie.org>
 <1428638946-24890-4-git-send-email-wens@csie.org>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBGW4ZWVAKGQEVTLGLTY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1428638946-24890-4-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 10 Apr 2015, Chen-Yu Tsai wrote:

> From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Rework the AXP20X_ macros and probe function to support the several chip
> families, so that each family can define it's own set of regulators.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> [wens-jdAy2FN1RRM@public.gmane.org: Support different DC-DC work frequency ranges]
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Reviewed-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/regulator/axp20x-regulator.c | 143 +++++++++++++++++++++++------=
------
>  1 file changed, 94 insertions(+), 49 deletions(-)

Applied, thanks.

> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp=
20x-regulator.c
> index e4331f5e5d7d..50ae0b5f2c0c 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c
> @@ -32,15 +32,15 @@
> =20
>  #define AXP20X_FREQ_DCDC_MASK		0x0f
> =20
> -#define AXP20X_DESC_IO(_id, _match, _supply, _min, _max, _step, _vreg, _=
vmask,	\
> -		       _ereg, _emask, _enable_val, _disable_val)		\
> -	[AXP20X_##_id] =3D {							\
> +#define AXP_DESC_IO(_family, _id, _match, _supply, _min, _max, _step, _v=
reg,	\
> +		    _vmask, _ereg, _emask, _enable_val, _disable_val)		\
> +	[_family##_##_id] =3D {							\
>  		.name		=3D #_id,						\
>  		.supply_name	=3D (_supply),					\
>  		.of_match	=3D of_match_ptr(_match),				\
>  		.regulators_node =3D of_match_ptr("regulators"),			\
>  		.type		=3D REGULATOR_VOLTAGE,				\
> -		.id		=3D AXP20X_##_id,					\
> +		.id		=3D _family##_##_id,				\
>  		.n_voltages	=3D (((_max) - (_min)) / (_step) + 1),		\
>  		.owner		=3D THIS_MODULE,					\
>  		.min_uV		=3D (_min) * 1000,				\
> @@ -54,15 +54,15 @@
>  		.ops		=3D &axp20x_ops,					\
>  	}
> =20
> -#define AXP20X_DESC(_id, _match, _supply, _min, _max, _step, _vreg, _vma=
sk,	\
> -		    _ereg, _emask)						\
> -	[AXP20X_##_id] =3D {							\
> +#define AXP_DESC(_family, _id, _match, _supply, _min, _max, _step, _vreg=
,	\
> +		 _vmask, _ereg, _emask) 					\
> +	[_family##_##_id] =3D {							\
>  		.name		=3D #_id,						\
>  		.supply_name	=3D (_supply),					\
>  		.of_match	=3D of_match_ptr(_match),				\
>  		.regulators_node =3D of_match_ptr("regulators"),			\
>  		.type		=3D REGULATOR_VOLTAGE,				\
> -		.id		=3D AXP20X_##_id,					\
> +		.id		=3D _family##_##_id,				\
>  		.n_voltages	=3D (((_max) - (_min)) / (_step) + 1),		\
>  		.owner		=3D THIS_MODULE,					\
>  		.min_uV		=3D (_min) * 1000,				\
> @@ -74,29 +74,29 @@
>  		.ops		=3D &axp20x_ops,					\
>  	}
> =20
> -#define AXP20X_DESC_FIXED(_id, _match, _supply, _volt)				\
> -	[AXP20X_##_id] =3D {							\
> +#define AXP_DESC_FIXED(_family, _id, _match, _supply, _volt)			\
> +	[_family##_##_id] =3D {							\
>  		.name		=3D #_id,						\
>  		.supply_name	=3D (_supply),					\
>  		.of_match	=3D of_match_ptr(_match),				\
>  		.regulators_node =3D of_match_ptr("regulators"),			\
>  		.type		=3D REGULATOR_VOLTAGE,				\
> -		.id		=3D AXP20X_##_id,					\
> +		.id		=3D _family##_##_id,				\
>  		.n_voltages	=3D 1,						\
>  		.owner		=3D THIS_MODULE,					\
>  		.min_uV		=3D (_volt) * 1000,				\
>  		.ops		=3D &axp20x_ops_fixed				\
>  	}
> =20
> -#define AXP20X_DESC_TABLE(_id, _match, _supply, _table, _vreg, _vmask, _=
ereg,	\
> -			  _emask)						\
> -	[AXP20X_##_id] =3D {							\
> +#define AXP_DESC_TABLE(_family, _id, _match, _supply, _table, _vreg, _vm=
ask,	\
> +		       _ereg, _emask)						\
> +	[_family##_##_id] =3D {							\
>  		.name		=3D #_id,						\
>  		.supply_name	=3D (_supply),					\
>  		.of_match	=3D of_match_ptr(_match),				\
>  		.regulators_node =3D of_match_ptr("regulators"),			\
>  		.type		=3D REGULATOR_VOLTAGE,				\
> -		.id		=3D AXP20X_##_id,					\
> +		.id		=3D _family##_##_id,				\
>  		.n_voltages	=3D ARRAY_SIZE(_table),				\
>  		.owner		=3D THIS_MODULE,					\
>  		.vsel_reg	=3D (_vreg),					\
> @@ -136,37 +136,57 @@ static struct regulator_ops axp20x_ops =3D {
>  };
> =20
>  static const struct regulator_desc axp20x_regulators[] =3D {
> -	AXP20X_DESC(DCDC2, "dcdc2", "vin2", 700, 2275, 25, AXP20X_DCDC2_V_OUT,
> -		    0x3f, AXP20X_PWR_OUT_CTRL, 0x10),
> -	AXP20X_DESC(DCDC3, "dcdc3", "vin3", 700, 3500, 25, AXP20X_DCDC3_V_OUT,
> -		    0x7f, AXP20X_PWR_OUT_CTRL, 0x02),
> -	AXP20X_DESC_FIXED(LDO1, "ldo1", "acin", 1300),
> -	AXP20X_DESC(LDO2, "ldo2", "ldo24in", 1800, 3300, 100,
> -		    AXP20X_LDO24_V_OUT, 0xf0, AXP20X_PWR_OUT_CTRL, 0x04),
> -	AXP20X_DESC(LDO3, "ldo3", "ldo3in", 700, 3500, 25, AXP20X_LDO3_V_OUT,
> -		    0x7f, AXP20X_PWR_OUT_CTRL, 0x40),
> -	AXP20X_DESC_TABLE(LDO4, "ldo4", "ldo24in", axp20x_ldo4_data,
> -			  AXP20X_LDO24_V_OUT, 0x0f, AXP20X_PWR_OUT_CTRL, 0x08),
> -	AXP20X_DESC_IO(LDO5, "ldo5", "ldo5in", 1800, 3300, 100,
> -		       AXP20X_LDO5_V_OUT, 0xf0, AXP20X_GPIO0_CTRL, 0x07,
> -		       AXP20X_IO_ENABLED, AXP20X_IO_DISABLED),
> +	AXP_DESC(AXP20X, DCDC2, "dcdc2", "vin2", 700, 2275, 25,
> +		 AXP20X_DCDC2_V_OUT, 0x3f, AXP20X_PWR_OUT_CTRL, 0x10),
> +	AXP_DESC(AXP20X, DCDC3, "dcdc3", "vin3", 700, 3500, 25,
> +		 AXP20X_DCDC3_V_OUT, 0x7f, AXP20X_PWR_OUT_CTRL, 0x02),
> +	AXP_DESC_FIXED(AXP20X, LDO1, "ldo1", "acin", 1300),
> +	AXP_DESC(AXP20X, LDO2, "ldo2", "ldo24in", 1800, 3300, 100,
> +		 AXP20X_LDO24_V_OUT, 0xf0, AXP20X_PWR_OUT_CTRL, 0x04),
> +	AXP_DESC(AXP20X, LDO3, "ldo3", "ldo3in", 700, 3500, 25,
> +		 AXP20X_LDO3_V_OUT, 0x7f, AXP20X_PWR_OUT_CTRL, 0x40),
> +	AXP_DESC_TABLE(AXP20X, LDO4, "ldo4", "ldo24in", axp20x_ldo4_data,
> +		       AXP20X_LDO24_V_OUT, 0x0f, AXP20X_PWR_OUT_CTRL, 0x08),
> +	AXP_DESC_IO(AXP20X, LDO5, "ldo5", "ldo5in", 1800, 3300, 100,
> +		    AXP20X_LDO5_V_OUT, 0xf0, AXP20X_GPIO0_CTRL, 0x07,
> +		    AXP20X_IO_ENABLED, AXP20X_IO_DISABLED),
>  };
> =20
>  static int axp20x_set_dcdc_freq(struct platform_device *pdev, u32 dcdcfr=
eq)
>  {
>  	struct axp20x_dev *axp20x =3D dev_get_drvdata(pdev->dev.parent);
> +	u32 min, max, def, step;
> +
> +	switch (axp20x->variant) {
> +	case AXP202_ID:
> +	case AXP209_ID:
> +		min =3D 750;
> +		max =3D 1875;
> +		def =3D 1500;
> +		step =3D 75;
> +		break;
> +	default:
> +		dev_err(&pdev->dev,
> +			"Setting DCDC frequency for unsupported AXP variant\n");
> +		return -EINVAL;
> +	}
> +
> +	if (dcdcfreq =3D=3D 0)
> +		dcdcfreq =3D def;
> =20
> -	if (dcdcfreq < 750) {
> -		dcdcfreq =3D 750;
> -		dev_warn(&pdev->dev, "DCDC frequency too low. Set to 750kHz\n");
> +	if (dcdcfreq < min) {
> +		dcdcfreq =3D min;
> +		dev_warn(&pdev->dev, "DCDC frequency too low. Set to %ukHz\n",
> +			 min);
>  	}
> =20
> -	if (dcdcfreq > 1875) {
> -		dcdcfreq =3D 1875;
> -		dev_warn(&pdev->dev, "DCDC frequency too high. Set to 1875kHz\n");
> +	if (dcdcfreq > max) {
> +		dcdcfreq =3D max;
> +		dev_warn(&pdev->dev, "DCDC frequency too high. Set to %ukHz\n",
> +			 max);
>  	}
> =20
> -	dcdcfreq =3D (dcdcfreq - 750) / 75;
> +	dcdcfreq =3D (dcdcfreq - min) / step;
> =20
>  	return regmap_update_bits(axp20x->regmap, AXP20X_DCDC_FREQ,
>  				  AXP20X_FREQ_DCDC_MASK, dcdcfreq);
> @@ -176,7 +196,7 @@ static int axp20x_regulator_parse_dt(struct platform_=
device *pdev)
>  {
>  	struct device_node *np, *regulators;
>  	int ret;
> -	u32 dcdcfreq;
> +	u32 dcdcfreq =3D 0;
> =20
>  	np =3D of_node_get(pdev->dev.parent->of_node);
>  	if (!np)
> @@ -186,7 +206,6 @@ static int axp20x_regulator_parse_dt(struct platform_=
device *pdev)
>  	if (!regulators) {
>  		dev_warn(&pdev->dev, "regulators node not found\n");
>  	} else {
> -		dcdcfreq =3D 1500;
>  		of_property_read_u32(regulators, "x-powers,dcdc-freq", &dcdcfreq);
>  		ret =3D axp20x_set_dcdc_freq(pdev, dcdcfreq);
>  		if (ret < 0) {
> @@ -202,15 +221,27 @@ static int axp20x_regulator_parse_dt(struct platfor=
m_device *pdev)
> =20
>  static int axp20x_set_dcdc_workmode(struct regulator_dev *rdev, int id, =
u32 workmode)
>  {
> -	unsigned int mask =3D AXP20X_WORKMODE_DCDC2_MASK;
> +	struct axp20x_dev *axp20x =3D rdev_get_drvdata(rdev);
> +	unsigned int mask;
> =20
> -	if ((id !=3D AXP20X_DCDC2) && (id !=3D AXP20X_DCDC3))
> -		return -EINVAL;
> +	switch (axp20x->variant) {
> +	case AXP202_ID:
> +	case AXP209_ID:
> +		if ((id !=3D AXP20X_DCDC2) && (id !=3D AXP20X_DCDC3))
> +			return -EINVAL;
> +
> +		mask =3D AXP20X_WORKMODE_DCDC2_MASK;
> +		if (id =3D=3D AXP20X_DCDC3)
> +			mask =3D AXP20X_WORKMODE_DCDC3_MASK;
> =20
> -	if (id =3D=3D AXP20X_DCDC3)
> -		mask =3D AXP20X_WORKMODE_DCDC3_MASK;
> +		workmode <<=3D ffs(mask) - 1;
> +		break;
> =20
> -	workmode <<=3D ffs(mask) - 1;
> +	default:
> +		/* should not happen */
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}
> =20
>  	return regmap_update_bits(rdev->regmap, AXP20X_DCDC_MODE, mask, workmod=
e);
>  }
> @@ -219,22 +250,36 @@ static int axp20x_regulator_probe(struct platform_d=
evice *pdev)
>  {
>  	struct regulator_dev *rdev;
>  	struct axp20x_dev *axp20x =3D dev_get_drvdata(pdev->dev.parent);
> +	const struct regulator_desc *regulators;
>  	struct regulator_config config =3D {
>  		.dev =3D pdev->dev.parent,
>  		.regmap =3D axp20x->regmap,
> +		.driver_data =3D axp20x,
>  	};
> -	int ret, i;
> +	int ret, i, nregulators;
>  	u32 workmode;
> =20
> +	switch (axp20x->variant) {
> +	case AXP202_ID:
> +	case AXP209_ID:
> +		regulators =3D axp20x_regulators;
> +		nregulators =3D AXP20X_REG_ID_MAX;
> +		break;
> +	default:
> +		dev_err(&pdev->dev, "Unsupported AXP variant: %ld\n",
> +			axp20x->variant);
> +		return -EINVAL;
> +	}
> +
>  	/* This only sets the dcdc freq. Ignore any errors */
>  	axp20x_regulator_parse_dt(pdev);
> =20
> -	for (i =3D 0; i < AXP20X_REG_ID_MAX; i++) {
> -		rdev =3D devm_regulator_register(&pdev->dev, &axp20x_regulators[i],
> +	for (i =3D 0; i < nregulators; i++) {
> +		rdev =3D devm_regulator_register(&pdev->dev, &regulators[i],
>  					       &config);
>  		if (IS_ERR(rdev)) {
>  			dev_err(&pdev->dev, "Failed to register %s\n",
> -				axp20x_regulators[i].name);
> +				regulators[i].name);
> =20
>  			return PTR_ERR(rdev);
>  		}
> @@ -245,7 +290,7 @@ static int axp20x_regulator_probe(struct platform_dev=
ice *pdev)
>  		if (!ret) {
>  			if (axp20x_set_dcdc_workmode(rdev, i, workmode))
>  				dev_err(&pdev->dev, "Failed to set workmode on %s\n",
> -					axp20x_regulators[i].name);
> +					rdev->desc->name);
>  		}
>  	}
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
