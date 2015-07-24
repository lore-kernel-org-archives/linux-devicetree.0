From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 2/2] mfd: atmel-flexcom: add a driver for Atmel Flexible
 Serial Communication Unit
Date: Fri, 24 Jul 2015 10:42:37 +0200
Message-ID: <55B1FA7D.9080306@atmel.com>
References: <cover.1437669004.git.cyrille.pitchen@atmel.com> <55921f08b2d5d14256141edbe12287fba55860c4.1437669004.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55921f08b2d5d14256141edbe12287fba55860c4.1437669004.git.cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 23/07/2015 18:42, Cyrille Pitchen a =E9crit :
> This driver supports the new Atmel Flexcom. The Flexcom is a wrapper =
which
> integrates one SPI controller, one I2C controller and one USART. Only=
 one
> function can be enabled at a time. This driver selects the function o=
nce
> for all, when the Flexcom is probed, using the "reg" property of the =
first
> (should be unique) available DT child node.
>=20
> This driver has chosen to present the Flexcom to the system as a MFD =
so
> the implementation is seamless for the existing Atmel SPI, I2C and US=
ART
> drivers.
>=20
> Also the Flexcom embeds FIFOs: the latest patches of the SPI, I2C and
> USART drivers take advantage of this new feature.

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Thank you.

Bye,


> Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/mfd/Kconfig         |  11 +++++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/atmel-flexcom.c | 113 ++++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 125 insertions(+)
>  create mode 100644 drivers/mfd/atmel-flexcom.c
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 653815950aa2..2c75472c679c 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -60,6 +60,17 @@ config MFD_AAT2870_CORE
>  	  additional drivers must be enabled in order to use the
>  	  functionality of the device.
> =20
> +config MFD_ATMEL_FLEXCOM
> +	tristate "Atmel Flexcom (Flexible Serial Communication Unit)"
> +	select MFD_CORE
> +	depends on OF
> +	help
> +	  Select this to get support for Atmel Flexcom. This is a wrapper
> +	  which embeds a SPI controller, a I2C controller and a USART. Only
> +	  one function can be used at a time. The choice is done at boot ti=
me
> +	  by the probe function of this MFD driver according to a device tr=
ee
> +	  property.
> +
>  config MFD_ATMEL_HLCDC
>  	tristate "Atmel HLCDC (High-end LCD Controller)"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index ea40e076cb61..0705eb2d873d 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -160,6 +160,7 @@ obj-$(CONFIG_MFD_SPMI_PMIC)	+=3D qcom-spmi-pmic.o
>  obj-$(CONFIG_TPS65911_COMPARATOR)	+=3D tps65911-comparator.o
>  obj-$(CONFIG_MFD_TPS65090)	+=3D tps65090.o
>  obj-$(CONFIG_MFD_AAT2870_CORE)	+=3D aat2870-core.o
> +obj-$(CONFIG_MFD_ATMEL_FLEXCOM)	+=3D atmel-flexcom.o
>  obj-$(CONFIG_MFD_ATMEL_HLCDC)	+=3D atmel-hlcdc.o
>  obj-$(CONFIG_MFD_INTEL_MSIC)	+=3D intel_msic.o
>  obj-$(CONFIG_MFD_PALMAS)	+=3D palmas.o
> diff --git a/drivers/mfd/atmel-flexcom.c b/drivers/mfd/atmel-flexcom.=
c
> new file mode 100644
> index 000000000000..0d06b70696b0
> --- /dev/null
> +++ b/drivers/mfd/atmel-flexcom.c
> @@ -0,0 +1,113 @@
> +/*
> + * Driver for Atmel Flexcom
> + *
> + * Copyright (C) 2015 Atmel Corporation
> + *
> + * Author: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, b=
ut WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Lic=
ense for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License=
 along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/clk.h>
> +
> +/* I/O register offsets */
> +#define FLEX_MR		0x0	/* Mode Register */
> +#define FLEX_VERSION	0xfc	/* Version Register */
> +
> +/* Mode Register bit fields */
> +#define FLEX_MR_OPMODE_MASK	0x3
> +#define FLEX_MR_OPMODE_NO_COM	0x0
> +#define FLEX_MR_OPMODE_USART	0x1
> +#define FLEX_MR_OPMODE_SPI	0x2
> +#define FLEX_MR_OPMODE_TWI	0x3
> +
> +
> +static int atmel_flexcom_probe(struct platform_device *pdev)
> +{
> +	struct device_node *child, *np =3D pdev->dev.of_node;
> +	struct clk *clk;
> +	struct resource *res;
> +	void __iomem *base;
> +	u32 opmode;
> +	int err;
> +
> +	child =3D of_get_next_available_child(np, NULL);
> +	if (!child)
> +		return -ENODEV;
> +
> +	/*
> +	 * The Operating Mode is stored into the first u32 of the reg prope=
rty
> +	 * of the child.
> +	 */
> +	err =3D of_property_read_u32_index(child, "reg", 0, &opmode);
> +	of_node_put(child);
> +	if (err)
> +		return -EINVAL;
> +
> +	if ((opmode =3D=3D FLEX_MR_OPMODE_NO_COM) ||
> +	    (opmode & ~FLEX_MR_OPMODE_MASK))
> +		return -EINVAL;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	clk =3D devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	err =3D clk_prepare_enable(clk);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * Set the Operating Mode in the Mode Register: only the selected d=
evice
> +	 * is clocked. Hence, registers of the other serial devices remain
> +	 * inaccessible and are read as zero. Also the external I/O lines o=
f the
> +	 * Flexcom are muxed to reach the selected device.
> +	 */
> +	writel(opmode, base + FLEX_MR);
> +
> +	clk_disable_unprepare(clk);
> +
> +	return of_platform_populate(np, NULL, NULL, &pdev->dev);
> +}
> +
> +static const struct of_device_id atmel_flexcom_of_match[] =3D {
> +	{ .compatible =3D "atmel,sama5d2-flexcom" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, atmel_flexcom_of_match);
> +
> +static struct platform_driver atmel_flexcom_driver =3D {
> +	.probe	=3D atmel_flexcom_probe,
> +	.driver	=3D {
> +		.name		=3D "atmel_flexcom",
> +		.of_match_table	=3D atmel_flexcom_of_match,
> +	},
> +};
> +
> +module_platform_driver(atmel_flexcom_driver);
> +
> +MODULE_AUTHOR("Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>");
> +MODULE_DESCRIPTION("Atmel Flexcom MFD driver");
> +MODULE_LICENSE("GPL v2");
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
