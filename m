From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 07/15] PCI: aardvark: Add suspend to RAM support
Date: Tue,  8 Jan 2019 17:24:32 +0100
Message-ID: <20190108162441.5278-8-miquel.raynal@bootlin.com>
References: <20190108162441.5278-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108162441.5278-1-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Add suspend and resume callbacks. The priority of these are
"_noirq()", to workaround early access to the registers done by the
PCI core through the ->read()/->write() callbacks at resume time.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/pci/controller/pci-aardvark.c | 45 ++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 3fb14e37eb59..999bbe27761a 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -1028,7 +1028,7 @@ static int advk_pcie_setup_clk(struct advk_pcie *pcie)
 	return ret;
 }
 
-static void __maybe_unused advk_pcie_disable_phy(struct advk_pcie *pcie)
+static void advk_pcie_disable_phy(struct advk_pcie *pcie)
 {
 	phy_power_off(pcie->phy);
 	phy_exit(pcie->phy);
@@ -1119,6 +1119,47 @@ static int advk_pcie_setup_reset_gpio(struct advk_pcie *pcie)
 	return 0;
 }
 
+static int __maybe_unused advk_pcie_suspend(struct device *dev)
+{
+	struct advk_pcie *pcie = dev_get_drvdata(dev);
+
+	advk_pcie_disable_phy(pcie);
+
+	clk_disable_unprepare(pcie->clk);
+
+	return 0;
+}
+
+static int __maybe_unused advk_pcie_resume(struct device *dev)
+{
+	struct advk_pcie *pcie = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(pcie->clk);
+	if (ret)
+		return ret;
+
+	ret = advk_pcie_enable_phy(pcie);
+	if (ret)
+		return ret;
+
+	advk_pcie_setup_hw(pcie);
+
+	advk_sw_pci_bridge_init(pcie);
+
+	return 0;
+}
+
+/*
+ * The PCI core will try to reconfigure the bus quite early in the resume path.
+ * We must use the _noirq() alternatives to ensure the controller is ready when
+ * the core uses the ->read()/->write() callbacks.
+ */
+static const struct dev_pm_ops advk_pcie_dev_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(advk_pcie_suspend,
+				      advk_pcie_resume)
+};
+
 static int advk_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1133,6 +1174,7 @@ static int advk_pcie_probe(struct platform_device *pdev)
 
 	pcie = pci_host_bridge_priv(bridge);
 	pcie->pdev = pdev;
+	platform_set_drvdata(pdev, pcie);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	pcie->base = devm_ioremap_resource(dev, res);
@@ -1210,6 +1252,7 @@ static struct platform_driver advk_pcie_driver = {
 	.driver = {
 		.name = "advk-pcie",
 		.of_match_table = advk_pcie_of_match_table,
+		.pm = &advk_pcie_dev_pm_ops,
 		/* Driver unloading/unbinding currently not supported */
 		.suppress_bind_attrs = true,
 	},
-- 
2.19.1
