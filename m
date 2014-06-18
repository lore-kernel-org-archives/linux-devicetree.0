From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/7] mfd: axp20x: add AXP221 PMIC support
Date: Wed, 18 Jun 2014 09:36:05 +0100
Message-ID: <20140618083605.GQ21030@lee--X1>
References: <1402990723-28138-1-git-send-email-boris.brezillon@free-electrons.com>
 <1402990723-28138-2-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBB746QWOQKGQE3O53MFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1402990723-28138-2-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 17 Jun 2014, Boris BREZILLON wrote:

> Add support for the AXP221 PMIC device to the existing AXP20x driver.
>=20
> The AXP221 defines a new set of registers, power supplies and regulators,
> but most of the API is similar to the AXP20x ones.
> The AXP20x irq chip definition is reused, though some interrupts are not
> available in the AXP221.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/mfd/axp20x.c       | 64 ++++++++++++++++++++++++++++++++++++++++=
++----
>  include/linux/mfd/axp20x.h | 56 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 115 insertions(+), 5 deletions(-)

Looks good to me now.
  Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Can this go in independently to the other patches in the set?

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index dee6539..ad4c177 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -33,6 +33,11 @@ static const struct regmap_range axp20x_writeable_rang=
es[] =3D {
>  	regmap_reg_range(AXP20X_DCDC_MODE, AXP20X_FG_RES),
>  };
> =20
> +static const struct regmap_range axp22x_writeable_ranges[] =3D {
> +	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_IRQ5_STATE),
> +	regmap_reg_range(AXP20X_DCDC_MODE, AXP22X_BATLOW_THRES1),
> +};
> +
>  static const struct regmap_range axp20x_volatile_ranges[] =3D {
>  	regmap_reg_range(AXP20X_IRQ1_EN, AXP20X_IRQ5_STATE),
>  };
> @@ -42,6 +47,11 @@ static const struct regmap_access_table axp20x_writeab=
le_table =3D {
>  	.n_yes_ranges	=3D ARRAY_SIZE(axp20x_writeable_ranges),
>  };
> =20
> +static const struct regmap_access_table axp22x_writeable_table =3D {
> +	.yes_ranges	=3D axp22x_writeable_ranges,
> +	.n_yes_ranges	=3D ARRAY_SIZE(axp22x_writeable_ranges),
> +};
> +
>  static const struct regmap_access_table axp20x_volatile_table =3D {
>  	.yes_ranges	=3D axp20x_volatile_ranges,
>  	.n_yes_ranges	=3D ARRAY_SIZE(axp20x_volatile_ranges),
> @@ -70,6 +80,15 @@ static const struct regmap_config axp20x_regmap_config=
 =3D {
>  	.cache_type	=3D REGCACHE_RBTREE,
>  };
> =20
> +static const struct regmap_config axp22x_regmap_config =3D {
> +	.reg_bits	=3D 8,
> +	.val_bits	=3D 8,
> +	.wr_table	=3D &axp22x_writeable_table,
> +	.volatile_table	=3D &axp20x_volatile_table,
> +	.max_register	=3D AXP22X_BATLOW_THRES1,
> +	.cache_type	=3D REGCACHE_RBTREE,
> +};
> +
>  #define AXP20X_IRQ(_irq, _off, _mask) \
>  	[AXP20X_IRQ_##_irq] =3D { .reg_offset =3D (_off), .mask =3D BIT(_mask) =
}
> =20
> @@ -116,6 +135,7 @@ static const struct regmap_irq axp20x_regmap_irqs[] =
=3D {
>  static const struct of_device_id axp20x_of_match[] =3D {
>  	{ .compatible =3D "x-powers,axp202", .data =3D (void *) AXP202_ID },
>  	{ .compatible =3D "x-powers,axp209", .data =3D (void *) AXP209_ID },
> +	{ .compatible =3D "x-powers,axp221", .data =3D (void *) AXP221_ID },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, axp20x_of_match);
> @@ -149,6 +169,21 @@ static const char * const axp20x_supplies[] =3D {
>  	"ldo5in",
>  };
> =20
> +static const char *axp22x_supplies[] =3D {
> +	"vbus",
> +	"acin",
> +	"vin1",
> +	"vin2",
> +	"vin3",
> +	"vin4",
> +	"vin5",
> +	"aldoin",
> +	"dldoin",
> +	"eldoin",
> +	"ldoioin",
> +	"rtcldoin",
> +};
> +
>  static struct mfd_cell axp20x_cells[] =3D {
>  	{
>  		.name			=3D "axp20x-pek",
> @@ -161,6 +196,14 @@ static struct mfd_cell axp20x_cells[] =3D {
>  	},
>  };
> =20
> +static struct mfd_cell axp22x_cells[] =3D {
> +	{
> +		.name			=3D "axp20x-regulator",
> +		.parent_supplies	=3D axp22x_supplies,
> +		.num_parent_supplies	=3D ARRAY_SIZE(axp22x_supplies),
> +	},
> +};
> +
>  static struct axp20x_dev *axp20x_pm_power_off;
>  static void axp20x_power_off(void)
>  {
> @@ -171,8 +214,11 @@ static void axp20x_power_off(void)
>  static int axp20x_i2c_probe(struct i2c_client *i2c,
>  			 const struct i2c_device_id *id)
>  {
> -	struct axp20x_dev *axp20x;
> +	const struct regmap_config *regmap_cfg;
>  	const struct of_device_id *of_id;
> +	struct axp20x_dev *axp20x;
> +	struct mfd_cell *cells;
> +	int ncells;
>  	int ret;
> =20
>  	axp20x =3D devm_kzalloc(&i2c->dev, sizeof(*axp20x), GFP_KERNEL);
> @@ -190,7 +236,17 @@ static int axp20x_i2c_probe(struct i2c_client *i2c,
>  	axp20x->dev =3D &i2c->dev;
>  	dev_set_drvdata(axp20x->dev, axp20x);
> =20
> -	axp20x->regmap =3D devm_regmap_init_i2c(i2c, &axp20x_regmap_config);
> +	if (axp20x->variant =3D=3D AXP221_ID) {
> +		regmap_cfg =3D &axp22x_regmap_config;
> +		cells =3D axp22x_cells;
> +		ncells =3D ARRAY_SIZE(axp22x_cells);
> +	} else {
> +		regmap_cfg =3D &axp20x_regmap_config;
> +		cells =3D axp20x_cells;
> +		ncells =3D ARRAY_SIZE(axp20x_cells);
> +	}
> +
> +	axp20x->regmap =3D devm_regmap_init_i2c(i2c, regmap_cfg);
>  	if (IS_ERR(axp20x->regmap)) {
>  		ret =3D PTR_ERR(axp20x->regmap);
>  		dev_err(&i2c->dev, "regmap init failed: %d\n", ret);
> @@ -206,9 +262,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c,
>  		return ret;
>  	}
> =20
> -	ret =3D mfd_add_devices(axp20x->dev, -1, axp20x_cells,
> -			      ARRAY_SIZE(axp20x_cells), NULL, 0, NULL);
> -
> +	ret =3D mfd_add_devices(axp20x->dev, -1, cells, ncells, NULL, 0, NULL);
>  	if (ret) {
>  		dev_err(&i2c->dev, "failed to add MFD devices: %d\n", ret);
>  		regmap_del_irq_chip(i2c->irq, axp20x->regmap_irqc);
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index d0e31a2..8a8ce02 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -14,6 +14,7 @@
>  enum {
>  	AXP202_ID =3D 0,
>  	AXP209_ID,
> +	AXP221_ID,
>  };
> =20
>  #define AXP20X_DATACACHE(m)		(0x04 + (m))
> @@ -43,6 +44,28 @@ enum {
>  #define AXP20X_V_LTF_DISCHRG		0x3c
>  #define AXP20X_V_HTF_DISCHRG		0x3d
> =20
> +#define AXP22X_PWR_OUT_CTRL1		0x10
> +#define AXP22X_PWR_OUT_CTRL2		0x12
> +#define AXP22X_PWR_OUT_CTRL3		0x13
> +#define AXP22X_DLDO1_V_OUT		0x15
> +#define AXP22X_DLDO2_V_OUT		0x16
> +#define AXP22X_DLDO3_V_OUT		0x17
> +#define AXP22X_DLDO4_V_OUT		0x18
> +#define AXP22X_ELDO1_V_OUT		0x19
> +#define AXP22X_ELDO2_V_OUT		0x1a
> +#define AXP22X_ELDO3_V_OUT		0x1b
> +#define AXP22X_DC5LDO_V_OUT		0x1c
> +#define AXP22X_DCDC1_V_OUT		0x21
> +#define AXP22X_DCDC2_V_OUT		0x22
> +#define AXP22X_DCDC3_V_OUT		0x23
> +#define AXP22X_DCDC4_V_OUT		0x24
> +#define AXP22X_DCDC5_V_OUT		0x25
> +#define AXP22X_DCDC23_V_RAMP_CTRL	0x27
> +#define AXP22X_ALDO1_V_OUT		0x28
> +#define AXP22X_ALDO2_V_OUT		0x29
> +#define AXP22X_ALDO3_V_OUT		0x2a
> +#define AXP22X_CHRG_CTRL3		0x35
> +
>  /* Interrupt */
>  #define AXP20X_IRQ1_EN			0x40
>  #define AXP20X_IRQ2_EN			0x41
> @@ -96,6 +119,9 @@ enum {
>  #define AXP20X_VBUS_MON			0x8b
>  #define AXP20X_OVER_TMP			0x8f
> =20
> +#define AXP22X_PWREN_CTRL1		0x8c
> +#define AXP22X_PWREN_CTRL2		0x8d
> +
>  /* GPIO */
>  #define AXP20X_GPIO0_CTRL		0x90
>  #define AXP20X_LDO5_V_OUT		0x91
> @@ -104,6 +130,11 @@ enum {
>  #define AXP20X_GPIO20_SS		0x94
>  #define AXP20X_GPIO3_CTRL		0x95
> =20
> +#define AXP22X_LDO_IO0_V_OUT		0x91
> +#define AXP22X_LDO_IO1_V_OUT		0x93
> +#define AXP22X_GPIO_STATE		0x94
> +#define AXP22X_GPIO_PULL_DOWN		0x95
> +
>  /* Battery */
>  #define AXP20X_CHRG_CC_31_24		0xb0
>  #define AXP20X_CHRG_CC_23_16		0xb1
> @@ -116,6 +147,8 @@ enum {
>  #define AXP20X_CC_CTRL			0xb8
>  #define AXP20X_FG_RES			0xb9
> =20
> +#define AXP22X_BATLOW_THRES1		0xe6
> +
>  /* Regulators IDs */
>  enum {
>  	AXP20X_LDO1 =3D 0,
> @@ -128,6 +161,29 @@ enum {
>  	AXP20X_REG_ID_MAX,
>  };
> =20
> +enum {
> +	AXP22X_DCDC1 =3D 0,
> +	AXP22X_DCDC2,
> +	AXP22X_DCDC3,
> +	AXP22X_DCDC4,
> +	AXP22X_DCDC5,
> +	AXP22X_DC5LDO,
> +	AXP22X_ALDO1,
> +	AXP22X_ALDO2,
> +	AXP22X_ALDO3,
> +	AXP22X_ELDO1,
> +	AXP22X_ELDO2,
> +	AXP22X_ELDO3,
> +	AXP22X_DLDO1,
> +	AXP22X_DLDO2,
> +	AXP22X_DLDO3,
> +	AXP22X_DLDO4,
> +	AXP22X_RTC_LDO,
> +	AXP22X_LDO_IO0,
> +	AXP22X_LDO_IO1,
> +	AXP22X_REG_ID_MAX,
> +};
> +
>  /* IRQs */
>  enum {
>  	AXP20X_IRQ_ACIN_OVER_V =3D 1,

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
