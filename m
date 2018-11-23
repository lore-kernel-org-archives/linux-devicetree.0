From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 03/12] PCI: aardvark: add PHY support
Date: Fri, 23 Nov 2018 15:18:22 +0100
Message-ID: <20181123141831.8214-4-miquel.raynal@bootlin.com>
References: <20181123141831.8214-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181123141831.8214-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Antoine Tenart <antoine.tenart@bootlin.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The IP needs its PHY to be properly configured to work. While the PHY
is usually already configured by the bootloader, we will need this
feature when adding S2RAM support. Take care of registering and
configuring the PHY from the driver itself.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/pci/controller/pci-aardvark.c | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 1d31d74ddab7..da695572a2ed 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -17,6 +17,7 @@
 #include <linux/pci.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
+#include <linux/phy/phy.h>
 #include <linux/of_address.h>
 #include <linux/of_gpio.h>
 #include <linux/of_pci.h>
@@ -204,6 +205,7 @@ struct advk_pcie {
 	int root_bus_nr;
 	struct pci_bridge_emul bridge;
 	struct gpio_desc *reset_gpio;
+	struct phy *phy;
 };
 
 static inline void advk_writel(struct advk_pcie *pcie, u32 val, u64 reg)
@@ -1025,6 +1027,62 @@ static int advk_pcie_setup_reset_gpio(struct advk_pcie *pcie)
 	return 0;
 }
 
+static void advk_pcie_disable_phy(struct advk_pcie *pcie)
+{
+	phy_power_off(pcie->phy);
+	phy_exit(pcie->phy);
+}
+
+static int advk_pcie_enable_phy(struct advk_pcie *pcie)
+{
+	int ret;
+
+	if (!pcie->phy)
+		return 0;
+
+	ret = phy_init(pcie->phy);
+	if (ret)
+		return ret;
+
+	ret = phy_set_mode(pcie->phy, PHY_MODE_PCIE);
+	if (ret) {
+		phy_exit(pcie->phy);
+		return ret;
+	}
+
+	ret = phy_power_on(pcie->phy);
+	if (ret) {
+		phy_exit(pcie->phy);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int advk_pcie_setup_phy(struct advk_pcie *pcie)
+{
+	struct device *dev = &pcie->pdev->dev;
+	struct device_node *node = dev->of_node;
+	int ret = 0;
+
+	pcie->phy = devm_of_phy_get(dev, node, NULL);
+	if (IS_ERR(pcie->phy) && (PTR_ERR(pcie->phy) == -EPROBE_DEFER))
+		return PTR_ERR(pcie->phy);
+
+	/* Old bindings miss the PHY handle */
+	if (IS_ERR(pcie->phy)) {
+		dev_warn(dev, "PHY unavailable (%ld)\n", PTR_ERR(pcie->phy));
+		pcie->phy = NULL;
+		return 0;
+	}
+
+	ret = advk_pcie_enable_phy(pcie);
+	if (ret)
+		dev_err(dev, "Failed to initialize PHY (%d)\n", ret);
+
+	return ret;
+}
+
 static int advk_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1060,6 +1118,10 @@ static int advk_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = advk_pcie_setup_phy(pcie);
+	if (ret)
+		return ret;
+
 	ret = advk_pcie_setup_reset_gpio(pcie);
 	if (ret)
 		return ret;
-- 
2.19.1
