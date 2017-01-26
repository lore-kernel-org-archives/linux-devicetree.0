From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] irqchip/imx-gpcv2: Add power domain support
Date: Thu, 26 Jan 2017 13:56:09 -0800
Message-ID: <20170126215609.4272-5-andrew.smirnov@gmail.com>
References: <20170126215609.4272-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170126215609.4272-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add code allowing for control of various power domains managed by GPCv2
IP block found in i.MX7 series of SoCs. Power domains covered by this
patch are:

      - PCIE PHY
      - MIPI PHY
      - USB HSIC PHY
      - USB OTG1/2 PHY

Support for any other power domain controlled by GPC is not present, and
can be added at some later point.

Testing of this code was done against a PCIe driver.

Cc: yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/power/fsl,imx-gpcv2.txt    |  63 +++++
 drivers/irqchip/irq-imx-gpcv2.c                    | 263 ++++++++++++++++++++-
 include/dt-bindings/power/imx7-power.h             |  18 ++
 3 files changed, 343 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
 create mode 100644 include/dt-bindings/power/imx7-power.h

diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
new file mode 100644
index 0000000..d971006
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
@@ -0,0 +1,63 @@
+Freescale i.MX General Power Controller v2
+==========================================
+
+The i.MX7S/D General Power Control (GPC) block contains Power Gating
+Control (PGC) for various power domains.
+
+Required properties:
+
+- compatible: Should be "fsl,imx7d-gpc"
+
+- reg: should be register base and length as documented in the
+  datasheet
+
+- interrupts: Should contain GPC interrupt request 1
+
+- pcie-phy-supply: Link to the LDO regulator powering the PCIE PHY
+  power domain (connected to PCIE_VP/VP_TX/VP_RX pads)
+
+- mipi-phy-supply: Link to the LDO regulator powering the MIPI PHY
+  power domain (connected to VDD_MIPI_1P0 pad)
+
+- usb-hsic-phy-supply: Link to the LDO regulator powering the USB HSIC
+  PHY power domain (connected to VDD_USB_H_1P2 pad)
+
+- #power-domain-cells: Should be 1, see below:
+
+The gpc node is a power-controller as documented by the generic power
+domain bindings in
+Documentation/devicetree/bindings/power/power_domain.txt.
+
+Example:
+
+	gpc: gpc@303a0000 {
+		compatible = "fsl,imx7d-gpc";
+		reg = <0x303a0000 0x10000>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&intc>;
+		#power-domain-cells = <1>;
+		pcie-phy-supply = <&reg_1p0d>;
+	};
+
+
+Specifying power domain for IP modules
+======================================
+
+IP cores belonging to a power domain should contain a 'power-domains'
+property that is a phandle pointing to the gpc device node and a
+DOMAIN_INDEX specifying the power domain the device belongs to.
+
+Example of a device that is part of the PU power domain:
+
+	pcie: pcie@0x33800000 {
+	      reg = <0x33800000 0x4000>,
+	            <0x4ff00000 0x80000>;
+		/* ... */
+		power-domains = <&gpc IMX7_POWER_DOMAIN_PCIE_PHY>;
+		/* ... */
+	};
+
+All valid DOMAIN_INDEX values are defined and can be found in
+include/dt-bindings/power/imx7-power.h
diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index 15af9a9..c8fe7cd 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -11,6 +11,10 @@
 #include <linux/slab.h>
 #include <linux/irqchip.h>
 #include <linux/syscore_ops.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/regulator/consumer.h>
+#include <dt-bindings/power/imx7-power.h>
 
 #define IMR_NUM			4
 #define GPC_MAX_IRQS            (IMR_NUM * 32)
@@ -18,6 +22,21 @@
 #define GPC_IMR1_CORE0		0x30
 #define GPC_IMR1_CORE1		0x40
 
