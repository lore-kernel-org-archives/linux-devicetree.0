From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] mfd: tps65086: Add driver for the TPS65086 PMIC
Date: Mon, 19 Oct 2015 10:23:36 +0100
Message-ID: <20151019092336.GI31804@x1>
References: <1445014753-15450-1-git-send-email-afd@ti.com>
 <1445014753-15450-3-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445014753-15450-3-git-send-email-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 16 Oct 2015, Andrew F. Davis wrote:

> Add support for the TPS65912 device. It provides communication
> through I2C and contains the following components:
>=20
>  - Regulators
>  - Load switches
>  - GPO controller

What's a GPO controller?

> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/mfd/Kconfig          |  13 ++++
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/tps65086.c       | 145 +++++++++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/tps65086.h | 120 +++++++++++++++++++++++++++++++++=
++
>  4 files changed, 279 insertions(+)
>  create mode 100644 drivers/mfd/tps65086.c
>  create mode 100644 include/linux/mfd/tps65086.h
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 99d6367..ab3b392 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1093,6 +1093,19 @@ config TPS6507X
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called tps6507x.
> =20
> +config MFD_TPS65086
> +	tristate "TI TPS65086x Power Management chips"

Use the full name:

  "TI TPS65086x Power Management Integrated Chips (PMICs)"

> +	select REGMAP
> +	select REGMAP_IRQ
> +	select REGMAP_I2C
> +	depends on I2C

REGMAP_I2C already depends on I2C.

> +	depends on OF || COMPILE_TEST
> +	help
> +	  If you say yes here you get support for the TPS65086 series of
> +	  Power Management chips.

I'd remove the line break.

> +	  These include voltage regulators, GPO and other features

GPIO?

> +	  that are often used in portable devices.

This is meant to be a 'help', so instead of staying "and some other
stuff", please list them.

