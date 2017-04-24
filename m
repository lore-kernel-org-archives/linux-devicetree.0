From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 05/12] mfd: axp20x: support AXP803 variant
Date: Mon, 24 Apr 2017 13:09:06 +0100
Message-ID: <20170424120906.q3emjbb42v556xd7@dell>
References: <20170417115747.7300-1-icenowy@aosc.io>
 <20170417115747.7300-6-icenowy@aosc.io>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBZWV67DQKGQE44LCXKQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170417115747.7300-6-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 17 Apr 2017, Icenowy Zheng wrote:

> AXP803 is a new PMIC chip produced by X-Powers, usually paired with A64
> via RSB bus. The PMIC itself is like AXP288, but with RSB support and
> dedicated VBUS and ACIN.
>=20
> Add support for it in the axp20x mfd driver.
>=20
> Currently only power key function is supported.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> This patch is said to be applied by Lee Jones, however, I didn't see it
> in the linux-next, so I included it in the patchset now.
>=20
> Changes in v2:
> - Share regmap configs with AXP288.
> - Place AXP803 bits before AXP806/809.
>=20
>  drivers/mfd/axp20x-rsb.c   |  1 +
>  drivers/mfd/axp20x.c       | 79 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/mfd/axp20x.h | 40 ++++++++++++++++++++++-
>  3 files changed, 119 insertions(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
> index a732cb50bcff..fd5c7267b136 100644
> --- a/drivers/mfd/axp20x-rsb.c
> +++ b/drivers/mfd/axp20x-rsb.c
> @@ -61,6 +61,7 @@ static int axp20x_rsb_remove(struct sunxi_rsb_device *r=
dev)
> =20
>  static const struct of_device_id axp20x_rsb_of_match[] =3D {
>  	{ .compatible =3D "x-powers,axp223", .data =3D (void *)AXP223_ID },
> +	{ .compatible =3D "x-powers,axp803", .data =3D (void *)AXP803_ID },
>  	{ .compatible =3D "x-powers,axp806", .data =3D (void *)AXP806_ID },
>  	{ .compatible =3D "x-powers,axp809", .data =3D (void *)AXP809_ID },
>  	{ },
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index e6f55079876e..1dc6235778eb 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -41,6 +41,7 @@ static const char * const axp20x_model_names[] =3D {
>  	"AXP221",
>  	"AXP223",
>  	"AXP288",
> +	"AXP803",
>  	"AXP806",
>  	"AXP809",
>  };
> @@ -117,6 +118,7 @@ static const struct regmap_access_table axp22x_volati=
le_table =3D {
>  	.n_yes_ranges	=3D ARRAY_SIZE(axp22x_volatile_ranges),
>  };
> =20
> +/* AXP288 ranges are shared with the AXP803, as they cover the same rang=
e */
>  static const struct regmap_range axp288_writeable_ranges[] =3D {
>  	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_IRQ6_STATE),
>  	regmap_reg_range(AXP20X_DCDC_MODE, AXP288_FG_TUNE5),
> @@ -264,6 +266,20 @@ static struct resource axp288_fuel_gauge_resources[]=
 =3D {
>  	},
>  };
> =20
> +static struct resource axp803_pek_resources[] =3D {
> +	{
> +		.name   =3D "PEK_DBR",
> +		.start  =3D AXP803_IRQ_PEK_RIS_EDGE,
> +		.end    =3D AXP803_IRQ_PEK_RIS_EDGE,
> +		.flags  =3D IORESOURCE_IRQ,
> +	}, {
> +		.name   =3D "PEK_DBF",
> +		.start  =3D AXP803_IRQ_PEK_FAL_EDGE,
> +		.end    =3D AXP803_IRQ_PEK_FAL_EDGE,
> +		.flags  =3D IORESOURCE_IRQ,
> +	},
> +};
> +
>  static struct resource axp809_pek_resources[] =3D {
>  	{
>  		.name   =3D "PEK_DBR",
> @@ -457,6 +473,43 @@ static const struct regmap_irq axp288_regmap_irqs[] =
=3D {
>  	INIT_REGMAP_IRQ(AXP288, BC_USB_CHNG,            5, 1),
>  };
> =20
> +static const struct regmap_irq axp803_regmap_irqs[] =3D {
> +	INIT_REGMAP_IRQ(AXP803, ACIN_OVER_V,		0, 7),
> +	INIT_REGMAP_IRQ(AXP803, ACIN_PLUGIN,		0, 6),
> +	INIT_REGMAP_IRQ(AXP803, ACIN_REMOVAL,	        0, 5),
> +	INIT_REGMAP_IRQ(AXP803, VBUS_OVER_V,		0, 4),
> +	INIT_REGMAP_IRQ(AXP803, VBUS_PLUGIN,		0, 3),
> +	INIT_REGMAP_IRQ(AXP803, VBUS_REMOVAL,	        0, 2),
> +	INIT_REGMAP_IRQ(AXP803, BATT_PLUGIN,		1, 7),
> +	INIT_REGMAP_IRQ(AXP803, BATT_REMOVAL,	        1, 6),
> +	INIT_REGMAP_IRQ(AXP803, BATT_ENT_ACT_MODE,	1, 5),
> +	INIT_REGMAP_IRQ(AXP803, BATT_EXIT_ACT_MODE,	1, 4),
> +	INIT_REGMAP_IRQ(AXP803, CHARG,		        1, 3),
> +	INIT_REGMAP_IRQ(AXP803, CHARG_DONE,		1, 2),
> +	INIT_REGMAP_IRQ(AXP803, BATT_CHG_TEMP_HIGH,	2, 7),
> +	INIT_REGMAP_IRQ(AXP803, BATT_CHG_TEMP_HIGH_END,	2, 6),
> +	INIT_REGMAP_IRQ(AXP803, BATT_CHG_TEMP_LOW,	2, 5),
> +	INIT_REGMAP_IRQ(AXP803, BATT_CHG_TEMP_LOW_END,	2, 4),
> +	INIT_REGMAP_IRQ(AXP803, BATT_ACT_TEMP_HIGH,	2, 3),
> +	INIT_REGMAP_IRQ(AXP803, BATT_ACT_TEMP_HIGH_END,	2, 2),
> +	INIT_REGMAP_IRQ(AXP803, BATT_ACT_TEMP_LOW,	2, 1),
> +	INIT_REGMAP_IRQ(AXP803, BATT_ACT_TEMP_LOW_END,	2, 0),
> +	INIT_REGMAP_IRQ(AXP803, DIE_TEMP_HIGH,	        3, 7),
> +	INIT_REGMAP_IRQ(AXP803, GPADC,		        3, 2),
> +	INIT_REGMAP_IRQ(AXP803, LOW_PWR_LVL1,	        3, 1),
> +	INIT_REGMAP_IRQ(AXP803, LOW_PWR_LVL2,	        3, 0),
> +	INIT_REGMAP_IRQ(AXP803, TIMER,		        4, 7),
> +	INIT_REGMAP_IRQ(AXP803, PEK_RIS_EDGE,	        4, 6),
> +	INIT_REGMAP_IRQ(AXP803, PEK_FAL_EDGE,	        4, 5),
> +	INIT_REGMAP_IRQ(AXP803, PEK_SHORT,		4, 4),
> +	INIT_REGMAP_IRQ(AXP803, PEK_LONG,		4, 3),
> +	INIT_REGMAP_IRQ(AXP803, PEK_OVER_OFF,		4, 2),
> +	INIT_REGMAP_IRQ(AXP803, GPIO1_INPUT,		4, 1),
> +	INIT_REGMAP_IRQ(AXP803, GPIO0_INPUT,		4, 0),
> +	INIT_REGMAP_IRQ(AXP803, BC_USB_CHNG,            5, 1),
> +	INIT_REGMAP_IRQ(AXP803, MV_CHNG,                5, 0),
> +};
> +
>  static const struct regmap_irq axp806_regmap_irqs[] =3D {
>  	INIT_REGMAP_IRQ(AXP806, DIE_TEMP_HIGH_LV1,	0, 0),
>  	INIT_REGMAP_IRQ(AXP806, DIE_TEMP_HIGH_LV2,	0, 1),
> @@ -557,6 +610,18 @@ static const struct regmap_irq_chip axp288_regmap_ir=
q_chip =3D {
> =20
>  };
> =20
> +static const struct regmap_irq_chip axp803_regmap_irq_chip =3D {
> +	.name			=3D "axp803",
> +	.status_base		=3D AXP20X_IRQ1_STATE,
> +	.ack_base		=3D AXP20X_IRQ1_STATE,
> +	.mask_base		=3D AXP20X_IRQ1_EN,
> +	.mask_invert		=3D true,
> +	.init_ack_masked	=3D true,
> +	.irqs			=3D axp803_regmap_irqs,
> +	.num_irqs		=3D ARRAY_SIZE(axp803_regmap_irqs),
> +	.num_regs		=3D 6,
> +};
> +
>  static const struct regmap_irq_chip axp806_regmap_irq_chip =3D {
>  	.name			=3D "axp806",
>  	.status_base		=3D AXP20X_IRQ1_STATE,
> @@ -778,6 +843,14 @@ static struct mfd_cell axp288_cells[] =3D {
>  	},
>  };
> =20
> +static struct mfd_cell axp803_cells[] =3D {
> +	{
> +		.name			=3D "axp20x-pek",
> +		.num_resources		=3D ARRAY_SIZE(axp803_pek_resources),
> +		.resources		=3D axp803_pek_resources,
> +	}
> +};
> +
>  static struct mfd_cell axp806_cells[] =3D {
>  	{
>  		.id			=3D 2,
> @@ -864,6 +937,12 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  		axp20x->regmap_irq_chip =3D &axp288_regmap_irq_chip;
>  		axp20x->irq_flags =3D IRQF_TRIGGER_LOW;
>  		break;
> +	case AXP803_ID:
> +		axp20x->nr_cells =3D ARRAY_SIZE(axp803_cells);
> +		axp20x->cells =3D axp803_cells;
> +		axp20x->regmap_cfg =3D &axp288_regmap_config;
> +		axp20x->regmap_irq_chip =3D &axp803_regmap_irq_chip;
> +		break;
>  	case AXP806_ID:
>  		axp20x->nr_cells =3D ARRAY_SIZE(axp806_cells);
>  		axp20x->cells =3D axp806_cells;
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index dc8798cf2a24..cde56cfe8446 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -20,6 +20,7 @@ enum axp20x_variants {
>  	AXP221_ID,
>  	AXP223_ID,
>  	AXP288_ID,
> +	AXP803_ID,
>  	AXP806_ID,
>  	AXP809_ID,
>  	NR_AXP20X_VARIANTS,
> @@ -234,7 +235,7 @@ enum axp20x_variants {
>  #define AXP22X_TS_ADC_L			0x59
>  #define AXP22X_BATLOW_THRES1		0xe6
> =20
> -/* AXP288 specific registers */
> +/* AXP288/AXP803 specific registers */
>  #define AXP288_POWER_REASON		0x02
>  #define AXP288_BC_GLOBAL		0x2c
>  #define AXP288_BC_VBUS_CNTL		0x2d
> @@ -475,6 +476,43 @@ enum axp288_irqs {
>  	AXP288_IRQ_BC_USB_CHNG,
>  };
> =20
> +enum axp803_irqs {
> +	AXP803_IRQ_ACIN_OVER_V =3D 1,
> +	AXP803_IRQ_ACIN_PLUGIN,
> +	AXP803_IRQ_ACIN_REMOVAL,
> +	AXP803_IRQ_VBUS_OVER_V,
> +	AXP803_IRQ_VBUS_PLUGIN,
> +	AXP803_IRQ_VBUS_REMOVAL,
> +	AXP803_IRQ_BATT_PLUGIN,
> +	AXP803_IRQ_BATT_REMOVAL,
> +	AXP803_IRQ_BATT_ENT_ACT_MODE,
> +	AXP803_IRQ_BATT_EXIT_ACT_MODE,
> +	AXP803_IRQ_CHARG,
> +	AXP803_IRQ_CHARG_DONE,
> +	AXP803_IRQ_BATT_CHG_TEMP_HIGH,
> +	AXP803_IRQ_BATT_CHG_TEMP_HIGH_END,
> +	AXP803_IRQ_BATT_CHG_TEMP_LOW,
> +	AXP803_IRQ_BATT_CHG_TEMP_LOW_END,
> +	AXP803_IRQ_BATT_ACT_TEMP_HIGH,
> +	AXP803_IRQ_BATT_ACT_TEMP_HIGH_END,
> +	AXP803_IRQ_BATT_ACT_TEMP_LOW,
> +	AXP803_IRQ_BATT_ACT_TEMP_LOW_END,
> +	AXP803_IRQ_DIE_TEMP_HIGH,
> +	AXP803_IRQ_GPADC,
> +	AXP803_IRQ_LOW_PWR_LVL1,
> +	AXP803_IRQ_LOW_PWR_LVL2,
> +	AXP803_IRQ_TIMER,
> +	AXP803_IRQ_PEK_RIS_EDGE,
> +	AXP803_IRQ_PEK_FAL_EDGE,
> +	AXP803_IRQ_PEK_SHORT,
> +	AXP803_IRQ_PEK_LONG,
> +	AXP803_IRQ_PEK_OVER_OFF,
> +	AXP803_IRQ_GPIO1_INPUT,
> +	AXP803_IRQ_GPIO0_INPUT,
> +	AXP803_IRQ_BC_USB_CHNG,
> +	AXP803_IRQ_MV_CHNG,
> +};
> +
>  enum axp806_irqs {
>  	AXP806_IRQ_DIE_TEMP_HIGH_LV1,
>  	AXP806_IRQ_DIE_TEMP_HIGH_LV2,

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
