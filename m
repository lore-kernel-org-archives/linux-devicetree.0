Return-Path: <SRS0=zE5V=SZ=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V2 27/28] PCI: tegra: Add support for GPIO based PCIe reset
Date: Tue, 23 Apr 2019 14:58:24 +0530
Message-ID: <20190423092825.759-28-mmaddireddy@nvidia.com>
In-Reply-To: <20190423092825.759-1-mmaddireddy@nvidia.com>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Add support for GPIO based PERST# instead of SFIO mode controlled by AFI.
GPIO number comes from per port PCIe device tree node.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
V2: Using standard "reset-gpio" property

 drivers/pci/controller/pci-tegra.c | 36 +++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 72d344858e25..09b3b3e847c5 100644
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
@@ -26,6 +27,7 @@
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of_address.h>
+#include <linux/of_gpio.h>
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
 #include <linux/pci.h>
@@ -400,6 +402,8 @@ struct tegra_pcie_port {
 	unsigned int lanes;
 
 	struct phy **phys;
+
+	int reset_gpio;
 };
 
 struct tegra_pcie_bus {
@@ -583,15 +587,23 @@ static void tegra_pcie_port_reset(struct tegra_pcie_port *port)
 	unsigned long value;
 
 	/* pulse reset signal */
-	value = afi_readl(port->pcie, ctrl);
-	value &= ~AFI_PEX_CTRL_RST;
-	afi_writel(port->pcie, value, ctrl);
+	if (gpio_is_valid(port->reset_gpio)) {
+		gpiod_set_value(gpio_to_desc(port->reset_gpio), 0);
+	} else {
+		value = afi_readl(port->pcie, ctrl);
+		value &= ~AFI_PEX_CTRL_RST;
+		afi_writel(port->pcie, value, ctrl);
+	}
 
 	usleep_range(1000, 2000);
 
-	value = afi_readl(port->pcie, ctrl);
-	value |= AFI_PEX_CTRL_RST;
-	afi_writel(port->pcie, value, ctrl);
+	if (gpio_is_valid(port->reset_gpio)) {
+		gpiod_set_value(gpio_to_desc(port->reset_gpio), 1);
+	} else {
+		value = afi_readl(port->pcie, ctrl);
+		value |= AFI_PEX_CTRL_RST;
+		afi_writel(port->pcie, value, ctrl);
+	}
 }
 
 static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
@@ -2299,6 +2311,18 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
 		if (IS_ERR(rp->base))
 			return PTR_ERR(rp->base);
 
+		rp->reset_gpio = of_get_named_gpio(port, "reset-gpio", 0);
+		if (gpio_is_valid(rp->reset_gpio)) {
+			err = devm_gpio_request_one(dev, rp->reset_gpio,
+						    GPIOF_OUT_INIT_LOW,
+						    "pex_reset");
+			if (err < 0) {
+				dev_err(dev, "failed to request reset-gpio: %d\n",
+					err);
+				return err;
+			}
+		}
+
 		list_add_tail(&rp->list, &pcie->ports);
 	}
 
-- 
2.17.1