>  config TPS65911_COMPARATOR
>  	tristate
> =20
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index a59e3fc..7adb902 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -66,6 +66,7 @@ obj-$(CONFIG_MFD_WM8994)	+=3D wm8994-core.o wm8994-=
irq.o wm8994-regmap.o
>  obj-$(CONFIG_TPS6105X)		+=3D tps6105x.o
>  obj-$(CONFIG_TPS65010)		+=3D tps65010.o
>  obj-$(CONFIG_TPS6507X)		+=3D tps6507x.o
> +obj-$(CONFIG_MFD_TPS65086)	+=3D tps65086.o
>  obj-$(CONFIG_MFD_TPS65217)	+=3D tps65217.o
>  obj-$(CONFIG_MFD_TPS65218)	+=3D tps65218.o
>  obj-$(CONFIG_MFD_TPS65910)	+=3D tps65910.o
> diff --git a/drivers/mfd/tps65086.c b/drivers/mfd/tps65086.c
> new file mode 100644
> index 0000000..be6d678
> --- /dev/null
> +++ b/drivers/mfd/tps65086.c
> @@ -0,0 +1,145 @@
> +/*
> + * Driver for TI TPS65086x PMICs

I'd suggest removing the driver part.  We know it's a driver.

> + * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti=
=2Ecom/
> + *
> + * Author: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License versi=
on 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
> + * kind, whether expressed or implied; without even the implied warr=
anty
> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License version 2 for more details.
> + *
> + * Based on the TPS65912 driver
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +
> +#include <linux/mfd/tps65086.h>
> +
> +static const struct regmap_range tps65086_yes_ranges[] =3D {
> +	regmap_reg_range(TPS65086_IRQ, TPS65086_IRQ),
> +	regmap_reg_range(TPS65086_PMICSTAT, TPS65086_SHUTDNSRC),
> +	regmap_reg_range(TPS65086_GPOCTRL, TPS65086_GPOCTRL),
> +	regmap_reg_range(TPS65086_PG_STATUS1, TPS65086_OC_STATUS),
> +};
> +
> +static const struct regmap_access_table tps65086_volatile_table =3D =
{
> +	.yes_ranges =3D tps65086_yes_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(tps65086_yes_ranges),
> +};
> +
> +static const struct regmap_config tps65086_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.cache_type =3D REGCACHE_RBTREE,
> +	.volatile_table =3D &tps65086_volatile_table,
> +};
> +
> +static const struct regmap_irq tps65086_irqs[] =3D {
> +	REGMAP_IRQ_REG(TPS65086_IRQ_DIETEMP, 0, TPS65086_IRQ_DIETEMP_MASK),
> +	REGMAP_IRQ_REG(TPS65086_IRQ_SHUTDN, 0, TPS65086_IRQ_SHUTDN_MASK),
> +	REGMAP_IRQ_REG(TPS65086_IRQ_FAULT, 0, TPS65086_IRQ_FAULT_MASK),
> +};
> +
> +static struct regmap_irq_chip tps65086_irq_chip =3D {
> +	.name =3D "tps65086",
> +	.status_base =3D TPS65086_IRQ,
> +	.mask_base =3D TPS65086_IRQ_MASK,
> +	.ack_base =3D TPS65086_IRQ,
> +	.init_ack_masked =3D true,
> +	.num_regs =3D 1,
> +	.irqs =3D tps65086_irqs,
> +	.num_irqs =3D ARRAY_SIZE(tps65086_irqs),
> +};
> +
> +static const struct of_device_id tps65086_of_match_table[] =3D {
> +	{ .compatible =3D "ti,tps65086", },
> +	{ /* sentinel */ }
> +};
> +
> +static int tps65086_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *ids)
> +{
> +	struct tps65086 *tps;
> +	unsigned int version;
> +	int ret;
> +
> +	tps =3D devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
> +	if (!tps)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, tps);
> +	tps->dev =3D &client->dev;
> +	tps->irq =3D client->irq;
> +
> +	tps->regmap =3D devm_regmap_init_i2c(client, &tps65086_regmap_confi=
g);
> +	if (IS_ERR(tps->regmap)) {
> +		dev_err(tps->dev, "Failed to initialize register map\n");
> +		return PTR_ERR(tps->regmap);
> +	}
> +
> +	ret =3D regmap_read(tps->regmap, TPS65086_DEVICEID, &version);
> +	if (ret < 0) {
> +		dev_err(tps->dev, "Failed to read revision register\n");
> +		return ret;
> +	}
> +
> +	dev_info(tps->dev, "Device: TPS65086%01lX, OTP: %c, Rev: %ld\n",
> +		 (version & TPS65086_DEVICEID_PART_MASK),
> +		 (char)((version & TPS65086_DEVICEID_OTP_MASK) >> 4) + 'A',
> +		 (version & TPS65086_DEVICEID_REV_MASK) >> 6);
> +
> +	ret =3D regmap_add_irq_chip(tps->regmap, tps->irq, IRQF_ONESHOT, 0,
> +				  &tps65086_irq_chip, &tps->irq_data);
> +	if (ret < 0) {

if (ret)

> +		dev_err(tps->dev, "Failed to register IRQ chip\n");
> +		return ret;
> +	}
> +
> +	ret =3D of_platform_populate(tps->dev->of_node, NULL, NULL, tps->de=
v);
> +	if (ret < 0) {

if (ret)

> +		regmap_del_irq_chip(tps->irq, tps->irq_data);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tps65086_remove(struct i2c_client *client)
> +{
> +	struct tps65086 *tps =3D i2c_get_clientdata(client);
> +
> +	regmap_del_irq_chip(tps->irq, tps->irq_data);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id tps65086_id_table[] =3D {
> +	{ "tps65086", 0 },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i2c, tps65086_id_table);
> +
> +static struct i2c_driver tps65086_driver =3D {
> +	.driver		=3D {
> +		.name	=3D "tps65086",
> +		.of_match_table =3D tps65086_of_match_table,
> +	},
> +	.probe		=3D tps65086_probe,
> +	.remove		=3D tps65086_remove,
> +	.id_table       =3D tps65086_id_table,
> +};
> +
> +module_i2c_driver(tps65086_driver);
> +
> +MODULE_AUTHOR("Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>");
> +MODULE_DESCRIPTION("TPS65086x PMIC Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/mfd/tps65086.h b/include/linux/mfd/tps6508=
6.h
> new file mode 100644
> index 0000000..2a9e9dd
> --- /dev/null
> +++ b/include/linux/mfd/tps65086.h
> @@ -0,0 +1,120 @@
> +/*
> + * TI TPS65086x
> + *
> + * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti=
=2Ecom/
> + *
> + * Author: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License versi=
on 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
> + * kind, whether expressed or implied; without even the implied warr=
anty
> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License version 2 for more details.
> + *
> + * Based on the TPS65912 driver
> + */
> +
> +#ifndef __LINUX_MFD_TPS65086_H
> +#define __LINUX_MFD_TPS65086_H
> +
> +#include <linux/device.h>
> +#include <linux/regmap.h>
> +
> +/* List of registers for TPS65086 */
> +#define TPS65086_DEVICEID		0x01
> +#define TPS65086_IRQ			0x02
> +#define TPS65086_IRQ_MASK		0x03
> +#define TPS65086_PMICSTAT		0x04
> +#define TPS65086_SHUTDNSRC		0x05
> +#define TPS65086_BUCK1CTRL		0x20
> +#define TPS65086_BUCK2CTRL		0x21
> +#define TPS65086_BUCK3DECAY		0x22
> +#define TPS65086_BUCK3VID		0x23
> +#define TPS65086_BUCK3SLPCTRL		0x24
> +#define TPS65086_BUCK4CTRL		0x25
> +#define TPS65086_BUCK5CTRL		0x26
> +#define TPS65086_BUCK6CTRL		0x27
> +#define TPS65086_LDOA2CTRL		0x28
> +#define TPS65086_LDOA3CTRL		0x29
> +#define TPS65086_DISCHCTRL1		0x40
> +#define TPS65086_DISCHCTRL2		0x41
> +#define TPS65086_DISCHCTRL3		0x42
> +#define TPS65086_PG_DELAY1		0x43
> +#define TPS65086_FORCESHUTDN		0x91
> +#define TPS65086_BUCK1SLPCTRL		0x92
> +#define TPS65086_BUCK2SLPCTRL		0x93
> +#define TPS65086_BUCK4VID		0x94
> +#define TPS65086_BUCK4SLPVID		0x95
> +#define TPS65086_BUCK5VID		0x96
> +#define TPS65086_BUCK5SLPVID		0x97
> +#define TPS65086_BUCK6VID		0x98
> +#define TPS65086_BUCK6SLPVID		0x99
> +#define TPS65086_LDOA2VID		0x9A
> +#define TPS65086_LDOA3VID		0x9B
> +#define TPS65086_BUCK123CTRL		0x9C
> +#define TPS65086_PG_DELAY2		0x9D
> +#define TPS65086_PIN_EN_MASK1		0x9E
> +#define TPS65086_PIN_EN_MASK2		0x9F
> +#define TPS65086_SWVTT_EN		0x9F
> +#define TPS65086_PIN_EN_OVR1		0xA0
> +#define TPS65086_PIN_EN_OVR2		0xA1
> +#define TPS65086_GPOCTRL		0xA1
> +#define TPS65086_PWR_FAULT_MASK1	0xA2
> +#define TPS65086_PWR_FAULT_MASK2	0xA3
> +#define TPS65086_GPO1PG_CTRL1		0xA4
> +#define TPS65086_GPO1PG_CTRL2		0xA5
> +#define TPS65086_GPO4PG_CTRL1		0xA6
> +#define TPS65086_GPO4PG_CTRL2		0xA7
> +#define TPS65086_GPO2PG_CTRL1		0xA8
> +#define TPS65086_GPO2PG_CTRL2		0xA9
> +#define TPS65086_GPO3PG_CTRL1		0xAA
> +#define TPS65086_GPO3PG_CTRL2		0xAB
> +#define TPS65086_LDOA1CTRL		0xAE
> +#define TPS65086_PG_STATUS1		0xB0
> +#define TPS65086_PG_STATUS2		0xB1
> +#define TPS65086_PWR_FAULT_STATUS1	0xB2
> +#define TPS65086_PWR_FAULT_STATUS2	0xB3
> +#define TPS65086_TEMPCRIT		0xB4
> +#define TPS65086_TEMPHOT		0xB5
> +#define TPS65086_OC_STATUS		0xB6
> +
> +/* IRQ Register field definitions */
> +#define TPS65086_IRQ_DIETEMP_MASK	BIT(0)
> +#define TPS65086_IRQ_SHUTDN_MASK	BIT(3)
> +#define TPS65086_IRQ_FAULT_MASK		BIT(7)
> +
> +/* DEVICEID Register field definitions */
> +#define TPS65086_DEVICEID_PART_MASK	GENMASK(3, 0)
> +#define TPS65086_DEVICEID_OTP_MASK	GENMASK(5, 4)
> +#define TPS65086_DEVICEID_REV_MASK	GENMASK(7, 6)
> +
> +/* VID Masks */
> +#define BUCK_VID_MASK			GENMASK(7, 1)
> +#define VDOA1_VID_MASK			GENMASK(4, 1)
> +#define VDOA23_VID_MASK			GENMASK(3, 0)
> +
> +/* Define the TPS65086 IRQ numbers */
> +enum tps65086_irqs {
> +	TPS65086_IRQ_DIETEMP,
> +	TPS65086_IRQ_SHUTDN,
> +	TPS65086_IRQ_FAULT,
> +};
> +
> +/*
> + * struct tps65086 - state holder for the tps65086 driver
> + *
> + * Device data may be used to access the TPS65086 chip
> + */
> +struct tps65086 {
> +	struct device *dev;
> +	struct regmap *regmap;
> +
> +	/* IRQ Data */
> +	int irq;
> +	struct regmap_irq_chip_data *irq_data;
> +};
> +
> +#endif /*  __LINUX_MFD_TPS65086_H */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
