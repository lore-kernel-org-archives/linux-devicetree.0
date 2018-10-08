From: <honghui.zhang@mediatek.com>
Subject: [PATCH v6 3/9] PCI: mediatek: Remove the redundant dev->pm_domain check
Date: Mon, 8 Oct 2018 11:24:42 +0800
Message-ID: <1538969088-7136-4-git-send-email-honghui.zhang@mediatek.com>
References: <1538969088-7136-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538969088-7136-1-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com
Cc: ulf.hansson@linaro.org, marc.zyngier@arm.com, matthias.bgg@gmail.com, devicetree@vger.kernel.org, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, honghui.zhang@mediatek.com, youlin.pei@mediatek.com, yt.shen@mediatek.com, sean.wang@mediatek.com
List-Id: devicetree@vger.kernel.org

From: Honghui Zhang <honghui.zhang@mediatek.com>

It's no needed to check whether device have pm_domain attached before
calling the pm_runtime_XXX interface, remove it.

Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index bcdac9b..59fdb60 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -225,10 +225,8 @@ static void mtk_pcie_subsys_powerdown(struct mtk_pcie *pcie)
 
 	clk_disable_unprepare(pcie->free_ck);
 
-	if (dev->pm_domain) {
-		pm_runtime_put_sync(dev);
-		pm_runtime_disable(dev);
-	}
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
 }
 
 static void mtk_pcie_port_free(struct mtk_pcie_port *port)
@@ -998,10 +996,8 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
 		pcie->free_ck = NULL;
 	}
 
-	if (dev->pm_domain) {
-		pm_runtime_enable(dev);
-		pm_runtime_get_sync(dev);
-	}
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
 
 	/* enable top level clock */
 	err = clk_prepare_enable(pcie->free_ck);
@@ -1013,10 +1009,8 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
 	return 0;
 
 err_free_ck:
-	if (dev->pm_domain) {
-		pm_runtime_put_sync(dev);
-		pm_runtime_disable(dev);
-	}
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
 
 	return err;
 }
-- 
2.6.4
