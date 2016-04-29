From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH V4] phy: bcm-ns-usb2: new driver for USB 2.0 PHY on
 Northstar
Date: Fri, 29 Apr 2016 14:49:55 +0530
Message-ID: <5723273B.3040603@ti.com>
References: <1460367788-971-1-git-send-email-zajec5@gmail.com>
 <1460626663-5984-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460626663-5984-1-git-send-email-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-kernel@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Felix Fietkau <nbd@openwrt.org>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jon.mason@broadcom.com>, linux-usb@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On Thursday 14 April 2016 03:07 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> Northstar is a family of SoCs used in home routers. They have USB 2.0
> and 3.0 controllers with PHYs that need to be properly initialized.
> This driver provides PHY init support in a generic way and can be bou=
nd
> with an EHCI controller driver.
> There are (just a few) registers being defined in bcma header. It's
> because DMU/CRU registers will be also needed in other drivers. We wi=
ll
> need them e.g. in PCIe controller/PHY driver and at some point probab=
ly
> in clock driver for BCM53573 chipset. By using include/linux/bcma/ we
> avoid code duplication.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
> V2: Support reg-names and clock-names. As you can see PHY PLL is
>     controlled over DMU, not a separated PHY registers range. This ma=
y
>     be a bit confusing and even less clear if we happen to support mo=
re
>     complex hardware in the future. Using a clear name should make co=
de
>     cleaner.
>     Also use struct device *dev helpers to make code simpler.
> V3: Update Kconfig entry fixing 2.0 vs. 3.0 typo and removing info ab=
out
>     bcma (this driver is not bcma specific).
> V4: Drop unneeded #clock-cells =3D <0>; from Documentation
>     Do ioremap in probe function
>     Switch to readl and writel
>     Slightly optimize usb_pll_pdiv calculation
>     Describe 0x0000ea68 as magic value (we don't know bits meaning)
>     Fix MODULE_LICENSE
>     Update commit message
> ---
>  .../devicetree/bindings/phy/bcm-ns-usb2-phy.txt    |  21 ++++
>  drivers/phy/Kconfig                                |   9 ++
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-bcm-ns-usb2.c                      | 137 +++++++++++=
++++++++++
>  include/linux/bcma/bcma.h                          |   1 +
>  include/linux/bcma/bcma_driver_arm_c9.h            |  15 +++
>  6 files changed, 184 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/bcm-ns-usb2=
-phy.txt
>  create mode 100644 drivers/phy/phy-bcm-ns-usb2.c
>  create mode 100644 include/linux/bcma/bcma_driver_arm_c9.h
>=20
> diff --git a/Documentation/devicetree/bindings/phy/bcm-ns-usb2-phy.tx=
t b/Documentation/devicetree/bindings/phy/bcm-ns-usb2-phy.txt
> new file mode 100644
> index 0000000..a7aee9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/bcm-ns-usb2-phy.txt
> @@ -0,0 +1,21 @@
> +Driver for Broadcom Northstar USB 2.0 PHY
> +
> +Required properties:
> +- compatible: brcm,ns-usb2-phy
> +- reg: iomem address range of DMU (Device Management Unit)
> +- reg-names: "dmu", the only needed & supported reg right now
> +- clocks: USB PHY reference clock
> +- clock-names: "phy-ref-clk", the only needed & supported clock righ=
t now
> +
> +To initialize USB 2.0 PHY driver needs to setup PLL correctly. To do=
 this it
> +requires passing phandle to the USB PHY reference clock.
> +
> +Example:
> +	usb2-phy {
> +		compatible =3D "brcm,ns-usb2-phy";
> +		reg =3D <0x1800c000 0x1000>;
> +		reg-names =3D "dmu";
> +		#phy-cells =3D <0>;
> +		clocks =3D <&genpll BCM_NSP_GENPLL_USB_PHY_REF_CLK>;
> +		clock-names =3D "phy-ref-clk";
> +	};
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 26566db..3292502 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -15,6 +15,15 @@ config GENERIC_PHY
>  	  phy users can obtain reference to the PHY. All the users of this
>  	  framework should select this config.
> =20
> +config PHY_BCM_NS_USB2
> +	tristate "Broadcom Northstar USB 2.0 PHY Driver

=46ixed
drivers/phy/Kconfig:19:warning: multi-line strings not supported and up=
dated
the patch in linux-phy tree :-(

Thanks
Kishon
> +	depends on ARCH_BCM_IPROC || COMPILE_TEST
> +	depends on HAS_IOMEM && OF
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support Broadcom USB 2.0 PHY connected to the USB
> +	  controller on Northstar family.
> +
>  config PHY_BERLIN_USB
>  	tristate "Marvell Berlin USB PHY Driver"
>  	depends on ARCH_BERLIN && RESET_CONTROLLER && HAS_IOMEM && OF
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index 24596a9..9c8f08d 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -3,6 +3,7 @@
>  #
> =20
>  obj-$(CONFIG_GENERIC_PHY)		+=3D phy-core.o
> +obj-$(CONFIG_PHY_BCM_NS_USB2)		+=3D phy-bcm-ns-usb2.o
>  obj-$(CONFIG_PHY_BERLIN_USB)		+=3D phy-berlin-usb.o
>  obj-$(CONFIG_PHY_BERLIN_SATA)		+=3D phy-berlin-sata.o
>  obj-$(CONFIG_PHY_DM816X_USB)		+=3D phy-dm816x-usb.o
> diff --git a/drivers/phy/phy-bcm-ns-usb2.c b/drivers/phy/phy-bcm-ns-u=
sb2.c
> new file mode 100644
> index 0000000..95ab6b2
> --- /dev/null
> +++ b/drivers/phy/phy-bcm-ns-usb2.c
> @@ -0,0 +1,137 @@
> +/*
> + * Broadcom Northstar USB 2.0 PHY Driver
> + *
> + * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + */
> +
> +#include <linux/bcma/bcma.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +struct bcm_ns_usb2 {
> +	struct device *dev;
> +	struct clk *ref_clk;
> +	struct phy *phy;
> +	void __iomem *dmu;
> +};
> +
> +static int bcm_ns_usb2_phy_init(struct phy *phy)
> +{
> +	struct bcm_ns_usb2 *usb2 =3D phy_get_drvdata(phy);
> +	struct device *dev =3D usb2->dev;
> +	void __iomem *dmu =3D usb2->dmu;
> +	u32 ref_clk_rate, usb2ctl, usb_pll_ndiv, usb_pll_pdiv;
> +	int err =3D 0;
> +
> +	err =3D clk_prepare_enable(usb2->ref_clk);
> +	if (err < 0) {
> +		dev_err(dev, "Failed to prepare ref clock: %d\n", err);
> +		goto err_out;
> +	}
> +
> +	ref_clk_rate =3D clk_get_rate(usb2->ref_clk);
> +	if (!ref_clk_rate) {
> +		dev_err(dev, "Failed to get ref clock rate\n");
> +		err =3D -EINVAL;
> +		goto err_clk_off;
> +	}
> +
> +	usb2ctl =3D readl(dmu + BCMA_DMU_CRU_USB2_CONTROL);
> +
> +	if (usb2ctl & BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_PDIV_MASK) {
> +		usb_pll_pdiv =3D usb2ctl;
> +		usb_pll_pdiv &=3D BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_PDIV_MASK;
> +		usb_pll_pdiv >>=3D BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_PDIV_SHIFT;
> +	} else {
> +		usb_pll_pdiv =3D 1 << 3;
> +	}
> +
> +	/* Calculate ndiv based on a solid 1920 MHz that is for USB2 PHY */
> +	usb_pll_ndiv =3D (1920000000 * usb_pll_pdiv) / ref_clk_rate;
> +
> +	/* Unlock DMU PLL settings with some magic value */
> +	writel(0x0000ea68, dmu + BCMA_DMU_CRU_CLKSET_KEY);
> +
> +	/* Write USB 2.0 PLL control setting */
> +	usb2ctl &=3D ~BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_NDIV_MASK;
> +	usb2ctl |=3D usb_pll_ndiv << BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_NDIV=
_SHIFT;
> +	writel(usb2ctl, dmu + BCMA_DMU_CRU_USB2_CONTROL);
> +
> +	/* Lock DMU PLL settings */
> +	writel(0x00000000, dmu + BCMA_DMU_CRU_CLKSET_KEY);
> +
> +err_clk_off:
> +	clk_disable_unprepare(usb2->ref_clk);
> +err_out:
> +	return err;
> +}
> +
> +static const struct phy_ops ops =3D {
> +	.init		=3D bcm_ns_usb2_phy_init,
> +	.owner		=3D THIS_MODULE,
> +};
> +
> +static int bcm_ns_usb2_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct bcm_ns_usb2 *usb2;
> +	struct resource *res;
> +	struct phy_provider *phy_provider;
> +
> +	usb2 =3D devm_kzalloc(&pdev->dev, sizeof(*usb2), GFP_KERNEL);
> +	if (!usb2)
> +		return -ENOMEM;
> +	usb2->dev =3D dev;
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "dmu");
> +	usb2->dmu =3D devm_ioremap_resource(dev, res);
> +	if (IS_ERR(usb2->dmu)) {
> +		dev_err(dev, "Failed to map DMU regs\n");
> +		return PTR_ERR(usb2->dmu);
> +	}
> +
> +	usb2->ref_clk =3D devm_clk_get(dev, "phy-ref-clk");
> +	if (IS_ERR(usb2->ref_clk)) {
> +		dev_err(dev, "Clock not defined\n");
> +		return PTR_ERR(usb2->ref_clk);
> +	}
> +
> +	usb2->phy =3D devm_phy_create(dev, NULL, &ops);
> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
> +
> +	phy_set_drvdata(usb2->phy, usb2);
> +	platform_set_drvdata(pdev, usb2);
> +
> +	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_x=
late);
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id bcm_ns_usb2_id_table[] =3D {
> +	{ .compatible =3D "brcm,ns-usb2-phy", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, bcm_ns_usb2_id_table);
> +
> +static struct platform_driver bcm_ns_usb2_driver =3D {
> +	.probe		=3D bcm_ns_usb2_probe,
> +	.driver =3D {
> +		.name =3D "bcm_ns_usb2",
> +		.of_match_table =3D bcm_ns_usb2_id_table,
> +	},
> +};
> +module_platform_driver(bcm_ns_usb2_driver);
> +
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/bcma/bcma.h b/include/linux/bcma/bcma.h
> index 0367c63..e6b41f4 100644
> --- a/include/linux/bcma/bcma.h
> +++ b/include/linux/bcma/bcma.h
> @@ -4,6 +4,7 @@
>  #include <linux/pci.h>
>  #include <linux/mod_devicetable.h>
> =20
> +#include <linux/bcma/bcma_driver_arm_c9.h>
>  #include <linux/bcma/bcma_driver_chipcommon.h>
>  #include <linux/bcma/bcma_driver_pci.h>
>  #include <linux/bcma/bcma_driver_pcie2.h>
> diff --git a/include/linux/bcma/bcma_driver_arm_c9.h b/include/linux/=
bcma/bcma_driver_arm_c9.h
> new file mode 100644
> index 0000000..93bd73d
> --- /dev/null
> +++ b/include/linux/bcma/bcma_driver_arm_c9.h
> @@ -0,0 +1,15 @@
> +#ifndef LINUX_BCMA_DRIVER_ARM_C9_H_
> +#define LINUX_BCMA_DRIVER_ARM_C9_H_
> +
> +/* DMU (Device Management Unit) */
> +#define BCMA_DMU_CRU_USB2_CONTROL			0x0164
> +#define  BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_NDIV_MASK	0x00000FFC
> +#define  BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_NDIV_SHIFT	2
> +#define  BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_PDIV_MASK	0x00007000
> +#define  BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_PDIV_SHIFT	12
> +#define BCMA_DMU_CRU_CLKSET_KEY				0x0180
> +#define BCMA_DMU_CRU_STRAPS_CTRL			0x02A0
> +#define  BCMA_DMU_CRU_STRAPS_CTRL_USB3			0x00000010
> +#define  BCMA_DMU_CRU_STRAPS_CTRL_4BYTE			0x00008000
> +
> +#endif /* LINUX_BCMA_DRIVER_ARM_C9_H_ */
>=20
