From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] mfd: act8945a: add Active-semi ACT8945A PMIC MFD
 driver
Date: Mon, 11 Jan 2016 05:49:17 +0000
Message-ID: <20160111054917.GF3331@x1>
References: <1452218729-11357-1-git-send-email-wenyou.yang@atmel.com>
 <1452218729-11357-2-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452218729-11357-2-git-send-email-wenyou.yang@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wenyou Yang <wenyou.yang@atmel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 08 Jan 2016, Wenyou Yang wrote:

> This patch adds support for the Active-semi ACT8945A PMIC.
> It is a Multi Function Device with the following subdevices:
>  - Regulator
>  - Charger
>=20
> It is interfaced to the host controller using I2C interface,
> ACT8945A is a child device of the I2C.
>=20
> Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
> ---
>=20
>  drivers/mfd/Kconfig          |    8 +++
>  drivers/mfd/Makefile         |    1 +
>  drivers/mfd/act8945a.c       |  122 ++++++++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/act8945a.h |   25 +++++++++
>  4 files changed, 156 insertions(+)
>  create mode 100644 drivers/mfd/act8945a.c
>  create mode 100644 include/linux/mfd/act8945a.h
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 9581ebb..018c72d 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -18,6 +18,14 @@ config MFD_CS5535
>  	  This is the core driver for CS5535/CS5536 MFD functions.  This is
>            necessary for using the board's GPIO and MFGPT functionali=
ty.
> =20
> +config MFD_ACT8945A
> +	bool "Active-semi ACT8945A"
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	depends on I2C && OF
> +	help
> +	  Support for the ACT8945A PMIC from Active-Semi

Checkpatch usually complains about single line helps.

>  config MFD_AS3711
>  	bool "AMS AS3711"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 0f230a6..2f1ca82 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -6,6 +6,7 @@
>  obj-$(CONFIG_MFD_88PM860X)	+=3D 88pm860x.o
>  obj-$(CONFIG_MFD_88PM800)	+=3D 88pm800.o 88pm80x.o
>  obj-$(CONFIG_MFD_88PM805)	+=3D 88pm805.o 88pm80x.o
> +obj-$(CONFIG_MFD_ACT8945A)	+=3D act8945a.o
>  obj-$(CONFIG_MFD_SM501)		+=3D sm501.o
>  obj-$(CONFIG_MFD_ASIC3)		+=3D asic3.o tmio_core.o
>  obj-$(CONFIG_MFD_BCM590XX)	+=3D bcm590xx.o
> diff --git a/drivers/mfd/act8945a.c b/drivers/mfd/act8945a.c
> new file mode 100644
> index 0000000..b9b8685
> --- /dev/null
> +++ b/drivers/mfd/act8945a.c
> @@ -0,0 +1,122 @@
> +/*
> + * MFD driver for Active-semi ACT8945a PMIC
> + *
> + * Copyright (C) 2015 Atmel Corporation.

Please update this.

> + *                    Wenyou Yang <wenyou.yang@atmel.com>

* Author: Wenyou Yang <wenyou.yang@atmel.com>

> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

This is the long version.  Any chance it can be shortened?

> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/mfd/act8945a.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +
> +static const struct mfd_cell act8945a_devs[] =3D {
> +	{
> +		.name =3D "act8945a-pmic",
> +		.of_compatible =3D "active-semi,act8945a-regulator",
> +	},
> +	{
> +		.name =3D "act8945a-charger",
> +		.of_compatible =3D "active-semi,act8945a-charger",
> +	},
> +};
> +
> +static const struct regmap_config act8945a_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +};
> +
> +static int act8945a_i2c_probe(struct i2c_client *client,
> +			     const struct i2c_device_id *id)
> +{
> +	struct act8945a_dev *act8945a;
> +	int ret;
> +
> +	act8945a =3D devm_kzalloc(&client->dev, sizeof(*act8945a), GFP_KERN=
EL);
> +	if (act8945a =3D=3D NULL)

if (!act8945a)

> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, act8945a);
> +
> +	act8945a->dev =3D &client->dev;
> +	act8945a->i2c_client =3D client;

If you're saving 'client' already, you don't need to save 'dev' too,
as one can be retrieved from the other.

> +	act8945a->regmap =3D devm_regmap_init_i2c(client,
> +						&act8945a_regmap_config);

Don't we have a generic call to obtain a single 8bit register yet?

> +	if (IS_ERR(act8945a->regmap)) {
> +		ret =3D PTR_ERR(act8945a->regmap);
> +		dev_err(&client->dev, "regmap init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D mfd_add_devices(act8945a->dev, -1, act8945a_devs,

Please use the correct defines, instead of '-1'.

> +			      ARRAY_SIZE(act8945a_devs), NULL, 0, NULL);
> +	if (ret < 0) {

if (ret)

> +		dev_err(&client->dev, "mfd_add_devices failed: %d\n", ret);

Be more explicit.

"Failed to add sub devices".

> +		return ret;
> +	}
> +
> +	dev_info(&client->dev, "added %zu mfd sub-devices\n",
> +		 ARRAY_SIZE(act8945a_devs));

This serves no one, please remove.

> +	return 0;
> +
> +}
> +
> +static int act8945a_i2c_remove(struct i2c_client *i2c)
> +{
> +	struct act8945a_dev *act8945a =3D i2c_get_clientdata(i2c);
> +
> +	mfd_remove_devices(act8945a->dev);

mfd_remove_devices(i2c->dev);

> +	return 0;
> +}
> +
> +static const struct i2c_device_id act8945a_i2c_id[] =3D {
> +	{ "act8945a", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, act8945a_i2c_id);
> +
> +static const struct of_device_id act8945a_of_match[] =3D {
> +	{.compatible =3D "active-semi,act8945a", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, act8945a_of_match);
> +
> +static struct i2c_driver act8945a_i2c_driver =3D {
> +	.driver =3D {
> +		   .name =3D "act8945a",
> +		   .owner =3D THIS_MODULE,

Remove this line, it's taken care of elsewhere.

> +		   .of_match_table =3D of_match_ptr(act8945a_of_match),
> +	},
> +	.probe =3D act8945a_i2c_probe,
> +	.remove =3D act8945a_i2c_remove,
> +	.id_table =3D act8945a_i2c_id,
> +};
> +
> +static int __init act8945a_i2c_init(void)
> +{
> +	return i2c_add_driver(&act8945a_i2c_driver);
> +}
> +subsys_initcall(act8945a_i2c_init);
> +
> +static void __exit act8945a_i2c_exit(void)
> +{
> +	i2c_del_driver(&act8945a_i2c_driver);
> +}
> +module_exit(act8945a_i2c_exit);
> +
> +MODULE_DESCRIPTION("ACT8945A PMIC multi-function driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Wenyou Yang <wenyou.yang@atmel.com>");
> diff --git a/include/linux/mfd/act8945a.h b/include/linux/mfd/act8945=
a.h
> new file mode 100644
> index 0000000..5b18d16
> --- /dev/null
> +++ b/include/linux/mfd/act8945a.h
> @@ -0,0 +1,25 @@
> +/*
> + * MFD for Active-semi ACT8945A PMIC
> + *
> + * Copyright (C) 2015 Atmel Corporation.

Please update this.

> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef _LINUX_MFD_ACT8945A_H
> +#define _LINUX_MFD_ACT8945A_H
> +
> +struct act8945a_dev {
> +	struct device *dev;

I don't think you need this.

> +	struct i2c_client *i2c_client;

Where is this used?

> +	struct regmap *regmap;

Where is this used?

> +};
> +
> +#endif

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
