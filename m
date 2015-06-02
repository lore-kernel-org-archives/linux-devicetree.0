From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: at91: add Flexcom clock
Date: Tue, 2 Jun 2015 18:58:33 +0200
Message-ID: <556DE0B9.7070405@atmel.com>
References: <cover.1433263218.git.cyrille.pitchen@atmel.com> <99519eef99d2324019f0b44a4296c518eac47f95.1433263218.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <99519eef99d2324019f0b44a4296c518eac47f95.1433263218.git.cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 02/06/2015 18:49, Cyrille Pitchen a =E9crit :
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>=20
> This driver supports the new Atmel Flexcom. The Flexcom is a wrapper =
which
> integrates one SPI controller, one I2C controller and one USART. Only=
 one
> function can be enabled at a time. This driver selects the function o=
nce for
> all, when the Flexcom is probed, according to the value of the new
> "atmel,flexcom-mode" device tree property.
>=20
> This driver has chosen to present the Flexcom to the system as a cloc=
k so the
> implementation is seamless for the existing Atmel SPI, I2C and USART =
drivers.
>=20
> Also the Flexcom embeds FIFOs: the latest patches of the SPI, I2C and=
 USART
> drivers take advantage of this new feature.
>=20
> Conflicts:
> 	drivers/clk/at91/Makefile
issue with the commit message: sending a new series

Cyrille