+#define GPC_PGC_CPU_MAPPING	0xec
+#define USB_HSIC_PHY_A7_DOMAIN	BIT(6)
+#define USB_OTG2_PHY_A7_DOMAIN	BIT(5)
+#define USB_OTG1_PHY_A7_DOMAIN	BIT(4)
+#define PCIE_PHY_A7_DOMAIN	BIT(3)
+#define MIPI_PHY_A7_DOMAIN	BIT(2)
+
+#define GPC_PU_PGC_SW_PUP_REQ	0xf8
+#define GPC_PU_PGC_SW_PDN_REQ	0x104
+#define USB_HSIC_PHY_SW_Pxx_REQ	BIT(4)
+#define USB_OTG2_PHY_SW_Pxx_REQ	BIT(3)
+#define USB_OTG1_PHY_SW_Pxx_REQ	BIT(2)
+#define PCIE_PHY_SW_Pxx_REQ	BIT(1)
+#define MIPI_PHY_SW_Pxx_REQ	BIT(0)
+
 struct gpcv2_irqchip_data {
 	struct raw_spinlock	rlock;
 	void __iomem		*gpc_base;
@@ -26,6 +45,18 @@ struct gpcv2_irqchip_data {
 	u32			cpu2wakeup;
 };
 
+struct gpcv2_domain {
+	struct generic_pm_domain genpd;
+	struct regulator *regulator;
+
+	const struct {
+		u32 pxx;
+		u32 map;
+	} bits;
+
+	struct device *dev;
+};
+
 static struct gpcv2_irqchip_data *imx_gpcv2_instance;
 
 /*
@@ -268,5 +299,235 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 
 	return 0;
 }
+IRQCHIP_DECLARE_DRIVER(imx_gpcv2, "fsl,imx7d-gpc", imx_gpcv2_irqchip_init);
+
+static int imx7_gpc_pu_pgc_sw_pxx_req(struct generic_pm_domain *genpd,
+				      bool on)
+{
+	int ret = 0;
+	u32 mapping;
+	unsigned long deadline;
+	struct gpcv2_domain *pd = container_of(genpd,
+					       struct gpcv2_domain, genpd);
+	void __iomem *base  = imx_gpcv2_instance->gpc_base;
+	unsigned int offset = (on) ?
+		GPC_PU_PGC_SW_PUP_REQ : GPC_PU_PGC_SW_PDN_REQ;
+
+	if (!base)
+		return -ENODEV;
+
+	mapping = readl_relaxed(base + GPC_PGC_CPU_MAPPING);
+	writel_relaxed(mapping | pd->bits.map, base + GPC_PGC_CPU_MAPPING);
+
+	if (on) {
+		ret = regulator_enable(pd->regulator);
+		if (ret) {
+			dev_err(pd->dev,
+				"failed to enable regulator: %d\n", ret);
+			goto unmap;
+		}
+	}
+
+	writel_relaxed(readl_relaxed(base + offset) | pd->bits.pxx,
+		       base + offset);
+
+	/*
+	 * As per "5.5.9.4 Example Code 4" in IMX7DRM.pdf wait
+	 * for PUP_REQ/PDN_REQ bit to be cleared
+	 */
+	deadline = jiffies + msecs_to_jiffies(1);
+	while (true) {
+		if (readl_relaxed(base + offset) & pd->bits.pxx)
+			break;
+		if (time_after(jiffies, deadline)) {
+			dev_err(pd->dev, "falied to command PGC\n");
+			ret = -ETIMEDOUT;
+			/*
+			 * If we were in a process of enabling a
+			 * domain and failed we might as well disable
+			 * the regulator we just enabled. And if it
+			 * was the opposite situation and we failed to
+			 * power down -- keep the regulator on
+			 */
+			on  = !on;
+			break;
+		}
+		cpu_relax();
+	}
+
+	if (!on) {
+		int err;
+
+		err = regulator_disable(pd->regulator);
+		if (err)
+			dev_err(pd->dev,
+				"failed to disable regulator: %d\n", ret);
+		/*
+		 * Preserve earlier error code
+		 */
+		ret = ret ?: err;
+	}
+unmap:
+	writel_relaxed(mapping, base + GPC_PGC_CPU_MAPPING);
+	return ret;
+}
+
+static int imx7_gpc_pu_pgc_sw_pup_req(struct generic_pm_domain *genpd)
+{
+	return imx7_gpc_pu_pgc_sw_pxx_req(genpd, true);
+}
+
+static int imx7_gpc_pu_pgc_sw_pdn_req(struct generic_pm_domain *genpd)
+{
+	return imx7_gpc_pu_pgc_sw_pxx_req(genpd, false);
+}
 
