From: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>
Subject: Re: [PATCH v5 1/2] mfd: act8945a: add Active-semi ACT8945A PMIC MFD driver
Date: Thu, 14 Jan 2016 14:35:26 +0100
Message-ID: <87pox41dy9.fsf@dell.be.48ers.dk>
References: <1452747845-2962-1-git-send-email-wenyou.yang@atmel.com>
	<1452747845-2962-2-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452747845-2962-2-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> (Wenyou
	Yang's message of "Thu, 14 Jan 2016 13:04:04 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

>>>>> "Wenyou" == Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> writes:

 > This patch adds support for the Active-semi ACT8945A PMIC.
 > It is a Multi Function Device with the following subdevices:
 >  - Regulator
 >  - Charger

 > It is interfaced to the host controller using I2C interface,
 > ACT8945A is a child device of the I2C.

 > Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
 > Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
 > ---

 > Changes in v5:
 >  - change depends on to 'I2C=y'.

Why not make it a tristate instead? Having regulators as modules is
perhaps not a very wise thing to do, but conceptually I don't see why
this code couldn't be a module.
 
 > +config MFD_ACT8945A
 > +	bool "Active-semi ACT8945A"
 > +	select MFD_CORE
 > +	select REGMAP_I2C
 > +	depends on I2C=y && OF
 > +	help
 > +	  Support for the ACT8945A PMIC from Active-semi. This device
 > +	  features three step-down DC/DC converters and four low-dropout
 > +	  linear regulators, along with a complete ActivePath battery
 > +	  charger.
 > +

[snip]

> +++ b/drivers/mfd/act8945a.c
 > @@ -0,0 +1,109 @@
 > +/*
 > + * MFD driver for Active-semi ACT8945a PMIC
 > + *
 > + * Copyright (C) 2015 Atmel Corporation.
 > + *
 > + * Author: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
 > + *
 > + * This program is free software; you can redistribute it and/or modify it
 > + * under  the terms of the GNU General  Public License as published by the
 > + * Free Software Foundation;  either version 2 of the License, or (at your
 > + * option) any later version.
 > + */
 > +
 > +#include <linux/i2c.h>
 > +#include <linux/mfd/act8945a.h>
 > +#include <linux/mfd/core.h>
 > +#include <linux/module.h>
 > +#include <linux/of_device.h>
 > +#include <linux/regmap.h>
 > +
 > +static const struct mfd_cell act8945a_devs[] = {
 > +	{
 > +		.name = "act8945a-pmic",
 > +		.of_compatible = "active-semi,act8945a-regulator",
 > +	},
 > +	{
 > +		.name = "act8945a-charger",
 > +		.of_compatible = "active-semi,act8945a-charger",
 > +	},
 > +};
 > +
 > +static const struct regmap_config act8945a_regmap_config = {
 > +	.reg_bits = 8,
 > +	.val_bits = 8,
 > +};
 > +
 > +static int act8945a_i2c_probe(struct i2c_client *i2c,
 > +			      const struct i2c_device_id *id)
 > +{
 > +	struct act8945a_dev *act8945a;
 > +	int ret;
 > +
 > +	act8945a = devm_kzalloc(&i2c->dev, sizeof(*act8945a), GFP_KERNEL);
 > +	if (!act8945a)
 > +		return -ENOMEM;
 > +

What is the point of this structure (and the header file)? Can't the
subdevices just do dev_get_regmap(dev->parent)? regulator_register()
afaik already does this by default.

-- 
Bye, Peter Korsgaard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
