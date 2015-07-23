From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 2/2] mfd: atmel-flexcom: add a driver for Atmel
 Flexible Serial Communication Unit
Date: Thu, 23 Jul 2015 08:32:17 +0100
Message-ID: <20150723073217.GT3061@x1>
References: <cover.1437558598.git.cyrille.pitchen@atmel.com>
 <7639e02fc2b16dc20b19fbe3bbbb986b0f3b9887.1437558598.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7639e02fc2b16dc20b19fbe3bbbb986b0f3b9887.1437558598.git.cyrille.pitchen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 22 Jul 2015, Cyrille Pitchen wrote:

> This driver supports the new Atmel Flexcom. The Flexcom is a wrapper =
which
> integrates one SPI controller, one I2C controller and one USART. Only=
 one
> function can be enabled at a time. This driver selects the function o=
nce
> for all, when the Flexcom is probed, finding the first (should be uni=
que)
> available DT child node which compatible property contains one of the
> following strings:
> - "-usart"
> - "-spi"
> - "-i2c"
>=20
> This driver has chosen to present the Flexcom to the system as a MFD =
so
> the implementation is seamless for the existing Atmel SPI, I2C and US=
ART
> drivers.
>=20
> Also the Flexcom embeds FIFOs: the latest patches of the SPI, I2C and
> USART drivers take advantage of this new feature.
>=20
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> ---
>  drivers/mfd/Kconfig         |  11 ++++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/atmel-flexcom.c | 126 ++++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644 drivers/mfd/atmel-flexcom.c
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index d5ad04dad081..9b33ad0653d1 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -59,6 +59,17 @@ config MFD_AAT2870_CORE
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
> index 0e5cfeba107c..c666bf51abf3 100644
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
> index 000000000000..8ba1862fbb74
> --- /dev/null
> +++ b/drivers/mfd/atmel-flexcom.c
> @@ -0,0 +1,126 @@
> +/*
> + * Driver for Atmel Flexcom
> + *
> + * Copyright (C) 2015 Atmel Corporation
> + *
> + * Author: Cyrille Pitchen <cyrille.pitchen@atmel.com>
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
> +	u32 opmode =3D FLEX_MR_OPMODE_NO_COM;
> +	int err;
> +
> +	for_each_child_of_node(np, child) {
> +		const char *compatible;
> +		int cplen;
> +
> +		if (!of_device_is_available(child))
> +			continue;
> +
> +		compatible =3D of_get_property(child, "compatible", &cplen);
> +		if (!compatible || strlen(compatible) > cplen)
> +			continue;
> +
> +		if (strstr(compatible, "-usart")) {
> +			opmode =3D FLEX_MR_OPMODE_USART;
> +			break;
> +		}
> +
> +		if (strstr(compatible, "-spi")) {
> +			opmode =3D FLEX_MR_OPMODE_SPI;
> +			break;
> +		}
> +
> +		if (strstr(compatible, "-i2c")) {
> +			opmode =3D FLEX_MR_OPMODE_TWI;
> +			break;
> +		}
> +	}

=46rom what I understand Flexcom is a wrapper which can sit above any
number of SPI, I2C and/or UART devices.  Devices which you don't
really have any control over (source code wise).  So wouldn't it be
better to match on the details you do have control over i.e. the node
name, rather than the compatible string?

I would personally match on of_find_node_by_name() to future-proof
your implementation.

> +	if (opmode =3D=3D FLEX_MR_OPMODE_NO_COM)
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
> +	.driver		=3D {
> +		.name	=3D "atmel_flexcom",
> +		.of_match_table =3D atmel_flexcom_of_match,
> +	},
> +	.probe		=3D atmel_flexcom_probe,
> +};

This way of lining code up looks weird.  I do like straight lines when
code has the same indentation, but you're attempting to match lines at
different levels (and not matching on lines that are on the same
level).

> +module_platform_driver(atmel_flexcom_driver);
> +
> +MODULE_AUTHOR("Cyrille Pitchen <cyrille.pitchen@atmel.com>");
> +MODULE_DESCRIPTION("Atmel Flexcom MFD driver");
> +MODULE_LICENSE("GPL v2");

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
