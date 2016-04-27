From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V10 2/6] mfd: max77620: add core driver for
 MAX77620/MAX20024
Date: Wed, 27 Apr 2016 16:19:47 +0100
Message-ID: <20160427151947.GD4892@dell>
References: <1459348188-11726-1-git-send-email-ldewangan@nvidia.com>
 <1459348188-11726-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459348188-11726-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, ijc+devicetree@hellion.org.uk, swarren@nvidia.com, treding@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Wed, 30 Mar 2016, Laxman Dewangan wrote:

> MAX77620/MAX20024 are Power Management IC from the MAXIM.
> It supports RTC, multiple GPIOs, multiple DCDC and LDOs,
> watchdog, clock etc.
>=20
> Add MFD drier to provides common support for accessing the
> device; additional drivers is developed on respected subsystem
> in order to use the functionality of the device.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Mallikarjun Kasoju <mkasoju@nvidia.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> ---
> Changes from V1:
> - Code cleanups per review from V1.
> - Move register acccess APIs from header to c file.
> - Remove some of non required variable, remove duplication in error m=
essage
>  and simplify some of function implementation.
> - Register RTC driver such that it can get the regmap handle form par=
ent device
>=20
> Changes from V2:
> - Run coccicheck and checkpatch in strict mode for the alignment.
> - Drop RTC driver and its i2c client registration.
>=20
> Changes from V3:
> - Change all sys initcall to module driver.
> - change the max77620_read argument to unisgned int from u8.
>=20
> Changes from V4:
> - Take care of fps nodes.
> - Drop the battery charger and low battery binding and related code a=
s
>   it need to go on power driver.
>=20
> Changes from V5:
> -None
>=20
> Changes from V6:
> - Taken care of Lee's comment like used defines for irqs, remove max7=
7620
>   register accesss abstractions, remove DTof module and use ID table =
only,
>   reduce the copyright lines.
> - Drop configuration for hard power off time chnage as it will be in
>   power driver.
> - Use direct regmap from all drivers instead of using abstractions.
> - This depends on patch
>=20
> Change from V7:
> - Use MFD defines for making mfd cells.
> - Use new property name.
>=20
> Changes from V8:
> - Remove the usage of MFD defines. Remove mutex_config as not needed.
>=20
> Changes from V9:
> - Use the devm_regmap_add_irq_chip() for irq registration.
>=20
>  drivers/mfd/Kconfig          |  15 ++
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/max77620.c       | 544 +++++++++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/max77620.h | 337 +++++++++++++++++++++++++++
>  4 files changed, 897 insertions(+)
>  create mode 100644 drivers/mfd/max77620.c
>  create mode 100644 include/linux/mfd/max77620.h
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index eea61e3..585d6e3 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -527,6 +527,21 @@ config MFD_MAX14577
>  	  additional drivers must be enabled in order to use the functional=
ity
>  	  of the device.
> =20
> +config MFD_MAX77620
> +	bool "Maxim Semiconductor MAX77620 and MAX20024 PMIC Support"
> +	depends on I2C=3Dy
> +	depends on OF
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	select REGMAP_IRQ
> +	select IRQ_DOMAIN
> +	help
> +	  Say yes here to add support for Maxim Semiconductor MAX77620 and
> +	  MAX20024 which are Power Management IC with General purpose pins,
> +	  RTC, regulators, clock generator, watchdog etc. This driver
> +	  provides common support for accessing the device; additional driv=
ers
> +	  must be enabled in order to use the functionality of the device.
> +
>  config MFD_MAX77686
>  	tristate "Maxim Semiconductor MAX77686/802 PMIC Support"
>  	depends on I2C
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 5eaa6465d..921a08d 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -128,6 +128,7 @@ obj-$(CONFIG_MFD_DA9063)	+=3D da9063.o
>  obj-$(CONFIG_MFD_DA9150)	+=3D da9150-core.o
> =20
>  obj-$(CONFIG_MFD_MAX14577)	+=3D max14577.o
> +obj-$(CONFIG_MFD_MAX77620)	+=3D max77620.o
>  obj-$(CONFIG_MFD_MAX77686)	+=3D max77686.o
>  obj-$(CONFIG_MFD_MAX77693)	+=3D max77693.o
>  obj-$(CONFIG_MFD_MAX77843)	+=3D max77843.o
> diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
> new file mode 100644
> index 0000000..41daaf7
> --- /dev/null
> +++ b/drivers/mfd/max77620.c
> @@ -0,0 +1,544 @@
> +/*
> + * Maxim MAX77620 MFD Driver
> + *
> + * Copyright (C) 2016 NVIDIA CORPORATION. All rights reserved.
> + *
> + * Author:
> + *	Laxman Dewangan <ldewangan@nvidia.com>
> + *	Chaitanya Bandi <bandik@nvidia.com>
> + *	Mallikarjun Kasoju <mkasoju@nvidia.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/max77620.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +static struct resource gpio_resources[] =3D {
> +	DEFINE_RES_IRQ(MAX77620_IRQ_TOP_GPIO),
> +};
> +
> +static struct resource power_resources[] =3D {
> +	DEFINE_RES_IRQ(MAX77620_IRQ_LBT_MBATLOW),
> +};
> +
> +static struct resource rtc_resources[] =3D {
> +	DEFINE_RES_IRQ(MAX77620_IRQ_TOP_RTC),
> +};
> +
> +static struct resource thermal_resources[] =3D {
> +	DEFINE_RES_IRQ(MAX77620_IRQ_LBT_TJALRM1),
> +	DEFINE_RES_IRQ(MAX77620_IRQ_LBT_TJALRM2),
> +};
> +
> +static const struct regmap_irq max77620_top_irqs[] =3D {
> +	REGMAP_IRQ_REG(MAX77620_IRQ_TOP_GLBL, 0, MAX77620_IRQ_TOP_GLBL_MASK=
),
> +	REGMAP_IRQ_REG(MAX77620_IRQ_TOP_SD, 0, MAX77620_IRQ_TOP_SD_MASK),
> +	REGMAP_IRQ_REG(MAX77620_IRQ_TOP_LDO, 0, MAX77620_IRQ_TOP_LDO_MASK),
> +	REGMAP_IRQ_REG(MAX77620_IRQ_TOP_GPIO, 0, MAX77620_IRQ_TOP_GPIO_MASK=
),
> +	REGMAP_IRQ_REG(MAX77620_IRQ_TOP_RTC, 0, MAX77620_IRQ_TOP_RTC_MASK),
> +	REGMAP_IRQ_REG(MAX77620_IRQ_TOP_32K, 0, MAX77620_IRQ_TOP_32K_MASK),
> +	REGMAP_IRQ_REG(MAX77620_IRQ_TOP_ONOFF, 0, MAX77620_IRQ_TOP_ONOFF_MA=
SK),
> +	REGMAP_IRQ_REG(MAX77620_IRQ_LBT_MBATLOW, 1, MAX77620_IRQ_LBM_MASK),
> +	REGMAP_IRQ_REG(MAX77620_IRQ_LBT_TJALRM1, 1, MAX77620_IRQ_TJALRM1_MA=
SK),
> +	REGMAP_IRQ_REG(MAX77620_IRQ_LBT_TJALRM2, 1, MAX77620_IRQ_TJALRM2_MA=
SK),
> +};
> +
> +#define MAX77620_MFD_CELL_NAME(_name)				\
> +	{							\
> +		.name =3D (_name),				\
> +	}
> +
> +#define MAX77620_MFD_CELL_RES(_name, _res)			\
> +	{							\
> +		.name =3D (_name),				\
> +		.resources =3D (_res),				\
> +		.num_resources =3D ARRAY_SIZE((_res)),		\
> +	}

I'm *still* not accepting this.

> +static struct mfd_cell max77620_children[] =3D {
> +	MAX77620_MFD_CELL_NAME("max77620-pinctrl"),
> +	MAX77620_MFD_CELL_RES("max77620-gpio", gpio_resources),
> +	MAX77620_MFD_CELL_NAME("max77620-pmic"),
> +	MAX77620_MFD_CELL_RES("max77620-rtc", rtc_resources),
> +	MAX77620_MFD_CELL_RES("max77620-power", power_resources),
> +	MAX77620_MFD_CELL_NAME("max77620-watchdog"),
> +	MAX77620_MFD_CELL_NAME("max77620-clock"),
> +	MAX77620_MFD_CELL_RES("max77620-thermal", thermal_resources),
> +};
> +
> +static struct mfd_cell max20024_children[] =3D {
> +	MAX77620_MFD_CELL_NAME("max20024-pinctrl"),
> +	MAX77620_MFD_CELL_RES("max20024-gpio", gpio_resources),
> +	MAX77620_MFD_CELL_NAME("max20024-pmic"),
> +	MAX77620_MFD_CELL_RES("max77620-rtc", rtc_resources),
> +	MAX77620_MFD_CELL_RES("max20024-power", power_resources),
> +	MAX77620_MFD_CELL_NAME("max20024-watchdog"),
> +	MAX77620_MFD_CELL_NAME("max20024-clock"),
> +};

If you want this submission to be accepted this cycle, you're going to
have to convert this to the traditional way of defining MFD children.

> +static struct regmap_irq_chip max77620_top_irq_chip =3D {
> +	.name =3D "max77620-top",
> +	.irqs =3D max77620_top_irqs,
> +	.num_irqs =3D ARRAY_SIZE(max77620_top_irqs),
> +	.num_regs =3D 2,
> +	.status_base =3D MAX77620_REG_IRQTOP,
> +	.mask_base =3D MAX77620_REG_IRQTOPM,
> +};
> +
> +static const struct regmap_range max77620_readable_ranges[] =3D {
> +	regmap_reg_range(MAX77620_REG_CNFGGLBL1, MAX77620_REG_DVSSD4),
> +};
> +
> +static const struct regmap_access_table max77620_readable_table =3D =
{
> +	.yes_ranges =3D max77620_readable_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(max77620_readable_ranges),
> +};
> +
> +static const struct regmap_range max20024_readable_ranges[] =3D {
> +	regmap_reg_range(MAX77620_REG_CNFGGLBL1, MAX77620_REG_DVSSD4),
> +	regmap_reg_range(MAX20024_REG_MAX_ADD, MAX20024_REG_MAX_ADD),
> +};
> +
> +static const struct regmap_access_table max20024_readable_table =3D =
{
> +	.yes_ranges =3D max20024_readable_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(max20024_readable_ranges),
> +};
> +
> +static const struct regmap_range max77620_writable_ranges[] =3D {
> +	regmap_reg_range(MAX77620_REG_CNFGGLBL1, MAX77620_REG_DVSSD4),
> +};
> +
> +static const struct regmap_access_table max77620_writable_table =3D =
{
> +	.yes_ranges =3D max77620_writable_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(max77620_writable_ranges),
> +};
> +
> +static const struct regmap_range max77620_cacheable_ranges[] =3D {
> +	regmap_reg_range(MAX77620_REG_SD0_CFG, MAX77620_REG_LDO_CFG3),
> +	regmap_reg_range(MAX77620_REG_FPS_CFG0, MAX77620_REG_FPS_SD3),
> +};
> +
> +static const struct regmap_access_table max77620_volatile_table =3D =
{
> +	.no_ranges =3D max77620_cacheable_ranges,
> +	.n_no_ranges =3D ARRAY_SIZE(max77620_cacheable_ranges),
> +};
> +
> +static const struct regmap_config max77620_regmap_config =3D {
> +	.name =3D "power-slave",
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D MAX77620_REG_DVSSD4 + 1,
> +	.cache_type =3D REGCACHE_RBTREE,
> +	.rd_table =3D &max77620_readable_table,
> +	.wr_table =3D &max77620_writable_table,
> +	.volatile_table =3D &max77620_volatile_table,
> +};
> +
> +static const struct regmap_config max20024_regmap_config =3D {
> +	.name =3D "power-slave",
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D MAX20024_REG_MAX_ADD + 1,
> +	.cache_type =3D REGCACHE_RBTREE,
> +	.rd_table =3D &max20024_readable_table,
> +	.wr_table =3D &max77620_writable_table,
> +	.volatile_table =3D &max77620_volatile_table,
> +};
> +
> +static int max77620_get_fps_period_reg_value(struct max77620_chip *c=
hip,
> +					     int tperiod)
> +{
> +	int base_fps_time =3D (chip->chip_id =3D=3D MAX20024) ? 20 : 40;

What are 20 and 40?  I think you're going to need a comment to
describe what's going on in this function.

> +	int x, i;
> +
> +	for (i =3D 0; i < 0x7; i++) {

It's unsual to use hex values like this.

I think it should be defined.

> +		x =3D base_fps_time * BIT(i);

20 * (1 << {0..7})

So ...

20 * (1, 2, 4, 8, etc)

What does that does that doe exactly?

> +		if (x >=3D tperiod)
> +			return i;
> +	}
> +
> +	return i;
> +}
> +
> +static int max77620_config_fps(struct max77620_chip *chip,
> +			       struct device_node *fps_np)

Lots of mention of 'FPS' here, but noting to so what that is?

What does FPS stand for and what does the FPS do?

> +{
> +	struct device *dev =3D chip->dev;
> +	unsigned int mask =3D 0, config =3D 0;
> +	u32 param_val;
> +	int tperiod, fps_id;
> +	int ret;
> +	char fps_name[10];
> +
> +	for (fps_id =3D 0; fps_id < MAX77620_FPS_COUNT; fps_id++) {
> +		sprintf(fps_name, "fps%d", fps_id);
> +		if (!strcmp(fps_np->name, fps_name))
> +			break;
> +	}
> +
> +	if (fps_id =3D=3D MAX77620_FPS_COUNT) {
> +		dev_err(dev, "FPS node name %s is not valid\n", fps_np->name);
> +		return -EINVAL;
> +	}
> +
> +	ret =3D of_property_read_u32(fps_np, "maxim,shutdown-fps-time-perio=
d-us",
> +				   &param_val);
> +	if (!ret) {
> +		mask |=3D MAX77620_FPS_TIME_PERIOD_MASK;
> +		chip->shutdown_fps_period[fps_id] =3D min(param_val, 5120U);

Please define all magic numbers.

> +		tperiod =3D max77620_get_fps_period_reg_value(chip,
> +				chip->shutdown_fps_period[fps_id]);
> +		config |=3D tperiod << MAX77620_FPS_TIME_PERIOD_SHIFT;
> +	}
> +
> +	ret =3D of_property_read_u32(fps_np, "maxim,suspend-fps-time-period=
-us",
> +				   &param_val);
> +	if (!ret)
> +		chip->suspend_fps_period[fps_id] =3D min(param_val, 5120U);
> +
> +	ret =3D of_property_read_u32(fps_np, "maxim,fps-event-source",
> +				   &param_val);
> +	if (!ret) {
> +		if (param_val > 2) {
> +			dev_err(dev, "FPS%d event-source invalid\n", fps_id);
> +			return -EINVAL;
> +		}
> +		mask |=3D MAX77620_FPS_EN_SRC_MASK;
> +		config |=3D param_val << MAX77620_FPS_EN_SRC_SHIFT;
> +		if (param_val =3D=3D 2) {
> +			mask |=3D MAX77620_FPS_ENFPS_SW_MASK;
> +			config |=3D MAX77620_FPS_ENFPS_SW;
> +		}
> +	}
> +
> +	if (!chip->sleep_enable && !chip->enable_global_lpm) {
> +		ret =3D of_property_read_u32(fps_np,
> +				"maxim,device-state-on-disabled-event",
> +				&param_val);
> +		if (!ret) {
> +			if (param_val =3D=3D 0)
> +				chip->sleep_enable =3D true;
> +			else if (param_val =3D=3D 1)
> +				chip->enable_global_lpm =3D true;
> +		}
> +	}
> +
> +	ret =3D regmap_update_bits(chip->rmap, MAX77620_REG_FPS_CFG0 + fps_=
id,
> +				 mask, config);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to Reg 0x%02x update: %d\n",
> +			MAX77620_REG_FPS_CFG0 + fps_id, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max77620_initialise_fps(struct max77620_chip *chip)
> +{
> +	struct device *dev =3D chip->dev;
> +	struct device_node *fps_np, *fps_child;
> +	u8 config;
> +	int fps_id;
> +	int ret;
> +
> +	for (fps_id =3D 0; fps_id < MAX77620_FPS_COUNT; fps_id++) {
> +		chip->shutdown_fps_period[fps_id] =3D -1;
> +		chip->suspend_fps_period[fps_id] =3D -1;
> +	}
> +
> +	fps_np =3D of_get_child_by_name(dev->of_node, "fps");
> +	if (!fps_np)
> +		goto skip_fps;
> +
> +	for_each_child_of_node(fps_np, fps_child) {
> +		ret =3D max77620_config_fps(chip, fps_child);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	config =3D chip->enable_global_lpm ? MAX77620_ONOFFCNFG2_SLP_LPM_MS=
K : 0;
> +	ret =3D regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG2,
> +				 MAX77620_ONOFFCNFG2_SLP_LPM_MSK, config);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to reg ONOFFCNFG2 update: %d\n", ret);

This isn't very readable for your users.

Please issue a user friendly print instead.

> +		return ret;
> +	}
> +
> +skip_fps:
> +	/* Enable wake on EN0 pin */
> +	ret =3D regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG2,
> +				 MAX77620_ONOFFCNFG2_WK_EN0,
> +				 MAX77620_ONOFFCNFG2_WK_EN0);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to reg ONOFFCNFG2 update: %d\n", ret);

