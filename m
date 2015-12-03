From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH linux-next 2/3] mtd: brcmnand: Request and enable the clock if
 present
Date: Thu, 3 Dec 2015 20:00:48 +0000
Message-ID: <56609F70.601@simon.arlott.org.uk>
References: <56609F09.7020607@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56609F09.7020607@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
List-Id: devicetree@vger.kernel.org

Attempt to enable a clock named "nand" as some SoCs have a clock for the
controller that needs to be enabled.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
Removed ctrl->clk not NULL check.

 drivers/mtd/nand/brcmnand/brcmnand.c | 64 ++++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 35d78f7..cf0374e 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -11,6 +11,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/clk.h>
 #include <linux/version.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -122,6 +123,9 @@ struct brcmnand_controller {
 	/* Some SoCs provide custom interrupt status register(s) */
 	struct brcmnand_soc	*soc;
 
+	/* Some SoCs have a gateable clock for the controller */
+	struct clk		*clk;
+
 	int			cmd_pending;
 	bool			dma_pending;
 	struct completion	done;
@@ -2127,10 +2131,24 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	if (IS_ERR(ctrl->nand_base))
 		return PTR_ERR(ctrl->nand_base);
 
+	/* Enable clock before using NAND registers */
+	ctrl->clk = devm_clk_get(dev, "nand");
+	if (!IS_ERR(ctrl->clk)) {
+		ret = clk_prepare_enable(ctrl->clk);
+		if (ret)
+			return ret;
+	} else {
+		ret = PTR_ERR(ctrl->clk);
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		ctrl->clk = NULL;
+	}
+
 	/* Initialize NAND revision */
 	ret = brcmnand_revision_init(ctrl);
 	if (ret)
-		return ret;
+		goto err;
 
 	/*
 	 * Most chips have this cache at a fixed offset within 'nand' block.
@@ -2139,8 +2157,10 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand-cache");
 	if (res) {
 		ctrl->nand_fc = devm_ioremap_resource(dev, res);
-		if (IS_ERR(ctrl->nand_fc))
-			return PTR_ERR(ctrl->nand_fc);
+		if (IS_ERR(ctrl->nand_fc)) {
+			ret = PTR_ERR(ctrl->nand_fc);
+			goto err;
+		}
 	} else {
 		ctrl->nand_fc = ctrl->nand_base +
 				ctrl->reg_offsets[BRCMNAND_FC_BASE];
@@ -2150,8 +2170,10 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "flash-dma");
 	if (res) {
 		ctrl->flash_dma_base = devm_ioremap_resource(dev, res);
-		if (IS_ERR(ctrl->flash_dma_base))
-			return PTR_ERR(ctrl->flash_dma_base);
+		if (IS_ERR(ctrl->flash_dma_base)) {
+			ret = PTR_ERR(ctrl->flash_dma_base);
+			goto err;
+		}
 
 		flash_dma_writel(ctrl, FLASH_DMA_MODE, 1); /* linked-list */
 		flash_dma_writel(ctrl, FLASH_DMA_ERROR_STATUS, 0);
@@ -2160,13 +2182,16 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 		ctrl->dma_desc = dmam_alloc_coherent(dev,
 						     sizeof(*ctrl->dma_desc),
 						     &ctrl->dma_pa, GFP_KERNEL);
-		if (!ctrl->dma_desc)
-			return -ENOMEM;
+		if (!ctrl->dma_desc) {
+			ret = -ENOMEM;
+			goto err;
+		}
 
 		ctrl->dma_irq = platform_get_irq(pdev, 1);
 		if ((int)ctrl->dma_irq < 0) {
 			dev_err(dev, "missing FLASH_DMA IRQ\n");
-			return -ENODEV;
+			ret = -ENODEV;
+			goto err;
 		}
 
 		ret = devm_request_irq(dev, ctrl->dma_irq,
@@ -2175,7 +2200,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 		if (ret < 0) {
 			dev_err(dev, "can't allocate IRQ %d: error %d\n",
 					ctrl->dma_irq, ret);
-			return ret;
+			goto err;
 		}
 
 		dev_info(dev, "enabling FLASH_DMA\n");
@@ -2199,7 +2224,8 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	ctrl->irq = platform_get_irq(pdev, 0);
 	if ((int)ctrl->irq < 0) {
 		dev_err(dev, "no IRQ defined\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err;
 	}
 
 	/*
@@ -2223,7 +2249,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	if (ret < 0) {
 		dev_err(dev, "can't allocate IRQ %d: error %d\n",
 			ctrl->irq, ret);
-		return ret;
+		goto err;
 	}
 
 	for_each_available_child_of_node(dn, child) {
@@ -2233,7 +2259,8 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
 			if (!host) {
 				of_node_put(child);
-				return -ENOMEM;
+				ret = -ENOMEM;
+				goto err;
 			}
 			host->pdev = pdev;
 			host->ctrl = ctrl;
@@ -2249,10 +2276,17 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	}
 
 	/* No chip-selects could initialize properly */
-	if (list_empty(&ctrl->host_list))
-		return -ENODEV;
+	if (list_empty(&ctrl->host_list)) {
+		ret = -ENODEV;
+		goto err;
+	}
 
 	return 0;
+
+err:
+	clk_disable_unprepare(ctrl->clk);
+	return ret;
+
 }
 EXPORT_SYMBOL_GPL(brcmnand_probe);
 
@@ -2264,6 +2298,8 @@ int brcmnand_remove(struct platform_device *pdev)
 	list_for_each_entry(host, &ctrl->host_list, node)
 		nand_release(&host->mtd);
 
+	clk_disable_unprepare(ctrl->clk);
+
 	dev_set_drvdata(&pdev->dev, NULL);
 
 	return 0;
-- 
2.1.4

-- 
Simon Arlott
