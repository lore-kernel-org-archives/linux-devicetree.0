From: <honghui.zhang@mediatek.com>
Subject: [PATCH 1/4] PCI: mediatek: Remove un-used variant in struct mtk_pcie_port
Date: Fri, 14 Dec 2018 09:25:39 +0800
Message-ID: <1544750742-31419-2-git-send-email-honghui.zhang@mediatek.com>
References: <1544750742-31419-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544750742-31419-1-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, matthias.bgg@gmail.com, robh+dt@kernel.org, robh@kernel.org
Cc: devicetree@vger.kernel.org, youlin.pei@mediatek.com, jianjun.wang@mediatek.com, Honghui Zhang <honghui.zhang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Honghui Zhang <honghui.zhang@mediatek.com>

The "lane" variant in struct mtk_pcie_port is not used, remove it.

Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 6917aec..e307166 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -161,7 +161,6 @@ struct mtk_pcie_soc {
  * @obff_ck: pointer to OBFF functional block operating clock
  * @pipe_ck: pointer to LTSSM and PHY/MAC layer operating clock
  * @phy: pointer to PHY control block
- * @lane: lane count
  * @slot: port slot
  * @irq: GIC irq
  * @irq_domain: legacy INTx IRQ domain
@@ -182,7 +181,6 @@ struct mtk_pcie_port {
 	struct clk *obff_ck;
 	struct clk *pipe_ck;
 	struct phy *phy;
-	u32 lane;
 	u32 slot;
 	int irq;
 	struct irq_domain *irq_domain;
@@ -895,12 +893,6 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
 	if (!port)
 		return -ENOMEM;
 
-	err = of_property_read_u32(node, "num-lanes", &port->lane);
-	if (err) {
-		dev_err(dev, "missing num-lanes property\n");
-		return err;
-	}
-
 	snprintf(name, sizeof(name), "port%d", slot);
 	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
 	port->base = devm_ioremap_resource(dev, regs);
-- 
2.6.4