As above, and all the others below too.

> +		return ret;
> +	}
> +
> +	/* For MAX20024, SLPEN will be POR reset if CLRSE is b11 */
> +	if ((chip->chip_id =3D=3D MAX20024) && chip->sleep_enable) {
> +		config =3D MAX77620_ONOFFCNFG1_SLPEN | MAX20024_ONOFFCNFG1_CLRSE;
> +		ret =3D regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG1,
> +					 config, config);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to reg ONOFFCNFG1 update: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int max77620_read_es_version(struct max77620_chip *chip)
> +{
> +	unsigned int val;
> +	u8 cid_val[6];
> +	int i;
> +	int ret;
> +
> +	for (i =3D MAX77620_REG_CID0; i <=3D MAX77620_REG_CID5; i++) {
> +		ret =3D regmap_read(chip->rmap, i, &val);
> +		if (ret < 0) {
> +			dev_err(chip->dev, "Failed to reg CID%d read: %d\n",
> +				i - MAX77620_REG_CID0, ret);
> +			return ret;
> +		}
> +		dev_dbg(chip->dev, "CID%d: 0x%02x\n",
> +			i - MAX77620_REG_CID0, val);
> +		cid_val[i - MAX77620_REG_CID0] =3D val;
> +	}
> +
> +	/* CID4 is OTP Version  and CID5 is ES version */
> +	dev_info(chip->dev, "PMIC Version OTP:0x%02X and ES:0x%X\n",
> +		 cid_val[4], MAX77620_CID5_DIDM(cid_val[5]));
> +
> +	return ret;
> +}
> +
> +static int max77620_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
> +{
> +	const struct regmap_config *rmap_config;
> +	struct max77620_chip *chip;
> +	struct mfd_cell *mfd_cells;
> +	int n_mfd_cells;
> +	int ret;
> +
> +	chip =3D devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, chip);
> +	chip->dev =3D &client->dev;
> +	chip->irq_base =3D -1;
> +	chip->chip_irq =3D client->irq;
> +	chip->chip_id =3D (enum max77620_chip_id)id->driver_data;
> +
> +	switch (chip->chip_id) {
> +	case MAX77620:
> +		mfd_cells =3D max77620_children;
> +		n_mfd_cells =3D ARRAY_SIZE(max77620_children);
> +		rmap_config =3D &max77620_regmap_config;
> +		break;
> +	case MAX20024:
> +		mfd_cells =3D max20024_children;
> +		n_mfd_cells =3D ARRAY_SIZE(max20024_children);
> +		rmap_config =3D &max20024_regmap_config;
> +		break;
> +	default:
> +		dev_err(chip->dev, "ChipID is invalid %d\n", chip->chip_id);
> +		return -EINVAL;
> +	}
> +
> +	chip->rmap =3D devm_regmap_init_i2c(client, rmap_config);
> +	if (IS_ERR(chip->rmap)) {
> +		ret =3D PTR_ERR(chip->rmap);
> +		dev_err(chip->dev, "Failed to regmap init: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D max77620_read_es_version(chip);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D devm_regmap_add_irq_chip(chip->dev, chip->rmap, client->irq=
,
> +				       IRQF_ONESHOT | IRQF_SHARED,
> +				       chip->irq_base, &max77620_top_irq_chip,
> +				       &chip->top_irq_data);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "Failed to add regmap irq: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D max77620_initialise_fps(chip);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D  mfd_add_devices(chip->dev, PLATFORM_DEVID_NONE,
> +			       mfd_cells, n_mfd_cells, NULL, 0,
> +			       regmap_irq_get_domain(chip->top_irq_data));

