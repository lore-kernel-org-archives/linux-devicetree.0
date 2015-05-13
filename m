From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND v6 4/6] regulator: axp20x: add
 support for AXP22X regulators
Date: Wed, 13 May 2015 16:30:44 +0100
Message-ID: <20150513153044.GF3394@x1>
References: <1428638946-24890-1-git-send-email-wens@csie.org>
 <1428638946-24890-5-git-send-email-wens@csie.org>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBKG4ZWVAKGQE2GXCPPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1428638946-24890-5-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
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
> Add AXP22X regulator definitions and variant id associations.
> This introduces a new "switch" type output for one of the regulators.
> It is a switchable secondary output of one regulator, with the same
> voltage level as the primary output.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> [wens-jdAy2FN1RRM@public.gmane.org: Moved variant choosing to multi family support patch]
> [wens-jdAy2FN1RRM@public.gmane.org: Add dc-dc work frequency range]
> [wens-jdAy2FN1RRM@public.gmane.org: Add "switch" type output regulator DC1SW]
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Reviewed-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>=20
> Hi Mark,
>    =20
> This patch depends on the previous patch "regulator: axp20x: prepare
> support for multiple AXP chip families" and the mfd header from the
> first patch "mfd: axp20x: add AXP22x PMIC support".
>=20
> Could we merge both regulator patches through the mfd tree, with the
> other patches in the series? There are no other external dependencies.
>=20
> ChenYu
>=20
> ---
>  drivers/regulator/axp20x-regulator.c | 96 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 96 insertions(+)

Applied, thanks.

> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp=
20x-regulator.c
> index 50ae0b5f2c0c..646829132b59 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c
> @@ -27,8 +27,12 @@
>  #define AXP20X_IO_ENABLED		0x03
>  #define AXP20X_IO_DISABLED		0x07
> =20
> +#define AXP22X_IO_ENABLED		0x04
> +#define AXP22X_IO_DISABLED		0x03
> +
>  #define AXP20X_WORKMODE_DCDC2_MASK	BIT(2)
>  #define AXP20X_WORKMODE_DCDC3_MASK	BIT(1)
> +#define AXP22X_WORKMODE_DCDCX_MASK(x)	BIT(x)
> =20
>  #define AXP20X_FREQ_DCDC_MASK		0x0f
> =20
> @@ -74,6 +78,26 @@
>  		.ops		=3D &axp20x_ops,					\
>  	}
> =20
> +#define AXP_DESC_SW(_family, _id, _match, _supply, _min, _max, _step, _v=
reg,	\
> +		    _vmask, _ereg, _emask) 					\
> +	[_family##_##_id] =3D {							\
> +		.name		=3D #_id,						\
> +		.supply_name	=3D (_supply),					\
> +		.of_match	=3D of_match_ptr(_match),				\
> +		.regulators_node =3D of_match_ptr("regulators"),			\
> +		.type		=3D REGULATOR_VOLTAGE,				\
> +		.id		=3D _family##_##_id,				\
> +		.n_voltages	=3D (((_max) - (_min)) / (_step) + 1),		\
> +		.owner		=3D THIS_MODULE,					\
> +		.min_uV		=3D (_min) * 1000,				\
> +		.uV_step	=3D (_step) * 1000,				\
> +		.vsel_reg	=3D (_vreg),					\
> +		.vsel_mask	=3D (_vmask),					\
> +		.enable_reg	=3D (_ereg),					\
> +		.enable_mask	=3D (_emask),					\
> +		.ops		=3D &axp20x_ops_sw,				\
> +	}
> +
>  #define AXP_DESC_FIXED(_family, _id, _match, _supply, _volt)			\
>  	[_family##_##_id] =3D {							\
>  		.name		=3D #_id,						\
> @@ -135,6 +159,14 @@ static struct regulator_ops axp20x_ops =3D {
>  	.is_enabled		=3D regulator_is_enabled_regmap,
>  };
> =20
> +static struct regulator_ops axp20x_ops_sw =3D {
> +	.get_voltage_sel	=3D regulator_get_voltage_sel_regmap,
> +	.list_voltage		=3D regulator_list_voltage_linear,
> +	.enable			=3D regulator_enable_regmap,
> +	.disable		=3D regulator_disable_regmap,
> +	.is_enabled		=3D regulator_is_enabled_regmap,
> +};
> +
>  static const struct regulator_desc axp20x_regulators[] =3D {
>  	AXP_DESC(AXP20X, DCDC2, "dcdc2", "vin2", 700, 2275, 25,
>  		 AXP20X_DCDC2_V_OUT, 0x3f, AXP20X_PWR_OUT_CTRL, 0x10),
> @@ -152,6 +184,52 @@ static const struct regulator_desc axp20x_regulators=
[] =3D {
>  		    AXP20X_IO_ENABLED, AXP20X_IO_DISABLED),
>  };
> =20
> +static const struct regulator_desc axp22x_regulators[] =3D {
> +	AXP_DESC(AXP22X, DCDC1, "dcdc1", "vin1", 1600, 3400, 100,
> +		 AXP22X_DCDC1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL1, BIT(1)),
> +	AXP_DESC(AXP22X, DCDC2, "dcdc2", "vin2", 600, 1540, 20,
> +		 AXP22X_DCDC2_V_OUT, 0x3f, AXP22X_PWR_OUT_CTRL1, BIT(2)),
> +	AXP_DESC(AXP22X, DCDC3, "dcdc3", "vin3", 600, 1860, 20,
> +		 AXP22X_DCDC3_V_OUT, 0x3f, AXP22X_PWR_OUT_CTRL1, BIT(3)),
> +	AXP_DESC(AXP22X, DCDC4, "dcdc4", "vin4", 600, 1540, 20,
> +		 AXP22X_DCDC4_V_OUT, 0x3f, AXP22X_PWR_OUT_CTRL1, BIT(3)),
> +	AXP_DESC(AXP22X, DCDC5, "dcdc5", "vin5", 1000, 2550, 50,
> +		 AXP22X_DCDC5_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL1, BIT(4)),
> +	/* secondary switchable output of DCDC1 */
> +	AXP_DESC_SW(AXP22X, DC1SW, "dc1sw", "dcdc1", 1600, 3400, 100,
> +		    AXP22X_DCDC1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(7)),
> +	/* LDO regulator internally chained to DCDC5 */
> +	AXP_DESC(AXP22X, DC5LDO, "dc5ldo", "dcdc5", 700, 1400, 100,
> +		 AXP22X_DC5LDO_V_OUT, 0x7, AXP22X_PWR_OUT_CTRL1, BIT(0)),
> +	AXP_DESC(AXP22X, ALDO1, "aldo1", "aldoin", 700, 3300, 100,
> +		 AXP22X_ALDO1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL1, BIT(6)),
> +	AXP_DESC(AXP22X, ALDO2, "aldo2", "aldoin", 700, 3300, 100,
> +		 AXP22X_ALDO2_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL1, BIT(7)),
> +	AXP_DESC(AXP22X, ALDO3, "aldo3", "aldoin", 700, 3300, 100,
> +		 AXP22X_ALDO3_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL3, BIT(7)),
> +	AXP_DESC(AXP22X, DLDO1, "dldo1", "dldoin", 700, 3300, 100,
> +		 AXP22X_DLDO1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(3)),
> +	AXP_DESC(AXP22X, DLDO2, "dldo2", "dldoin", 700, 3300, 100,
> +		 AXP22X_DLDO2_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(4)),
> +	AXP_DESC(AXP22X, DLDO3, "dldo3", "dldoin", 700, 3300, 100,
> +		 AXP22X_DLDO3_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(5)),
> +	AXP_DESC(AXP22X, DLDO4, "dldo4", "dldoin", 700, 3300, 100,
> +		 AXP22X_DLDO4_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(6)),
> +	AXP_DESC(AXP22X, ELDO1, "eldo1", "eldoin", 700, 3300, 100,
> +		 AXP22X_ELDO1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(0)),
> +	AXP_DESC(AXP22X, ELDO2, "eldo2", "eldoin", 700, 3300, 100,
> +		 AXP22X_ELDO2_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(1)),
> +	AXP_DESC(AXP22X, ELDO3, "eldo3", "eldoin", 700, 3300, 100,
> +		 AXP22X_ELDO3_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(2)),
> +	AXP_DESC_IO(AXP22X, LDO_IO0, "ldo_io0", "ips", 1800, 3300, 100,
> +		    AXP22X_LDO_IO0_V_OUT, 0x1f, AXP20X_GPIO0_CTRL, 0x07,
> +		    AXP22X_IO_ENABLED, AXP22X_IO_DISABLED),
> +	AXP_DESC_IO(AXP22X, LDO_IO1, "ldo_io1", "ips", 1800, 3300, 100,
> +		    AXP22X_LDO_IO1_V_OUT, 0x1f, AXP20X_GPIO1_CTRL, 0x07,
> +		    AXP22X_IO_ENABLED, AXP22X_IO_DISABLED),
> +	AXP_DESC_FIXED(AXP22X, RTC_LDO, "rtc_ldo", "ips", 3000),
> +};
> +
>  static int axp20x_set_dcdc_freq(struct platform_device *pdev, u32 dcdcfr=
eq)
>  {
>  	struct axp20x_dev *axp20x =3D dev_get_drvdata(pdev->dev.parent);
> @@ -165,6 +243,12 @@ static int axp20x_set_dcdc_freq(struct platform_devi=
ce *pdev, u32 dcdcfreq)
>  		def =3D 1500;
>  		step =3D 75;
>  		break;
> +	case AXP221_ID:
> +		min =3D 1800;
> +		max =3D 4050;
> +		def =3D 3000;
> +		step =3D 150;
> +		break;
>  	default:
>  		dev_err(&pdev->dev,
>  			"Setting DCDC frequency for unsupported AXP variant\n");
> @@ -237,6 +321,14 @@ static int axp20x_set_dcdc_workmode(struct regulator=
_dev *rdev, int id, u32 work
>  		workmode <<=3D ffs(mask) - 1;
>  		break;
> =20
> +	case AXP221_ID:
> +		if (id < AXP22X_DCDC1 || id > AXP22X_DCDC5)
> +			return -EINVAL;
> +
> +		mask =3D AXP22X_WORKMODE_DCDCX_MASK(id - AXP22X_DCDC1);
> +		workmode <<=3D id - AXP22X_DCDC1;
> +		break;
> +
>  	default:
>  		/* should not happen */
>  		WARN_ON(1);
> @@ -265,6 +357,10 @@ static int axp20x_regulator_probe(struct platform_de=
vice *pdev)
>  		regulators =3D axp20x_regulators;
>  		nregulators =3D AXP20X_REG_ID_MAX;
>  		break;
> +	case AXP221_ID:
> +		regulators =3D axp22x_regulators;
> +		nregulators =3D AXP22X_REG_ID_MAX;
> +		break;
>  	default:
>  		dev_err(&pdev->dev, "Unsupported AXP variant: %ld\n",
>  			axp20x->variant);

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
