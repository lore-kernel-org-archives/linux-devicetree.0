Return-Path: <SRS0=blGF=TQ=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V4 27/28] PCI: tegra: Add support for GPIO based PERST#
Date: Thu, 16 May 2019 11:23:06 +0530
Message-ID: <20190516055307.25737-28-mmaddireddy@nvidia.com>
In-Reply-To: <20190516055307.25737-1-mmaddireddy@nvidia.com>
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Add support for GPIO based PERST# signal. GPIO number comes from per port
PCIe device tree node.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
V4: Using devm_gpiod_get_from_of_node() to get reset-gpios

V3: Using helper function to get reset-gpios

V2: Using standard "reset-gpio" property

 drivers/pci/controller/pci-tegra.c | 41 +++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 06b99fcbf382..09b4d384ba38 100644
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
+	struct gpio_desc *reset_gpiod;
 };
 
 struct tegra_pcie_bus {
@@ -583,15 +586,23 @@ static void tegra_pcie_port_reset(struct tegra_pcie_port *port)
 	unsigned long value;
 
 	/* pulse reset signal */
-	value = afi_readl(port->pcie, ctrl);
-	value &= ~AFI_PEX_CTRL_RST;
-	afi_writel(port->pcie, value, ctrl);
+	if (port->reset_gpiod) {
+		gpiod_set_value(port->reset_gpiod, 0);
+	} else {
+		value = afi_readl(port->pcie, ctrl);
+		value &= ~AFI_PEX_CTRL_RST;
+		afi_writel(port->pcie, value, ctrl);
+	}
 
 	usleep_range(1000, 2000);
 
-	value = afi_readl(port->pcie, ctrl);
-	value |= AFI_PEX_CTRL_RST;
-	afi_writel(port->pcie, value, ctrl);
+	if (port->reset_gpiod) {
+		gpiod_set_value(port->reset_gpiod, 1);
+	} else {
+		value = afi_readl(port->pcie, ctrl);
+		value |= AFI_PEX_CTRL_RST;
+		afi_writel(port->pcie, value, ctrl);
+	}
 }
 
 static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
@@ -2238,6 +2249,7 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
 		struct tegra_pcie_port *rp;
 		unsigned int index;
 		u32 value;
+		char *label;
 
 		err = of_pci_get_devfn(port);
 		if (err < 0) {
@@ -2296,6 +2308,23 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
 		if (IS_ERR(rp->base))
 			return PTR_ERR(rp->base);
 
+		label = kasprintf(GFP_KERNEL, "pex-reset-%u", index);
+		if (!label) {
+			dev_err(dev, "failed to create reset GPIO label\n");
+			return -ENOMEM;
+		}
+
+		rp->reset_gpiod = devm_gpiod_get_from_of_node(dev, port,
+							      "reset-gpios", 0,
+							      GPIOD_OUT_LOW,
+							      label);
+		kfree(label);
+		if (IS_ERR(rp->reset_gpiod)) {
+			err = PTR_ERR(rp->reset_gpiod);
+			dev_err(dev, "failed to get reset GPIO: %d\n", err);
+			return err;
+		}
+
 		list_add_tail(&rp->list, &pcie->ports);
 	}
 
-- 
2.17.1
