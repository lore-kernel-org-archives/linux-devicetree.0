From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 1/2] mfd: act8945a: add Active-semi ACT8945A PMIC MFD
 driver
Date: Wed, 10 Feb 2016 16:55:12 +0000
Message-ID: <20160210165512.GP3782@x1>
References: <1454643390-16910-1-git-send-email-wenyou.yang@atmel.com>
 <1454643390-16910-2-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454643390-16910-2-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Peter Korsgaard <jacmet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 05 Feb 2016, Wenyou Yang wrote:

> This patch adds support for the Active-semi ACT8945A PMIC.
> It is a Multi Function Device with the following subdevices:
>  - Regulator
>  - Charger
>=20
> It is interfaced to the host controller using I2C interface,
> ACT8945A is a child device of the I2C.
>=20
> Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>
> ---
>=20
> Changes in v10:
>  - remove the mfd cell .of_compatible.

v9 unapplied, v10 applied.

> Changes in v9:
>  - remove unneeded struct act8945a_dev structure.
>  - collect Acked from Lee.
>  - collect Acked from Peter.
>=20
> Changes in v8:
>  - change the subdevice's name "act8945a-pmic" to "act8945a-regulator=
".
>=20
> Changes in v7:
>  - remove struct act8945a_dev to .c file.
>  - remove unused .h file.
>=20
> Changes in v6:
>  - change MFD_ACT8945A type from bool to tristate.
>  - revert depends on to 'I2C'.
>=20
> Changes in v5:
>  - change depends on to 'I2C=3Dy'.
>=20
> Changes in v4:
>  - add a space before .compatible.
>  - collect Reviewed-by from Krzysztof Kozlowski.
>=20
> Changes in v3: None
> Changes in v2:
>  - add more help information in Kconfig.
>  - update the file header with short version license and author line.
>  - remove unused structure members (dev, i2c_client) of stuct act8945=
a_dev.
>  - use define "PLATFORM_DEVID_NONE" for mfd_add_devices(), instead of=
 '-1'.
>  - use more explicit info to indicate the failure to add sub devices.
>  - remove the unnecessary print out.
>  - substitute MODULE_LICENSE("GPL") for MODULE_LICENSE("GPL v2").
>=20
>  drivers/mfd/Kconfig    |   11 ++++++
>  drivers/mfd/Makefile   |    1 +
>  drivers/mfd/act8945a.c |  102 ++++++++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 114 insertions(+)
>  create mode 100644 drivers/mfd/act8945a.c
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6c4ebd9..38994bb 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -18,6 +18,17 @@ config MFD_CS5535
>  	  This is the core driver for CS5535/CS5536 MFD functions.  This is
>            necessary for using the board's GPIO and MFGPT functionali=
ty.
> =20
> +config MFD_ACT8945A
> +	tristate "Active-semi ACT8945A"
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	depends on I2C && OF
> +	help
> +	  Support for the ACT8945A PMIC from Active-semi. This device
> +	  features three step-down DC/DC converters and four low-dropout
> +	  linear regulators, along with a complete ActivePath battery
> +	  charger.
> +
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
> index 0000000..525b546
> --- /dev/null
> +++ b/drivers/mfd/act8945a.c
> @@ -0,0 +1,102 @@
> +/*
> + * MFD driver for Active-semi ACT8945a PMIC
> + *
> + * Copyright (C) 2015 Atmel Corporation.
> + *
> + * Author: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify it
> + * under  the terms of the GNU General  Public License as published =
by the
> + * Free Software Foundation;  either version 2 of the License, or (a=
t your
> + * option) any later version.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +
> +static const struct mfd_cell act8945a_devs[] =3D {
> +	{
> +		.name =3D "act8945a-regulator",
> +	},
> +	{
> +		.name =3D "act8945a-charger",
> +	},
> +};
> +
> +static const struct regmap_config act8945a_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +};
> +
> +static int act8945a_i2c_probe(struct i2c_client *i2c,
> +			      const struct i2c_device_id *id)
> +{
> +	int ret;
> +	struct regmap *regmap;
> +
> +	regmap =3D devm_regmap_init_i2c(i2c, &act8945a_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		ret =3D PTR_ERR(regmap);
> +		dev_err(&i2c->dev, "regmap init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	i2c_set_clientdata(i2c, regmap);
> +
> +	ret =3D mfd_add_devices(&i2c->dev, PLATFORM_DEVID_NONE, act8945a_de=
vs,
> +			      ARRAY_SIZE(act8945a_devs), NULL, 0, NULL);
> +	if (ret) {
> +		dev_err(&i2c->dev, "Failed to add sub devices\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int act8945a_i2c_remove(struct i2c_client *i2c)
> +{
> +	mfd_remove_devices(&i2c->dev);
> +
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
> +	{ .compatible =3D "active-semi,act8945a", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, act8945a_of_match);
> +
> +static struct i2c_driver act8945a_i2c_driver =3D {
> +	.driver =3D {
> +		   .name =3D "act8945a",
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
> +MODULE_AUTHOR("Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>");
> +MODULE_LICENSE("GPL");

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
