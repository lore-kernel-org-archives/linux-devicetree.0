From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] Adding Skyworks SKY81452 MFD driver
Date: Thu, 21 Aug 2014 10:45:02 +0100
Message-ID: <20140821094502.GV4266@lee--X1>
References: <1407488899-31065-1-git-send-email-jack.yoo@skyworksinc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1407488899-31065-1-git-send-email-jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, heiko.stuebner-HCpLIkUQxWGakBO8gow8eQ@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, silvio.fricke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When you send patch-sets, you should send them connected to one
another AKA threaded.  That way, when we're reviewing we can look at
the other patches in the set for reference.  See the man page for `git
send-email` for details.

<commit log>

> Signed-off-by: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/sky81452.txt |  24 +++++

Binding documents should be sent separately:

See: Documentation/devicetree/bindings/submitting-patches.txt

>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +

This can go in with the documentation.

>  drivers/mfd/Kconfig                                |  12 +++
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/sky81452.c                             | 113 +++++++++++=
++++++++++
>  include/linux/mfd/sky81452.h                       |  32 ++++++
>  6 files changed, 183 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/sky81452.tx=
t
>  create mode 100644 drivers/mfd/sky81452.c
>  create mode 100644 include/linux/mfd/sky81452.h
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/sky81452.txt b/Doc=
umentation/devicetree/bindings/mfd/sky81452.txt
> new file mode 100644
> index 0000000..5fb0b4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/sky81452.txt
> @@ -0,0 +1,24 @@
> +SKY81452 bindings
> +
> +Required properties:
> +- compatible	: Must be "skyworks,sky81452"
> +
> +Required child nodes:
> +- backlight	: container node for backlight following the binding
> +		in video/backlight/sky81452-backlight.txt
> +- regulator	: container node for regulators following the binding
> +		in regulator/sky81452-regulator.txt
> +
> +Example:
> +
> +	sky81452@2C {

Lower case.

> +		compatible =3D "skyworks,sky81452";

"reg"?

You also need to document the 'compatible' and 'reg' properties.

> +		backlight {
> +			...
> +		};
> +
> +		regulator {
> +			...
> +		};
> +	};

I think it would be helpful to place a fully populated example in
here.

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/=
Documentation/devicetree/bindings/vendor-prefixes.txt
> index d415b38..ce76e10 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -122,6 +122,7 @@ silabs	Silicon Laboratories
>  simtek
>  sii	Seiko Instruments, Inc.
>  sirf	SiRF Technology, Inc.
> +skyworks	Skyworks Solutions, Inc.
>  smsc	Standard Microsystems Corporation
>  snps 	Synopsys, Inc.
>  spansion	Spansion Inc.
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index de5abf2..acfb2e5 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -626,6 +626,18 @@ config MFD_SM501_GPIO
>  	 lines on the SM501. The platform data is used to supply the
>  	 base number for the first GPIO line to register.
> =20
> +config SKY81452

MFD_SKY81452

> +	tristate "Skyworks Solutions SKY81452"
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	depends on I2C=3Dy

Why do you need I2C to be built-in, rather than as a module?

