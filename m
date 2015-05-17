From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 4/7] mtd: brcmnand: add methods to register struct device
Date: Sun, 17 May 2015 17:41:03 +0200
Message-ID: <1431877266-28566-5-git-send-email-hauke@hauke-m.de>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431877266-28566-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds a new method to register a struct device to brcmnand.
The functions handling platform device will stay, but they are just
extracting the data from the platform device and are providing the data
to the brcmnand_probe_dev() function.

The struct brcmnand_soc is now used to provide all information like irq
numbers and memory ranges to the actual driver. soc is now set in all
cases.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 121 +++++++++++++++++++++++------------
 drivers/mtd/nand/brcmnand/brcmnand.h |   8 +++
 2 files changed, 89 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 58462b5..468a212 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -2023,7 +2023,7 @@ static int brcmnand_resume(struct device *dev)
 	brcmnand_write_reg(ctrl, BRCMNAND_CS_XOR, ctrl->nand_cs_nand_xor);
 	brcmnand_write_reg(ctrl, BRCMNAND_CORR_THRESHOLD,
 			ctrl->corr_stat_threshold);
-	if (ctrl->soc) {
+	if (ctrl->soc->ctlrdy_ack && ctrl->soc->ctlrdy_set_enabled) {
 		/* Clear/re-enable interrupt */
 		ctrl->soc->ctlrdy_ack(ctrl->soc);
 		ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
@@ -2063,21 +2063,12 @@ MODULE_DEVICE_TABLE(of, brcmnand_of_match);
  * Platform driver setup (per controller)
  ***********************************************************************/
 
-int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
+int brcmnand_probe_dev(struct device *dev, struct brcmnand_soc *soc)
 {
-	struct device *dev = &pdev->dev;
 	struct device_node *dn = dev->of_node, *child;
 	struct brcmnand_controller *ctrl;
-	struct resource *res;
 	int ret;
 
-	/* We only support device-tree instantiation */
-	if (!dn)
-		return -ENODEV;
-
-	if (!of_match_node(brcmnand_of_match, dn))
-		return -ENODEV;
-
 	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
 	if (!ctrl)
 		return -ENOMEM;
@@ -2092,10 +2083,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	INIT_LIST_HEAD(&ctrl->host_list);
 
 	/* NAND register range */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctrl->nand_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(ctrl->nand_base))
-		return PTR_ERR(ctrl->nand_base);
+	ctrl->nand_base = soc->nand_base;
 
 	/* Initialize NAND revision */
 	ret = brcmnand_revision_init(ctrl);
@@ -2106,22 +2094,16 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	 * Most chips have this cache at a fixed offset within 'nand' block.
 	 * Some must specify this region separately.
 	 */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand-cache");
-	if (res) {
-		ctrl->nand_fc = devm_ioremap_resource(dev, res);
-		if (IS_ERR(ctrl->nand_fc))
-			return PTR_ERR(ctrl->nand_fc);
+	if (soc->nand_fc) {
+		ctrl->nand_fc = soc->nand_fc;
 	} else {
 		ctrl->nand_fc = ctrl->nand_base +
 				ctrl->reg_offsets[BRCMNAND_FC_BASE];
 	}
 
 	/* FLASH_DMA */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "flash-dma");
-	if (res) {
-		ctrl->flash_dma_base = devm_ioremap_resource(dev, res);
-		if (IS_ERR(ctrl->flash_dma_base))
-			return PTR_ERR(ctrl->flash_dma_base);
+	if (soc->flash_dma_base) {
+		ctrl->flash_dma_base = soc->flash_dma_base;
 
 		flash_dma_writel(ctrl, FLASH_DMA_MODE, 1); /* linked-list */
 		flash_dma_writel(ctrl, FLASH_DMA_ERROR_STATUS, 0);
@@ -2133,11 +2115,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 		if (!ctrl->dma_desc)
 			return -ENOMEM;
 
-		ctrl->dma_irq = platform_get_irq(pdev, 1);
-		if ((int)ctrl->dma_irq < 0) {
-			dev_err(dev, "missing FLASH_DMA IRQ\n");
-			return -ENODEV;
-		}
+		ctrl->dma_irq = soc->dma_irq;
 
 		ret = devm_request_irq(dev, ctrl->dma_irq,
 				brcmnand_dma_irq, 0, DRV_NAME,
@@ -2166,17 +2144,13 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	}
 
 	/* IRQ */
-	ctrl->irq = platform_get_irq(pdev, 0);
-	if ((int)ctrl->irq < 0) {
-		dev_err(dev, "no IRQ defined\n");
-		return -ENODEV;
-	}
+	ctrl->irq = soc->irq;
 
 	/*
 	 * Some SoCs integrate this controller (e.g., its interrupt bits) in
 	 * interesting ways
 	 */
-	if (soc) {
+	if (soc->ctlrdy_ack && soc->ctlrdy_set_enabled) {
 		ctrl->soc = soc;
 
 		ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
@@ -2221,20 +2195,87 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(brcmnand_probe);
+EXPORT_SYMBOL_GPL(brcmnand_probe_dev);
 
-int brcmnand_remove(struct platform_device *pdev)
+int brcmnand_remove_dev(struct device *dev)
 {
-	struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
+	struct brcmnand_controller *ctrl = dev_get_drvdata(dev);
 	struct brcmnand_host *host;
 
 	list_for_each_entry(host, &ctrl->host_list, node)
 		nand_release(&host->mtd);
 
-	dev_set_drvdata(&pdev->dev, NULL);
+	dev_set_drvdata(dev, NULL);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(brcmnand_remove_dev);
+
+int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *dn = dev->of_node;
+	struct resource *res;
+
+	/* We only support device-tree instantiation */
+	if (!dn)
+		return -ENODEV;
+
+	if (!of_match_node(brcmnand_of_match, dn))
+		return -ENODEV;
+
+	if (!soc) {
+		soc = devm_kzalloc(dev, sizeof(*soc), GFP_KERNEL);
+		if (!soc)
+			return -ENOMEM;
+	}
+
+	/* NAND register range */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	soc->nand_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(soc->nand_base))
+		return PTR_ERR(soc->nand_base);
+
+	/*
+	 * Most chips have this cache at a fixed offset within 'nand' block.
+	 * Some must specify this region separately.
+	 */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand-cache");
+	if (res) {
+		soc->nand_fc = devm_ioremap_resource(dev, res);
+		if (IS_ERR(soc->nand_fc))
+			return PTR_ERR(soc->nand_fc);
+	}
+
+	/* FLASH_DMA */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "flash-dma");
+	if (res) {
+		soc->flash_dma_base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(soc->flash_dma_base))
+			return PTR_ERR(soc->flash_dma_base);
+
+		soc->dma_irq = platform_get_irq(pdev, 1);
+		if ((int)soc->dma_irq < 0) {
+			dev_err(dev, "missing FLASH_DMA IRQ\n");
+			return -ENODEV;
+		}
+	}
+
+	/* IRQ */
+	soc->irq = platform_get_irq(pdev, 0);
+	if ((int)soc->irq < 0) {
+		dev_err(dev, "no IRQ defined\n");
+		return -ENODEV;
+	}
+
+	return brcmnand_probe_dev(&pdev->dev, soc);
+}
+EXPORT_SYMBOL_GPL(brcmnand_probe);
+
+int brcmnand_remove(struct platform_device *pdev)
+{
+	return brcmnand_remove_dev(&pdev->dev);
+}
 EXPORT_SYMBOL_GPL(brcmnand_remove);
 
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/mtd/nand/brcmnand/brcmnand.h b/drivers/mtd/nand/brcmnand/brcmnand.h
index d0d74d7..3211401 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.h
+++ b/drivers/mtd/nand/brcmnand/brcmnand.h
@@ -26,6 +26,11 @@ struct brcmnand_soc {
 	bool (*ctlrdy_ack)(struct brcmnand_soc *soc);
 	void (*ctlrdy_set_enabled)(struct brcmnand_soc *soc, bool en);
 	void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare);
+	void __iomem	*nand_base;
+	void __iomem	*nand_fc; /* flash cache */
+	void __iomem	*flash_dma_base;
+	unsigned int	irq;
+	unsigned int	dma_irq;
 };
 
 static inline void brcmnand_soc_data_bus_prepare(struct brcmnand_soc *soc)
@@ -65,6 +70,9 @@ static inline void brcmnand_writel(u32 val, void __iomem *addr)
 		writel_relaxed(val, addr);
 }
 
+int brcmnand_probe_dev(struct device *dev, struct brcmnand_soc *soc);
+int brcmnand_remove_dev(struct device *dev);
+
 int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc);
 int brcmnand_remove(struct platform_device *pdev);
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
