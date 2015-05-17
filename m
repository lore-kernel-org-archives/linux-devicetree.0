From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 3/7] mtd: brcmnand: use struct device and not platform_device
Date: Sun, 17 May 2015 17:41:02 +0200
Message-ID: <1431877266-28566-4-git-send-email-hauke@hauke-m.de>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431877266-28566-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This replaces the struct platform_device with struct device in the
structures used by brcmnand. This is a first step to make it possible
to use other device types than platform devices.

This should not change any functionality.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---
 drivers/mtd/nand/brcmnand/bcm63138_nand.c |  2 +-
 drivers/mtd/nand/brcmnand/brcmnand.c      | 20 +++++++++-----------
 drivers/mtd/nand/brcmnand/brcmnand.h      |  2 +-
 drivers/mtd/nand/brcmnand/iproc_nand.c    |  2 +-
 4 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/bcm63138_nand.c b/drivers/mtd/nand/brcmnand/bcm63138_nand.c
index 3f4c44c..d764807 100644
--- a/drivers/mtd/nand/brcmnand/bcm63138_nand.c
+++ b/drivers/mtd/nand/brcmnand/bcm63138_nand.c
@@ -81,7 +81,7 @@ static int bcm63138_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	soc->pdev = pdev;
+	soc->dev = dev;
 	soc->priv = priv;
 	soc->ctlrdy_ack = bcm63138_nand_intc_ack;
 	soc->ctlrdy_set_enabled = bcm63138_nand_intc_set;
diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index a48ad49..58462b5 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -180,7 +180,7 @@ struct brcmnand_host {
 
 	struct nand_chip	chip;
 	struct mtd_info		mtd;
-	struct platform_device	*pdev;
+	struct device		*dev;
 	int			cs;
 
 	unsigned int		last_cmd;
@@ -739,7 +739,7 @@ static struct nand_ecclayout *brcmnand_create_layout(int ecc_level,
 	int sas;
 	int idx1, idx2;
 
-	layout = devm_kzalloc(&host->pdev->dev, sizeof(*layout), GFP_KERNEL);
+	layout = devm_kzalloc(host->dev, sizeof(*layout), GFP_KERNEL);
 	if (!layout)
 		return NULL;
 
@@ -783,7 +783,7 @@ static struct nand_ecclayout *brcmnand_create_layout(int ecc_level,
 	 */
 	req = DIV_ROUND_UP(ecc_level * 14, 8);
 	if (req >= sas) {
-		dev_err(&host->pdev->dev,
+		dev_err(host->dev,
 			"error: ECC too large for OOB (ECC bytes %d, spare sector %d)\n",
 			req, sas);
 		return NULL;
@@ -842,8 +842,7 @@ static struct nand_ecclayout *brcmstb_choose_ecc_layout(
 
 	layout = brcmnand_create_layout(ecc_level, host);
 	if (!layout) {
-		dev_err(&host->pdev->dev,
-				"no proper ecc_layout for this NAND cfg\n");
+		dev_err(host->dev, "no proper ecc_layout for this NAND cfg\n");
 		return NULL;
 	}
 
@@ -1884,7 +1883,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
 	struct device_node *dn = host->of_node;
-	struct platform_device *pdev = host->pdev;
+	struct device *dev = host->dev;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
 	int ret = 0;
@@ -1892,7 +1891,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
 
 	ret = of_property_read_u32(dn, "reg", &host->cs);
 	if (ret) {
-		dev_err(&pdev->dev, "can't get chip-select\n");
+		dev_err(dev, "can't get chip-select\n");
 		return -ENXIO;
 	}
 
@@ -1902,10 +1901,9 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
 	chip->dn = dn;
 	chip->priv = host;
 	mtd->priv = chip;
-	mtd->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "brcmnand.%d",
-				   host->cs);
+	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "brcmnand.%d", host->cs);
 	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = &pdev->dev;
+	mtd->dev.parent = dev;
 
 	chip->IO_ADDR_R = (void __iomem *)0xdeadbeef;
 	chip->IO_ADDR_W = (void __iomem *)0xdeadbeef;
@@ -2205,7 +2203,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
 			if (!host)
 				return -ENOMEM;
-			host->pdev = pdev;
+			host->dev = dev;
 			host->ctrl = ctrl;
 			host->of_node = child;
 
diff --git a/drivers/mtd/nand/brcmnand/brcmnand.h b/drivers/mtd/nand/brcmnand/brcmnand.h
index a20c736..d0d74d7 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.h
+++ b/drivers/mtd/nand/brcmnand/brcmnand.h
@@ -21,7 +21,7 @@ struct platform_device;
 struct dev_pm_ops;
 
 struct brcmnand_soc {
-	struct platform_device *pdev;
+	struct device *dev;
 	void *priv;
 	bool (*ctlrdy_ack)(struct brcmnand_soc *soc);
 	void (*ctlrdy_set_enabled)(struct brcmnand_soc *soc, bool en);
diff --git a/drivers/mtd/nand/brcmnand/iproc_nand.c b/drivers/mtd/nand/brcmnand/iproc_nand.c
index 683495c..50504e9 100644
--- a/drivers/mtd/nand/brcmnand/iproc_nand.c
+++ b/drivers/mtd/nand/brcmnand/iproc_nand.c
@@ -118,7 +118,7 @@ static int iproc_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->ext_base))
 		return PTR_ERR(priv->ext_base);
 
-	soc->pdev = pdev;
+	soc->dev = dev;
 	soc->priv = priv;
 	soc->ctlrdy_ack = iproc_nand_intc_ack;
 	soc->ctlrdy_set_enabled = iproc_nand_intc_set;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