Use new devm_*

> +	if (ret < 0) {
> +		dev_err(chip->dev, "Failed to add sub devices: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max77620_remove(struct i2c_client *client)
> +{
> +	struct max77620_chip *chip =3D i2c_get_clientdata(client);
> +
> +	mfd_remove_devices(chip->dev);
> +
> +	return 0;
> +}

Remove .remove()

> +#ifdef CONFIG_PM_SLEEP
> +static int max77620_set_fps_period(struct max77620_chip *chip,
> +				   int fps_id, int time_period)
> +{
> +	int period =3D max77620_get_fps_period_reg_value(chip, time_period)=
;
> +	int ret;
> +
> +	ret =3D regmap_update_bits(chip->rmap, MAX77620_REG_FPS_CFG0 + fps_=
id,
> +				 MAX77620_FPS_TIME_PERIOD_MASK,
> +				 period << MAX77620_FPS_TIME_PERIOD_SHIFT);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "Failed to reg 0x%02x write: %d\n",
> +			MAX77620_REG_FPS_CFG0 + fps_id, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max77620_i2c_suspend(struct device *dev)
> +{
> +	struct max77620_chip *chip =3D dev_get_drvdata(dev);
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	unsigned int config;
> +	int fps;
> +	int ret;
> +
> +	for (fps =3D 0; fps < MAX77620_FPS_COUNT; fps++) {
> +		if (chip->suspend_fps_period[fps] < 0)
> +			continue;
> +
> +		ret =3D max77620_set_fps_period(chip, fps,
> +					      chip->suspend_fps_period[fps]);
> +		if (ret < 0)
> +			dev_err(dev, "Failed to FPS%d config: %d\n", fps, ret);
> +	}
> +
> +	/*
> +	 * For MAX20024: No need to configure SLPEN on suspend as
> +	 * it will be configured on Init.
> +	 */
> +	if (chip->chip_id =3D=3D MAX20024)
> +		goto out;
> +
> +	config =3D (chip->sleep_enable) ? MAX77620_ONOFFCNFG1_SLPEN : 0;
> +	ret =3D regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG1,
> +				 MAX77620_ONOFFCNFG1_SLPEN,
> +				 config);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to reg ONOFFCNFG1 update: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Disable WK_EN0 */
> +	ret =3D regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG2,
> +				 MAX77620_ONOFFCNFG2_WK_EN0, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to reg ONOFFCNFG2 update: %d\n", ret);
> +		return ret;
> +	}
> +
> +out:
> +	disable_irq(client->irq);
> +
> +	return 0;
> +}
> +
> +static int max77620_i2c_resume(struct device *dev)
> +{
> +	struct max77620_chip *chip =3D dev_get_drvdata(dev);
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	int ret;
> +	int fps;
> +
> +	for (fps =3D 0; fps < MAX77620_FPS_COUNT; fps++) {
> +		if (chip->shutdown_fps_period[fps] < 0)
> +			continue;
> +
> +		ret =3D max77620_set_fps_period(chip, fps,
> +					      chip->shutdown_fps_period[fps]);
> +		if (ret < 0)
> +			dev_err(dev, "Failed to FPS%d config: %d\n", fps, ret);
> +	}
> +
> +	/*
> +	 * For MAX20024: No need to configure WKEN0 on resume as
> +	 * it is configured on Init.
> +	 */
> +	if (chip->chip_id =3D=3D MAX20024)
> +		goto out;
> +
> +	/* Enable WK_EN0 */
> +	ret =3D regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG2,
> +				 MAX77620_ONOFFCNFG2_WK_EN0,
> +		MAX77620_ONOFFCNFG2_WK_EN0);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to reg ONOFFCNFG2 WK_EN0 update: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +out:
> +	enable_irq(client->irq);
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct i2c_device_id max77620_id[] =3D {
> +	{"max77620", MAX77620},
> +	{"max20024", MAX20024},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, max77620_id);
> +
> +static const struct dev_pm_ops max77620_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(max77620_i2c_suspend, max77620_i2c_resume)
> +};
> +
> +static struct i2c_driver max77620_driver =3D {
> +	.driver =3D {
> +		.name =3D "max77620",
> +		.pm =3D &max77620_pm_ops,
> +	},
> +	.probe =3D max77620_probe,
> +	.remove =3D max77620_remove,
> +	.id_table =3D max77620_id,
> +};
> +
> +module_i2c_driver(max77620_driver);
> +
> +MODULE_DESCRIPTION("MAX77620/MAX20024 Multi Function Device Core Dri=
ver");
> +MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
> +MODULE_AUTHOR("Chaitanya Bandi <bandik@nvidia.com>");
> +MODULE_AUTHOR("Mallikarjun Kasoju <mkasoju@nvidia.com>");
> +MODULE_ALIAS("i2c:max77620");

The I2C subsystem should do this for you.

> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/mfd/max77620.h b/include/linux/mfd/max7762=
0.h
> new file mode 100644
> index 0000000..db34107
> --- /dev/null
> +++ b/include/linux/mfd/max77620.h
> @@ -0,0 +1,337 @@
> +/*
> + * Defining registers address and its bit definitions of MAX77620 an=
d MAX20024
> + *
> + * Copyright (C) 2016 NVIDIA CORPORATION. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + */
> +
> +#ifndef _LINUX_MFD_MAX77620_H_
> +#define _LINUX_MFD_MAX77620_H_

Just drop the LINUX part.

> +#include <linux/types.h>
> +
> +/* GLOBAL, PMIC, GPIO, FPS, ONOFFC, CID Registers */
> +#define MAX77620_REG_CNFGGLBL1			0x00
> +#define MAX77620_REG_CNFGGLBL2			0x01
> +#define MAX77620_REG_CNFGGLBL3			0x02
> +#define MAX77620_REG_CNFG1_32K			0x03
> +#define MAX77620_REG_CNFGBBC			0x04
> +#define MAX77620_REG_IRQTOP			0x05
> +#define MAX77620_REG_INTLBT			0x06
> +#define MAX77620_REG_IRQSD			0x07
> +#define MAX77620_REG_IRQ_LVL2_L0_7		0x08
> +#define MAX77620_REG_IRQ_LVL2_L8		0x09
> +#define MAX77620_REG_IRQ_LVL2_GPIO		0x0A
> +#define MAX77620_REG_ONOFFIRQ			0x0B
> +#define MAX77620_REG_NVERC			0x0C
> +#define MAX77620_REG_IRQTOPM			0x0D
> +#define MAX77620_REG_INTENLBT			0x0E
> +#define MAX77620_REG_IRQMASKSD			0x0F
> +#define MAX77620_REG_IRQ_MSK_L0_7		0x10
> +#define MAX77620_REG_IRQ_MSK_L8			0x11
> +#define MAX77620_REG_ONOFFIRQM			0x12
> +#define MAX77620_REG_STATLBT			0x13
> +#define MAX77620_REG_STATSD			0x14
> +#define MAX77620_REG_ONOFFSTAT			0x15
> +
> +/* SD and LDO Registers */
> +#define MAX77620_REG_SD0			0x16
> +#define MAX77620_REG_SD1			0x17
> +#define MAX77620_REG_SD2			0x18
> +#define MAX77620_REG_SD3			0x19
> +#define MAX77620_REG_SD4			0x1A
> +#define MAX77620_REG_DVSSD0			0x1B
> +#define MAX77620_REG_DVSSD1			0x1C
> +#define MAX77620_REG_SD0_CFG			0x1D
> +#define MAX77620_REG_SD1_CFG			0x1E
> +#define MAX77620_REG_SD2_CFG			0x1F
> +#define MAX77620_REG_SD3_CFG			0x20
> +#define MAX77620_REG_SD4_CFG			0x21
> +#define MAX77620_REG_SD_CFG2			0x22
> +#define MAX77620_REG_LDO0_CFG			0x23
> +#define MAX77620_REG_LDO0_CFG2			0x24
> +#define MAX77620_REG_LDO1_CFG			0x25
> +#define MAX77620_REG_LDO1_CFG2			0x26
> +#define MAX77620_REG_LDO2_CFG			0x27
> +#define MAX77620_REG_LDO2_CFG2			0x28
> +#define MAX77620_REG_LDO3_CFG			0x29
> +#define MAX77620_REG_LDO3_CFG2			0x2A
> +#define MAX77620_REG_LDO4_CFG			0x2B
> +#define MAX77620_REG_LDO4_CFG2			0x2C
> +#define MAX77620_REG_LDO5_CFG			0x2D
> +#define MAX77620_REG_LDO5_CFG2			0x2E
> +#define MAX77620_REG_LDO6_CFG			0x2F
> +#define MAX77620_REG_LDO6_CFG2			0x30
> +#define MAX77620_REG_LDO7_CFG			0x31
> +#define MAX77620_REG_LDO7_CFG2			0x32
> +#define MAX77620_REG_LDO8_CFG			0x33
> +#define MAX77620_REG_LDO8_CFG2			0x34
> +#define MAX77620_REG_LDO_CFG3			0x35
> +
> +#define MAX77620_LDO_SLEW_RATE_MASK		0x1
> +
> +/* LDO Configuration 3 */
> +#define MAX77620_TRACK4_MASK			BIT(5)
> +#define MAX77620_TRACK4_SHIFT			5
> +
> +/* Voltage */
> +#define MAX77620_SDX_VOLT_MASK			0xFF
> +#define MAX77620_SD0_VOLT_MASK			0x3F
> +#define MAX77620_SD1_VOLT_MASK			0x7F
> +#define MAX77620_LDO_VOLT_MASK			0x3F
> +
> +#define MAX77620_REG_GPIO0			0x36
> +#define MAX77620_REG_GPIO1			0x37
> +#define MAX77620_REG_GPIO2			0x38
> +#define MAX77620_REG_GPIO3			0x39
> +#define MAX77620_REG_GPIO4			0x3A
> +#define MAX77620_REG_GPIO5			0x3B
> +#define MAX77620_REG_GPIO6			0x3C
> +#define MAX77620_REG_GPIO7			0x3D
> +#define MAX77620_REG_PUE_GPIO			0x3E
> +#define MAX77620_REG_PDE_GPIO			0x3F
> +#define MAX77620_REG_AME_GPIO			0x40
> +#define MAX77620_REG_ONOFFCNFG1			0x41
> +#define MAX77620_REG_ONOFFCNFG2			0x42
> +
> +/* FPS Registers */
> +#define MAX77620_REG_FPS_CFG0			0x43
> +#define MAX77620_REG_FPS_CFG1			0x44
> +#define MAX77620_REG_FPS_CFG2			0x45
> +#define MAX77620_REG_FPS_LDO0			0x46
> +#define MAX77620_REG_FPS_LDO1			0x47
> +#define MAX77620_REG_FPS_LDO2			0x48
> +#define MAX77620_REG_FPS_LDO3			0x49
> +#define MAX77620_REG_FPS_LDO4			0x4A
> +#define MAX77620_REG_FPS_LDO5			0x4B
> +#define MAX77620_REG_FPS_LDO6			0x4C
> +#define MAX77620_REG_FPS_LDO7			0x4D
> +#define MAX77620_REG_FPS_LDO8			0x4E
> +#define MAX77620_REG_FPS_SD0			0x4F
> +#define MAX77620_REG_FPS_SD1			0x50
> +#define MAX77620_REG_FPS_SD2			0x51
> +#define MAX77620_REG_FPS_SD3			0x52
> +#define MAX77620_REG_FPS_SD4			0x53
> +#define MAX77620_REG_FPS_NONE			0
> +
> +#define MAX77620_FPS_SRC_MASK			0xC0
> +#define MAX77620_FPS_SRC_SHIFT			6
> +#define MAX77620_FPS_PU_PERIOD_MASK		0x38
> +#define MAX77620_FPS_PU_PERIOD_SHIFT		3
> +#define MAX77620_FPS_PD_PERIOD_MASK		0x07
> +#define MAX77620_FPS_PD_PERIOD_SHIFT		0
> +#define MAX77620_FPS_TIME_PERIOD_MASK		0x38
> +#define MAX77620_FPS_TIME_PERIOD_SHIFT		3
> +#define MAX77620_FPS_EN_SRC_MASK		0x06
> +#define MAX77620_FPS_EN_SRC_SHIFT		1
> +#define MAX77620_FPS_ENFPS_SW_MASK		0x01
> +#define MAX77620_FPS_ENFPS_SW			0x01
> +
> +#define MAX77620_REG_FPS_GPIO1			0x54
> +#define MAX77620_REG_FPS_GPIO2			0x55
> +#define MAX77620_REG_FPS_GPIO3			0x56
> +#define MAX77620_REG_FPS_RSO			0x57
> +#define MAX77620_REG_CID0			0x58
> +#define MAX77620_REG_CID1			0x59
> +#define MAX77620_REG_CID2			0x5A
> +#define MAX77620_REG_CID3			0x5B
> +#define MAX77620_REG_CID4			0x5C
> +#define MAX77620_REG_CID5			0x5D
> +
> +#define MAX77620_REG_DVSSD4			0x5E
> +#define MAX20024_REG_MAX_ADD			0x70
> +
> +#define MAX77620_CID_DIDM_MASK			0xF0
> +#define MAX77620_CID_DIDM_SHIFT			4
> +
> +/* CNCG2SD */
> +#define MAX77620_SD_CNF2_ROVS_EN_SD1		BIT(1)
> +#define MAX77620_SD_CNF2_ROVS_EN_SD0		BIT(2)
> +
> +/* Device Identification Metal */
> +#define MAX77620_CID5_DIDM(n)			(((n) >> 4) & 0xF)
> +/* Device Indentification OTP */
> +#define MAX77620_CID5_DIDO(n)			((n) & 0xF)
> +
> +/* SD CNFG1 */
> +#define MAX77620_SD_SR_MASK			0xC0
> +#define MAX77620_SD_SR_SHIFT			6
> +#define MAX77620_SD_POWER_MODE_MASK		0x30
> +#define MAX77620_SD_POWER_MODE_SHIFT		4
> +#define MAX77620_SD_CFG1_ADE_MASK		BIT(3)
> +#define MAX77620_SD_CFG1_ADE_DISABLE		0
> +#define MAX77620_SD_CFG1_ADE_ENABLE		BIT(3)
> +#define MAX77620_SD_FPWM_MASK			0x04
> +#define MAX77620_SD_FPWM_SHIFT			2
> +#define MAX77620_SD_FSRADE_MASK			0x01
> +#define MAX77620_SD_FSRADE_SHIFT		0
> +#define MAX77620_SD_CFG1_FPWM_SD_MASK		BIT(2)
> +#define MAX77620_SD_CFG1_FPWM_SD_SKIP		0
> +#define MAX77620_SD_CFG1_FPWM_SD_FPWM		BIT(2)
> +#define MAX77620_SD_CFG1_FSRADE_SD_MASK		BIT(0)
> +#define MAX77620_SD_CFG1_FSRADE_SD_DISABLE	0
> +#define MAX77620_SD_CFG1_FSRADE_SD_ENABLE	BIT(0)
> +
> +/* LDO_CNFG2 */
> +#define MAX77620_LDO_POWER_MODE_MASK		0xC0
> +#define MAX77620_LDO_POWER_MODE_SHIFT		6
> +#define MAX77620_LDO_CFG2_ADE_MASK		BIT(1)
> +#define MAX77620_LDO_CFG2_ADE_DISABLE		0
> +#define MAX77620_LDO_CFG2_ADE_ENABLE		BIT(1)
> +#define MAX77620_LDO_CFG2_SS_MASK		BIT(0)
> +#define MAX77620_LDO_CFG2_SS_FAST		BIT(0)
> +#define MAX77620_LDO_CFG2_SS_SLOW		0
> +
> +#define MAX77620_IRQ_TOP_GLBL_MASK		BIT(7)
> +#define MAX77620_IRQ_TOP_SD_MASK		BIT(6)
> +#define MAX77620_IRQ_TOP_LDO_MASK		BIT(5)
> +#define MAX77620_IRQ_TOP_GPIO_MASK		BIT(4)
> +#define MAX77620_IRQ_TOP_RTC_MASK		BIT(3)
> +#define MAX77620_IRQ_TOP_32K_MASK		BIT(2)
> +#define MAX77620_IRQ_TOP_ONOFF_MASK		BIT(1)
> +
> +#define MAX77620_IRQ_LBM_MASK			BIT(3)
> +#define MAX77620_IRQ_TJALRM1_MASK		BIT(2)
> +#define MAX77620_IRQ_TJALRM2_MASK		BIT(1)
> +
> +#define MAX77620_PWR_I2C_ADDR			0x3c
> +#define MAX77620_RTC_I2C_ADDR			0x68
> +
> +#define MAX77620_CNFG_GPIO_DRV_MASK		BIT(0)
> +#define MAX77620_CNFG_GPIO_DRV_PUSHPULL		BIT(0)
> +#define MAX77620_CNFG_GPIO_DRV_OPENDRAIN	0
> +#define MAX77620_CNFG_GPIO_DIR_MASK		BIT(1)
> +#define MAX77620_CNFG_GPIO_DIR_INPUT		BIT(1)
> +#define MAX77620_CNFG_GPIO_DIR_OUTPUT		0
> +#define MAX77620_CNFG_GPIO_INPUT_VAL_MASK	BIT(2)
> +#define MAX77620_CNFG_GPIO_OUTPUT_VAL_MASK	BIT(3)
> +#define MAX77620_CNFG_GPIO_OUTPUT_VAL_HIGH	BIT(3)
> +#define MAX77620_CNFG_GPIO_OUTPUT_VAL_LOW	0
> +#define MAX77620_CNFG_GPIO_INT_MASK		(0x3 << 4)
> +#define MAX77620_CNFG_GPIO_INT_FALLING		BIT(4)
> +#define MAX77620_CNFG_GPIO_INT_RISING		BIT(5)
> +#define MAX77620_CNFG_GPIO_DBNC_MASK		(0x3 << 6)
> +#define MAX77620_CNFG_GPIO_DBNC_None		(0x0 << 6)
> +#define MAX77620_CNFG_GPIO_DBNC_8ms		(0x1 << 6)
> +#define MAX77620_CNFG_GPIO_DBNC_16ms		(0x2 << 6)
> +#define MAX77620_CNFG_GPIO_DBNC_32ms		(0x3 << 6)
> +
> +#define MAX77620_IRQ_LVL2_GPIO_EDGE0		BIT(0)
> +#define MAX77620_IRQ_LVL2_GPIO_EDGE1		BIT(1)
> +#define MAX77620_IRQ_LVL2_GPIO_EDGE2		BIT(2)
> +#define MAX77620_IRQ_LVL2_GPIO_EDGE3		BIT(3)
> +#define MAX77620_IRQ_LVL2_GPIO_EDGE4		BIT(4)
> +#define MAX77620_IRQ_LVL2_GPIO_EDGE5		BIT(5)
> +#define MAX77620_IRQ_LVL2_GPIO_EDGE6		BIT(6)
> +#define MAX77620_IRQ_LVL2_GPIO_EDGE7		BIT(7)
> +
> +#define MAX77620_CNFG1_32K_OUT0_EN		BIT(2)
> +
> +#define MAX77620_ONOFFCNFG1_SFT_RST		BIT(7)
> +#define MAX77620_ONOFFCNFG1_MRT_MASK		0x38
> +#define MAX77620_ONOFFCNFG1_MRT_SHIFT		0x3
> +#define MAX77620_ONOFFCNFG1_SLPEN		BIT(2)
> +#define MAX77620_ONOFFCNFG1_PWR_OFF		BIT(1)
> +#define MAX20024_ONOFFCNFG1_CLRSE		0x18
> +
> +#define MAX77620_ONOFFCNFG2_SFT_RST_WK		BIT(7)
> +#define MAX77620_ONOFFCNFG2_WD_RST_WK		BIT(6)
> +#define MAX77620_ONOFFCNFG2_SLP_LPM_MSK		BIT(5)
> +#define MAX77620_ONOFFCNFG2_WK_ALARM1		BIT(2)
> +#define MAX77620_ONOFFCNFG2_WK_EN0		BIT(0)
> +
> +#define MAX77620_GLBLM_MASK			BIT(0)
> +
> +#define MAX77620_WDTC_MASK			0x3
> +#define MAX77620_WDTOFFC			BIT(4)
> +#define MAX77620_WDTSLPC			BIT(3)
> +#define MAX77620_WDTEN				BIT(2)
> +
> +#define MAX77620_TWD_MASK			0x3
> +#define MAX77620_TWD_2s				0x0
> +#define MAX77620_TWD_16s			0x1
> +#define MAX77620_TWD_64s			0x2
> +#define MAX77620_TWD_128s			0x3
> +
> +#define MAX77620_CNFGGLBL1_LBDAC_EN		BIT(7)
> +#define MAX77620_CNFGGLBL1_MPPLD		BIT(6)
> +#define MAX77620_CNFGGLBL1_LBHYST		(BIT(5) | BIT(4))
> +#define MAX77620_CNFGGLBL1_LBDAC		0x0E
> +#define MAX77620_CNFGGLBL1_LBRSTEN		BIT(0)
> +
> +/* CNFG BBC registers */
> +#define MAX77620_CNFGBBC_ENABLE			BIT(0)
> +#define MAX77620_CNFGBBC_CURRENT_MASK		0x06
> +#define MAX77620_CNFGBBC_CURRENT_SHIFT		1
> +#define MAX77620_CNFGBBC_VOLTAGE_MASK		0x18
> +#define MAX77620_CNFGBBC_VOLTAGE_SHIFT		3
> +#define MAX77620_CNFGBBC_LOW_CURRENT_DISABLE	BIT(5)
> +#define MAX77620_CNFGBBC_RESISTOR_MASK		0xC0
> +#define MAX77620_CNFGBBC_RESISTOR_SHIFT		6
> +
> +#define MAX77620_FPS_COUNT			3
> +
> +/* Interrupts */
> +enum {
> +	MAX77620_IRQ_TOP_GLBL,		/* Low-Battery */
> +	MAX77620_IRQ_TOP_SD,		/* SD power fail */
> +	MAX77620_IRQ_TOP_LDO,		/* LDO power fail */
> +	MAX77620_IRQ_TOP_GPIO,		/* TOP GPIO internal int to MAX77620 */
> +	MAX77620_IRQ_TOP_RTC,		/* RTC */
> +	MAX77620_IRQ_TOP_32K,		/* 32kHz oscillator */
> +	MAX77620_IRQ_TOP_ONOFF,		/* ON/OFF oscillator */
> +	MAX77620_IRQ_LBT_MBATLOW,	/* Thermal alarm status, > 120C */
> +	MAX77620_IRQ_LBT_TJALRM1,	/* Thermal alarm status, > 120C */
> +	MAX77620_IRQ_LBT_TJALRM2,	/* Thermal alarm status, > 140C */
> +};
> +
> +/* GPIOs */
> +enum {
> +	MAX77620_GPIO0,
> +	MAX77620_GPIO1,
> +	MAX77620_GPIO2,
> +	MAX77620_GPIO3,
> +	MAX77620_GPIO4,
> +	MAX77620_GPIO5,
> +	MAX77620_GPIO6,
> +	MAX77620_GPIO7,
> +	MAX77620_GPIO_NR,
> +};
> +
> +/* FPS Source */
> +enum max77620_fps_src {
> +	MAX77620_FPS_SRC_0,
> +	MAX77620_FPS_SRC_1,
> +	MAX77620_FPS_SRC_2,
> +	MAX77620_FPS_SRC_NONE,
> +	MAX77620_FPS_SRC_DEF,
> +};
> +
> +enum max77620_chip_id {
> +	MAX77620,
> +	MAX20024,
> +};
> +
> +struct max77620_chip {
> +	struct device *dev;
> +	struct regmap *rmap;
> +
> +	int chip_irq;
> +	int irq_base;
> +
> +	/* chip id */
> +	enum max77620_chip_id chip_id;
> +
> +	bool sleep_enable;
> +	bool enable_global_lpm;
> +	int shutdown_fps_period[MAX77620_FPS_COUNT];
> +	int suspend_fps_period[MAX77620_FPS_COUNT];
> +
> +	struct regmap_irq_chip_data *top_irq_data;
> +	struct regmap_irq_chip_data *gpio_irq_data;
> +};
> +
> +#endif /* _LINUX_MFD_MAX77620_H_ */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
