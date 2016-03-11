From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/5 v10] usb: musb: da8xx: Add DT support for the DA8xx driver
Date: Fri, 11 Mar 2016 09:29:49 +0100
Message-ID: <1457684989-13318-5-git-send-email-petr@barix.com>
References: <1457684989-13318-1-git-send-email-petr@barix.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457684989-13318-1-git-send-email-petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds DT support for TI DA8xx/OMAP-L1x/AM17xx/AM18xx MUSB driver

Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Tested-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
---
v1: <initial>

v2:
 - using standard MUSB properties "dr_mode", "mentor,power", "mentor,num-eps", "mentor,multipoint", "mentor,ram-bits"
 - using "ti," prefix instead of "da8xx," for specific property names
 - no wilcards in compatibility string
 - using CFGCHIP2_USB2PHYCLKMUX_SHIFT instead of CFGCHIP2_USB2PHYCLKMUX_OFFSET

v3:
 - DMA mask initialization corrected
 - removed extra #ifdef CONFIG_OF

v4:
 - compatibility string set to "ti,da830-musb"
 - "mentor,num-eps", "mentor,multipoint", "mentor,ram-bits" properties removed and hardcoded
 - "ti,phy20-clkmux-cfg" renamed to "ti,phy20-clkmux-pll" and changed to boolean
 - removed use of the DA8XX_SYSCFG0_VIRT macro

v5:
 - using CFGCHIP2_REFFREQ_ in get_phy_refclk_cfg()
 - simplified initialization of the hard coded config parameters
 - optimization CFGCHIP2 register update

v6:
 - using "ti,usb2-phy-" prefix instead of "ti,phy20-" for the specific properties
 - optimization CFGCHIP2 register update
 
v7:
 - pdata::power hard coded to 500mA

v8:
 - USB maximum power modelled via a regulator "vbus-supply"
 - "ti,usb2-phy-refclock-frequency" renamed to "ti,usb2-phy-refclock-hz"
 - "ti,usb2-phy-clkmux-pll" changed to "ti,usb2-phy-clkmux-refclkin" and the boolean meaning inverted to reflect the more common case

v9:
 - power regulator used only to get the current

v10:
 - corrected current calculation in get_vbus_power (missing divide by 2)

 drivers/usb/musb/da8xx.c | 106 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index b03d3b8..52f2c3d 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -6,6 +6,9 @@
  * Based on the DaVinci "glue layer" code.
  * Copyright (C) 2005-2006 by Texas Instruments
  *
+ * DT support
+ * Copyright (c) 2016 Petr Kulhavy, Barix AG <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
+ *
  * This file is part of the Inventra Controller Driver for Linux.
  *
  * The Inventra Controller Driver for Linux is free software; you
@@ -33,9 +36,11 @@
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/usb/usb_phy_generic.h>
+#include <linux/regulator/consumer.h>
 
 #include <mach/da8xx.h>
 #include <linux/platform_data/usb-davinci.h>
+#include <linux/of_platform.h>
 
 #include "musb_core.h"
 
@@ -134,6 +139,55 @@ static inline void phy_off(void)
 	__raw_writel(cfgchip2, CFGCHIP2);
 }
 
