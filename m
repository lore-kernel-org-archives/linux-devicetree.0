From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/8] mfd: axp20x: Add support for AXP806 PMIC
Date: Wed, 31 Aug 2016 13:12:07 +0100
Message-ID: <20160831121207.GD9301@dell>
References: <20160827075544.26316-1-wens@csie.org>
 <20160827075544.26316-3-wens@csie.org>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBLMSTO7AKGQEKQXPDHA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160827075544.26316-3-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 27 Aug 2016, Chen-Yu Tsai wrote:

> The X-Powers AXP806 is a new PMIC that is paired with Allwinner's A80
> SoC, along with a master AXP809 PMIC.
>=20
> This PMIC has a new register layout, and supports some functions not
> seen in other X-Powers PMICs, such as master-slave mode, or having
> multiple AXP806 PMICs on the same bus with address space extension,
> or supporting both I2C and RSB mode. I2C has not been tested.
>=20
> This patch adds support for the interrupts of the PMIC. A regulator
> sub-device is enabled, but actual regulator support will come in a
> later patch.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
> Changes since v1: none
> ---
>  drivers/mfd/axp20x-rsb.c   |  1 +
>  drivers/mfd/axp20x.c       | 72 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/mfd/axp20x.h | 60 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 133 insertions(+)

Applied, thanks.

> diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
> index a407527bcd09..a732cb50bcff 100644
> --- a/drivers/mfd/axp20x-rsb.c
> +++ b/drivers/mfd/axp20x-rsb.c
> @@ -61,6 +61,7 @@ static int axp20x_rsb_remove(struct sunxi_rsb_device *r=
dev)
> =20
>  static const struct of_device_id axp20x_rsb_of_match[] =3D {
>  	{ .compatible =3D "x-powers,axp223", .data =3D (void *)AXP223_ID },
> +	{ .compatible =3D "x-powers,axp806", .data =3D (void *)AXP806_ID },
>  	{ .compatible =3D "x-powers,axp809", .data =3D (void *)AXP809_ID },
>  	{ },
>  };
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index fd80b0981f0f..96102753847f 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -38,6 +38,7 @@ static const char * const axp20x_model_names[] =3D {
>  	"AXP221",
>  	"AXP223",
>  	"AXP288",
> +	"AXP806",
>  	"AXP809",
>  };
> =20
> @@ -129,6 +130,27 @@ static const struct regmap_access_table axp288_volat=
ile_table =3D {
>  	.n_yes_ranges	=3D ARRAY_SIZE(axp288_volatile_ranges),
>  };
> =20
> +static const struct regmap_range axp806_writeable_ranges[] =3D {
> +	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_DATACACHE(3)),
> +	regmap_reg_range(AXP806_PWR_OUT_CTRL1, AXP806_CLDO3_V_CTRL),
> +	regmap_reg_range(AXP20X_IRQ1_EN, AXP20X_IRQ2_EN),
> +	regmap_reg_range(AXP20X_IRQ1_STATE, AXP20X_IRQ2_STATE),
> +};
> +
> +static const struct regmap_range axp806_volatile_ranges[] =3D {
> +	regmap_reg_range(AXP20X_IRQ1_STATE, AXP20X_IRQ2_STATE),
> +};
> +
> +static const struct regmap_access_table axp806_writeable_table =3D {
> +	.yes_ranges	=3D axp806_writeable_ranges,
> +	.n_yes_ranges	=3D ARRAY_SIZE(axp806_writeable_ranges),
> +};
> +
> +static const struct regmap_access_table axp806_volatile_table =3D {
> +	.yes_ranges	=3D axp806_volatile_ranges,
> +	.n_yes_ranges	=3D ARRAY_SIZE(axp806_volatile_ranges),
> +};
> +
>  static struct resource axp152_pek_resources[] =3D {
>  	DEFINE_RES_IRQ_NAMED(AXP152_IRQ_PEK_RIS_EDGE, "PEK_DBR"),
>  	DEFINE_RES_IRQ_NAMED(AXP152_IRQ_PEK_FAL_EDGE, "PEK_DBF"),
> @@ -278,6 +300,15 @@ static const struct regmap_config axp288_regmap_conf=
ig =3D {
>  	.cache_type	=3D REGCACHE_RBTREE,
>  };
> =20
> +static const struct regmap_config axp806_regmap_config =3D {
> +	.reg_bits	=3D 8,
> +	.val_bits	=3D 8,
> +	.wr_table	=3D &axp806_writeable_table,
> +	.volatile_table	=3D &axp806_volatile_table,
> +	.max_register	=3D AXP806_VREF_TEMP_WARN_L,
> +	.cache_type	=3D REGCACHE_RBTREE,
> +};
> +
>  #define INIT_REGMAP_IRQ(_variant, _irq, _off, _mask)			\
>  	[_variant##_IRQ_##_irq] =3D { .reg_offset =3D (_off), .mask =3D BIT(_ma=
sk) }
> =20
> @@ -409,6 +440,21 @@ static const struct regmap_irq axp288_regmap_irqs[] =
=3D {
>  	INIT_REGMAP_IRQ(AXP288, BC_USB_CHNG,            5, 1),
>  };
> =20
> +static const struct regmap_irq axp806_regmap_irqs[] =3D {
> +	INIT_REGMAP_IRQ(AXP806, DIE_TEMP_HIGH_LV1,	0, 0),
> +	INIT_REGMAP_IRQ(AXP806, DIE_TEMP_HIGH_LV2,	0, 1),
> +	INIT_REGMAP_IRQ(AXP806, DCDCA_V_LOW,		0, 3),
> +	INIT_REGMAP_IRQ(AXP806, DCDCB_V_LOW,		0, 4),
> +	INIT_REGMAP_IRQ(AXP806, DCDCC_V_LOW,		0, 5),
> +	INIT_REGMAP_IRQ(AXP806, DCDCD_V_LOW,		0, 6),
> +	INIT_REGMAP_IRQ(AXP806, DCDCE_V_LOW,		0, 7),
> +	INIT_REGMAP_IRQ(AXP806, PWROK_LONG,		1, 0),
> +	INIT_REGMAP_IRQ(AXP806, PWROK_SHORT,		1, 1),
> +	INIT_REGMAP_IRQ(AXP806, WAKEUP,			1, 4),
> +	INIT_REGMAP_IRQ(AXP806, PWROK_FALL,		1, 5),
> +	INIT_REGMAP_IRQ(AXP806, PWROK_RISE,		1, 6),
> +};
> +
>  static const struct regmap_irq axp809_regmap_irqs[] =3D {
>  	INIT_REGMAP_IRQ(AXP809, ACIN_OVER_V,		0, 7),
>  	INIT_REGMAP_IRQ(AXP809, ACIN_PLUGIN,		0, 6),
> @@ -494,6 +540,18 @@ static const struct regmap_irq_chip axp288_regmap_ir=
q_chip =3D {
> =20
>  };
> =20
> +static const struct regmap_irq_chip axp806_regmap_irq_chip =3D {
> +	.name			=3D "axp806",
> +	.status_base		=3D AXP20X_IRQ1_STATE,
> +	.ack_base		=3D AXP20X_IRQ1_STATE,
> +	.mask_base		=3D AXP20X_IRQ1_EN,
> +	.mask_invert		=3D true,
> +	.init_ack_masked	=3D true,
> +	.irqs			=3D axp806_regmap_irqs,
> +	.num_irqs		=3D ARRAY_SIZE(axp806_regmap_irqs),
> +	.num_regs		=3D 2,
> +};
> +
>  static const struct regmap_irq_chip axp809_regmap_irq_chip =3D {
>  	.name			=3D "axp809",
>  	.status_base		=3D AXP20X_IRQ1_STATE,
> @@ -660,12 +718,20 @@ static struct mfd_cell axp288_cells[] =3D {
>  	},
>  };
> =20
> +static struct mfd_cell axp806_cells[] =3D {
> +	{
> +		.id			=3D 2,
> +		.name			=3D "axp20x-regulator",
> +	},
> +};
> +
>  static struct mfd_cell axp809_cells[] =3D {
>  	{
>  		.name			=3D "axp20x-pek",
>  		.num_resources		=3D ARRAY_SIZE(axp809_pek_resources),
>  		.resources		=3D axp809_pek_resources,
>  	}, {
> +		.id			=3D 1,
>  		.name			=3D "axp20x-regulator",
>  	},
>  };
> @@ -732,6 +798,12 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  		axp20x->regmap_cfg =3D &axp288_regmap_config;
>  		axp20x->regmap_irq_chip =3D &axp288_regmap_irq_chip;
>  		break;
> +	case AXP806_ID:
> +		axp20x->nr_cells =3D ARRAY_SIZE(axp806_cells);
> +		axp20x->cells =3D axp806_cells;
> +		axp20x->regmap_cfg =3D &axp806_regmap_config;
> +		axp20x->regmap_irq_chip =3D &axp806_regmap_irq_chip;
> +		break;
>  	case AXP809_ID:
>  		axp20x->nr_cells =3D ARRAY_SIZE(axp809_cells);
>  		axp20x->cells =3D axp809_cells;
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index 0be4982f08fe..fec597fb34cb 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -20,6 +20,7 @@ enum {
>  	AXP221_ID,
>  	AXP223_ID,
>  	AXP288_ID,
> +	AXP806_ID,
>  	AXP809_ID,
>  	NR_AXP20X_VARIANTS,
>  };
> @@ -91,6 +92,30 @@ enum {
>  #define AXP22X_ALDO3_V_OUT		0x2a
>  #define AXP22X_CHRG_CTRL3		0x35
> =20
> +#define AXP806_STARTUP_SRC		0x00
> +#define AXP806_CHIP_ID			0x03
> +#define AXP806_PWR_OUT_CTRL1		0x10
> +#define AXP806_PWR_OUT_CTRL2		0x11
> +#define AXP806_DCDCA_V_CTRL		0x12
> +#define AXP806_DCDCB_V_CTRL		0x13
> +#define AXP806_DCDCC_V_CTRL		0x14
> +#define AXP806_DCDCD_V_CTRL		0x15
> +#define AXP806_DCDCE_V_CTRL		0x16
> +#define AXP806_ALDO1_V_CTRL		0x17
> +#define AXP806_ALDO2_V_CTRL		0x18
> +#define AXP806_ALDO3_V_CTRL		0x19
> +#define AXP806_DCDC_MODE_CTRL1		0x1a
> +#define AXP806_DCDC_MODE_CTRL2		0x1b
> +#define AXP806_DCDC_FREQ_CTRL		0x1c
> +#define AXP806_BLDO1_V_CTRL		0x20
> +#define AXP806_BLDO2_V_CTRL		0x21
> +#define AXP806_BLDO3_V_CTRL		0x22
> +#define AXP806_BLDO4_V_CTRL		0x23
> +#define AXP806_CLDO1_V_CTRL		0x24
> +#define AXP806_CLDO2_V_CTRL		0x25
> +#define AXP806_CLDO3_V_CTRL		0x26
> +#define AXP806_VREF_TEMP_WARN_L		0xf3
> +
>  /* Interrupt */
>  #define AXP152_IRQ1_EN			0x40
>  #define AXP152_IRQ2_EN			0x41
> @@ -266,6 +291,26 @@ enum {
>  };
> =20
>  enum {
> +	AXP806_DCDCA =3D 0,
> +	AXP806_DCDCB,
> +	AXP806_DCDCC,
> +	AXP806_DCDCD,
> +	AXP806_DCDCE,
> +	AXP806_ALDO1,
> +	AXP806_ALDO2,
> +	AXP806_ALDO3,
> +	AXP806_BLDO1,
> +	AXP806_BLDO2,
> +	AXP806_BLDO3,
> +	AXP806_BLDO4,
> +	AXP806_CLDO1,
> +	AXP806_CLDO2,
> +	AXP806_CLDO3,
> +	AXP806_SW,
> +	AXP806_REG_ID_MAX,
> +};
> +
> +enum {
>  	AXP809_DCDC1 =3D 0,
>  	AXP809_DCDC2,
>  	AXP809_DCDC3,
> @@ -414,6 +459,21 @@ enum axp288_irqs {
>  	AXP288_IRQ_BC_USB_CHNG,
>  };
> =20
> +enum axp806_irqs {
> +	AXP806_IRQ_DIE_TEMP_HIGH_LV1,
> +	AXP806_IRQ_DIE_TEMP_HIGH_LV2,
> +	AXP806_IRQ_DCDCA_V_LOW,
> +	AXP806_IRQ_DCDCB_V_LOW,
> +	AXP806_IRQ_DCDCC_V_LOW,
> +	AXP806_IRQ_DCDCD_V_LOW,
> +	AXP806_IRQ_DCDCE_V_LOW,
> +	AXP806_IRQ_PWROK_LONG,
> +	AXP806_IRQ_PWROK_SHORT,
> +	AXP806_IRQ_WAKEUP,
> +	AXP806_IRQ_PWROK_FALL,
> +	AXP806_IRQ_PWROK_RISE,
> +};
> +
>  enum axp809_irqs {
>  	AXP809_IRQ_ACIN_OVER_V =3D 1,
>  	AXP809_IRQ_ACIN_PLUGIN,

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