> ---
>  arch/arm/mach-at91/Kconfig     |   3 +
>  drivers/clk/at91/Makefile      |   1 +
>  drivers/clk/at91/clk-flexcom.c | 160 +++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 164 insertions(+)
>  create mode 100644 drivers/clk/at91/clk-flexcom.c
>=20
> diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
> index fd95f34..8ce9b73 100644
> --- a/arch/arm/mach-at91/Kconfig
> +++ b/arch/arm/mach-at91/Kconfig
> @@ -90,6 +90,9 @@ config HAVE_AT91_SMD
>  config HAVE_AT91_H32MX
>  	bool
> =20
> +config HAVE_AT91_FLEXCOM
> +	bool
> +
>  config SOC_SAM_V4_V5
>  	bool
> =20
> diff --git a/drivers/clk/at91/Makefile b/drivers/clk/at91/Makefile
> index 89a48a7..74711b8 100644
> --- a/drivers/clk/at91/Makefile
> +++ b/drivers/clk/at91/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_HAVE_AT91_UTMI)		+=3D clk-utmi.o
>  obj-$(CONFIG_HAVE_AT91_USB_CLK)		+=3D clk-usb.o
>  obj-$(CONFIG_HAVE_AT91_SMD)		+=3D clk-smd.o
>  obj-$(CONFIG_HAVE_AT91_H32MX)		+=3D clk-h32mx.o
> +obj-$(CONFIG_HAVE_AT91_FLEXCOM)		+=3D clk-flexcom.o
> diff --git a/drivers/clk/at91/clk-flexcom.c b/drivers/clk/at91/clk-fl=
excom.c
> new file mode 100644
> index 0000000..ce39093
> --- /dev/null
> +++ b/drivers/clk/at91/clk-flexcom.c
> @@ -0,0 +1,160 @@
> +/*
> + * Driver for Atmel AT91 Flexcom
> + *
> + * Copyright (C) 2014 Atmel Corporation
> + *
> + * Author: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> + *
> + * Based on drivers/clk/clk-axi-clkgen.c
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/module.h>
> +
> +
> +#define FX_MR		0x0
> +#define FX_RHR		0x10
> +#define FX_THR		0x20
> +#define FX_VERSION	0xfc
> +
> +#define FX_MR_NO_COM	0
> +#define FX_MR_USART	1
> +#define FX_MR_SPI	2
> +#define FX_MR_TWI	3
> +
> +struct clk_flexcom {
> +	struct clk_hw	hw;
> +	struct device	*dev;
> +	u8 __iomem	*base;
> +	u32		mr;
> +	bool		show_once;
> +};
> +
> +#define to_clk_flexcom(_hw)	container_of(_hw, struct clk_flexcom, hw=
)
> +
> +
> +static int at91_flexcom_enable(struct clk_hw *hw)
> +{
> +	struct clk_flexcom *dev =3D to_clk_flexcom(hw);
> +	u32 version;
> +
> +	if (!dev->show_once) {
> +		dev->show_once =3D true;
> +		version =3D __raw_readl(dev->base + FX_VERSION);
> +		dev_info(dev->dev, "version: %#x\n", version);
> +	}
> +
> +	__raw_writel(dev->mr, dev->base + FX_MR);
> +	return 0;
> +}
> +
> +static void at91_flexcom_disable(struct clk_hw *hw)
> +{
> +	struct clk_flexcom *dev =3D to_clk_flexcom(hw);
> +
> +	__raw_writel(FX_MR_NO_COM, dev->base + FX_MR);
> +}
> +
> +static const struct clk_ops at91_flexcom_ops =3D {
> +	.enable =3D at91_flexcom_enable,
> +	.disable =3D at91_flexcom_disable,
> +};
> +
> +static int at91_flexcom_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct clk_flexcom *dev;
> +	struct resource *mem;
> +	const char *parent_name, *clk_name, *mode;
> +	struct clk *clk;
> +	struct clk_init_data init;
> +	u32 mr =3D FX_MR_NO_COM;
> +	int err;
> +
> +	if (!np)
> +		return -ENODEV;
> +
> +	err =3D of_property_read_string(np, "atmel,flexcom-mode", &mode);
> +	if (err)
> +		return err;
> +
> +	if (!strcmp(mode, "usart"))
> +		mr =3D FX_MR_USART;
> +	else if (!strcmp(mode, "spi"))
> +		mr =3D FX_MR_SPI;
> +	else if (!strcmp(mode, "twi") || !strcmp(mode, "i2c"))
> +		mr =3D FX_MR_TWI;
> +	else
> +		return -EINVAL;
> +
> +	dev =3D devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	dev->base =3D devm_ioremap_resource(&pdev->dev, mem);
> +	if (IS_ERR(dev->base))
> +		return PTR_ERR(dev->base);
> +
> +	parent_name =3D of_clk_get_parent_name(np, 0);
> +	if (!parent_name)
> +		return -EINVAL;
> +
> +	clk_name =3D np->name;
> +	of_property_read_string(np, "clock-output-names", &clk_name);
> +
> +	init.name =3D clk_name;
> +	init.ops =3D &at91_flexcom_ops;
> +	init.flags =3D 0;
> +	init.parent_names =3D &parent_name;
> +	init.num_parents =3D 1;
> +
> +	dev->hw.init =3D &init;
> +	dev->dev =3D &pdev->dev;
> +	dev->mr =3D mr;
> +	platform_set_drvdata(pdev, dev);
> +
> +	clk =3D devm_clk_register(&pdev->dev, &dev->hw);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	return of_clk_add_provider(np, of_clk_src_simple_get, clk);
> +}
> +
> +static int at91_flexcom_remove(struct platform_device *pdev)
> +{
> +	of_clk_del_provider(pdev->dev.of_node);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id at91_flexcom_dt_ids[] =3D {
> +	{ .compatible =3D "atmel,sama5d2-flexcom" },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, at91_flexcom_dt_ids);
> +
> +static struct platform_driver at91_flexcom_driver =3D {
> +	.driver		=3D {
> +		.name	=3D "at91_flexcom",
> +		.of_match_table =3D of_match_ptr(at91_flexcom_dt_ids),
> +	},
> +	.probe		=3D at91_flexcom_probe,
> +	.remove		=3D at91_flexcom_remove,
> +};
> +module_platform_driver(at91_flexcom_driver);
> +
> +MODULE_ALIAS("platform:at91_flexcom");
> +MODULE_DESCRIPTION("Atmel AT91 Flexcom driver");
> +MODULE_AUTHOR("Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>");
> +MODULE_LICENSE("GPL v2");
> +
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
