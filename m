From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 07/11] regulator: axp20x-regulator: add
 support for AXP803
Date: Tue, 11 Apr 2017 15:03:45 +0100
Message-ID: <20170411140345.7jakfdjkotnpgt4a@dell>
References: <20170407183441.58750-1-icenowy@aosc.io>
 <20170407183441.58750-8-icenowy@aosc.io>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBROEWPDQKGQEMVVZMUQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170407183441.58750-8-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 08 Apr 2017, Icenowy Zheng wrote:

> AXP803 PMIC also have a series of regulators (DCDCs and LDOs)
> controllable via I2C/RSB bus.
>=20
> Add support for them.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Changes in v2:
> - Place AXP803 codes before AXP806/809 ones.
> - Fixed some errors in regulator description.
> - Reuse AXP803 DLDO2 range for AXP806 CLDO2 & AXP809 DLDO1.
>=20
>  drivers/regulator/axp20x-regulator.c | 153 +++++++++++++++++++++++++++++=
+-----
>  include/linux/mfd/axp20x.h           |  37 +++++++++
>  2 files changed, 168 insertions(+), 22 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
 =20
> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp=
20x-regulator.c
> index 0b9d4e3e52c7..2ed15e4a7a82 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c
> @@ -244,6 +244,82 @@ static const struct regulator_desc axp22x_drivevbus_=
regulator =3D {
>  	.ops		=3D &axp20x_ops_sw,
>  };
> =20
> +static const struct regulator_linear_range axp803_dcdc234_ranges[] =3D {
> +	REGULATOR_LINEAR_RANGE(500000, 0x0, 0x46, 10000),
> +	REGULATOR_LINEAR_RANGE(1220000, 0x47, 0x4b, 20000),
> +};
> +
> +static const struct regulator_linear_range axp803_dcdc5_ranges[] =3D {
> +	REGULATOR_LINEAR_RANGE(800000, 0x0, 0x20, 10000),
> +	REGULATOR_LINEAR_RANGE(1140000, 0x21, 0x44, 20000),
> +};
> +
> +static const struct regulator_linear_range axp803_dcdc6_ranges[] =3D {
> +	REGULATOR_LINEAR_RANGE(600000, 0x0, 0x32, 10000),
> +	REGULATOR_LINEAR_RANGE(1120000, 0x33, 0x47, 20000),
> +};
> +
> +/* AXP806's CLDO2 and AXP809's DLDO1 shares the same range */
> +static const struct regulator_linear_range axp803_dldo2_ranges[] =3D {
> +	REGULATOR_LINEAR_RANGE(700000, 0x0, 0x1a, 100000),
> +	REGULATOR_LINEAR_RANGE(3400000, 0x1b, 0x1f, 200000),
> +};
> +
> +static const struct regulator_desc axp803_regulators[] =3D {
> +	AXP_DESC(AXP803, DCDC1, "dcdc1", "vin1", 1600, 3400, 100,
> +		 AXP803_DCDC1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL1, BIT(0)),
> +	AXP_DESC_RANGES(AXP803, DCDC2, "dcdc2", "vin2", axp803_dcdc234_ranges,
> +			76, AXP803_DCDC2_V_OUT, 0x7f, AXP22X_PWR_OUT_CTRL1,
> +			BIT(1)),
> +	AXP_DESC_RANGES(AXP803, DCDC3, "dcdc3", "vin3", axp803_dcdc234_ranges,
> +			76, AXP803_DCDC3_V_OUT, 0x7f, AXP22X_PWR_OUT_CTRL1,
> +			BIT(2)),
> +	AXP_DESC_RANGES(AXP803, DCDC4, "dcdc4", "vin4", axp803_dcdc234_ranges,
> +			76, AXP803_DCDC4_V_OUT, 0x7f, AXP22X_PWR_OUT_CTRL1,
> +			BIT(3)),
> +	AXP_DESC_RANGES(AXP803, DCDC5, "dcdc5", "vin5", axp803_dcdc5_ranges,
> +			68, AXP803_DCDC5_V_OUT, 0x7f, AXP22X_PWR_OUT_CTRL1,
> +			BIT(4)),
> +	AXP_DESC_RANGES(AXP803, DCDC6, "dcdc6", "vin6", axp803_dcdc6_ranges,
> +			72, AXP803_DCDC6_V_OUT, 0x7f, AXP22X_PWR_OUT_CTRL1,
> +			BIT(5)),
> +	/* secondary switchable output of DCDC1 */
> +	AXP_DESC_SW(AXP803, DC1SW, "dc1sw", NULL, AXP22X_PWR_OUT_CTRL2,
> +		    BIT(7)),
> +	AXP_DESC(AXP803, ALDO1, "aldo1", "aldoin", 700, 3300, 100,
> +		 AXP22X_ALDO1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL3, BIT(5)),
> +	AXP_DESC(AXP803, ALDO2, "aldo2", "aldoin", 700, 3300, 100,
> +		 AXP22X_ALDO2_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL3, BIT(6)),
> +	AXP_DESC(AXP803, ALDO3, "aldo3", "aldoin", 700, 3300, 100,
> +		 AXP22X_ALDO3_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL3, BIT(7)),
> +	AXP_DESC(AXP803, DLDO1, "dldo1", "dldoin", 700, 3300, 100,
> +		 AXP22X_DLDO1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(3)),
> +	AXP_DESC_RANGES(AXP803, DLDO2, "dldo2", "dldoin", axp803_dldo2_ranges,
> +			32, AXP22X_DLDO2_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2,
> +			BIT(4)),
> +	AXP_DESC(AXP803, DLDO3, "dldo3", "dldoin", 700, 3300, 100,
> +		 AXP22X_DLDO3_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(5)),
> +	AXP_DESC(AXP803, DLDO4, "dldo4", "dldoin", 700, 3300, 100,
> +		 AXP22X_DLDO4_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(6)),
> +	AXP_DESC(AXP803, ELDO1, "eldo1", "eldoin", 700, 1900, 50,
> +		 AXP22X_ELDO1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(0)),
> +	AXP_DESC(AXP803, ELDO2, "eldo2", "eldoin", 700, 1900, 50,
> +		 AXP22X_ELDO2_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(1)),
> +	AXP_DESC(AXP803, ELDO3, "eldo3", "eldoin", 700, 1900, 50,
> +		 AXP22X_ELDO3_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(2)),
> +	AXP_DESC(AXP803, FLDO1, "fldo1", "fldoin", 700, 1450, 50,
> +		 AXP803_FLDO1_V_OUT, 0x0f, AXP22X_PWR_OUT_CTRL3, BIT(2)),
> +	AXP_DESC(AXP803, FLDO2, "fldo2", "fldoin", 700, 1450, 50,
> +		 AXP803_FLDO2_V_OUT, 0x0f, AXP22X_PWR_OUT_CTRL3, BIT(3)),
> +	AXP_DESC_IO(AXP803, LDO_IO0, "ldo_io0", "ips", 700, 3300, 100,
> +		    AXP22X_LDO_IO0_V_OUT, 0x1f, AXP20X_GPIO0_CTRL, 0x07,
> +		    AXP22X_IO_ENABLED, AXP22X_IO_DISABLED),
> +	AXP_DESC_IO(AXP803, LDO_IO1, "ldo_io1", "ips", 700, 3300, 100,
> +		    AXP22X_LDO_IO1_V_OUT, 0x1f, AXP20X_GPIO1_CTRL, 0x07,
> +		    AXP22X_IO_ENABLED, AXP22X_IO_DISABLED),
> +	AXP_DESC_FIXED(AXP803, RTC_LDO, "rtc_ldo", "ips", 3000),
> +};
> +
>  static const struct regulator_linear_range axp806_dcdca_ranges[] =3D {
>  	REGULATOR_LINEAR_RANGE(600000, 0x0, 0x32, 10000),
>  	REGULATOR_LINEAR_RANGE(1120000, 0x33, 0x47, 20000),
> @@ -254,11 +330,6 @@ static const struct regulator_linear_range axp806_dc=
dcd_ranges[] =3D {
>  	REGULATOR_LINEAR_RANGE(1600000, 0x2e, 0x3f, 100000),
>  };
> =20
> -static const struct regulator_linear_range axp806_cldo2_ranges[] =3D {
> -	REGULATOR_LINEAR_RANGE(700000, 0x0, 0x1a, 100000),
> -	REGULATOR_LINEAR_RANGE(3400000, 0x1b, 0x1f, 200000),
> -};
> -
>  static const struct regulator_desc axp806_regulators[] =3D {
>  	AXP_DESC_RANGES(AXP806, DCDCA, "dcdca", "vina", axp806_dcdca_ranges,
>  			72, AXP806_DCDCA_V_CTRL, 0x7f, AXP806_PWR_OUT_CTRL1,
> @@ -289,7 +360,7 @@ static const struct regulator_desc axp806_regulators[=
] =3D {
>  		 AXP806_BLDO4_V_CTRL, 0x0f, AXP806_PWR_OUT_CTRL2, BIT(3)),
>  	AXP_DESC(AXP806, CLDO1, "cldo1", "cldoin", 700, 3300, 100,
>  		 AXP806_CLDO1_V_CTRL, 0x1f, AXP806_PWR_OUT_CTRL2, BIT(4)),
> -	AXP_DESC_RANGES(AXP806, CLDO2, "cldo2", "cldoin", axp806_cldo2_ranges,
> +	AXP_DESC_RANGES(AXP806, CLDO2, "cldo2", "cldoin", axp803_dldo2_ranges,
>  			32, AXP806_CLDO2_V_CTRL, 0x1f, AXP806_PWR_OUT_CTRL2,
>  			BIT(5)),
>  	AXP_DESC(AXP806, CLDO3, "cldo3", "cldoin", 700, 3300, 100,
> @@ -326,7 +397,7 @@ static const struct regulator_desc axp809_regulators[=
] =3D {
>  		 AXP22X_ALDO2_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL1, BIT(7)),
>  	AXP_DESC(AXP809, ALDO3, "aldo3", "aldoin", 700, 3300, 100,
>  		 AXP22X_ALDO3_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(5)),
> -	AXP_DESC_RANGES(AXP809, DLDO1, "dldo1", "dldoin", axp806_cldo2_ranges,
> +	AXP_DESC_RANGES(AXP809, DLDO1, "dldo1", "dldoin", axp803_dldo2_ranges,
>  			32, AXP22X_DLDO1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2,
>  			BIT(3)),
>  	AXP_DESC(AXP809, DLDO2, "dldo2", "dldoin", 700, 3300, 100,
> @@ -369,14 +440,21 @@ static int axp20x_set_dcdc_freq(struct platform_dev=
ice *pdev, u32 dcdcfreq)
>  		def =3D 1500;
>  		step =3D 75;
>  		break;
> -	case AXP806_ID:
> +	case AXP803_ID:
>  		/*
> -		 * AXP806 DCDC work frequency setting has the same range and
> +		 * AXP803 DCDC work frequency setting has the same range and
>  		 * step as AXP22X, but at a different register.
>  		 * Fall through to the check below.
>  		 * (See include/linux/mfd/axp20x.h)
>  		 */
> -		reg =3D AXP806_DCDC_FREQ_CTRL;
> +		reg =3D AXP803_DCDC_FREQ_CTRL;
> +	case AXP806_ID:
> +		/*
> +		 * AXP806 also have DCDC work frequency setting register at a
> +		 * different position.
> +		 */
> +		if (axp20x->variant =3D=3D AXP806_ID)
> +			reg =3D AXP806_DCDC_FREQ_CTRL;
>  	case AXP221_ID:
>  	case AXP223_ID:
>  	case AXP809_ID:
> @@ -475,6 +553,14 @@ static int axp20x_set_dcdc_workmode(struct regulator=
_dev *rdev, int id, u32 work
>  		workmode <<=3D id - AXP22X_DCDC1;
>  		break;
> =20
> +	case AXP803_ID:
> +		if (id < AXP803_DCDC1 || id > AXP803_DCDC6)
> +			return -EINVAL;
> +
> +		mask =3D AXP22X_WORKMODE_DCDCX_MASK(id - AXP803_DCDC1);
> +		workmode <<=3D id - AXP803_DCDC1;
> +		break;
> +
>  	default:
>  		/* should not happen */
>  		WARN_ON(1);
> @@ -492,20 +578,38 @@ static bool axp20x_is_polyphase_slave(struct axp20x=
_dev *axp20x, int id)
>  {
>  	u32 reg =3D 0;
> =20
> -	/* Only AXP806 has poly-phase outputs */
> -	if (axp20x->variant !=3D AXP806_ID)
> -		return false;
> +	/*
> +	 * Currently in our supported AXP variants, only AXP806 and AXP803
> +	 * have polyphase regulators.
> +	 */
> +	switch (axp20x->variant) {
> +	case AXP803_ID:
> +		regmap_read(axp20x->regmap, AXP803_POLYPHASE_CTRL, &reg);
> +
> +		switch (id) {
> +		case AXP803_DCDC3:
> +			return !!(reg & BIT(6));
> +		case AXP803_DCDC6:
> +			return !!(reg & BIT(7));
> +		}
> +		break;
> =20
> -	regmap_read(axp20x->regmap, AXP806_DCDC_MODE_CTRL2, &reg);
> +	case AXP806_ID:
> +		regmap_read(axp20x->regmap, AXP806_DCDC_MODE_CTRL2, &reg);
> +
> +		switch (id) {
> +		case AXP806_DCDCB:
> +			return (((reg & GENMASK(7, 6)) =3D=3D BIT(6)) ||
> +				((reg & GENMASK(7, 6)) =3D=3D BIT(7)));
> +		case AXP806_DCDCC:
> +			return ((reg & GENMASK(7, 6)) =3D=3D BIT(7));
> +		case AXP806_DCDCE:
> +			return !!(reg & BIT(5));
> +		}
> +		break;
> =20
> -	switch (id) {
> -	case AXP806_DCDCB:
> -		return (((reg & GENMASK(7, 6)) =3D=3D BIT(6)) ||
> -			((reg & GENMASK(7, 6)) =3D=3D BIT(7)));
> -	case AXP806_DCDCC:
> -		return ((reg & GENMASK(7, 6)) =3D=3D BIT(7));
> -	case AXP806_DCDCE:
> -		return !!(reg & BIT(5));
> +	default:
> +		return false;
>  	}
> =20
>  	return false;
> @@ -540,6 +644,10 @@ static int axp20x_regulator_probe(struct platform_de=
vice *pdev)
>  		drivevbus =3D of_property_read_bool(pdev->dev.parent->of_node,
>  						  "x-powers,drive-vbus-en");
>  		break;
> +	case AXP803_ID:
> +		regulators =3D axp803_regulators;
> +		nregulators =3D AXP803_REG_ID_MAX;
> +		break;
>  	case AXP806_ID:
>  		regulators =3D axp806_regulators;
>  		nregulators =3D AXP806_REG_ID_MAX;
> @@ -579,6 +687,7 @@ static int axp20x_regulator_probe(struct platform_dev=
ice *pdev)
>  		 * name.
>  		 */
>  		if ((regulators =3D=3D axp22x_regulators && i =3D=3D AXP22X_DC1SW) ||
> +		    (regulators =3D=3D axp803_regulators && i =3D=3D AXP803_DC1SW) ||
>  		    (regulators =3D=3D axp809_regulators && i =3D=3D AXP809_DC1SW)) {
>  			new_desc =3D devm_kzalloc(&pdev->dev, sizeof(*desc),
>  						GFP_KERNEL);
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index cde56cfe8446..965b027e31b3 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -119,6 +119,17 @@ enum axp20x_variants {
>  #define AXP806_BUS_ADDR_EXT		0xfe
>  #define AXP806_REG_ADDR_EXT		0xff
> =20
> +#define AXP803_POLYPHASE_CTRL		0x14
> +#define AXP803_FLDO1_V_OUT		0x1c
> +#define AXP803_FLDO2_V_OUT		0x1d
> +#define AXP803_DCDC1_V_OUT		0x20
> +#define AXP803_DCDC2_V_OUT		0x21
> +#define AXP803_DCDC3_V_OUT		0x22
> +#define AXP803_DCDC4_V_OUT		0x23
> +#define AXP803_DCDC5_V_OUT		0x24
> +#define AXP803_DCDC6_V_OUT		0x25
> +#define AXP803_DCDC_FREQ_CTRL		0x3b
> +
>  /* Interrupt */
>  #define AXP152_IRQ1_EN			0x40
>  #define AXP152_IRQ2_EN			0x41
> @@ -350,6 +361,32 @@ enum {
>  	AXP809_REG_ID_MAX,
>  };
> =20
> +enum {
> +	AXP803_DCDC1 =3D 0,
> +	AXP803_DCDC2,
> +	AXP803_DCDC3,
> +	AXP803_DCDC4,
> +	AXP803_DCDC5,
> +	AXP803_DCDC6,
> +	AXP803_DC1SW,
> +	AXP803_ALDO1,
> +	AXP803_ALDO2,
> +	AXP803_ALDO3,
> +	AXP803_DLDO1,
> +	AXP803_DLDO2,
> +	AXP803_DLDO3,
> +	AXP803_DLDO4,
> +	AXP803_ELDO1,
> +	AXP803_ELDO2,
> +	AXP803_ELDO3,
> +	AXP803_FLDO1,
> +	AXP803_FLDO2,
> +	AXP803_RTC_LDO,
> +	AXP803_LDO_IO0,
> +	AXP803_LDO_IO1,
> +	AXP803_REG_ID_MAX,
> +};
> +
>  /* IRQs */
>  enum {
>  	AXP152_IRQ_LDO0IN_CONNECT =3D 1,

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
