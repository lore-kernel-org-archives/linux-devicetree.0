From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 1/2] mfd: act8945a: add Active-semi ACT8945A PMIC MFD
 driver
Date: Wed, 27 Jan 2016 09:20:00 +0000
Message-ID: <20160127092000.GK3368@x1>
References: <1453861685-30924-1-git-send-email-wenyou.yang@atmel.com>
 <1453861685-30924-2-git-send-email-wenyou.yang@atmel.com>
 <20160127072732.GE3368@x1>
 <B256D81BAE5131468A838E5D7A243641D63FA896@penmbx01>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <B256D81BAE5131468A838E5D7A243641D63FA896@penmbx01>
Sender: linux-kernel-owner@vger.kernel.org
To: "Yang, Wenyou" <Wenyou.Yang@atmel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Javier Martinez Canillas <javier@dowhile0.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Peter Korsgaard <jacmet@gmail.com>, "Ferre, Nicolas" <Nicolas.FERRE@atmel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Jan 2016, Yang, Wenyou wrote:

> Hi Lee,
>=20
> > -----Original Message-----
> > From: Lee Jones [mailto:lee.jones@linaro.org]
> > Sent: 2016=E5=B9=B41=E6=9C=8827=E6=97=A5 15:28
> > To: Yang, Wenyou <Wenyou.Yang@atmel.com>
> > Cc: Rob Herring <robh+dt@kernel.org>; Pawel Moll <pawel.moll@arm.co=
m>;
> > Mark Rutland <mark.rutland@arm.com>; Ian Campbell
> > <ijc+devicetree@hellion.org.uk>; Kumar Gala <galak@codeaurora.org>;=
 Javier
> > Martinez Canillas <javier@dowhile0.org>; Krzysztof Kozlowski
> > <k.kozlowski@samsung.com>; Peter Korsgaard <jacmet@gmail.com>; Ferr=
e,
> > Nicolas <Nicolas.FERRE@atmel.com>; linux-arm-kernel@lists.infradead=
=2Eorg;
> > linux-kernel@vger.kernel.org; devicetree@vger.kernel.org
> > Subject: Re: [PATCH v8 1/2] mfd: act8945a: add Active-semi ACT8945A=
 PMIC
> > MFD driver
> >=20
> > On Wed, 27 Jan 2016, Wenyou Yang wrote:
> >=20
> > > This patch adds support for the Active-semi ACT8945A PMIC.
> > > It is a Multi Function Device with the following subdevices:
> > >  - Regulator
> > >  - Charger
> > >
> > > It is interfaced to the host controller using I2C interface, ACT8=
945A
> > > is a child device of the I2C.
> > >
> > > Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
> > > Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >=20
> > Can I take the MFD patches in separately?
>=20
> Yes, you can, I think.
>=20
> >=20
> > For my own reference:
> >   Acked-by: Lee Jones <lee.jones@linaro.org>
>=20
> Thank you for your Acked.

Please re-submit with the changes Peter suggested and I'll apply.

