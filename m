From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 06/15] PCI: aardvark: Add external reset GPIO support
Date: Tue,  8 Jan 2019 17:24:31 +0100
Message-ID: <20190108162441.5278-7-miquel.raynal@bootlin.com>
References: <20190108162441.5278-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108162441.5278-1-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Add support for a possible external reset GPIO wired to the PCIe
endpoint card. Asserting/deasserting the reset line is done during the
warm reset because the warm reset operation already triggers the
internal reset line that may also reset the endpoint card (if muxed).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/pci/controller/pci-aardvark.c | 50 +++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index cfe48e553bca..3fb14e37eb59 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -10,6 +10,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
@@ -19,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 #include <linux/of_address.h>
+#include <linux/of_gpio.h>
 #include <linux/of_pci.h>
 
 #include "../pci.h"
@@ -209,6 +211,7 @@ struct advk_pcie {
 	int root_bus_nr;
 	struct pci_bridge_emul bridge;
 	struct phy *phy;
+	struct gpio_desc *reset_gpio;
 };
 
 static inline void advk_writel(struct advk_pcie *pcie, u32 val, u64 reg)
@@ -249,6 +252,12 @@ static int advk_pcie_wait_for_link(struct advk_pcie *pcie)
 	return -ETIMEDOUT;
 }
 
+static void advk_pcie_card_reset_assert(struct advk_pcie *pcie, bool status)
+{
+	if (pcie->reset_gpio)
+		gpiod_set_value_cansleep(pcie->reset_gpio, status);
+}
+
 static void advk_pcie_setup_hw(struct advk_pcie *pcie)
 {
 	u32 reg;
@@ -257,11 +266,13 @@ static void advk_pcie_setup_hw(struct advk_pcie *pcie)
 	reg = advk_readl(pcie, CTRL_WARM_RESET_REG);
 	reg |= CTRL_PCIE_CORE_WARM_RESET | CTRL_PHY_CORE_WARM_RESET |
 	       CTRL_PERSTN_GPIO_EN;
+	advk_pcie_card_reset_assert(pcie, 1);
 	advk_writel(pcie, reg, CTRL_WARM_RESET_REG);
 	reg = advk_readl(pcie, CTRL_WARM_RESET_REG);
 	mdelay(1);
 	reg &= ~(CTRL_PCIE_CORE_WARM_RESET | CTRL_PHY_CORE_WARM_RESET |
 		 CTRL_PERSTN_GPIO_EN);
+	advk_pcie_card_reset_assert(pcie, 0);
 	advk_writel(pcie, reg, CTRL_WARM_RESET_REG);
 	reg = advk_readl(pcie, CTRL_WARM_RESET_REG);
 	mdelay(10);
@@ -1073,6 +1084,41 @@ static int advk_pcie_setup_phy(struct advk_pcie *pcie)
 	return ret;
 }
 
+static int advk_pcie_setup_reset_gpio(struct advk_pcie *pcie)
+{
+	struct device *dev = &pcie->pdev->dev;
+	enum of_gpio_flags of_flags;
+	unsigned long gpio_flags;
+	int gpio_nb;
+	int ret;
+
+	gpio_nb = of_get_named_gpio_flags(dev->of_node, "reset-gpios", 0,
+					  &of_flags);
+	if (gpio_nb == -EPROBE_DEFER)
+		return gpio_nb;
+
+	/* No all boards use an external GPIO for card reset */
+	if (!gpio_is_valid(gpio_nb))
+		return 0;
+
+	if (of_flags & OF_GPIO_ACTIVE_LOW)
+		gpio_flags = GPIOF_ACTIVE_LOW |
+			     GPIOF_OUT_INIT_LOW;
+	else
+		gpio_flags = GPIOF_OUT_INIT_HIGH;
+
+	ret = devm_gpio_request_one(dev, gpio_nb, gpio_flags,
+				    "pcie-aardvark-card-reset");
+	if (ret) {
+		dev_err(dev, "Failed to retrieve reset GPIO (%d)\n", ret);
+		return ret;
+	}
+
+	pcie->reset_gpio = gpio_to_desc(gpio_nb);
+
+	return 0;
+}
+
 static int advk_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1116,6 +1162,10 @@ static int advk_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = advk_pcie_setup_reset_gpio(pcie);
+	if (ret)
+		return ret;
+
 	advk_pcie_setup_hw(pcie);
 
 	advk_sw_pci_bridge_init(pcie);
-- 
2.19.1