-IRQCHIP_DECLARE(imx_gpcv2, "fsl,imx7d-gpc", imx_gpcv2_irqchip_init);
+static struct gpcv2_domain imx7_usb_hsic_phy = {
+	.genpd = {
+		.name      = "usb-hsic-phy",
+		.power_on  = imx7_gpc_pu_pgc_sw_pup_req,
+		.power_off = imx7_gpc_pu_pgc_sw_pdn_req,
+	},
+	.bits  = {
+		.pxx = USB_HSIC_PHY_SW_Pxx_REQ,
+		.map = USB_HSIC_PHY_A7_DOMAIN,
+	},
+};
+
+static struct gpcv2_domain imx7_usb_otg2_phy = {
+	.genpd = {
+		.name      = "usb-otg2-phy",
+		.power_on  = imx7_gpc_pu_pgc_sw_pup_req,
+		.power_off = imx7_gpc_pu_pgc_sw_pdn_req,
+	},
+	.bits  = {
+		.pxx = USB_OTG2_PHY_SW_Pxx_REQ,
+		.map = USB_OTG2_PHY_A7_DOMAIN,
+	},
+};
+
+static struct gpcv2_domain imx7_usb_otg1_phy = {
+	.genpd = {
+		.name      = "usb-otg1-phy",
+		.power_on  = imx7_gpc_pu_pgc_sw_pup_req,
+		.power_off = imx7_gpc_pu_pgc_sw_pdn_req,
+	},
+	.bits  = {
+		.pxx = USB_OTG1_PHY_SW_Pxx_REQ,
+		.map = USB_OTG1_PHY_A7_DOMAIN,
+	},
+};
+
+static struct gpcv2_domain imx7_pcie_phy = {
+	.genpd = {
+		.name      = "pcie-phy",
+		.power_on  = imx7_gpc_pu_pgc_sw_pup_req,
+		.power_off = imx7_gpc_pu_pgc_sw_pdn_req,
+	},
+	.bits  = {
+		.pxx = PCIE_PHY_SW_Pxx_REQ,
+		.map = PCIE_PHY_A7_DOMAIN,
+	},
+};
+
+static struct gpcv2_domain imx7_mipi_phy = {
+	.genpd = {
+		.name      = "mipi-phy",
+		.power_on  = imx7_gpc_pu_pgc_sw_pup_req,
+		.power_off = imx7_gpc_pu_pgc_sw_pdn_req,
+	},
+	.bits  = {
+		.pxx = MIPI_PHY_SW_Pxx_REQ,
+		.map = MIPI_PHY_A7_DOMAIN,
+	},
+};
+
+static struct generic_pm_domain *imx_gpcv2_domains[] = {
+	[IMX7_POWER_DOMAIN_USB_HSIC_PHY] = &imx7_usb_hsic_phy.genpd,
+	[IMX7_POWER_DOMAIN_USB_OTG2_PHY] = &imx7_usb_otg2_phy.genpd,
+	[IMX7_POWER_DOMAIN_USB_OTG1_PHY] = &imx7_usb_otg1_phy.genpd,
+	[IMX7_POWER_DOMAIN_PCIE_PHY]     = &imx7_pcie_phy.genpd,
+	[IMX7_POWER_DOMAIN_MIPI_PHY]     = &imx7_mipi_phy.genpd,
+};
+
+static struct genpd_onecell_data imx_gpcv2_onecell_data = {
+	.domains = imx_gpcv2_domains,
+	.num_domains = ARRAY_SIZE(imx_gpcv2_domains),
+};
+
+static int imx_gpcv2_probe(struct platform_device *pdev)
+{
+	int i, ret;
+	struct device *dev = &pdev->dev;
+
+	for (i = 0; i < ARRAY_SIZE(imx_gpcv2_domains); i++) {
+		int voltage = 0;
+		const char *id = "dummy";
+		struct generic_pm_domain *genpd = imx_gpcv2_domains[i];
+		struct gpcv2_domain *pd = container_of(genpd,
+						       struct gpcv2_domain,
+						       genpd);
+
+		ret = pm_genpd_init(genpd, NULL, true);
+		if (ret) {
+			dev_err(dev, "Failed to init power domain #%d\n", i);
+			goto undo_pm_genpd_init;
+		}
+
+		switch (i) {
+		case IMX7_POWER_DOMAIN_PCIE_PHY:
+			id = "pcie-phy";
+			voltage = 1000000;
+			break;
+		case IMX7_POWER_DOMAIN_MIPI_PHY:
+			id = "mipi-phy";
+			voltage = 1000000;
+			break;
+		case IMX7_POWER_DOMAIN_USB_HSIC_PHY:
+			id = "usb-hsic-phy";
+			voltage = 1200000;
+			break;
+		}
+
+		pd->regulator = devm_regulator_get(dev, id);
+		if (voltage)
+			regulator_set_voltage(pd->regulator,
+					      voltage, voltage);
+
+		pd->dev = dev;
+	}
+
+	ret = of_genpd_add_provider_onecell(dev->of_node,
+					    &imx_gpcv2_onecell_data);
+	if (ret) {
+		dev_err(dev, "Failed to add genpd provider\n");
+		goto undo_pm_genpd_init;
+	}
+
+	return 0;
+
+undo_pm_genpd_init:
+	for (--i; i >= 0; i--)
+		pm_genpd_remove(imx_gpcv2_domains[i]);
+
+	return ret;
+}
+
+static const struct of_device_id imx_gpcv2_dt_ids[] = {
+	{ .compatible = "fsl,imx7d-gpc" },
+	{ }
+};
+
+static struct platform_driver imx_gpcv2_driver = {
+	.driver = {
+		.name = "imx-gpcv2",
+		.of_match_table = imx_gpcv2_dt_ids,
+	},
+	.probe = imx_gpcv2_probe,
+};
+
+static int __init imx_pgcv2_init(void)
+{
+	return platform_driver_register(&imx_gpcv2_driver);
+}
+subsys_initcall(imx_pgcv2_init);
diff --git a/include/dt-bindings/power/imx7-power.h b/include/dt-bindings/power/imx7-power.h
new file mode 100644
index 0000000..24dde62
--- /dev/null
+++ b/include/dt-bindings/power/imx7-power.h
@@ -0,0 +1,18 @@
+/*
+ *  Copyright © 2017 Impinj
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __DT_BINDINGS_ARM_IMX7_POWER_H__
+#define __DT_BINDINGS_ARM_IMX7_POWER_H__
+
+#define IMX7_POWER_DOMAIN_USB_HSIC_PHY	0
+#define IMX7_POWER_DOMAIN_USB_OTG2_PHY	1
+#define IMX7_POWER_DOMAIN_USB_OTG1_PHY	2
+#define IMX7_POWER_DOMAIN_PCIE_PHY	3
+#define IMX7_POWER_DOMAIN_MIPI_PHY	4
+
+#endif
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