> +	help
> +	  This is the core driver for the Skyworks SKY81452 backlight and
> +	  voltage regulator device.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called sky81452.
> +
>  config MFD_SMSC
>         bool "SMSC ECE1099 series chips"
>         depends on I2C=3Dy
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index f001487..191c656 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -169,6 +169,7 @@ obj-$(CONFIG_MFD_AS3711)	+=3D as3711.o
>  obj-$(CONFIG_MFD_AS3722)	+=3D as3722.o
>  obj-$(CONFIG_MFD_STW481X)	+=3D stw481x.o
>  obj-$(CONFIG_MFD_IPAQ_MICRO)	+=3D ipaq-micro.o
> +obj-$(CONFIG_SKY81452)		+=3D sky81452.o
> =20
>  intel-soc-pmic-objs		:=3D intel_soc_pmic_core.o intel_soc_pmic_crc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC)	+=3D intel-soc-pmic.o
> diff --git a/drivers/mfd/sky81452.c b/drivers/mfd/sky81452.c
> new file mode 100644
> index 0000000..566912f
> --- /dev/null
> +++ b/drivers/mfd/sky81452.c
> @@ -0,0 +1,113 @@
> +/*
> + * sky81452.c	SKY81452 MFD driver
> + *
> + * Copyright 2014 Skyworks Solutions Inc.
> + * Author : Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify it
> + * under the terms of the GNU General Public License as published by=
 the
> + * Free Software Foundation; either version 2, or (at your option) a=
ny
> + * later version.
> + *
> + * This program is distributed in the hope that it will be useful, b=
ut
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License=
 along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/err.h>
> +#include <linux/slab.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/sky81452.h>
> +
> +static const struct regmap_config sky81452_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +};
> +
> +static int sky81452_register_devices(struct device *dev,
> +		const struct sky81452_platform_data *pdata)
> +{
> +	struct mfd_cell cells[] =3D {
> +		{
> +			.name =3D "sky81452-bl",
> +			.platform_data =3D pdata->bl_pdata,
> +			.pdata_size =3D sizeof(*pdata->bl_pdata),

Have you tested this with DT?

You're not passing the compatible string and not using
of_platform_populate() so I'm struggling to see how it would work
properly.

> +		},
> +		{
> +			.name =3D "sky81452-regulator",
> +			.platform_data =3D pdata->regulator_init_data,
> +			.pdata_size =3D sizeof(*pdata->regulator_init_data),
> +		},
> +	};

Please declare this outside of the function?

> +	return mfd_add_devices(dev, -1, cells, ARRAY_SIZE(cells),
> +			NULL, 0, NULL);

This doesn't really need to be in a function of its own.  Please put
it in .probe().  Also check for the return value and present the user
with an error message if it fails.

> +}
> +
> +static int sky81452_probe(struct i2c_client *client,
> +		const struct i2c_device_id *id)

Line up against '('.

> +{
> +	struct device *dev =3D &client->dev;
> +	const struct sky81452_platform_data *pdata =3D dev_get_platdata(dev=
);
> +	struct regmap *map;

Can you call this 'regmap' for clarity.

> +	if (!pdata) {
> +		pdata =3D devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +		if (!pdata)
> +			return -ENOMEM;
> +	}
> +
> +	map =3D devm_regmap_init_i2c(client, &sky81452_config);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);

I'm not sure you want this to fail silently.

> +	i2c_set_clientdata(client, map);
> +
> +	return sky81452_register_devices(dev, pdata);
> +}
> +
> +static int sky81452_remove(struct i2c_client *client)
> +{
> +	mfd_remove_devices(&client->dev);
> +	return 0;
> +}
> +
> +static const struct i2c_device_id sky81452_ids[] =3D {
> +	{ "sky81452", 0 },

Remove the second attribute, it's unused.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, sky81452_ids);
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id sky81452_of_match[] =3D {
> +	{ .compatible =3D "skyworks,sky81452", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, sky81452_of_match);
> +#endif

You can drop the #differy the compiler should sort that out on the
back of of_match_ptr().

> +static struct i2c_driver sky81452_driver =3D {
> +	.driver =3D {
> +		.name =3D "sky81452",
> +		.of_match_table =3D of_match_ptr(sky81452_of_match),
> +	},
> +	.probe =3D sky81452_probe,
> +	.remove =3D sky81452_remove,
> +	.id_table =3D sky81452_ids,
> +};
> +
> +module_i2c_driver(sky81452_driver);
> +
> +MODULE_DESCRIPTION("Skyworks SKY81452 MFD driver");
> +MODULE_AUTHOR("Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>");
> +MODULE_LICENSE("GPL");

I think you want v2.

> +MODULE_VERSION("1.0");
> diff --git a/include/linux/mfd/sky81452.h b/include/linux/mfd/sky8145=
2.h
> new file mode 100644
> index 0000000..8d8ed35
> --- /dev/null
> +++ b/include/linux/mfd/sky81452.h
> @@ -0,0 +1,32 @@
> +/*
> + * sky81452.h	SKY81452 backlight driver

If it's a just a backlight driver, why is it in MFD?

You'd best expand the description here.

> + * Copyright 2014 Skyworks Solutions Inc.
> + * Author : Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify it
> + * under the terms of the GNU General Public License as published by=
 the
> + * Free Software Foundation; either version 2, or (at your option) a=
ny
> + * later version.
> + *
> + * This program is distributed in the hope that it will be useful, b=
ut
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License=
 along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef _SKY81452_H
> +#define _SKY81452_H
> +
> +#include "linux/sky81452-backlight.h"
> +#include "linux/regulator/machine.h"

s/"/< and >

> +struct sky81452_platform_data {
> +	struct sky81452_bl_platform_data *bl_pdata;
> +	struct regulator_init_data *regulator_init_data;
> +};
> +
> +#endif

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
