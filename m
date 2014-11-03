From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESUBMIT PATCH v6 1/8] mfd: Add support for Skyworks SKY81452
 driver
Date: Mon, 3 Nov 2014 17:14:51 +0000
Message-ID: <20141103171451.GG12011@x1>
References: <1414393369-31583-1-git-send-email-jack.yoo@skyworksinc.com>
 <1414739322-12487-1-git-send-email-jack.yoo@skyworksinc.com>
 <1414739322-12487-2-git-send-email-jack.yoo@skyworksinc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1414739322-12487-2-git-send-email-jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 31 Oct 2014, gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:

> From: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
>=20
> Signed-off-by: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
> ---
> Changes v6:
> Added new line character at the end of line of dev_err()
>=20
> Changes v5:
> Move sky81452-backlight.h to include/linux/platform_data
>=20
> Changes v4:
> Removed MODULE_VERSION()
> Modified license to GPLv2
>=20
> Changes v3:
> Fixed the backlight name from 'sky81452-bl' to 'sky81452-backlight'
> Assigned mfd_cell.of_compatible for binding device node
> Modified error messages
>=20
> Changes v2:
> Renamed CONFIG_SKY81452 to CONFIG_MFD_SKY81452
> Changed the dependency from I2C=3Dy to I2C, for CONFIG_MFD_SKY81452
> Added message for exception or errors
>=20
>  drivers/mfd/Kconfig          |  12 +++++
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/sky81452.c       | 109 +++++++++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/sky81452.h |  32 +++++++++++++
>  4 files changed, 154 insertions(+)
>  create mode 100644 drivers/mfd/sky81452.c
>  create mode 100644 include/linux/mfd/sky81452.h

Code looks fine, but what are its dependencies.  I'm assuming nothing;
however, did Mark say that something depends on it?  If so, what and
what are you going to do about it?

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 1456ea7..a54244c 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -693,6 +693,18 @@ config MFD_SM501_GPIO
>  	 lines on the SM501. The platform data is used to supply the
>  	 base number for the first GPIO line to register.
> =20
> +config MFD_SKY81452
> +	tristate "Skyworks Solutions SKY81452"
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	depends on I2C
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
> index 8bd54b1..d9683ea 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -174,6 +174,7 @@ obj-$(CONFIG_MFD_STW481X)	+=3D stw481x.o
>  obj-$(CONFIG_MFD_IPAQ_MICRO)	+=3D ipaq-micro.o
>  obj-$(CONFIG_MFD_MENF21BMC)	+=3D menf21bmc.o
>  obj-$(CONFIG_MFD_HI6421_PMIC)	+=3D hi6421-pmic-core.o
> +obj-$(CONFIG_MFD_SKY81452)		+=3D sky81452.o
> =20
>  intel-soc-pmic-objs		:=3D intel_soc_pmic_core.o intel_soc_pmic_crc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC)	+=3D intel-soc-pmic.o
> diff --git a/drivers/mfd/sky81452.c b/drivers/mfd/sky81452.c
> new file mode 100644
> index 0000000..ae1b584
> --- /dev/null
> +++ b/drivers/mfd/sky81452.c
> @@ -0,0 +1,109 @@
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
> +static int sky81452_probe(struct i2c_client *client,
> +				const struct i2c_device_id *id)
> +{
> +	struct device *dev =3D &client->dev;
> +	const struct sky81452_platform_data *pdata =3D dev_get_platdata(dev=
);
> +	struct mfd_cell cells[2];
> +	struct regmap *regmap;
> +	int ret;
> +
> +	if (!pdata) {
> +		pdata =3D devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +		if (!pdata)
> +			return -ENOMEM;
> +	}
> +
> +	regmap =3D devm_regmap_init_i2c(client, &sky81452_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "failed to initialize.err=3D%ld\n", PTR_ERR(regmap));
> +		return PTR_ERR(regmap);
> +	}
> +
> +	i2c_set_clientdata(client, regmap);
> +
> +	memset(cells, 0, sizeof(cells));
> +	cells[0].name =3D "sky81452-backlight";
> +	cells[0].of_compatible =3D "skyworks,sky81452-backlight";
> +	cells[0].platform_data =3D pdata->bl_pdata;
> +	cells[0].pdata_size =3D sizeof(*pdata->bl_pdata);
> +	cells[1].name =3D "sky81452-regulator";
> +	cells[1].platform_data =3D pdata->regulator_init_data;
> +	cells[1].pdata_size =3D sizeof(*pdata->regulator_init_data);
> +
> +	ret =3D mfd_add_devices(dev, -1, cells, ARRAY_SIZE(cells), NULL, 0,=
 NULL);
> +	if (ret)
> +		dev_err(dev, "failed to add child devices. err=3D%d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int sky81452_remove(struct i2c_client *client)
> +{
> +	mfd_remove_devices(&client->dev);
> +	return 0;
> +}
> +
> +static const struct i2c_device_id sky81452_ids[] =3D {
> +	{ "sky81452" },
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
> +
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
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/mfd/sky81452.h b/include/linux/mfd/sky8145=
2.h
> new file mode 100644
> index 0000000..9d84872
> --- /dev/null
> +++ b/include/linux/mfd/sky81452.h
> @@ -0,0 +1,32 @@
> +/*
> + * sky81452.h	SKY81452 MFD driver
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
> +#ifndef _SKY81452_H
> +#define _SKY81452_H
> +
> +#include <linux/platform_data/sky81452-backlight.h>
> +#include <linux/regulator/machine.h>
> +
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
