From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 4/9] mfd: axp20x: Split the driver into
 core and i2c bits
Date: Mon, 11 Jan 2016 09:25:30 +0000
Message-ID: <20160111092530.GL14104@x1>
References: <1450283538-25067-1-git-send-email-wens@csie.org>
 <1450283538-25067-5-git-send-email-wens@csie.org>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBDPKZW2AKGQEEGJP6EY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450283538-25067-5-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-9oqZluOz41k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 17 Dec 2015, Chen-Yu Tsai wrote:

> The axp20x driver assumes the device is i2c based. This is not the
> case with later chips, which use a proprietary 2 wire serial bus
> by Allwinner called "Reduced Serial Bus".
>=20
> This patch follows the example of mfd/wm831x and splits it into
> an interface independent core, and an i2c specific glue layer.
> MFD_AXP20X and the new MFD_AXP20X_I2C are changed to tristate
> symbols, allowing the driver to be built as modules.
>=20
> Whitespace and other style errors in the moved i2c specific code
> have been fixed. Included but unused header files are removed as
> well.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/mfd/Kconfig        |  14 ++++---
>  drivers/mfd/Makefile       |   1 +
>  drivers/mfd/axp20x-i2c.c   | 102 +++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/mfd/axp20x.c       |  88 +++++++-------------------------------
>  include/linux/mfd/axp20x.h |  33 ++++++++++++++-
>  5 files changed, 158 insertions(+), 80 deletions(-)
>  create mode 100644 drivers/mfd/axp20x-i2c.c

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 4d92df6ef9fe..804cd3dcce32 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -91,14 +91,18 @@ config MFD_BCM590XX
>  	  Support for the BCM590xx PMUs from Broadcom
> =20
>  config MFD_AXP20X
> -	bool "X-Powers AXP20X"
> +	tristate
>  	select MFD_CORE
> -	select REGMAP_I2C
>  	select REGMAP_IRQ
> -	depends on I2C=3Dy
> +
> +config MFD_AXP20X_I2C
> +	tristate "X-Powers AXP series PMICs with I2C"
> +	select MFD_AXP20X
> +	select REGMAP_I2C
> +	depends on I2C
>  	help
> -	  If you say Y here you get support for the X-Powers AXP202, AXP209 and
> -	  AXP288 power management IC (PMIC).
> +	  If you say Y here you get support for the X-Powers AXP series power
> +	  management ICs (PMICs) controlled with I2C.
>  	  This driver include only the core APIs. You have to select individual
>  	  components like regulators or the PEK (Power Enable Key) under the
>  	  corresponding menus.
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index a8b76b81b467..a6913007d667 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -107,6 +107,7 @@ obj-$(CONFIG_PMIC_DA9052)	+=3D da9052-core.o
>  obj-$(CONFIG_MFD_DA9052_SPI)	+=3D da9052-spi.o
>  obj-$(CONFIG_MFD_DA9052_I2C)	+=3D da9052-i2c.o
>  obj-$(CONFIG_MFD_AXP20X)	+=3D axp20x.o
> +obj-$(CONFIG_MFD_AXP20X_I2C)	+=3D axp20x-i2c.o
> =20
>  obj-$(CONFIG_MFD_LP3943)	+=3D lp3943.o
>  obj-$(CONFIG_MFD_LP8788)	+=3D lp8788.o lp8788-irq.o
> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
> new file mode 100644
> index 000000000000..b54205677bb2
> --- /dev/null
> +++ b/drivers/mfd/axp20x-i2c.c
> @@ -0,0 +1,102 @@
> +/*
> + * axp20x-i2c.c - I2C driver for the X-Powers' Power Management ICs
> + *
> + * AXP20x typically comprises an adaptive USB-Compatible PWM charger, BU=
CK DC-DC
> + * converters, LDOs, multiple 12-bit ADCs of voltage, current and temper=
ature
> + * as well as configurable GPIOs.
> + *
> + * This driver supports the I2C variants.
> + *
> + * Author: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mfd/axp20x.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +static int axp20x_i2c_probe(struct i2c_client *i2c,
> +			    const struct i2c_device_id *id)
> +{
> +	struct axp20x_dev *axp20x;
> +	int ret;
> +
> +	axp20x =3D devm_kzalloc(&i2c->dev, sizeof(*axp20x), GFP_KERNEL);
> +	if (!axp20x)
> +		return -ENOMEM;
> +
> +	axp20x->dev =3D &i2c->dev;
> +	axp20x->irq =3D i2c->irq;
> +	dev_set_drvdata(axp20x->dev, axp20x);
> +
> +	ret =3D axp20x_match_device(axp20x);
> +	if (ret)
> +		return ret;
> +
> +	axp20x->regmap =3D devm_regmap_init_i2c(i2c, axp20x->regmap_cfg);
> +	if (IS_ERR(axp20x->regmap)) {
> +		ret =3D PTR_ERR(axp20x->regmap);
> +		dev_err(&i2c->dev, "regmap init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return axp20x_device_probe(axp20x);
> +}
> +
> +static int axp20x_i2c_remove(struct i2c_client *i2c)
> +{
> +	struct axp20x_dev *axp20x =3D i2c_get_clientdata(i2c);
> +
> +	return axp20x_device_remove(axp20x);
> +}
> +
> +static const struct of_device_id axp20x_i2c_of_match[] =3D {
> +	{ .compatible =3D "x-powers,axp152", .data =3D (void *)AXP152_ID },
> +	{ .compatible =3D "x-powers,axp202", .data =3D (void *)AXP202_ID },
> +	{ .compatible =3D "x-powers,axp209", .data =3D (void *)AXP209_ID },
> +	{ .compatible =3D "x-powers,axp221", .data =3D (void *)AXP221_ID },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
> +
> +/*
> + * This is useless for OF-enabled devices, but it is needed by I2C subsy=
stem
> + */
> +static const struct i2c_device_id axp20x_i2c_id[] =3D {
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
> +
> +static const struct acpi_device_id axp20x_i2c_acpi_match[] =3D {
> +	{
> +		.id =3D "INT33F4",
> +		.driver_data =3D AXP288_ID,
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, axp20x_i2c_acpi_match);
> +
> +static struct i2c_driver axp20x_i2c_driver =3D {
> +	.driver =3D {
> +		.name	=3D "axp20x-i2c",
> +		.of_match_table	=3D of_match_ptr(axp20x_i2c_of_match),
> +		.acpi_match_table =3D ACPI_PTR(axp20x_i2c_acpi_match),
> +	},
> +	.probe		=3D axp20x_i2c_probe,
> +	.remove		=3D axp20x_i2c_remove,
> +	.id_table	=3D axp20x_i2c_id,
> +};
> +
> +module_i2c_driver(axp20x_i2c_driver);
> +
> +MODULE_DESCRIPTION("PMIC MFD I2C driver for AXP20X");
> +MODULE_AUTHOR("Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 3e186f2dcac3..631ad64ddf69 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -5,6 +5,8 @@
>   * converters, LDOs, multiple 12-bit ADCs of voltage, current and temper=
ature
>   * as well as configurable GPIOs.
>   *
> + * This file contains the interface independent core functions.
> + *
>   * Author: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
>   *
>   * This program is free software; you can redistribute it and/or modify
> @@ -13,18 +15,15 @@
>   */
> =20
>  #include <linux/err.h>
> -#include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> -#include <linux/slab.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/mfd/axp20x.h>
>  #include <linux/mfd/core.h>
>  #include <linux/of_device.h>
> -#include <linux/of_irq.h>
>  #include <linux/acpi.h>
> =20
>  #define AXP20X_OFF	0x80
> @@ -376,32 +375,6 @@ static const struct regmap_irq axp288_regmap_irqs[] =
=3D {
>  	INIT_REGMAP_IRQ(AXP288, BC_USB_CHNG,            5, 1),
>  };
> =20
> -static const struct of_device_id axp20x_of_match[] =3D {
> -	{ .compatible =3D "x-powers,axp152", .data =3D (void *) AXP152_ID },
> -	{ .compatible =3D "x-powers,axp202", .data =3D (void *) AXP202_ID },
> -	{ .compatible =3D "x-powers,axp209", .data =3D (void *) AXP209_ID },
> -	{ .compatible =3D "x-powers,axp221", .data =3D (void *) AXP221_ID },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, axp20x_of_match);
> -
> -/*
> - * This is useless for OF-enabled devices, but it is needed by I2C subsy=
stem
> - */
> -static const struct i2c_device_id axp20x_i2c_id[] =3D {
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
> -
> -static const struct acpi_device_id axp20x_acpi_match[] =3D {
> -	{
> -		.id =3D "INT33F4",
> -		.driver_data =3D AXP288_ID,
> -	},
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(acpi, axp20x_acpi_match);
> -
>  static const struct regmap_irq_chip axp152_regmap_irq_chip =3D {
>  	.name			=3D "axp152_irq_chip",
>  	.status_base		=3D AXP152_IRQ1_STATE,
> @@ -606,7 +579,7 @@ static void axp20x_power_off(void)
>  		     AXP20X_OFF);
>  }
> =20
> -static int axp20x_match_device(struct axp20x_dev *axp20x)
> +int axp20x_match_device(struct axp20x_dev *axp20x)
>  {
>  	struct device *dev =3D axp20x->dev;
>  	const struct acpi_device_id *acpi_id;
> @@ -663,38 +636,18 @@ static int axp20x_match_device(struct axp20x_dev *a=
xp20x)
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL(axp20x_match_device);
> =20
> -static int axp20x_i2c_probe(struct i2c_client *i2c,
> -			 const struct i2c_device_id *id)
> +int axp20x_device_probe(struct axp20x_dev *axp20x)
>  {
> -	struct axp20x_dev *axp20x;
>  	int ret;
> =20
> -	axp20x =3D devm_kzalloc(&i2c->dev, sizeof(*axp20x), GFP_KERNEL);
> -	if (!axp20x)
> -		return -ENOMEM;
> -
> -	axp20x->i2c_client =3D i2c;
> -	axp20x->dev =3D &i2c->dev;
> -	dev_set_drvdata(axp20x->dev, axp20x);
> -
> -	ret =3D axp20x_match_device(axp20x);
> -	if (ret)
> -		return ret;
> -
> -	axp20x->regmap =3D devm_regmap_init_i2c(i2c, axp20x->regmap_cfg);
> -	if (IS_ERR(axp20x->regmap)) {
> -		ret =3D PTR_ERR(axp20x->regmap);
> -		dev_err(&i2c->dev, "regmap init failed: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret =3D regmap_add_irq_chip(axp20x->regmap, i2c->irq,
> +	ret =3D regmap_add_irq_chip(axp20x->regmap, axp20x->irq,
>  				  IRQF_ONESHOT | IRQF_SHARED, -1,
>  				  axp20x->regmap_irq_chip,
>  				  &axp20x->regmap_irqc);
>  	if (ret) {
> -		dev_err(&i2c->dev, "failed to add irq chip: %d\n", ret);
> +		dev_err(axp20x->dev, "failed to add irq chip: %d\n", ret);
>  		return ret;
>  	}
> =20
> @@ -702,8 +655,8 @@ static int axp20x_i2c_probe(struct i2c_client *i2c,
>  			axp20x->nr_cells, NULL, 0, NULL);
> =20
>  	if (ret) {
> -		dev_err(&i2c->dev, "failed to add MFD devices: %d\n", ret);
> -		regmap_del_irq_chip(i2c->irq, axp20x->regmap_irqc);
> +		dev_err(axp20x->dev, "failed to add MFD devices: %d\n", ret);
> +		regmap_del_irq_chip(axp20x->irq, axp20x->regmap_irqc);
>  		return ret;
>  	}
> =20
> @@ -712,38 +665,25 @@ static int axp20x_i2c_probe(struct i2c_client *i2c,
>  		pm_power_off =3D axp20x_power_off;
>  	}
> =20
> -	dev_info(&i2c->dev, "AXP20X driver loaded\n");
> +	dev_info(axp20x->dev, "AXP20X driver loaded\n");
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL(axp20x_device_probe);
> =20
> -static int axp20x_i2c_remove(struct i2c_client *i2c)
> +int axp20x_device_remove(struct axp20x_dev *axp20x)
>  {
> -	struct axp20x_dev *axp20x =3D i2c_get_clientdata(i2c);
> -
>  	if (axp20x =3D=3D axp20x_pm_power_off) {
>  		axp20x_pm_power_off =3D NULL;
>  		pm_power_off =3D NULL;
>  	}
> =20
>  	mfd_remove_devices(axp20x->dev);
> -	regmap_del_irq_chip(axp20x->i2c_client->irq, axp20x->regmap_irqc);
> +	regmap_del_irq_chip(axp20x->irq, axp20x->regmap_irqc);
> =20
>  	return 0;
>  }
> -
> -static struct i2c_driver axp20x_i2c_driver =3D {
> -	.driver =3D {
> -		.name	=3D "axp20x",
> -		.of_match_table	=3D of_match_ptr(axp20x_of_match),
> -		.acpi_match_table =3D ACPI_PTR(axp20x_acpi_match),
> -	},
> -	.probe		=3D axp20x_i2c_probe,
> -	.remove		=3D axp20x_i2c_remove,
> -	.id_table	=3D axp20x_i2c_id,
> -};
> -
> -module_i2c_driver(axp20x_i2c_driver);
> +EXPORT_SYMBOL(axp20x_device_remove);
> =20
>  MODULE_DESCRIPTION("PMIC MFD core driver for AXP20X");
>  MODULE_AUTHOR("Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>");
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index b24c771cebd5..00697c6ad8b0 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -396,7 +396,7 @@ enum axp288_irqs {
> =20
>  struct axp20x_dev {
>  	struct device			*dev;
> -	struct i2c_client		*i2c_client;
> +	int				irq;
>  	struct regmap			*regmap;
>  	struct regmap_irq_chip_data	*regmap_irqc;
>  	long				variant;
> @@ -462,4 +462,35 @@ static inline int axp20x_read_variable_width(struct =
regmap *regmap,
>  	return result;
>  }
> =20
> +/**
> + * axp20x_match_device(): Setup axp20x variant related fields
> + *
> + * @axp20x: axp20x device to setup (.dev field must be set)
> + * @dev: device associated with this axp20x device
> + *
> + * This lets the axp20x core configure the mfd cells and register maps
> + * for later use.
> + */
> +int axp20x_match_device(struct axp20x_dev *axp20x);
> +
> +/**
> + * axp20x_device_probe(): Probe a configured axp20x device
> + *
> + * @axp20x: axp20x device to probe (must be configured)
> + *
> + * This function lets the axp20x core register the axp20x mfd devices
> + * and irqchip. The axp20x device passed in must be fully configured
> + * with axp20x_match_device, its irq set, and regmap created.
> + */
> +int axp20x_device_probe(struct axp20x_dev *axp20x);
> +
> +/**
> + * axp20x_device_probe(): Remove a axp20x device
> + *
> + * @axp20x: axp20x device to remove
> + *
> + * This tells the axp20x core to remove the associated mfd devices
> + */
> +int axp20x_device_remove(struct axp20x_dev *axp20x);
> +
>  #endif /* __LINUX_MFD_AXP20X_H */

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
