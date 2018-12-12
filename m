From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 04/12] PCI: aardvark: Add clock support
Date: Wed, 12 Dec 2018 11:21:34 +0100
Message-ID: <20181212102142.16053-5-miquel.raynal@bootlin.com>
References: <20181212102142.16053-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181212102142.16053-1-miquel.raynal@bootlin.com>
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

The IP relies on a gated clock. When we will add S2RAM support, this
clock will need to be resumed before any PCIe registers are
accessed. Add support for this clock.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/pci/controller/pci-aardvark.c | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index da695572a2ed..108b3f15c410 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -8,6 +8,7 @@
  * Author: Hezi Shahmoon <hezi.shahmoon@marvell.com>
  */
 
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
@@ -190,6 +191,7 @@
 
 struct advk_pcie {
 	struct platform_device *pdev;
+	struct clk *clk;
 	void __iomem *base;
 	struct list_head resources;
 	struct irq_domain *irq_domain;
@@ -1083,6 +1085,29 @@ static int advk_pcie_setup_phy(struct advk_pcie *pcie)
 	return ret;
 }
 
+static int advk_pcie_setup_clk(struct advk_pcie *pcie)
+{
+	struct device *dev = &pcie->pdev->dev;
+	int ret;
+
+	pcie->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(pcie->clk) && (PTR_ERR(pcie->clk) == -EPROBE_DEFER))
+		return PTR_ERR(pcie->clk);
+
+	/* Old bindings miss the clock handle */
+	if (IS_ERR(pcie->clk)) {
+		dev_warn(dev, "Clock unavailable (%ld)\n", PTR_ERR(pcie->clk));
+		pcie->clk = NULL;
+		return 0;
+	}
+
+	ret = clk_prepare_enable(pcie->clk);
+	if (ret)
+		dev_err(dev, "Clock initialization failed (%d)\n", ret);
+
+	return ret;
+}
+
 static int advk_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1118,6 +1143,10 @@ static int advk_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = advk_pcie_setup_clk(pcie);
+	if (ret)
+		return ret;
+
 	ret = advk_pcie_setup_phy(pcie);
 	if (ret)
 		return ret;
-- 
2.19.1