> > > ---
> > >
> > > Changes in v8:
> > >  - change the subdevice's name "act8945a-pmic" to "act8945a-regul=
ator".
> > >
> > > Changes in v7:
> > >  - remove struct act8945a_dev to .c file.
> > >  - remove unused .h file.
> > >
> > > Changes in v6:
> > >  - change MFD_ACT8945A type from bool to tristate.
> > >  - revert depends on to 'I2C'.
> > >
> > > Changes in v5:
> > >  - change depends on to 'I2C=3Dy'.
> > >
> > > Changes in v4:
> > >  - add a space before .compatible.
> > >  - collect Reviewed-by from Krzysztof Kozlowski.
> > >
> > > Changes in v3: None
> > > Changes in v2:
> > >  - add more help information in Kconfig.
> > >  - update the file header with short version license and author l=
ine.
> > >  - remove unused structure members (dev, i2c_client) of stuct act=
8945a_dev.
> > >  - use define "PLATFORM_DEVID_NONE" for mfd_add_devices(), instea=
d of '-1'.
> > >  - use more explicit info to indicate the failure to add sub devi=
ces.
> > >  - remove the unnecessary print out.
> > >  - substitute MODULE_LICENSE("GPL") for MODULE_LICENSE("GPL v2").
> > >
> > >  drivers/mfd/Kconfig    |   11 +++++
> > >  drivers/mfd/Makefile   |    1 +
> > >  drivers/mfd/act8945a.c |  112
> > > ++++++++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 124 insertions(+)
> > >  create mode 100644 drivers/mfd/act8945a.c
> > >
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig index
> > > 6c4ebd9..38994bb 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -18,6 +18,17 @@ config MFD_CS5535
> > >  	  This is the core driver for CS5535/CS5536 MFD functions.  Thi=
s is
> > >            necessary for using the board's GPIO and MFGPT functio=
nality.
> > >
> > > +config MFD_ACT8945A
> > > +	tristate "Active-semi ACT8945A"
> > > +	select MFD_CORE
> > > +	select REGMAP_I2C
> > > +	depends on I2C && OF
> > > +	help
> > > +	  Support for the ACT8945A PMIC from Active-semi. This device
> > > +	  features three step-down DC/DC converters and four low-dropou=
t
> > > +	  linear regulators, along with a complete ActivePath battery
> > > +	  charger.
> > > +
> > >  config MFD_AS3711
> > >  	bool "AMS AS3711"
> > >  	select MFD_CORE
> > > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile index
> > > 0f230a6..2f1ca82 100644
> > > --- a/drivers/mfd/Makefile
> > > +++ b/drivers/mfd/Makefile
> > > @@ -6,6 +6,7 @@
> > >  obj-$(CONFIG_MFD_88PM860X)	+=3D 88pm860x.o
> > >  obj-$(CONFIG_MFD_88PM800)	+=3D 88pm800.o 88pm80x.o
> > >  obj-$(CONFIG_MFD_88PM805)	+=3D 88pm805.o 88pm80x.o
> > > +obj-$(CONFIG_MFD_ACT8945A)	+=3D act8945a.o
> > >  obj-$(CONFIG_MFD_SM501)		+=3D sm501.o
> > >  obj-$(CONFIG_MFD_ASIC3)		+=3D asic3.o tmio_core.o
> > >  obj-$(CONFIG_MFD_BCM590XX)	+=3D bcm590xx.o
> > > diff --git a/drivers/mfd/act8945a.c b/drivers/mfd/act8945a.c new =
file
> > > mode 100644 index 0000000..3a37611
> > > --- /dev/null
> > > +++ b/drivers/mfd/act8945a.c
> > > @@ -0,0 +1,112 @@
> > > +/*
> > > + * MFD driver for Active-semi ACT8945a PMIC
> > > + *
> > > + * Copyright (C) 2015 Atmel Corporation.
> > > + *
> > > + * Author: Wenyou Yang <wenyou.yang@atmel.com>
> > > + *
> > > + * This program is free software; you can redistribute it and/or
> > > +modify it
> > > + * under  the terms of the GNU General  Public License as publis=
hed
> > > +by the
> > > + * Free Software Foundation;  either version 2 of the License, o=
r (at
> > > +your
> > > + * option) any later version.
> > > + */
> > > +
> > > +#include <linux/i2c.h>
> > > +#include <linux/mfd/core.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +struct act8945a_dev {
> > > +	struct regmap *regmap;
> > > +};
> > > +
> > > +static const struct mfd_cell act8945a_devs[] =3D {
> > > +	{
> > > +		.name =3D "act8945a-regulator",
> > > +		.of_compatible =3D "active-semi,act8945a-regulator",
> > > +	},
> > > +	{
> > > +		.name =3D "act8945a-charger",
> > > +		.of_compatible =3D "active-semi,act8945a-charger",
> > > +	},
> > > +};
> > > +
> > > +static const struct regmap_config act8945a_regmap_config =3D {
> > > +	.reg_bits =3D 8,
> > > +	.val_bits =3D 8,
> > > +};
> > > +
> > > +static int act8945a_i2c_probe(struct i2c_client *i2c,
> > > +			      const struct i2c_device_id *id) {
> > > +	struct act8945a_dev *act8945a;
> > > +	int ret;
> > > +
> > > +	act8945a =3D devm_kzalloc(&i2c->dev, sizeof(*act8945a), GFP_KER=
NEL);
> > > +	if (!act8945a)
> > > +		return -ENOMEM;
> > > +
> > > +	i2c_set_clientdata(i2c, act8945a);
> > > +
> > > +	act8945a->regmap =3D devm_regmap_init_i2c(i2c,
> > &act8945a_regmap_config);
> > > +	if (IS_ERR(act8945a->regmap)) {
> > > +		ret =3D PTR_ERR(act8945a->regmap);
> > > +		dev_err(&i2c->dev, "regmap init failed: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret =3D mfd_add_devices(&i2c->dev, PLATFORM_DEVID_NONE,
> > act8945a_devs,
> > > +			      ARRAY_SIZE(act8945a_devs), NULL, 0, NULL);
> > > +	if (ret) {
> > > +		dev_err(&i2c->dev, "Failed to add sub devices\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int act8945a_i2c_remove(struct i2c_client *i2c) {
> > > +	mfd_remove_devices(&i2c->dev);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct i2c_device_id act8945a_i2c_id[] =3D {
> > > +	{ "act8945a", 0 },
> > > +	{}
> > > +};
> > > +MODULE_DEVICE_TABLE(i2c, act8945a_i2c_id);
> > > +
> > > +static const struct of_device_id act8945a_of_match[] =3D {
> > > +	{ .compatible =3D "active-semi,act8945a", },
> > > +	{},
> > > +};
> > > +MODULE_DEVICE_TABLE(of, act8945a_of_match);
> > > +
> > > +static struct i2c_driver act8945a_i2c_driver =3D {
> > > +	.driver =3D {
> > > +		   .name =3D "act8945a",
> > > +		   .of_match_table =3D of_match_ptr(act8945a_of_match),
> > > +	},
> > > +	.probe =3D act8945a_i2c_probe,
> > > +	.remove =3D act8945a_i2c_remove,
> > > +	.id_table =3D act8945a_i2c_id,
> > > +};
> > > +
> > > +static int __init act8945a_i2c_init(void) {
> > > +	return i2c_add_driver(&act8945a_i2c_driver);
> > > +}
> > > +subsys_initcall(act8945a_i2c_init);
> > > +
> > > +static void __exit act8945a_i2c_exit(void) {
> > > +	i2c_del_driver(&act8945a_i2c_driver);
> > > +}
> > > +module_exit(act8945a_i2c_exit);
> > > +
> > > +MODULE_DESCRIPTION("ACT8945A PMIC multi-function driver");
> > > +MODULE_AUTHOR("Wenyou Yang <wenyou.yang@atmel.com>");
> > > +MODULE_LICENSE("GPL");
> >=20
>=20
> Best Regards,
> Wenyou Yang

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
