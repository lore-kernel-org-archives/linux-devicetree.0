From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] mfd/axp20x: rename files to support more devices
Date: Tue, 9 Sep 2014 09:11:40 +0100
Message-ID: <20140909081140.GH30307@lee--X1>
References: <1410215046-31751-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1410215046-31751-2-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410215046-31751-2-git-send-email-jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <di>
List-Id: devicetree@vger.kernel.org

On Mon, 08 Sep 2014, Jacob Pan wrote:

> More XPowers PMIC devices can be supported by extending this driver, =
so
> rename it to axp2xx to cover axp288 variant.
>=20
> Signed-off-by: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/mfd/Kconfig        |   7 +-
>  drivers/mfd/Makefile       |   2 +-
>  drivers/mfd/axp20x.c       | 258 -----------------------------------=
----------
>  drivers/mfd/axp2xx.c       | 258 +++++++++++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/axp20x.h | 180 -------------------------------
>  include/linux/mfd/axp2xx.h | 180 +++++++++++++++++++++++++++++++
>  6 files changed, 443 insertions(+), 442 deletions(-)
>  delete mode 100644 drivers/mfd/axp20x.c
>  create mode 100644 drivers/mfd/axp2xx.c
>  delete mode 100644 include/linux/mfd/axp20x.h
>  create mode 100644 include/linux/mfd/axp2xx.h

Please resubmit using `git format-patch -M`

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index de5abf2..42a70a3 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -67,14 +67,15 @@ config MFD_BCM590XX
>  	help
>  	  Support for the BCM590xx PMUs from Broadcom
> =20
> -config MFD_AXP20X
> -	bool "X-Powers AXP20X"
> +config MFD_AXP2XX
> +	bool "X-Powers AXP2XX"
>  	select MFD_CORE
>  	select REGMAP_I2C
>  	select REGMAP_IRQ
>  	depends on I2C=3Dy
>  	help
> -	  If you say Y here you get support for the X-Powers AXP202 and AXP=
209.
> +	  If you say Y here you get support for the X-Powers AXP202, AXP209=
 and
