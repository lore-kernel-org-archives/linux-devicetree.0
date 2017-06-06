From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v3] phy: rcar-gen3-usb3: add support for R-Car Gen3 USB
 3.0 PHY
Date: Tue, 6 Jun 2017 11:32:24 +0000
Message-ID: <TY1PR06MB0992A931EF21C95B8C75F069D8CB0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1496054535-29826-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496054535-29826-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Sender: linux-kernel-owner@vger.kernel.org
To: "kishon@ti.com" <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Kishon,

> From: Yoshihiro Shimoda
> Sent: Monday, May 29, 2017 7:42 PM
>=20
> The USB 3.0 PHY modules of R-Car Gen3 SoCs have:
>  - Spread spectrum clock (ssc).
>  - Using USB 2.0 EXTAL clock instead of USB 3.0 clock.
>  - Enabling VBUS detection for usb3.0 peripheral.
>=20
> So, this driver supports these features.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Would you review this patch?
I confirmed this patch could be applied on the latest linux-phy.git / next =
branch.

Best regards.
Yoshihiro Shimoda

> ---
>  This patch is based on the latest linux-phy.git / next branch and
>  "[PATCH v5 3/3] phy: Group vendor specific phy drivers" patch.
>=20
>  I discussed with Geert-san about this driver on the ML:
>  https://patchwork.kernel.org/patch/9731759/
>=20
>  Changes from v2:
>  - Revise the device tree doc.
>  - Improve initialization method in rcar_gen3_phy_usb3_init().
>  - remove some values from rcar_gen3_phy_usb3_match_table.
>=20
>  Changes from v1:
>  - Changes from dev_info to dev_vdbg in rcar_gen3_phy_usb3_init().
>=20
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb3.txt |  46 +++++
>  MAINTAINERS                                        |   4 +-
>  drivers/phy/renesas/Kconfig                        |   7 +
>  drivers/phy/renesas/Makefile                       |   1 +
>  drivers/phy/renesas/phy-rcar-gen3-usb3.c           | 226 +++++++++++++++=
++++++
>  5 files changed, 282 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-u=
sb3.txt
>  create mode 100644 drivers/phy/renesas/phy-rcar-gen3-usb3.c
>=20
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> new file mode 100644
> index 0000000..f94cea4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> @@ -0,0 +1,46 @@
> +* Renesas R-Car generation 3 USB 3.0 PHY
> +
> +This file provides information on what the device node for the R-Car gen=
eration
> +3 USB 3.0 PHY contains.
> +If you want to enable spread spectrum clock (ssc), you should use USB_EX=
TAL
> +instead of USB3_CLK. However, if you don't want to these features, you d=
on't
> +need this driver.
> +
> +Required properties:
> +- compatible: "renesas,r8a7795-usb3-phy" if the device is a part of an R=
8A7795
> +	      SoC.
> +	      "renesas,r8a7796-usb3-phy" if the device is a part of an R8A7796
> +	      SoC.
> +	      "renesas,rcar-gen3-usb3-phy" for a generic R-Car Gen3 compatible
> +	      device.
> +
> +	      When compatible with the generic version, nodes must list the
> +	      SoC-specific version corresponding to the platform first
> +	      followed by the generic version.
> +
> +- reg: offset and length of the USB 3.0 PHY register block.
> +- clocks: A list of phandles and clock-specifier pairs.
> +- clock-names: Name of the clocks.
> +  - The funcional clock must be "usb3-if".
> +  - The usb3's external clock must be "usb3s_clk".
> +  - The usb2's external clock must be "usb_extal". If you want to use th=
e ssc,
> +    the clock-frequency must not be 0.
> +- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
> +
> +Optional properties:
> +- renesas,ssc-range: Enable/disable spread spectrum clock (ssc) by using
> +		     the following values as u32:
> +			- 0 (or the property doesn't exist): disable the ssc
> +			- 4980: enable the ssc as -4980 ppm
> +			- 4492: enable the ssc as -4492 ppm
> +			- 4003: enable the ssc as -4003 ppm
> +
> +Example (R-Car H3):
> +
> +	usb-phy@e65ee000 {
> +		compatible =3D "renesas,r8a7795-usb3-phy",
> +			     "renesas,rcar-gen3-usb3-phy";
> +		reg =3D <0 0xe65ee000 0 0x90>;
> +		clocks =3D <&cpg CPG_MOD 328>, <&usb3s0_clk>, <&usb_extal>;
> +		clock-names =3D "usb3-if", "usb3s_clk", "usb_extal";
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a47d3da..d711d53 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10829,11 +10829,11 @@ L:	linux-iio@vger.kernel.org
>  S:	Supported
>  F:	drivers/iio/adc/rcar_gyro_adc.c
>=20
> -RENESAS USB2 PHY DRIVER
> +RENESAS USB PHY DRIVER
>  M:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Maintained
> -F:	drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +F:	drivers/phy/renesas/phy-rcar-gen3-usb*.c
>=20
>  RESET CONTROLLER FRAMEWORK
>  M:	Philipp Zabel <p.zabel@pengutronix.de>
> diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
> index 432e271..4377064 100644
> --- a/drivers/phy/renesas/Kconfig
> +++ b/drivers/phy/renesas/Kconfig
> @@ -15,3 +15,10 @@ config PHY_RCAR_GEN3_USB2
>  	select GENERIC_PHY
>  	help
>  	  Support for USB 2.0 PHY found on Renesas R-Car generation 3 SoCs.
> +
> +config PHY_RCAR_GEN3_USB3
> +	tristate "Renesas R-Car generation 3 USB 3.0 PHY driver"
> +	depends on ARCH_RENESAS
> +	select GENERIC_PHY
> +	help
> +	  Support for USB 3.0 PHY found on Renesas R-Car generation 3 SoCs.
> diff --git a/drivers/phy/renesas/Makefile b/drivers/phy/renesas/Makefile
> index 695241a..8b60259 100644
> --- a/drivers/phy/renesas/Makefile
> +++ b/drivers/phy/renesas/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_PHY_RCAR_GEN2)		+=3D phy-rcar-gen2.o
>  obj-$(CONFIG_PHY_RCAR_GEN3_USB2)	+=3D phy-rcar-gen3-usb2.o
> +obj-$(CONFIG_PHY_RCAR_GEN3_USB3)	+=3D phy-rcar-gen3-usb3.o
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb3.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb3.c
> new file mode 100644
> index 0000000..88c83c9
> --- /dev/null
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb3.c
> @@ -0,0 +1,226 @@
> +/*
> + * Renesas R-Car Gen3 for USB3.0 PHY driver
> + *
> + * Copyright (C) 2017 Renesas Electronics Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#define USB30_CLKSET0		0x034
> +#define USB30_CLKSET1		0x036
> +#define USB30_SSC_SET		0x038
> +#define USB30_PHY_ENABLE	0x060
> +#define USB30_VBUS_EN		0x064
> +
> +/* USB30_CLKSET0 */
> +#define CLKSET0_PRIVATE			0x05c0
> +#define CLKSET0_USB30_FSEL_USB_EXTAL	0x0002
> +
> +/* USB30_CLKSET1 */
> +#define CLKSET1_USB30_PLL_MULTI_SHIFT		6
> +#define CLKSET1_USB30_PLL_MULTI_USB_EXTAL	(0x64 << \
> +						 CLKSET1_USB30_PLL_MULTI_SHIFT)
> +#define CLKSET1_PHYRESET	BIT(4)	/* 1: reset */
> +#define CLKSET1_REF_CLKDIV	BIT(3)	/* 1: USB_EXTAL */
> +#define CLKSET1_PRIVATE_2_1	BIT(1)	/* Write B'01 */
> +#define CLKSET1_REF_CLK_SEL	BIT(0)	/* 1: USB3S0_CLK_P */
> +
> +/* USB30_SSC_SET */
> +#define SSC_SET_SSC_EN		BIT(12)
> +#define SSC_SET_RANGE_SHIFT	9
> +#define SSC_SET_RANGE_4980	(0x0 << SSC_SET_RANGE_SHIFT)
> +#define SSC_SET_RANGE_4492	(0x1 << SSC_SET_RANGE_SHIFT)
> +#define SSC_SET_RANGE_4003	(0x2 << SSC_SET_RANGE_SHIFT)
> +
> +/* USB30_PHY_ENABLE */
> +#define PHY_ENABLE_RESET_EN	BIT(4)
> +
> +/* USB30_VBUS_EN */
> +#define VBUS_EN_VBUS_EN		BIT(1)
> +
> +struct rcar_gen3_usb3 {
> +	void __iomem *base;
> +	struct phy *phy;
> +	u32 ssc_range;
> +	bool usb3s_clk;
> +	bool usb_extal;
> +};
> +
> +static void write_clkset1_for_usb_extal(struct rcar_gen3_usb3 *r, bool r=
eset)
> +{
> +	u16 val =3D CLKSET1_USB30_PLL_MULTI_USB_EXTAL |
> +		  CLKSET1_REF_CLKDIV | CLKSET1_PRIVATE_2_1;
> +
> +	if (reset)
> +		val |=3D CLKSET1_PHYRESET;
> +
> +	writew(val, r->base + USB30_CLKSET1);
> +}
> +
> +static void rcar_gen3_phy_usb3_enable_ssc(struct rcar_gen3_usb3 *r)
> +{
> +	u16 val =3D SSC_SET_SSC_EN;
> +
> +	switch (r->ssc_range) {
> +	case 4980:
> +		val |=3D SSC_SET_RANGE_4980;
> +		break;
> +	case 4492:
> +		val |=3D SSC_SET_RANGE_4492;
> +		break;
> +	case 4003:
> +		val |=3D SSC_SET_RANGE_4003;
> +		break;
> +	default:
> +		dev_err(&r->phy->dev, "%s: unsupported range (%x)\n", __func__,
> +			r->ssc_range);
> +		return;
> +	}
> +
> +	writew(val, r->base + USB30_SSC_SET);
> +}
> +
> +static void rcar_gen3_phy_usb3_select_usb_extal(struct rcar_gen3_usb3 *r=
)
> +{
> +	write_clkset1_for_usb_extal(r, false);
> +	if (r->ssc_range)
> +		rcar_gen3_phy_usb3_enable_ssc(r);
> +	writew(CLKSET0_PRIVATE | CLKSET0_USB30_FSEL_USB_EXTAL,
> +	       r->base + USB30_CLKSET0);
> +	writew(PHY_ENABLE_RESET_EN, r->base + USB30_PHY_ENABLE);
> +	write_clkset1_for_usb_extal(r, true);
> +	usleep_range(10, 20);
> +	write_clkset1_for_usb_extal(r, false);
> +}
> +
> +static int rcar_gen3_phy_usb3_init(struct phy *p)
> +{
> +	struct rcar_gen3_usb3 *r =3D phy_get_drvdata(p);
> +
> +	dev_vdbg(&r->phy->dev, "%s: enter (%d, %d, %d)\n", __func__,
> +		 r->usb3s_clk, r->usb_extal, r->ssc_range);
> +
> +	if (!r->usb3s_clk && r->usb_extal)
> +		rcar_gen3_phy_usb3_select_usb_extal(r);
> +
> +	/* Enables VBUS detection anyway */
> +	writew(VBUS_EN_VBUS_EN, r->base + USB30_VBUS_EN);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops rcar_gen3_phy_usb3_ops =3D {
> +	.init		=3D rcar_gen3_phy_usb3_init,
> +	.owner		=3D THIS_MODULE,
> +};
> +
> +static const struct of_device_id rcar_gen3_phy_usb3_match_table[] =3D {
> +	{ .compatible =3D "renesas,rcar-gen3-usb3-phy" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, rcar_gen3_phy_usb3_match_table);
> +
> +static int rcar_gen3_phy_usb3_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct rcar_gen3_usb3 *r;
> +	struct phy_provider *provider;
> +	struct resource *res;
> +	int ret =3D 0;
> +	struct clk *clk;
> +
> +	if (!dev->of_node) {
> +		dev_err(dev, "This driver needs device tree\n");
> +		return -EINVAL;
> +	}
> +
> +	r =3D devm_kzalloc(dev, sizeof(*r), GFP_KERNEL);
> +	if (!r)
> +		return -ENOMEM;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	r->base =3D devm_ioremap_resource(dev, res);
> +	if (IS_ERR(r->base))
> +		return PTR_ERR(r->base);
> +
> +	clk =3D devm_clk_get(dev, "usb3s_clk");
> +	if (!IS_ERR(clk) && !clk_prepare_enable(clk)) {
> +		r->usb3s_clk =3D !!clk_get_rate(clk);
> +		clk_disable_unprepare(clk);
> +	}
> +	clk =3D devm_clk_get(dev, "usb_extal");
> +	if (!IS_ERR(clk) && !clk_prepare_enable(clk)) {
> +		r->usb_extal =3D !!clk_get_rate(clk);
> +		clk_disable_unprepare(clk);
> +	}
> +
> +	if (!r->usb3s_clk && !r->usb_extal) {
> +		dev_err(dev, "This driver needs usb3s_clk and/or usb_extal\n");
> +		ret =3D -EINVAL;
> +		goto error;
> +	}
> +
> +	/*
> +	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
> +	 * And then, phy-core will manage runtime pm for this device.
> +	 */
> +	pm_runtime_enable(dev);
> +
> +	r->phy =3D devm_phy_create(dev, NULL, &rcar_gen3_phy_usb3_ops);
> +	if (IS_ERR(r->phy)) {
> +		dev_err(dev, "Failed to create USB3 PHY\n");
> +		ret =3D PTR_ERR(r->phy);
> +		goto error;
> +	}
> +
> +	of_property_read_u32(dev->of_node, "renesas,ssc-range", &r->ssc_range);
> +
> +	platform_set_drvdata(pdev, r);
> +	phy_set_drvdata(r->phy, r);
> +
> +	provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(provider)) {
> +		dev_err(dev, "Failed to register PHY provider\n");
> +		ret =3D PTR_ERR(provider);
> +		goto error;
> +	}
> +
> +	return 0;
> +
> +error:
> +	pm_runtime_disable(dev);
> +
> +	return ret;
> +}
> +
> +static int rcar_gen3_phy_usb3_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return 0;
> +};
> +
> +static struct platform_driver rcar_gen3_phy_usb3_driver =3D {
> +	.driver =3D {
> +		.name		=3D "phy_rcar_gen3_usb3",
> +		.of_match_table	=3D rcar_gen3_phy_usb3_match_table,
> +	},
> +	.probe	=3D rcar_gen3_phy_usb3_probe,
> +	.remove =3D rcar_gen3_phy_usb3_remove,
> +};
> +module_platform_driver(rcar_gen3_phy_usb3_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Renesas R-Car Gen3 USB 3.0 PHY");
> +MODULE_AUTHOR("Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>");
> --
> 1.9.1