+static inline int get_phy_refclk_cfg(struct device_node *np)
+{
+	u32 freq;
+
+	if (of_property_read_u32(np, "ti,usb2-phy-refclock-hz", &freq))
+		return -EINVAL;
+
+	switch (freq) {
+	case 12000000:
+		return CFGCHIP2_REFFREQ_12MHZ;
+	case 13000000:
+		return CFGCHIP2_REFFREQ_13MHZ;
+	case 19200000:
+		return CFGCHIP2_REFFREQ_19_2MHZ;
+	case 20000000:
+		return CFGCHIP2_REFFREQ_20MHZ;
+	case 24000000:
+		return CFGCHIP2_REFFREQ_24MHZ;
+	case 26000000:
+		return CFGCHIP2_REFFREQ_26MHZ;
+	case 38400000:
+		return CFGCHIP2_REFFREQ_38_4MHZ;
+	case 40000000:
+		return CFGCHIP2_REFFREQ_40MHZ;
+	case 48000000:
+		return CFGCHIP2_REFFREQ_48MHZ;
+	default:
+		return -EINVAL;
+	}
+}
+
+static inline u8 get_vbus_power(struct device *dev)
+{
+	struct regulator *vbus_supply;
+	int current_uA;
+
+	vbus_supply = regulator_get(dev, "vbus");
+	if (IS_ERR(vbus_supply))
+		return 255;
+
+	current_uA = regulator_get_current_limit(vbus_supply);
+	regulator_put(vbus_supply);
+
+	if (current_uA <= 0 || current_uA > 510000)
+		return 255;
+
+	return current_uA / 1000 / 2;
+}
+
 /*
  * Because we don't set CTRL.UINT, it's "important" to:
  *	- not read/write INTRUSB/INTRUSBE (except during
@@ -482,6 +536,12 @@ static const struct platform_device_info da8xx_dev_info = {
 	.dma_mask	= DMA_BIT_MASK(32),
 };
 
+static const struct musb_hdrc_config da8xx_config = {
+	.ram_bits = 10,
+	.num_eps = 5,
+	.multipoint = 1,
+};
+
 static int da8xx_probe(struct platform_device *pdev)
 {
 	struct resource musb_resources[2];
@@ -490,6 +550,7 @@ static int da8xx_probe(struct platform_device *pdev)
 	struct da8xx_glue		*glue;
 	struct platform_device_info	pinfo;
 	struct clk			*clk;
+	struct device_node		*np = pdev->dev.of_node;
 
 	int				ret = -ENOMEM;
 
@@ -515,6 +576,42 @@ static int da8xx_probe(struct platform_device *pdev)
 	glue->dev			= &pdev->dev;
 	glue->clk			= clk;
 
+	if (IS_ENABLED(CONFIG_OF) && np) {
+		int refclk_cfg;
+		u32 cfgchip2;
+
+		pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+		if (!pdata) {
+			ret = -ENOMEM;
+			goto err5;
+		}
+
+		pdata->config	= &da8xx_config;
+		pdata->mode	= musb_get_mode(&pdev->dev);
+		pdata->power	= get_vbus_power(&pdev->dev);
+
+		refclk_cfg = get_phy_refclk_cfg(np);
+		if (refclk_cfg < 0) {
+			dev_err(&pdev->dev,
+				"PHY 2.0 clock frequency invalid or undefined\n");
+			ret = -EINVAL;
+			goto err5;
+		}
+
+		cfgchip2 = __raw_readl(CFGCHIP2);
+		cfgchip2 &= ~(CFGCHIP2_USB2PHYCLKMUX | CFGCHIP2_REFFREQ);
+
+		/*
+		 * optional parameter reference clock source
+		 * false = use PLL, true = use the external clock pin
+		 */
+		if (!of_property_read_bool(np, "ti,usb2-phy-clkmux-refclkin"))
+			cfgchip2 |=  CFGCHIP2_USB2PHYCLKMUX;
+		cfgchip2 |=  refclk_cfg;
+
+		__raw_writel(cfgchip2, CFGCHIP2);
+	}
+
 	pdata->platform_ops		= &da8xx_ops;
 
 	glue->phy = usb_phy_generic_register();
@@ -582,11 +679,20 @@ static int da8xx_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id da8xx_id_table[] = {
+	{
+		.compatible = "ti,da830-musb",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, da8xx_id_table);
+
 static struct platform_driver da8xx_driver = {
 	.probe		= da8xx_probe,
 	.remove		= da8xx_remove,
 	.driver		= {
 		.name	= "musb-da8xx",
+		.of_match_table = of_match_ptr(da8xx_id_table),
 	},
 };
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