> +	  AXP288 power management IC (PMIC).
>  	  This driver include only the core APIs. You have to select indivi=
dual
>  	  components like regulators or the PEK (Power Enable Key) under th=
e
>  	  corresponding menus.
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index f001487..55d76b3 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -103,7 +103,7 @@ obj-$(CONFIG_PMIC_DA9052)	+=3D da9052-irq.o
>  obj-$(CONFIG_PMIC_DA9052)	+=3D da9052-core.o
>  obj-$(CONFIG_MFD_DA9052_SPI)	+=3D da9052-spi.o
>  obj-$(CONFIG_MFD_DA9052_I2C)	+=3D da9052-i2c.o
> -obj-$(CONFIG_MFD_AXP20X)	+=3D axp20x.o
> +obj-$(CONFIG_MFD_AXP2XX)	+=3D axp2xx.o
> =20
>  obj-$(CONFIG_MFD_LP3943)	+=3D lp3943.o
>  obj-$(CONFIG_MFD_LP8788)	+=3D lp8788.o lp8788-irq.o
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> deleted file mode 100644
> index dee6539..0000000
> --- a/drivers/mfd/axp20x.c
> +++ /dev/null
> @@ -1,258 +0,0 @@
> -/*
> - * axp20x.c - MFD core driver for the X-Powers AXP202 and AXP209
> - *
> - * AXP20x comprises an adaptive USB-Compatible PWM charger, 2 BUCK D=
C-DC
> - * converters, 5 LDOs, multiple 12-bit ADCs of voltage, current and =
temperature
> - * as well as 4 configurable GPIOs.
> - *
> - * Author: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
> - *
> - * This program is free software; you can redistribute it and/or mod=
ify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - */
> -
> -#include <linux/err.h>
> -#include <linux/i2c.h>
> -#include <linux/interrupt.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/regmap.h>
> -#include <linux/slab.h>
> -#include <linux/regulator/consumer.h>
> -#include <linux/mfd/axp20x.h>
> -#include <linux/mfd/core.h>
> -#include <linux/of_device.h>
> -#include <linux/of_irq.h>
> -
> -#define AXP20X_OFF	0x80
> -
> -static const struct regmap_range axp20x_writeable_ranges[] =3D {
> -	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_IRQ5_STATE),
> -	regmap_reg_range(AXP20X_DCDC_MODE, AXP20X_FG_RES),
> -};
> -
> -static const struct regmap_range axp20x_volatile_ranges[] =3D {
> -	regmap_reg_range(AXP20X_IRQ1_EN, AXP20X_IRQ5_STATE),
> -};
> -
> -static const struct regmap_access_table axp20x_writeable_table =3D {
> -	.yes_ranges	=3D axp20x_writeable_ranges,
> -	.n_yes_ranges	=3D ARRAY_SIZE(axp20x_writeable_ranges),
> -};
> -
> -static const struct regmap_access_table axp20x_volatile_table =3D {
> -	.yes_ranges	=3D axp20x_volatile_ranges,
> -	.n_yes_ranges	=3D ARRAY_SIZE(axp20x_volatile_ranges),
> -};
> -
> -static struct resource axp20x_pek_resources[] =3D {
> -	{
> -		.name	=3D "PEK_DBR",
> -		.start	=3D AXP20X_IRQ_PEK_RIS_EDGE,
> -		.end	=3D AXP20X_IRQ_PEK_RIS_EDGE,
> -		.flags	=3D IORESOURCE_IRQ,
> -	}, {
> -		.name	=3D "PEK_DBF",
> -		.start	=3D AXP20X_IRQ_PEK_FAL_EDGE,
> -		.end	=3D AXP20X_IRQ_PEK_FAL_EDGE,
> -		.flags	=3D IORESOURCE_IRQ,
> -	},
> -};
> -
> -static const struct regmap_config axp20x_regmap_config =3D {
> -	.reg_bits	=3D 8,
> -	.val_bits	=3D 8,
> -	.wr_table	=3D &axp20x_writeable_table,
> -	.volatile_table	=3D &axp20x_volatile_table,
> -	.max_register	=3D AXP20X_FG_RES,
> -	.cache_type	=3D REGCACHE_RBTREE,
> -};
> -
> -#define AXP20X_IRQ(_irq, _off, _mask) \
> -	[AXP20X_IRQ_##_irq] =3D { .reg_offset =3D (_off), .mask =3D BIT(_ma=
sk) }
> -
> -static const struct regmap_irq axp20x_regmap_irqs[] =3D {
> -	AXP20X_IRQ(ACIN_OVER_V,		0, 7),
> -	AXP20X_IRQ(ACIN_PLUGIN,		0, 6),
> -	AXP20X_IRQ(ACIN_REMOVAL,	0, 5),
> -	AXP20X_IRQ(VBUS_OVER_V,		0, 4),
> -	AXP20X_IRQ(VBUS_PLUGIN,		0, 3),
> -	AXP20X_IRQ(VBUS_REMOVAL,	0, 2),
> -	AXP20X_IRQ(VBUS_V_LOW,		0, 1),
> -	AXP20X_IRQ(BATT_PLUGIN,		1, 7),
> -	AXP20X_IRQ(BATT_REMOVAL,	1, 6),
> -	AXP20X_IRQ(BATT_ENT_ACT_MODE,	1, 5),
> -	AXP20X_IRQ(BATT_EXIT_ACT_MODE,	1, 4),
> -	AXP20X_IRQ(CHARG,		1, 3),
> -	AXP20X_IRQ(CHARG_DONE,		1, 2),
> -	AXP20X_IRQ(BATT_TEMP_HIGH,	1, 1),
> -	AXP20X_IRQ(BATT_TEMP_LOW,	1, 0),
> -	AXP20X_IRQ(DIE_TEMP_HIGH,	2, 7),
> -	AXP20X_IRQ(CHARG_I_LOW,		2, 6),
> -	AXP20X_IRQ(DCDC1_V_LONG,	2, 5),
> -	AXP20X_IRQ(DCDC2_V_LONG,	2, 4),
> -	AXP20X_IRQ(DCDC3_V_LONG,	2, 3),
> -	AXP20X_IRQ(PEK_SHORT,		2, 1),
> -	AXP20X_IRQ(PEK_LONG,		2, 0),
> -	AXP20X_IRQ(N_OE_PWR_ON,		3, 7),
> -	AXP20X_IRQ(N_OE_PWR_OFF,	3, 6),
> -	AXP20X_IRQ(VBUS_VALID,		3, 5),
> -	AXP20X_IRQ(VBUS_NOT_VALID,	3, 4),
> -	AXP20X_IRQ(VBUS_SESS_VALID,	3, 3),
> -	AXP20X_IRQ(VBUS_SESS_END,	3, 2),
> -	AXP20X_IRQ(LOW_PWR_LVL1,	3, 1),
> -	AXP20X_IRQ(LOW_PWR_LVL2,	3, 0),
> -	AXP20X_IRQ(TIMER,		4, 7),
> -	AXP20X_IRQ(PEK_RIS_EDGE,	4, 6),
> -	AXP20X_IRQ(PEK_FAL_EDGE,	4, 5),
> -	AXP20X_IRQ(GPIO3_INPUT,		4, 3),
> -	AXP20X_IRQ(GPIO2_INPUT,		4, 2),
> -	AXP20X_IRQ(GPIO1_INPUT,		4, 1),
> -	AXP20X_IRQ(GPIO0_INPUT,		4, 0),
> -};
> -
> -static const struct of_device_id axp20x_of_match[] =3D {
> -	{ .compatible =3D "x-powers,axp202", .data =3D (void *) AXP202_ID }=
,
> -	{ .compatible =3D "x-powers,axp209", .data =3D (void *) AXP209_ID }=
,
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, axp20x_of_match);
> -
> -/*
> - * This is useless for OF-enabled devices, but it is needed by I2C s=
ubsystem
> - */
> -static const struct i2c_device_id axp20x_i2c_id[] =3D {
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
> -
> -static const struct regmap_irq_chip axp20x_regmap_irq_chip =3D {
> -	.name			=3D "axp20x_irq_chip",
> -	.status_base		=3D AXP20X_IRQ1_STATE,
> -	.ack_base		=3D AXP20X_IRQ1_STATE,
> -	.mask_base		=3D AXP20X_IRQ1_EN,
> -	.num_regs		=3D 5,
> -	.irqs			=3D axp20x_regmap_irqs,
> -	.num_irqs		=3D ARRAY_SIZE(axp20x_regmap_irqs),
> -	.mask_invert		=3D true,
> -	.init_ack_masked	=3D true,
> -};
> -
> -static const char * const axp20x_supplies[] =3D {
> -	"acin",
> -	"vin2",
> -	"vin3",
> -	"ldo24in",
> -	"ldo3in",
> -	"ldo5in",
> -};
> -
> -static struct mfd_cell axp20x_cells[] =3D {
> -	{
> -		.name			=3D "axp20x-pek",
> -		.num_resources		=3D ARRAY_SIZE(axp20x_pek_resources),
> -		.resources		=3D axp20x_pek_resources,
> -	}, {
> -		.name			=3D "axp20x-regulator",
> -		.parent_supplies	=3D axp20x_supplies,
> -		.num_parent_supplies	=3D ARRAY_SIZE(axp20x_supplies),
> -	},
> -};
> -
> -static struct axp20x_dev *axp20x_pm_power_off;
> -static void axp20x_power_off(void)
> -{
> -	regmap_write(axp20x_pm_power_off->regmap, AXP20X_OFF_CTRL,
> -		     AXP20X_OFF);
> -}
> -
> -static int axp20x_i2c_probe(struct i2c_client *i2c,
> -			 const struct i2c_device_id *id)
> -{
> -	struct axp20x_dev *axp20x;
> -	const struct of_device_id *of_id;
> -	int ret;
> -
> -	axp20x =3D devm_kzalloc(&i2c->dev, sizeof(*axp20x), GFP_KERNEL);
> -	if (!axp20x)
> -		return -ENOMEM;
> -
> -	of_id =3D of_match_device(axp20x_of_match, &i2c->dev);
> -	if (!of_id) {
> -		dev_err(&i2c->dev, "Unable to setup AXP20X data\n");
> -		return -ENODEV;
> -	}
> -	axp20x->variant =3D (long) of_id->data;
> -
> -	axp20x->i2c_client =3D i2c;
> -	axp20x->dev =3D &i2c->dev;
> -	dev_set_drvdata(axp20x->dev, axp20x);
> -
> -	axp20x->regmap =3D devm_regmap_init_i2c(i2c, &axp20x_regmap_config)=
;
> -	if (IS_ERR(axp20x->regmap)) {
> -		ret =3D PTR_ERR(axp20x->regmap);
> -		dev_err(&i2c->dev, "regmap init failed: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret =3D regmap_add_irq_chip(axp20x->regmap, i2c->irq,
> -				  IRQF_ONESHOT | IRQF_SHARED, -1,
> -				  &axp20x_regmap_irq_chip,
> -				  &axp20x->regmap_irqc);
> -	if (ret) {
> -		dev_err(&i2c->dev, "failed to add irq chip: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret =3D mfd_add_devices(axp20x->dev, -1, axp20x_cells,
> -			      ARRAY_SIZE(axp20x_cells), NULL, 0, NULL);
> -
> -	if (ret) {
> -		dev_err(&i2c->dev, "failed to add MFD devices: %d\n", ret);
> -		regmap_del_irq_chip(i2c->irq, axp20x->regmap_irqc);
> -		return ret;
> -	}
> -
> -	if (!pm_power_off) {
> -		axp20x_pm_power_off =3D axp20x;
> -		pm_power_off =3D axp20x_power_off;
> -	}
> -
> -	dev_info(&i2c->dev, "AXP20X driver loaded\n");
> -
> -	return 0;
> -}
> -
> -static int axp20x_i2c_remove(struct i2c_client *i2c)
> -{
> -	struct axp20x_dev *axp20x =3D i2c_get_clientdata(i2c);
> -
> -	if (axp20x =3D=3D axp20x_pm_power_off) {
> -		axp20x_pm_power_off =3D NULL;
> -		pm_power_off =3D NULL;
> -	}
> -
> -	mfd_remove_devices(axp20x->dev);
> -	regmap_del_irq_chip(axp20x->i2c_client->irq, axp20x->regmap_irqc);
> -
> -	return 0;
> -}
> -
> -static struct i2c_driver axp20x_i2c_driver =3D {
> -	.driver =3D {
> -		.name	=3D "axp20x",
> -		.owner	=3D THIS_MODULE,
> -		.of_match_table	=3D of_match_ptr(axp20x_of_match),
> -	},
> -	.probe		=3D axp20x_i2c_probe,
> -	.remove		=3D axp20x_i2c_remove,
> -	.id_table	=3D axp20x_i2c_id,
> -};
> -
> -module_i2c_driver(axp20x_i2c_driver);
> -
> -MODULE_DESCRIPTION("PMIC MFD core driver for AXP20X");
> -MODULE_AUTHOR("Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>");
> -MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/axp2xx.c b/drivers/mfd/axp2xx.c
> new file mode 100644
> index 0000000..c534443
> --- /dev/null
> +++ b/drivers/mfd/axp2xx.c
> @@ -0,0 +1,258 @@
> +/*
> + * axp20x.c - MFD core driver for the X-Powers AXP202 and AXP209
> + *
> + * AXP20x comprises an adaptive USB-Compatible PWM charger, 2 BUCK D=
C-DC
> + * converters, 5 LDOs, multiple 12-bit ADCs of voltage, current and =
temperature
> + * as well as 4 configurable GPIOs.
> + *
> + * Author: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/mfd/axp2xx.h>
> +#include <linux/mfd/core.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +
> +#define AXP20X_OFF	0x80
> +
> +static const struct regmap_range axp20x_writeable_ranges[] =3D {
> +	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_IRQ5_STATE),
> +	regmap_reg_range(AXP20X_DCDC_MODE, AXP20X_FG_RES),
> +};
> +
> +static const struct regmap_range axp20x_volatile_ranges[] =3D {
> +	regmap_reg_range(AXP20X_IRQ1_EN, AXP20X_IRQ5_STATE),
> +};
> +
> +static const struct regmap_access_table axp20x_writeable_table =3D {
> +	.yes_ranges	=3D axp20x_writeable_ranges,
> +	.n_yes_ranges	=3D ARRAY_SIZE(axp20x_writeable_ranges),
> +};
> +
> +static const struct regmap_access_table axp20x_volatile_table =3D {
> +	.yes_ranges	=3D axp20x_volatile_ranges,
> +	.n_yes_ranges	=3D ARRAY_SIZE(axp20x_volatile_ranges),
> +};
> +
> +static struct resource axp20x_pek_resources[] =3D {
> +	{
> +		.name	=3D "PEK_DBR",
> +		.start	=3D AXP20X_IRQ_PEK_RIS_EDGE,
> +		.end	=3D AXP20X_IRQ_PEK_RIS_EDGE,
> +		.flags	=3D IORESOURCE_IRQ,
> +	}, {
> +		.name	=3D "PEK_DBF",
> +		.start	=3D AXP20X_IRQ_PEK_FAL_EDGE,
> +		.end	=3D AXP20X_IRQ_PEK_FAL_EDGE,
> +		.flags	=3D IORESOURCE_IRQ,
> +	},
> +};
> +
> +static const struct regmap_config axp20x_regmap_config =3D {
> +	.reg_bits	=3D 8,
> +	.val_bits	=3D 8,
> +	.wr_table	=3D &axp20x_writeable_table,
> +	.volatile_table	=3D &axp20x_volatile_table,
> +	.max_register	=3D AXP20X_FG_RES,
> +	.cache_type	=3D REGCACHE_RBTREE,
> +};
> +
> +#define AXP20X_IRQ(_irq, _off, _mask) \
> +	[AXP20X_IRQ_##_irq] =3D { .reg_offset =3D (_off), .mask =3D BIT(_ma=
sk) }
> +
> +static const struct regmap_irq axp20x_regmap_irqs[] =3D {
> +	AXP20X_IRQ(ACIN_OVER_V,		0, 7),
> +	AXP20X_IRQ(ACIN_PLUGIN,		0, 6),
> +	AXP20X_IRQ(ACIN_REMOVAL,	0, 5),
> +	AXP20X_IRQ(VBUS_OVER_V,		0, 4),
> +	AXP20X_IRQ(VBUS_PLUGIN,		0, 3),
> +	AXP20X_IRQ(VBUS_REMOVAL,	0, 2),
> +	AXP20X_IRQ(VBUS_V_LOW,		0, 1),
> +	AXP20X_IRQ(BATT_PLUGIN,		1, 7),
> +	AXP20X_IRQ(BATT_REMOVAL,	1, 6),
> +	AXP20X_IRQ(BATT_ENT_ACT_MODE,	1, 5),
> +	AXP20X_IRQ(BATT_EXIT_ACT_MODE,	1, 4),
> +	AXP20X_IRQ(CHARG,		1, 3),
> +	AXP20X_IRQ(CHARG_DONE,		1, 2),
> +	AXP20X_IRQ(BATT_TEMP_HIGH,	1, 1),
> +	AXP20X_IRQ(BATT_TEMP_LOW,	1, 0),
> +	AXP20X_IRQ(DIE_TEMP_HIGH,	2, 7),
> +	AXP20X_IRQ(CHARG_I_LOW,		2, 6),
> +	AXP20X_IRQ(DCDC1_V_LONG,	2, 5),
> +	AXP20X_IRQ(DCDC2_V_LONG,	2, 4),
> +	AXP20X_IRQ(DCDC3_V_LONG,	2, 3),
> +	AXP20X_IRQ(PEK_SHORT,		2, 1),
> +	AXP20X_IRQ(PEK_LONG,		2, 0),
> +	AXP20X_IRQ(N_OE_PWR_ON,		3, 7),
> +	AXP20X_IRQ(N_OE_PWR_OFF,	3, 6),
> +	AXP20X_IRQ(VBUS_VALID,		3, 5),
> +	AXP20X_IRQ(VBUS_NOT_VALID,	3, 4),
> +	AXP20X_IRQ(VBUS_SESS_VALID,	3, 3),
> +	AXP20X_IRQ(VBUS_SESS_END,	3, 2),
> +	AXP20X_IRQ(LOW_PWR_LVL1,	3, 1),
> +	AXP20X_IRQ(LOW_PWR_LVL2,	3, 0),
> +	AXP20X_IRQ(TIMER,		4, 7),
> +	AXP20X_IRQ(PEK_RIS_EDGE,	4, 6),
> +	AXP20X_IRQ(PEK_FAL_EDGE,	4, 5),
> +	AXP20X_IRQ(GPIO3_INPUT,		4, 3),
> +	AXP20X_IRQ(GPIO2_INPUT,		4, 2),
> +	AXP20X_IRQ(GPIO1_INPUT,		4, 1),
> +	AXP20X_IRQ(GPIO0_INPUT,		4, 0),
> +};
> +
> +static const struct of_device_id axp20x_of_match[] =3D {
> +	{ .compatible =3D "x-powers,axp202", .data =3D (void *) AXP202_ID }=
,
> +	{ .compatible =3D "x-powers,axp209", .data =3D (void *) AXP209_ID }=
,
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, axp20x_of_match);
> +
> +/*
> + * This is useless for OF-enabled devices, but it is needed by I2C s=
ubsystem
> + */
> +static const struct i2c_device_id axp20x_i2c_id[] =3D {
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
> +
> +static const struct regmap_irq_chip axp20x_regmap_irq_chip =3D {
> +	.name			=3D "axp20x_irq_chip",
> +	.status_base		=3D AXP20X_IRQ1_STATE,
> +	.ack_base		=3D AXP20X_IRQ1_STATE,
> +	.mask_base		=3D AXP20X_IRQ1_EN,
> +	.num_regs		=3D 5,
> +	.irqs			=3D axp20x_regmap_irqs,
> +	.num_irqs		=3D ARRAY_SIZE(axp20x_regmap_irqs),
> +	.mask_invert		=3D true,
> +	.init_ack_masked	=3D true,
> +};
> +
> +static const char * const axp20x_supplies[] =3D {
> +	"acin",
> +	"vin2",
> +	"vin3",
> +	"ldo24in",
> +	"ldo3in",
> +	"ldo5in",
> +};
> +
> +static struct mfd_cell axp20x_cells[] =3D {
> +	{
> +		.name			=3D "axp20x-pek",
> +		.num_resources		=3D ARRAY_SIZE(axp20x_pek_resources),
> +		.resources		=3D axp20x_pek_resources,
> +	}, {
> +		.name			=3D "axp20x-regulator",
> +		.parent_supplies	=3D axp20x_supplies,
> +		.num_parent_supplies	=3D ARRAY_SIZE(axp20x_supplies),
> +	},
> +};
> +
> +static struct axp20x_dev *axp20x_pm_power_off;
> +static void axp20x_power_off(void)
> +{
> +	regmap_write(axp20x_pm_power_off->regmap, AXP20X_OFF_CTRL,
> +		     AXP20X_OFF);
> +}
> +
> +static int axp20x_i2c_probe(struct i2c_client *i2c,
> +			 const struct i2c_device_id *id)
> +{
> +	struct axp20x_dev *axp20x;
> +	const struct of_device_id *of_id;
> +	int ret;
> +
> +	axp20x =3D devm_kzalloc(&i2c->dev, sizeof(*axp20x), GFP_KERNEL);
> +	if (!axp20x)
> +		return -ENOMEM;
> +
> +	of_id =3D of_match_device(axp20x_of_match, &i2c->dev);
> +	if (!of_id) {
> +		dev_err(&i2c->dev, "Unable to setup AXP20X data\n");
> +		return -ENODEV;
> +	}
> +	axp20x->variant =3D (long) of_id->data;
> +
> +	axp20x->i2c_client =3D i2c;
> +	axp20x->dev =3D &i2c->dev;
> +	dev_set_drvdata(axp20x->dev, axp20x);
> +
> +	axp20x->regmap =3D devm_regmap_init_i2c(i2c, &axp20x_regmap_config)=
;
> +	if (IS_ERR(axp20x->regmap)) {
> +		ret =3D PTR_ERR(axp20x->regmap);
> +		dev_err(&i2c->dev, "regmap init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D regmap_add_irq_chip(axp20x->regmap, i2c->irq,
> +				  IRQF_ONESHOT | IRQF_SHARED, -1,
> +				  &axp20x_regmap_irq_chip,
> +				  &axp20x->regmap_irqc);
> +	if (ret) {
> +		dev_err(&i2c->dev, "failed to add irq chip: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D mfd_add_devices(axp20x->dev, -1, axp20x_cells,
> +			      ARRAY_SIZE(axp20x_cells), NULL, 0, NULL);
> +
> +	if (ret) {
> +		dev_err(&i2c->dev, "failed to add MFD devices: %d\n", ret);
> +		regmap_del_irq_chip(i2c->irq, axp20x->regmap_irqc);
> +		return ret;
> +	}
> +
> +	if (!pm_power_off) {
> +		axp20x_pm_power_off =3D axp20x;
> +		pm_power_off =3D axp20x_power_off;
> +	}
> +
> +	dev_info(&i2c->dev, "AXP20X driver loaded\n");
> +
> +	return 0;
> +}
> +
> +static int axp20x_i2c_remove(struct i2c_client *i2c)
> +{
> +	struct axp20x_dev *axp20x =3D i2c_get_clientdata(i2c);
> +
> +	if (axp20x =3D=3D axp20x_pm_power_off) {
> +		axp20x_pm_power_off =3D NULL;
> +		pm_power_off =3D NULL;
> +	}
> +
> +	mfd_remove_devices(axp20x->dev);
> +	regmap_del_irq_chip(axp20x->i2c_client->irq, axp20x->regmap_irqc);
> +
> +	return 0;
> +}
> +
> +static struct i2c_driver axp20x_i2c_driver =3D {
> +	.driver =3D {
> +		.name	=3D "axp20x",
> +		.owner	=3D THIS_MODULE,
> +		.of_match_table	=3D of_match_ptr(axp20x_of_match),
> +	},
> +	.probe		=3D axp20x_i2c_probe,
> +	.remove		=3D axp20x_i2c_remove,
> +	.id_table	=3D axp20x_i2c_id,
> +};
> +
> +module_i2c_driver(axp20x_i2c_driver);
> +
> +MODULE_DESCRIPTION("PMIC MFD core driver for AXP20X");
> +MODULE_AUTHOR("Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> deleted file mode 100644
> index d0e31a2..0000000
> --- a/include/linux/mfd/axp20x.h
> +++ /dev/null
> @@ -1,180 +0,0 @@
> -/*
> - * Functions and registers to access AXP20X power management chip.
> - *
> - * Copyright (C) 2013, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
> - *
> - * This program is free software; you can redistribute it and/or mod=
ify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - */
> -
> -#ifndef __LINUX_MFD_AXP20X_H
> -#define __LINUX_MFD_AXP20X_H
> -
> -enum {
> -	AXP202_ID =3D 0,
> -	AXP209_ID,
> -};
> -
> -#define AXP20X_DATACACHE(m)		(0x04 + (m))
> -
> -/* Power supply */
> -#define AXP20X_PWR_INPUT_STATUS		0x00
> -#define AXP20X_PWR_OP_MODE		0x01
> -#define AXP20X_USB_OTG_STATUS		0x02
> -#define AXP20X_PWR_OUT_CTRL		0x12
> -#define AXP20X_DCDC2_V_OUT		0x23
> -#define AXP20X_DCDC2_LDO3_V_SCAL	0x25
> -#define AXP20X_DCDC3_V_OUT		0x27
> -#define AXP20X_LDO24_V_OUT		0x28
> -#define AXP20X_LDO3_V_OUT		0x29
> -#define AXP20X_VBUS_IPSOUT_MGMT		0x30
> -#define AXP20X_V_OFF			0x31
> -#define AXP20X_OFF_CTRL			0x32
> -#define AXP20X_CHRG_CTRL1		0x33
> -#define AXP20X_CHRG_CTRL2		0x34
> -#define AXP20X_CHRG_BAK_CTRL		0x35
> -#define AXP20X_PEK_KEY			0x36
> -#define AXP20X_DCDC_FREQ		0x37
> -#define AXP20X_V_LTF_CHRG		0x38
> -#define AXP20X_V_HTF_CHRG		0x39
> -#define AXP20X_APS_WARN_L1		0x3a
> -#define AXP20X_APS_WARN_L2		0x3b
> -#define AXP20X_V_LTF_DISCHRG		0x3c
> -#define AXP20X_V_HTF_DISCHRG		0x3d
> -
> -/* Interrupt */
> -#define AXP20X_IRQ1_EN			0x40
> -#define AXP20X_IRQ2_EN			0x41
> -#define AXP20X_IRQ3_EN			0x42
> -#define AXP20X_IRQ4_EN			0x43
> -#define AXP20X_IRQ5_EN			0x44
> -#define AXP20X_IRQ1_STATE		0x48
> -#define AXP20X_IRQ2_STATE		0x49
> -#define AXP20X_IRQ3_STATE		0x4a
> -#define AXP20X_IRQ4_STATE		0x4b
> -#define AXP20X_IRQ5_STATE		0x4c
> -
> -/* ADC */
> -#define AXP20X_ACIN_V_ADC_H		0x56
> -#define AXP20X_ACIN_V_ADC_L		0x57
> -#define AXP20X_ACIN_I_ADC_H		0x58
> -#define AXP20X_ACIN_I_ADC_L		0x59
> -#define AXP20X_VBUS_V_ADC_H		0x5a
> -#define AXP20X_VBUS_V_ADC_L		0x5b
> -#define AXP20X_VBUS_I_ADC_H		0x5c
> -#define AXP20X_VBUS_I_ADC_L		0x5d
> -#define AXP20X_TEMP_ADC_H		0x5e
> -#define AXP20X_TEMP_ADC_L		0x5f
> -#define AXP20X_TS_IN_H			0x62
> -#define AXP20X_TS_IN_L			0x63
> -#define AXP20X_GPIO0_V_ADC_H		0x64
> -#define AXP20X_GPIO0_V_ADC_L		0x65
> -#define AXP20X_GPIO1_V_ADC_H		0x66
> -#define AXP20X_GPIO1_V_ADC_L		0x67
> -#define AXP20X_PWR_BATT_H		0x70
> -#define AXP20X_PWR_BATT_M		0x71
> -#define AXP20X_PWR_BATT_L		0x72
> -#define AXP20X_BATT_V_H			0x78
> -#define AXP20X_BATT_V_L			0x79
> -#define AXP20X_BATT_CHRG_I_H		0x7a
> -#define AXP20X_BATT_CHRG_I_L		0x7b
> -#define AXP20X_BATT_DISCHRG_I_H		0x7c
> -#define AXP20X_BATT_DISCHRG_I_L		0x7d
> -#define AXP20X_IPSOUT_V_HIGH_H		0x7e
> -#define AXP20X_IPSOUT_V_HIGH_L		0x7f
> -
> -/* Power supply */
> -#define AXP20X_DCDC_MODE		0x80
> -#define AXP20X_ADC_EN1			0x82
> -#define AXP20X_ADC_EN2			0x83
> -#define AXP20X_ADC_RATE			0x84
> -#define AXP20X_GPIO10_IN_RANGE		0x85
> -#define AXP20X_GPIO1_ADC_IRQ_RIS	0x86
> -#define AXP20X_GPIO1_ADC_IRQ_FAL	0x87
> -#define AXP20X_TIMER_CTRL		0x8a
> -#define AXP20X_VBUS_MON			0x8b
> -#define AXP20X_OVER_TMP			0x8f
> -
> -/* GPIO */
> -#define AXP20X_GPIO0_CTRL		0x90
> -#define AXP20X_LDO5_V_OUT		0x91
> -#define AXP20X_GPIO1_CTRL		0x92
> -#define AXP20X_GPIO2_CTRL		0x93
> -#define AXP20X_GPIO20_SS		0x94
> -#define AXP20X_GPIO3_CTRL		0x95
> -
> -/* Battery */
> -#define AXP20X_CHRG_CC_31_24		0xb0
> -#define AXP20X_CHRG_CC_23_16		0xb1
> -#define AXP20X_CHRG_CC_15_8		0xb2
> -#define AXP20X_CHRG_CC_7_0		0xb3
> -#define AXP20X_DISCHRG_CC_31_24		0xb4
> -#define AXP20X_DISCHRG_CC_23_16		0xb5
> -#define AXP20X_DISCHRG_CC_15_8		0xb6
> -#define AXP20X_DISCHRG_CC_7_0		0xb7
> -#define AXP20X_CC_CTRL			0xb8
> -#define AXP20X_FG_RES			0xb9
> -
> -/* Regulators IDs */
> -enum {
> -	AXP20X_LDO1 =3D 0,
> -	AXP20X_LDO2,
> -	AXP20X_LDO3,
> -	AXP20X_LDO4,
> -	AXP20X_LDO5,
> -	AXP20X_DCDC2,
> -	AXP20X_DCDC3,
> -	AXP20X_REG_ID_MAX,
> -};
> -
> -/* IRQs */
> -enum {
> -	AXP20X_IRQ_ACIN_OVER_V =3D 1,
> -	AXP20X_IRQ_ACIN_PLUGIN,
> -	AXP20X_IRQ_ACIN_REMOVAL,
> -	AXP20X_IRQ_VBUS_OVER_V,
> -	AXP20X_IRQ_VBUS_PLUGIN,
> -	AXP20X_IRQ_VBUS_REMOVAL,
> -	AXP20X_IRQ_VBUS_V_LOW,
> -	AXP20X_IRQ_BATT_PLUGIN,
> -	AXP20X_IRQ_BATT_REMOVAL,
> -	AXP20X_IRQ_BATT_ENT_ACT_MODE,
> -	AXP20X_IRQ_BATT_EXIT_ACT_MODE,
> -	AXP20X_IRQ_CHARG,
> -	AXP20X_IRQ_CHARG_DONE,
> -	AXP20X_IRQ_BATT_TEMP_HIGH,
> -	AXP20X_IRQ_BATT_TEMP_LOW,
> -	AXP20X_IRQ_DIE_TEMP_HIGH,
> -	AXP20X_IRQ_CHARG_I_LOW,
> -	AXP20X_IRQ_DCDC1_V_LONG,
> -	AXP20X_IRQ_DCDC2_V_LONG,
> -	AXP20X_IRQ_DCDC3_V_LONG,
> -	AXP20X_IRQ_PEK_SHORT =3D 22,
> -	AXP20X_IRQ_PEK_LONG,
> -	AXP20X_IRQ_N_OE_PWR_ON,
> -	AXP20X_IRQ_N_OE_PWR_OFF,
> -	AXP20X_IRQ_VBUS_VALID,
> -	AXP20X_IRQ_VBUS_NOT_VALID,
> -	AXP20X_IRQ_VBUS_SESS_VALID,
> -	AXP20X_IRQ_VBUS_SESS_END,
> -	AXP20X_IRQ_LOW_PWR_LVL1,
> -	AXP20X_IRQ_LOW_PWR_LVL2,
> -	AXP20X_IRQ_TIMER,
> -	AXP20X_IRQ_PEK_RIS_EDGE,
> -	AXP20X_IRQ_PEK_FAL_EDGE,
> -	AXP20X_IRQ_GPIO3_INPUT,
> -	AXP20X_IRQ_GPIO2_INPUT,
> -	AXP20X_IRQ_GPIO1_INPUT,
> -	AXP20X_IRQ_GPIO0_INPUT,
> -};
> -
> -struct axp20x_dev {
> -	struct device			*dev;
> -	struct i2c_client		*i2c_client;
> -	struct regmap			*regmap;
> -	struct regmap_irq_chip_data	*regmap_irqc;
> -	long				variant;
> -};
> -
> -#endif /* __LINUX_MFD_AXP20X_H */
> diff --git a/include/linux/mfd/axp2xx.h b/include/linux/mfd/axp2xx.h
> new file mode 100644
> index 0000000..d0e31a2
> --- /dev/null
> +++ b/include/linux/mfd/axp2xx.h
> @@ -0,0 +1,180 @@
> +/*
> + * Functions and registers to access AXP20X power management chip.
> + *
> + * Copyright (C) 2013, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __LINUX_MFD_AXP20X_H
> +#define __LINUX_MFD_AXP20X_H
> +
> +enum {
> +	AXP202_ID =3D 0,
> +	AXP209_ID,
> +};
> +
> +#define AXP20X_DATACACHE(m)		(0x04 + (m))
> +
> +/* Power supply */
> +#define AXP20X_PWR_INPUT_STATUS		0x00
> +#define AXP20X_PWR_OP_MODE		0x01
> +#define AXP20X_USB_OTG_STATUS		0x02
> +#define AXP20X_PWR_OUT_CTRL		0x12
> +#define AXP20X_DCDC2_V_OUT		0x23
> +#define AXP20X_DCDC2_LDO3_V_SCAL	0x25
> +#define AXP20X_DCDC3_V_OUT		0x27
> +#define AXP20X_LDO24_V_OUT		0x28
> +#define AXP20X_LDO3_V_OUT		0x29
> +#define AXP20X_VBUS_IPSOUT_MGMT		0x30
> +#define AXP20X_V_OFF			0x31
> +#define AXP20X_OFF_CTRL			0x32
> +#define AXP20X_CHRG_CTRL1		0x33
> +#define AXP20X_CHRG_CTRL2		0x34
> +#define AXP20X_CHRG_BAK_CTRL		0x35
> +#define AXP20X_PEK_KEY			0x36
> +#define AXP20X_DCDC_FREQ		0x37
> +#define AXP20X_V_LTF_CHRG		0x38
> +#define AXP20X_V_HTF_CHRG		0x39
> +#define AXP20X_APS_WARN_L1		0x3a
> +#define AXP20X_APS_WARN_L2		0x3b
> +#define AXP20X_V_LTF_DISCHRG		0x3c
> +#define AXP20X_V_HTF_DISCHRG		0x3d
> +
> +/* Interrupt */
> +#define AXP20X_IRQ1_EN			0x40
> +#define AXP20X_IRQ2_EN			0x41
> +#define AXP20X_IRQ3_EN			0x42
> +#define AXP20X_IRQ4_EN			0x43
> +#define AXP20X_IRQ5_EN			0x44
> +#define AXP20X_IRQ1_STATE		0x48
> +#define AXP20X_IRQ2_STATE		0x49
> +#define AXP20X_IRQ3_STATE		0x4a
> +#define AXP20X_IRQ4_STATE		0x4b
> +#define AXP20X_IRQ5_STATE		0x4c
> +
> +/* ADC */
> +#define AXP20X_ACIN_V_ADC_H		0x56
> +#define AXP20X_ACIN_V_ADC_L		0x57
> +#define AXP20X_ACIN_I_ADC_H		0x58
> +#define AXP20X_ACIN_I_ADC_L		0x59
> +#define AXP20X_VBUS_V_ADC_H		0x5a
> +#define AXP20X_VBUS_V_ADC_L		0x5b
> +#define AXP20X_VBUS_I_ADC_H		0x5c
> +#define AXP20X_VBUS_I_ADC_L		0x5d
> +#define AXP20X_TEMP_ADC_H		0x5e
> +#define AXP20X_TEMP_ADC_L		0x5f
> +#define AXP20X_TS_IN_H			0x62
> +#define AXP20X_TS_IN_L			0x63
> +#define AXP20X_GPIO0_V_ADC_H		0x64
> +#define AXP20X_GPIO0_V_ADC_L		0x65
> +#define AXP20X_GPIO1_V_ADC_H		0x66
> +#define AXP20X_GPIO1_V_ADC_L		0x67
> +#define AXP20X_PWR_BATT_H		0x70
> +#define AXP20X_PWR_BATT_M		0x71
> +#define AXP20X_PWR_BATT_L		0x72
> +#define AXP20X_BATT_V_H			0x78
> +#define AXP20X_BATT_V_L			0x79
> +#define AXP20X_BATT_CHRG_I_H		0x7a
> +#define AXP20X_BATT_CHRG_I_L		0x7b
> +#define AXP20X_BATT_DISCHRG_I_H		0x7c
> +#define AXP20X_BATT_DISCHRG_I_L		0x7d
> +#define AXP20X_IPSOUT_V_HIGH_H		0x7e
> +#define AXP20X_IPSOUT_V_HIGH_L		0x7f
> +
> +/* Power supply */
> +#define AXP20X_DCDC_MODE		0x80
> +#define AXP20X_ADC_EN1			0x82
> +#define AXP20X_ADC_EN2			0x83
> +#define AXP20X_ADC_RATE			0x84
> +#define AXP20X_GPIO10_IN_RANGE		0x85
> +#define AXP20X_GPIO1_ADC_IRQ_RIS	0x86
> +#define AXP20X_GPIO1_ADC_IRQ_FAL	0x87
> +#define AXP20X_TIMER_CTRL		0x8a
> +#define AXP20X_VBUS_MON			0x8b
> +#define AXP20X_OVER_TMP			0x8f
> +
> +/* GPIO */
> +#define AXP20X_GPIO0_CTRL		0x90
> +#define AXP20X_LDO5_V_OUT		0x91
> +#define AXP20X_GPIO1_CTRL		0x92
> +#define AXP20X_GPIO2_CTRL		0x93
> +#define AXP20X_GPIO20_SS		0x94
> +#define AXP20X_GPIO3_CTRL		0x95
> +
> +/* Battery */
> +#define AXP20X_CHRG_CC_31_24		0xb0
> +#define AXP20X_CHRG_CC_23_16		0xb1
> +#define AXP20X_CHRG_CC_15_8		0xb2
> +#define AXP20X_CHRG_CC_7_0		0xb3
> +#define AXP20X_DISCHRG_CC_31_24		0xb4
> +#define AXP20X_DISCHRG_CC_23_16		0xb5
> +#define AXP20X_DISCHRG_CC_15_8		0xb6
> +#define AXP20X_DISCHRG_CC_7_0		0xb7
> +#define AXP20X_CC_CTRL			0xb8
> +#define AXP20X_FG_RES			0xb9
> +
> +/* Regulators IDs */
> +enum {
> +	AXP20X_LDO1 =3D 0,
> +	AXP20X_LDO2,
> +	AXP20X_LDO3,
> +	AXP20X_LDO4,
> +	AXP20X_LDO5,
> +	AXP20X_DCDC2,
> +	AXP20X_DCDC3,
> +	AXP20X_REG_ID_MAX,
> +};
> +
> +/* IRQs */
> +enum {
> +	AXP20X_IRQ_ACIN_OVER_V =3D 1,
> +	AXP20X_IRQ_ACIN_PLUGIN,
> +	AXP20X_IRQ_ACIN_REMOVAL,
> +	AXP20X_IRQ_VBUS_OVER_V,
> +	AXP20X_IRQ_VBUS_PLUGIN,
> +	AXP20X_IRQ_VBUS_REMOVAL,
> +	AXP20X_IRQ_VBUS_V_LOW,
> +	AXP20X_IRQ_BATT_PLUGIN,
> +	AXP20X_IRQ_BATT_REMOVAL,
> +	AXP20X_IRQ_BATT_ENT_ACT_MODE,
> +	AXP20X_IRQ_BATT_EXIT_ACT_MODE,
> +	AXP20X_IRQ_CHARG,
> +	AXP20X_IRQ_CHARG_DONE,
> +	AXP20X_IRQ_BATT_TEMP_HIGH,
> +	AXP20X_IRQ_BATT_TEMP_LOW,
> +	AXP20X_IRQ_DIE_TEMP_HIGH,
> +	AXP20X_IRQ_CHARG_I_LOW,
> +	AXP20X_IRQ_DCDC1_V_LONG,
> +	AXP20X_IRQ_DCDC2_V_LONG,
> +	AXP20X_IRQ_DCDC3_V_LONG,
> +	AXP20X_IRQ_PEK_SHORT =3D 22,
> +	AXP20X_IRQ_PEK_LONG,
> +	AXP20X_IRQ_N_OE_PWR_ON,
> +	AXP20X_IRQ_N_OE_PWR_OFF,
> +	AXP20X_IRQ_VBUS_VALID,
> +	AXP20X_IRQ_VBUS_NOT_VALID,
> +	AXP20X_IRQ_VBUS_SESS_VALID,
> +	AXP20X_IRQ_VBUS_SESS_END,
> +	AXP20X_IRQ_LOW_PWR_LVL1,
> +	AXP20X_IRQ_LOW_PWR_LVL2,
> +	AXP20X_IRQ_TIMER,
> +	AXP20X_IRQ_PEK_RIS_EDGE,
> +	AXP20X_IRQ_PEK_FAL_EDGE,
> +	AXP20X_IRQ_GPIO3_INPUT,
> +	AXP20X_IRQ_GPIO2_INPUT,
> +	AXP20X_IRQ_GPIO1_INPUT,
> +	AXP20X_IRQ_GPIO0_INPUT,
> +};
> +
> +struct axp20x_dev {
> +	struct device			*dev;
> +	struct i2c_client		*i2c_client;
> +	struct regmap			*regmap;
> +	struct regmap_irq_chip_data	*regmap_irqc;
> +	long				variant;
> +};
> +
> +#endif /* __LINUX_MFD_AXP20X_H */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
