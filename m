From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] mfd: axp20x: Add axp152 support
Date: Mon, 13 Jul 2015 08:24:59 +0100
Message-ID: <20150713072459.GH12199@x1>
References: <1436619596-11823-1-git-send-email-hdegoede@redhat.com>
 <1436619596-11823-2-git-send-email-hdegoede@redhat.com>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBTWPRWWQKGQEZ2FFCPA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1436619596-11823-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 11 Jul 2015, Hans de Goede wrote:

> From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> The axp152 is a stripped down version of the axp202 pmic with the battery
> charging function removed as it is intended for top-set boxes.
>=20
> Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> Changes in v2:
> -Seperated out the devicetree binding documentation into a separate patch
> -Use DEFINE_RES_IRQ_NAMED to define the irq resources
> Changes in v3:
> -s/ax20x/axp20x/ in the commit msg
> -Added Michal Suchanek's S-o-b (with his permission)
> ---
>  drivers/mfd/axp20x.c       | 83 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/mfd/axp20x.h | 61 +++++++++++++++++++++++++++++++++-
>  2 files changed, 143 insertions(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index ca4a604..9027fc3 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -30,12 +30,34 @@
>  #define AXP20X_OFF	0x80
> =20
>  static const char * const axp20x_model_names[] =3D {
> +	"AXP152",
>  	"AXP202",
>  	"AXP209",
>  	"AXP221",
>  	"AXP288",
>  };
> =20
> +static const struct regmap_range axp152_writeable_ranges[] =3D {
> +	regmap_reg_range(AXP152_LDO3456_DC1234_CTRL, AXP152_IRQ3_STATE),
> +	regmap_reg_range(AXP152_DCDC_MODE, AXP152_PWM1_DUTY_CYCLE),
> +};
> +
> +static const struct regmap_range axp152_volatile_ranges[] =3D {
> +	regmap_reg_range(AXP152_PWR_OP_MODE, AXP152_PWR_OP_MODE),
> +	regmap_reg_range(AXP152_IRQ1_EN, AXP152_IRQ3_STATE),
> +	regmap_reg_range(AXP152_GPIO_INPUT, AXP152_GPIO_INPUT),
> +};
> +
> +static const struct regmap_access_table axp152_writeable_table =3D {
> +	.yes_ranges	=3D axp152_writeable_ranges,
> +	.n_yes_ranges	=3D ARRAY_SIZE(axp152_writeable_ranges),
> +};
> +
> +static const struct regmap_access_table axp152_volatile_table =3D {
> +	.yes_ranges	=3D axp152_volatile_ranges,
> +	.n_yes_ranges	=3D ARRAY_SIZE(axp152_volatile_ranges),
> +};
> +
>  static const struct regmap_range axp20x_writeable_ranges[] =3D {
>  	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_IRQ5_STATE),
>  	regmap_reg_range(AXP20X_DCDC_MODE, AXP20X_FG_RES),
> @@ -99,6 +121,11 @@ static const struct regmap_access_table axp288_volati=
le_table =3D {
>  	.n_yes_ranges	=3D ARRAY_SIZE(axp288_volatile_ranges),
>  };
> =20
> +static struct resource axp152_pek_resources[] =3D {
> +	DEFINE_RES_IRQ_NAMED(AXP152_IRQ_PEK_RIS_EDGE, "PEK_DBR"),
> +	DEFINE_RES_IRQ_NAMED(AXP152_IRQ_PEK_FAL_EDGE, "PEK_DBF"),
> +};
> +
>  static struct resource axp20x_pek_resources[] =3D {
>  	{
>  		.name	=3D "PEK_DBR",
> @@ -167,6 +194,15 @@ static struct resource axp288_fuel_gauge_resources[]=
 =3D {
>  	},
>  };
> =20
> +static const struct regmap_config axp152_regmap_config =3D {
> +	.reg_bits	=3D 8,
> +	.val_bits	=3D 8,
> +	.wr_table	=3D &axp152_writeable_table,
> +	.volatile_table	=3D &axp152_volatile_table,
> +	.max_register	=3D AXP152_PWM1_DUTY_CYCLE,
> +	.cache_type	=3D REGCACHE_RBTREE,
> +};
> +
>  static const struct regmap_config axp20x_regmap_config =3D {
>  	.reg_bits	=3D 8,
>  	.val_bits	=3D 8,
> @@ -197,6 +233,26 @@ static const struct regmap_config axp288_regmap_conf=
ig =3D {
>  #define INIT_REGMAP_IRQ(_variant, _irq, _off, _mask)			\
>  	[_variant##_IRQ_##_irq] =3D { .reg_offset =3D (_off), .mask =3D BIT(_ma=
sk) }
> =20
> +static const struct regmap_irq axp152_regmap_irqs[] =3D {
> +	INIT_REGMAP_IRQ(AXP152, LDO0IN_CONNECT,		0, 6),
> +	INIT_REGMAP_IRQ(AXP152, LDO0IN_REMOVAL,		0, 5),
> +	INIT_REGMAP_IRQ(AXP152, ALDO0IN_CONNECT,	0, 3),
> +	INIT_REGMAP_IRQ(AXP152, ALDO0IN_REMOVAL,	0, 2),
> +	INIT_REGMAP_IRQ(AXP152, DCDC1_V_LOW,		1, 5),
> +	INIT_REGMAP_IRQ(AXP152, DCDC2_V_LOW,		1, 4),
> +	INIT_REGMAP_IRQ(AXP152, DCDC3_V_LOW,		1, 3),
> +	INIT_REGMAP_IRQ(AXP152, DCDC4_V_LOW,		1, 2),
> +	INIT_REGMAP_IRQ(AXP152, PEK_SHORT,		1, 1),
> +	INIT_REGMAP_IRQ(AXP152, PEK_LONG,		1, 0),
> +	INIT_REGMAP_IRQ(AXP152, TIMER,			2, 7),
> +	INIT_REGMAP_IRQ(AXP152, PEK_RIS_EDGE,		2, 6),
> +	INIT_REGMAP_IRQ(AXP152, PEK_FAL_EDGE,		2, 5),
> +	INIT_REGMAP_IRQ(AXP152, GPIO3_INPUT,		2, 3),
> +	INIT_REGMAP_IRQ(AXP152, GPIO2_INPUT,		2, 2),
> +	INIT_REGMAP_IRQ(AXP152, GPIO1_INPUT,		2, 1),
> +	INIT_REGMAP_IRQ(AXP152, GPIO0_INPUT,		2, 0),
> +};
> +
>  static const struct regmap_irq axp20x_regmap_irqs[] =3D {
>  	INIT_REGMAP_IRQ(AXP20X, ACIN_OVER_V,		0, 7),
>  	INIT_REGMAP_IRQ(AXP20X, ACIN_PLUGIN,		0, 6),
> @@ -306,6 +362,7 @@ static const struct regmap_irq axp288_regmap_irqs[] =
=3D {
>  };
> =20
>  static const struct of_device_id axp20x_of_match[] =3D {
> +	{ .compatible =3D "x-powers,axp152", .data =3D (void *) AXP152_ID },
>  	{ .compatible =3D "x-powers,axp202", .data =3D (void *) AXP202_ID },
>  	{ .compatible =3D "x-powers,axp209", .data =3D (void *) AXP209_ID },
>  	{ .compatible =3D "x-powers,axp221", .data =3D (void *) AXP221_ID },
> @@ -330,6 +387,18 @@ static const struct acpi_device_id axp20x_acpi_match=
[] =3D {
>  };
>  MODULE_DEVICE_TABLE(acpi, axp20x_acpi_match);
> =20
> +static const struct regmap_irq_chip axp152_regmap_irq_chip =3D {
> +	.name			=3D "axp152_irq_chip",
> +	.status_base		=3D AXP152_IRQ1_STATE,
> +	.ack_base		=3D AXP152_IRQ1_STATE,
> +	.mask_base		=3D AXP152_IRQ1_EN,
> +	.mask_invert		=3D true,
> +	.init_ack_masked	=3D true,
> +	.irqs			=3D axp152_regmap_irqs,
> +	.num_irqs		=3D ARRAY_SIZE(axp152_regmap_irqs),
> +	.num_regs		=3D 3,
> +};
> +
>  static const struct regmap_irq_chip axp20x_regmap_irq_chip =3D {
>  	.name			=3D "axp20x_irq_chip",
>  	.status_base		=3D AXP20X_IRQ1_STATE,
> @@ -393,6 +462,14 @@ static struct mfd_cell axp22x_cells[] =3D {
>  	},
>  };
> =20
> +static struct mfd_cell axp152_cells[] =3D {
> +	{
> +		.name			=3D "axp20x-pek",
> +		.num_resources		=3D ARRAY_SIZE(axp152_pek_resources),
> +		.resources		=3D axp152_pek_resources,
> +	},
> +};
> +
>  static struct resource axp288_adc_resources[] =3D {
>  	{
>  		.name  =3D "GPADC",
> @@ -531,6 +608,12 @@ static int axp20x_match_device(struct axp20x_dev *ax=
p20x, struct device *dev)
>  	}
> =20
>  	switch (axp20x->variant) {
> +	case AXP152_ID:
> +		axp20x->nr_cells =3D ARRAY_SIZE(axp152_cells);
> +		axp20x->cells =3D axp152_cells;
> +		axp20x->regmap_cfg =3D &axp152_regmap_config;
> +		axp20x->regmap_irq_chip =3D &axp152_regmap_irq_chip;
> +		break;
>  	case AXP202_ID:
>  	case AXP209_ID:
>  		axp20x->nr_cells =3D ARRAY_SIZE(axp20x_cells);
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index 650bd964..b24c771 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -14,7 +14,8 @@
>  #include <linux/regmap.h>
> =20
>  enum {
> -	AXP202_ID =3D 0,
> +	AXP152_ID =3D 0,
> +	AXP202_ID,
>  	AXP209_ID,
>  	AXP221_ID,
>  	AXP288_ID,
> @@ -24,6 +25,24 @@ enum {
>  #define AXP20X_DATACACHE(m)		(0x04 + (m))
> =20
>  /* Power supply */
> +#define AXP152_PWR_OP_MODE		0x01
> +#define AXP152_LDO3456_DC1234_CTRL	0x12
> +#define AXP152_ALDO_OP_MODE		0x13
> +#define AXP152_LDO0_CTRL		0x15
> +#define AXP152_DCDC2_V_OUT		0x23
> +#define AXP152_DCDC2_V_SCAL		0x25
> +#define AXP152_DCDC1_V_OUT		0x26
> +#define AXP152_DCDC3_V_OUT		0x27
> +#define AXP152_ALDO12_V_OUT		0x28
> +#define AXP152_DLDO1_V_OUT		0x29
> +#define AXP152_DLDO2_V_OUT		0x2a
> +#define AXP152_DCDC4_V_OUT		0x2b
> +#define AXP152_V_OFF			0x31
> +#define AXP152_OFF_CTRL			0x32
> +#define AXP152_PEK_KEY			0x36
> +#define AXP152_DCDC_FREQ		0x37
> +#define AXP152_DCDC_MODE		0x80
> +
>  #define AXP20X_PWR_INPUT_STATUS		0x00
>  #define AXP20X_PWR_OP_MODE		0x01
>  #define AXP20X_USB_OTG_STATUS		0x02
> @@ -71,6 +90,13 @@ enum {
>  #define AXP22X_CHRG_CTRL3		0x35
> =20
>  /* Interrupt */
> +#define AXP152_IRQ1_EN			0x40
> +#define AXP152_IRQ2_EN			0x41
> +#define AXP152_IRQ3_EN			0x42
> +#define AXP152_IRQ1_STATE		0x48
> +#define AXP152_IRQ2_STATE		0x49
> +#define AXP152_IRQ3_STATE		0x4a
> +
>  #define AXP20X_IRQ1_EN			0x40
>  #define AXP20X_IRQ2_EN			0x41
>  #define AXP20X_IRQ3_EN			0x42
> @@ -129,6 +155,19 @@ enum {
>  #define AXP22X_PWREN_CTRL2		0x8d
> =20
>  /* GPIO */
> +#define AXP152_GPIO0_CTRL		0x90
> +#define AXP152_GPIO1_CTRL		0x91
> +#define AXP152_GPIO2_CTRL		0x92
> +#define AXP152_GPIO3_CTRL		0x93
> +#define AXP152_LDOGPIO2_V_OUT		0x96
> +#define AXP152_GPIO_INPUT		0x97
> +#define AXP152_PWM0_FREQ_X		0x98
> +#define AXP152_PWM0_FREQ_Y		0x99
> +#define AXP152_PWM0_DUTY_CYCLE		0x9a
> +#define AXP152_PWM1_FREQ_X		0x9b
> +#define AXP152_PWM1_FREQ_Y		0x9c
> +#define AXP152_PWM1_DUTY_CYCLE		0x9d
> +
>  #define AXP20X_GPIO0_CTRL		0x90
>  #define AXP20X_LDO5_V_OUT		0x91
>  #define AXP20X_GPIO1_CTRL		0x92
> @@ -226,6 +265,26 @@ enum {
> =20
>  /* IRQs */
>  enum {
> +	AXP152_IRQ_LDO0IN_CONNECT =3D 1,
> +	AXP152_IRQ_LDO0IN_REMOVAL,
> +	AXP152_IRQ_ALDO0IN_CONNECT,
> +	AXP152_IRQ_ALDO0IN_REMOVAL,
> +	AXP152_IRQ_DCDC1_V_LOW,
> +	AXP152_IRQ_DCDC2_V_LOW,
> +	AXP152_IRQ_DCDC3_V_LOW,
> +	AXP152_IRQ_DCDC4_V_LOW,
> +	AXP152_IRQ_PEK_SHORT,
> +	AXP152_IRQ_PEK_LONG,
> +	AXP152_IRQ_TIMER,
> +	AXP152_IRQ_PEK_RIS_EDGE,
> +	AXP152_IRQ_PEK_FAL_EDGE,
> +	AXP152_IRQ_GPIO3_INPUT,
> +	AXP152_IRQ_GPIO2_INPUT,
> +	AXP152_IRQ_GPIO1_INPUT,
> +	AXP152_IRQ_GPIO0_INPUT,
> +};
> +
> +enum {
>  	AXP20X_IRQ_ACIN_OVER_V =3D 1,
>  	AXP20X_IRQ_ACIN_PLUGIN,
>  	AXP20X_IRQ_ACIN_REMOVAL,

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
