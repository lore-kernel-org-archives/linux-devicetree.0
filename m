Return-Path: <SRS0=7yb5=UQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12025 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfFQRl1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Jun 2019 13:41:27 -0400
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V5 26/27] PCI: tegra: Add support for GPIO based PERST#
Date: Mon, 17 Jun 2019 23:09:51 +0530
Message-ID: <20190617173952.29363-27-mmaddireddy@nvidia.com>
In-Reply-To: <20190617173952.29363-1-mmaddireddy@nvidia.com>
References: <20190617173952.29363-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Tegra PCIe has fixed per port SFIO line to signal PERST#, which can be
controlled by AFI port register. However, if a platform routes a different
GPIO to the PCIe slot, then port register cannot control it. Add support
for GPIO based PERST# signal for such platforms. GPIO number comes from per
port PCIe device tree node. PCIe driver probe doesn't fail if per port
"reset-gpios" property is not populated, make sure that DT property is not
missed for such platforms.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
V5:
* Updated reset gpio toggle logic to reflect active low usage
* Replaced kasprintf() with devm_kasprintf()
* Updated commit message with more information.

V4: Using devm_gpiod_get_from_of_node() to get reset-gpios

V3: Using helper function to get reset-gpios

V2: Using standard "reset-gpio" property

 drivers/pci/controller/pci-tegra.c | 45 ++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index d3b9e6440dd6..2e55d64a0428 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -17,6 +17,7 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/export.h>
+#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
@@ -400,6 +401,8 @@ struct tegra_pcie_port {
 	unsigned int lanes;
 
 	struct phy **phys;
+
+	struct gpio_desc *reset_gpio;
 };
 
 struct tegra_pcie_bus {
@@ -545,15 +548,23 @@ static void tegra_pcie_port_reset(struct tegra_pcie_port *port)
 	unsigned long value;
 
 	/* pulse reset signal */
-	value = afi_readl(port->pcie, ctrl);
-	value &= ~AFI_PEX_CTRL_RST;
-	afi_writel(port->pcie, value, ctrl);
+	if (port->reset_gpio) {
+		gpiod_set_value(port->reset_gpio, 1);
+	} else {
+		value = afi_readl(port->pcie, ctrl);
+		value &= ~AFI_PEX_CTRL_RST;
+		afi_writel(port->pcie, value, ctrl);
+	}
 
 	usleep_range(1000, 2000);
 
-	value = afi_readl(port->pcie, ctrl);
-	value |= AFI_PEX_CTRL_RST;
-	afi_writel(port->pcie, value, ctrl);
+	if (port->reset_gpio) {
+		gpiod_set_value(port->reset_gpio, 0);
+	} else {
+		value = afi_readl(port->pcie, ctrl);
+		value |= AFI_PEX_CTRL_RST;
+		afi_writel(port->pcie, value, ctrl);
+	}
 }
 
 static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
@@ -2200,6 +2211,7 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
 		struct tegra_pcie_port *rp;
 		unsigned int index;
 		u32 value;
+		char *label;
 
 		err = of_pci_get_devfn(port);
 		if (err < 0) {
@@ -2258,6 +2270,27 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
 		if (IS_ERR(rp->base))
 			return PTR_ERR(rp->base);
 
+		label = devm_kasprintf(dev, GFP_KERNEL, "pex-reset-%u", index);
+		if (!label) {
+			dev_err(dev, "failed to create reset GPIO label\n");
+			return -ENOMEM;
+		}
+
+		/*
+		 * Returns null if reset-gpios property is not populated and
+		 * fall back to using AFI per port register to toggle PERST#
+		 * SFIO line.
+		 */
+		rp->reset_gpio = devm_gpiod_get_from_of_node(dev, port,
+							     "reset-gpios", 0,
+							     GPIOD_OUT_LOW,
+							     label);
+		if (IS_ERR(rp->reset_gpio)) {
+			err = PTR_ERR(rp->reset_gpio);
+			dev_err(dev, "failed to get reset GPIO: %d\n", err);
+			return err;
+		}
+
 		list_add_tail(&rp->list, &pcie->ports);
 	}
 
-- 
2.17.1
