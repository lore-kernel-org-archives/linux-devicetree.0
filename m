From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 6/9] mfd: axp20x: Add support for RSB
 based AXP223 PMIC
Date: Mon, 11 Jan 2016 09:24:27 +0000
Message-ID: <20160111092427.GI14104@x1>
References: <1450283538-25067-1-git-send-email-wens@csie.org>
 <1450283538-25067-7-git-send-email-wens@csie.org>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBT7JZW2AKGQEPIYVE4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450283538-25067-7-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
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

> The AXP223 is a new PMIC commonly paired with Allwinner A23/A33 SoCs.
> It is functionally identical to AXP221; only the regulator default
> voltage/status and the external host interface are different.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/mfd/Kconfig        | 11 +++++++
>  drivers/mfd/Makefile       |  1 +
>  drivers/mfd/axp20x-rsb.c   | 78 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/mfd/axp20x.c       |  2 ++
>  include/linux/mfd/axp20x.h |  1 +
>  5 files changed, 93 insertions(+)
>  create mode 100644 drivers/mfd/axp20x-rsb.c
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 804cd3dcce32..13c565103e96 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -107,6 +107,17 @@ config MFD_AXP20X_I2C
>  	  components like regulators or the PEK (Power Enable Key) under the
>  	  corresponding menus.
> =20
> +config MFD_AXP20X_RSB
> +	tristate "X-Powers AXP series PMICs with RSB"
> +	select MFD_AXP20X
> +	depends on SUNXI_RSB
> +	help
> +	  If you say Y here you get support for the X-Powers AXP series power
> +	  management ICs (PMICs) controlled with RSB.
> +	  This driver include only the core APIs. You have to select individual
> +	  components like regulators or the PEK (Power Enable Key) under the
> +	  corresponding menus.
> +
>  config MFD_CROS_EC
>  	tristate "ChromeOS Embedded Controller"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index a6913007d667..caea6637d5e8 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -108,6 +108,7 @@ obj-$(CONFIG_MFD_DA9052_SPI)	+=3D da9052-spi.o
>  obj-$(CONFIG_MFD_DA9052_I2C)	+=3D da9052-i2c.o
>  obj-$(CONFIG_MFD_AXP20X)	+=3D axp20x.o
>  obj-$(CONFIG_MFD_AXP20X_I2C)	+=3D axp20x-i2c.o
> +obj-$(CONFIG_MFD_AXP20X_RSB)	+=3D axp20x-rsb.o
> =20
>  obj-$(CONFIG_MFD_LP3943)	+=3D lp3943.o
>  obj-$(CONFIG_MFD_LP8788)	+=3D lp8788.o lp8788-irq.o
> diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
> new file mode 100644
> index 000000000000..76ff02b96df0
> --- /dev/null
> +++ b/drivers/mfd/axp20x-rsb.c
> @@ -0,0 +1,78 @@
> +/*
> + * axp20x-rsb.c - RSB driver for the X-Powers' Power Management ICs

Please remove the name of the file from the header.

They have a habit of becoming out of date.

> + * AXP20x typically comprises an adaptive USB-Compatible PWM charger, BU=
CK DC-DC
> + * converters, LDOs, multiple 12-bit ADCs of voltage, current and temper=
ature
> + * as well as configurable GPIOs.
> + *
> + * This driver supports the RSB variants.

No copyright line?

> + * Author: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/mfd/axp20x.h>

'f' comes before 'o'.

> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/sunxi-rsb.h>
> +
> +static int axp20x_rsb_probe(struct sunxi_rsb_device *rdev)
> +{
> +	struct axp20x_dev *axp20x;
> +	int ret;
> +
> +	axp20x =3D devm_kzalloc(&rdev->dev, sizeof(*axp20x), GFP_KERNEL);
> +	if (!axp20x)
> +		return -ENOMEM;
> +
> +	axp20x->dev =3D &rdev->dev;
> +	axp20x->irq =3D rdev->irq;
> +	sunxi_rsb_device_set_drvdata(rdev, axp20x);

What's the point of this call?  Why do you need a sunxi_ variant?

> +	ret =3D axp20x_match_device(axp20x);
> +	if (ret)
> +		return ret;
> +
> +	axp20x->regmap =3D devm_regmap_init_sunxi_rsb(rdev, axp20x->regmap_cfg)=
;
> +	if (IS_ERR(axp20x->regmap)) {
> +		ret =3D PTR_ERR(axp20x->regmap);
> +		dev_err(&rdev->dev, "regmap init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return axp20x_device_probe(axp20x);
> +}
> +
> +static int axp20x_rsb_remove(struct sunxi_rsb_device *rdev)
> +{
> +	struct axp20x_dev *axp20x =3D sunxi_rsb_device_get_drvdata(rdev);
> +
> +	return axp20x_device_remove(axp20x);
> +}
> +
> +static const struct of_device_id axp20x_rsb_of_match[] =3D {
> +	{ .compatible =3D "x-powers,axp223", .data =3D (void *)AXP223_ID },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, axp20x_rsb_of_match);
> +
> +static struct sunxi_rsb_driver axp20x_rsb_driver =3D {
> +	.driver =3D {
> +		.name	=3D "axp20x-rsb",
> +		.of_match_table	=3D of_match_ptr(axp20x_rsb_of_match),
> +	},
> +	.probe	=3D axp20x_rsb_probe,
> +	.remove	=3D axp20x_rsb_remove,
> +};
> +module_sunxi_rsb_driver(axp20x_rsb_driver);
> +
> +MODULE_DESCRIPTION("PMIC MFD sunXi RSB driver for AXP20X");
> +MODULE_AUTHOR("Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 54a00168da26..968d77fb95d8 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -33,6 +33,7 @@ static const char * const axp20x_model_names[] =3D {
>  	"AXP202",
>  	"AXP209",
>  	"AXP221",
> +	"AXP223",
>  	"AXP288",
>  };
> =20
> @@ -616,6 +617,7 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  		axp20x->regmap_irq_chip =3D &axp20x_regmap_irq_chip;
>  		break;
>  	case AXP221_ID:
> +	case AXP223_ID:
>  		axp20x->nr_cells =3D ARRAY_SIZE(axp22x_cells);
>  		axp20x->cells =3D axp22x_cells;
>  		axp20x->regmap_cfg =3D &axp22x_regmap_config;
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index 00697c6ad8b0..d82e7d51372b 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -18,6 +18,7 @@ enum {
>  	AXP202_ID,
>  	AXP209_ID,
>  	AXP221_ID,
> +	AXP223_ID,
>  	AXP288_ID,
>  	NR_AXP20X_VARIANTS,
>  };

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
