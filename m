From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V4] phy: bcm-ns-usb3: new driver for USB 3.0 PHY on
 Northstar
Date: Fri, 12 Aug 2016 15:16:39 +0530
Message-ID: <57AD9AFF.4080103@ti.com>
References: <1470954483-23365-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470954483-23365-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Friday 12 August 2016 03:58 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> Northstar is a family of SoCs used in home routers. They have USB 2.0
> and 3.0 controllers with PHYs that need to be properly initialized.
> This driver provides PHY init support in a generic way and can be bound
> with XHCI controller driver.
> 
> There aren't any public datasheets from Broadcom so we can't have nice
> defines for all used bits. It means we just follow Broadcom's
> initialization procedure using their magic values. We were quite lucky
> actually that Broadcom put some comments in their SDK reference code
> explaining what given writes are responsible for.
> 
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> V2: Redesign the driver to don't depend on bcma. This will allow reusing it on
>     Northstar+ which doesn't use bcma. This requires providing two different
>     registers ranges in DT which was documented in bindings info.
> V3: Use readl and writel
>     Fix MODULE_LICENSE to match header (v2)
>     Mention C0 series in Documentation
> RESEND: I can see that my PHY driver for USB 2.0:
> 	[PATCH V4] phy: bcm-ns-usb2: new driver for USB 2.0 PHY on Northstar
> 	sent on 14 Apr 2016 was accepted, however:
> 	[PATCH V3] phy: bcm-ns-usb3: new driver for USB 3.0 PHY on Northstar
> 	sent the very same day wasn't.
> 	I'm sending a simply rebased version hoping it can be accepted or
> 	commented somehow (e.g. what needs to be changed).
> V4: Comment on magic values in commit message
>     Add Copyright for Broadcom and their magic values
>     Some in-code trivial comments on enabling MDIO
>     Use some existing defines
>     Drop setting .owner
>     Rebased on top of updated "next" branch
> ---
>  .../devicetree/bindings/phy/bcm-ns-usb3-phy.txt    |  23 ++
>  drivers/phy/Kconfig                                |   9 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-bcm-ns-usb3.c                      | 273 +++++++++++++++++++++
>  4 files changed, 306 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.txt
>  create mode 100644 drivers/phy/phy-bcm-ns-usb3.c
> 
> diff --git a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.txt b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.txt
> new file mode 100644
> index 0000000..09aeba9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.txt
> @@ -0,0 +1,23 @@
> +Driver for Broadcom Northstar USB 3.0 PHY
> +
> +Required properties:
> +
> +- compatible: one of: "brcm,ns-ax-usb3-phy", "brcm,ns-bx-usb3-phy".
> +- reg: register mappings for DMP (Device Management Plugin) and ChipCommon B
> +       MMI.
> +- reg-names: "dmp" and "ccb-mii"
> +
> +Initialization of USB 3.0 PHY depends on Northstar version. There are currently
> +three known series: Ax, Bx and Cx.
> +Known A0: BCM4707 rev 0
> +Known B0: BCM4707 rev 4, BCM53573 rev 2
> +Known B1: BCM4707 rev 6
> +Known C0: BCM47094 rev 0
> +
> +Example:
> +	usb3-phy {
> +		compatible = "brcm,ns-ax-usb3-phy";
> +		reg = <0x18105000 0x1000>, <0x18003000 0x1000>;
> +		reg-names = "dmp", "ccb-mii";
> +		#phy-cells = <0>;
> +	};
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 19bff3a..afbdd6a 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -24,6 +24,15 @@ config PHY_BCM_NS_USB2
>  	  Enable this to support Broadcom USB 2.0 PHY connected to the USB
>  	  controller on Northstar family.
>  
> +config PHY_BCM_NS_USB3
> +	tristate "Broadcom Northstar USB 3.0 PHY Driver"
> +	depends on ARCH_BCM_IPROC || COMPILE_TEST
> +	depends on HAS_IOMEM && OF
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support Broadcom USB 3.0 PHY connected to the USB
> +	  controller on Northstar family.
> +
>  config PHY_BERLIN_USB
>  	tristate "Marvell Berlin USB PHY Driver"
>  	depends on ARCH_BERLIN && RESET_CONTROLLER && HAS_IOMEM && OF
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index 90ae198..b99370a 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -4,6 +4,7 @@
>  
>  obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
>  obj-$(CONFIG_PHY_BCM_NS_USB2)		+= phy-bcm-ns-usb2.o
> +obj-$(CONFIG_PHY_BCM_NS_USB3)		+= phy-bcm-ns-usb3.o
>  obj-$(CONFIG_PHY_BERLIN_USB)		+= phy-berlin-usb.o
>  obj-$(CONFIG_PHY_BERLIN_SATA)		+= phy-berlin-sata.o
>  obj-$(CONFIG_PHY_DA8XX_USB)		+= phy-da8xx-usb.o
> diff --git a/drivers/phy/phy-bcm-ns-usb3.c b/drivers/phy/phy-bcm-ns-usb3.c
> new file mode 100644
> index 0000000..c9326c5
> --- /dev/null
> +++ b/drivers/phy/phy-bcm-ns-usb3.c
> @@ -0,0 +1,273 @@
> +/*
> + * Broadcom Northstar USB 3.0 PHY Driver
> + *
> + * Copyright (C) 2016 Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> + *
> + * All magic values used for initialization (and related comments) were obtained
> + * from Broadcom's SDK:
> + * Copyright (c) Broadcom Corp, 2012
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/bcma/bcma.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/slab.h>
> +
> +#define BCM_NS_USB3_MII_MNG_TIMEOUT_US	1000	/* usecs */
> +
> +enum bcm_ns_family {
> +	BCM_NS_UNKNOWN,
> +	BCM_NS_AX,
> +	BCM_NS_BX,
> +};
> +
> +struct bcm_ns_usb3 {
> +	struct device *dev;
> +	enum bcm_ns_family family;
> +	void __iomem *dmp;
> +	void __iomem *ccb_mii;
> +	struct phy *phy;
> +};
> +
> +static const struct of_device_id bcm_ns_usb3_id_table[] = {
> +	{
> +		.compatible = "brcm,ns-ax-usb3-phy",
> +		.data = (int *)BCM_NS_AX,
> +	},
> +	{
> +		.compatible = "brcm,ns-bx-usb3-phy",
> +		.data = (int *)BCM_NS_BX,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, bcm_ns_usb3_id_table);
> +
> +static int bcm_ns_usb3_wait_reg(struct bcm_ns_usb3 *usb3, void __iomem *addr,
> +				u32 mask, u32 value, unsigned long timeout)
> +{
> +	unsigned long deadline = jiffies + timeout;
> +	u32 val;
> +
> +	do {
> +		val = readl(addr);
> +		if ((val & mask) == value)
> +			return 0;
> +		cpu_relax();
> +		udelay(10);
> +	} while (!time_after_eq(jiffies, deadline));
> +
> +	dev_err(usb3->dev, "Timeout waiting for register %p\n", addr);
> +
> +	return -EBUSY;
> +}
> +
> +static inline int bcm_ns_usb3_mii_mng_wait_idle(struct bcm_ns_usb3 *usb3)
> +{
> +	return bcm_ns_usb3_wait_reg(usb3, usb3->ccb_mii + BCMA_CCB_MII_MNG_CTL,
> +				    0x0100, 0x0000,
> +				    usecs_to_jiffies(BCM_NS_USB3_MII_MNG_TIMEOUT_US));
> +}
> +
> +static int bcm_ns_usb3_mii_mng_write32(struct bcm_ns_usb3 *usb3, u32 value)
> +{
> +	int err;
> +
> +	err = bcm_ns_usb3_mii_mng_wait_idle(usb3);
> +	if (err < 0) {
> +		dev_err(usb3->dev, "Couldn't write 0x%08x value\n", value);
> +		return err;
> +	}
> +
> +	writel(value, usb3->ccb_mii + BCMA_CCB_MII_MNG_CMD_DATA);
> +
> +	return 0;
> +}
> +
> +static int bcm_ns_usb3_phy_init_ns_bx(struct bcm_ns_usb3 *usb3)
> +{
> +	int err;
> +
> +	/* Enable MDIO. Setting MDCDIV as 26  */
> +	writel(0x0000009a, usb3->ccb_mii + BCMA_CCB_MII_MNG_CTL);
> +
> +	/* Wait for MDIO? */
> +	udelay(2);
> +
> +	/* USB3 PLL Block */
> +	err = bcm_ns_usb3_mii_mng_write32(usb3, 0x587e8000);
> +	if (err < 0)
> +		return err;
> +
> +	/* Assert Ana_Pllseq start */
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x58061000);
> +
> +	/* Assert CML Divider ratio to 26 */
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x582a6400);
> +
> +	/* Asserting PLL Reset */
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x582ec000);
> +
> +	/* Deaaserting PLL Reset */
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x582e8000);
> +
> +	/* Waiting MII Mgt interface idle */
> +	bcm_ns_usb3_mii_mng_wait_idle(usb3);
> +
> +	/* Deasserting USB3 system reset */
> +	writel(0, usb3->dmp + BCMA_RESET_CTL);
> +
> +	/* PLL frequency monitor enable */
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x58069000);
> +
> +	/* PIPE Block */
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x587e8060);
> +
> +	/* CMPMAX & CMPMINTH setting */
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x580af30d);
> +
> +	/* DEGLITCH MIN & MAX setting */
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x580e6302);
> +
> +	/* TXPMD block */
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x587e8040);
> +
> +	/* Enabling SSC */
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x58061003);
> +
> +	/* Waiting MII Mgt interface idle */
> +	bcm_ns_usb3_mii_mng_wait_idle(usb3);
> +
> +	return 0;
> +}
> +
> +static int bcm_ns_usb3_phy_init_ns_ax(struct bcm_ns_usb3 *usb3)
> +{
> +	int err;
> +
> +	/* Enable MDIO. Setting MDCDIV as 26  */
> +	writel(0x0000009a, usb3->ccb_mii + BCMA_CCB_MII_MNG_CTL);
> +
> +	/* Wait for MDIO? */
> +	udelay(2);
> +
> +	/* PLL30 block */
> +	err = bcm_ns_usb3_mii_mng_write32(usb3, 0x587e8000);
> +	if (err < 0)
> +		return err;
> +
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x582a6400);
> +
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x587e80e0);
> +
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x580a009c);
> +
> +	/* Enable SSC */
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x587e8040);
> +
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x580a21d3);
> +
> +	bcm_ns_usb3_mii_mng_write32(usb3, 0x58061003);
> +
> +	/* Waiting MII Mgt interface idle */
> +	bcm_ns_usb3_mii_mng_wait_idle(usb3);
> +
> +	/* Deasserting USB3 system reset */
> +	writel(0, usb3->dmp + BCMA_RESET_CTL);
> +
> +	return 0;
> +}
> +
> +static int bcm_ns_usb3_phy_init(struct phy *phy)
> +{
> +	struct bcm_ns_usb3 *usb3 = phy_get_drvdata(phy);
> +	int err;
> +
> +	/* Perform USB3 system soft reset */
> +	writel(BCMA_RESET_CTL_RESET, usb3->dmp + BCMA_RESET_CTL);
> +
> +	switch (usb3->family) {
> +	case BCM_NS_AX:
> +		err = bcm_ns_usb3_phy_init_ns_ax(usb3);
> +		break;
> +	case BCM_NS_BX:
> +		err = bcm_ns_usb3_phy_init_ns_bx(usb3);
> +		break;
> +	default:
> +		WARN_ON(1);
> +		err = -ENOTSUPP;
> +	}
> +
> +	return err;
> +}
> +
> +static const struct phy_ops ops = {
> +	.init		= bcm_ns_usb3_phy_init,

Since the module is kept as tristate, .owner shouldn't be removed. The phy core
will use .owner to prevent the module from being unloaded while it's using it.

Since the rest of the patch looks fine, I added this myself and merged to
linux-phy tree.

Thanks
Kishon

> +};
> +
> +static int bcm_ns_usb3_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct of_device_id *of_id;
> +	struct bcm_ns_usb3 *usb3;
> +	struct resource *res;
> +	struct phy_provider *phy_provider;
> +
> +	usb3 = devm_kzalloc(dev, sizeof(*usb3), GFP_KERNEL);
> +	if (!usb3)
> +		return -ENOMEM;
> +
> +	usb3->dev = dev;
> +
> +	of_id = of_match_device(bcm_ns_usb3_id_table, dev);
> +	if (!of_id)
> +		return -EINVAL;
> +	usb3->family = (enum bcm_ns_family)of_id->data;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dmp");
> +	usb3->dmp = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(usb3->dmp)) {
> +		dev_err(dev, "Failed to map DMP regs\n");
> +		return PTR_ERR(usb3->dmp);
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ccb-mii");
> +	usb3->ccb_mii = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(usb3->ccb_mii)) {
> +		dev_err(dev, "Failed to map ChipCommon B MII regs\n");
> +		return PTR_ERR(usb3->ccb_mii);
> +	}
> +
> +	usb3->phy = devm_phy_create(dev, NULL, &ops);
> +	if (IS_ERR(usb3->phy)) {
> +		dev_err(dev, "Failed to create PHY\n");
> +		return PTR_ERR(usb3->phy);
> +	}
> +
> +	phy_set_drvdata(usb3->phy, usb3);
> +	platform_set_drvdata(pdev, usb3);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (!IS_ERR(phy_provider))
> +		dev_info(dev, "Registered Broadcom Northstar USB 3.0 PHY driver\n");
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static struct platform_driver bcm_ns_usb3_driver = {
> +	.probe		= bcm_ns_usb3_probe,
> +	.driver = {
> +		.name = "bcm_ns_usb3",
> +		.of_match_table = bcm_ns_usb3_id_table,
> +	},
> +};
> +module_platform_driver(bcm_ns_usb3_driver);
> +
> +MODULE_LICENSE("GPL v2");
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
