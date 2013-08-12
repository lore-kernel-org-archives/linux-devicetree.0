Return-Path: <devicetree-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:55296 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757499Ab3HLRPT (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 12 Aug 2013 13:15:19 -0400
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v4 02/14] mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand' compatible string
Date: Mon, 12 Aug 2013 14:14:47 -0300
Message-Id: <1376327699-7973-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Jason Cooper <jason@lakedaemon.net>, Artem Bityutskiy <dedekind1@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Gregory Clement <gregory.clement@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>, Daniel Mack <zonque@gmail.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This driver supports NFCv1 (as found in PXA SoC) and NFCv2 (as found in
Armada 370/XP SoC). As both controller has a few differences, a way of
distinguishing between the two is needed.

This commit introduces a new compatible string 'marvell,armada370-nand'
and assigns a compatible data of type enum pxa3xx_nand_variant to allow
such distinction.

Cc: devicetree@vger.kernel.org
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 02f214d..55eb153 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -123,6 +123,11 @@ enum {
 	STATE_READY,
 };
 
+enum pxa3xx_nand_variant {
+	PXA3XX_NAND_VARIANT_PXA,
+	PXA3XX_NAND_VARIANT_ARMADA370,
+};
+
 struct pxa3xx_nand_host {
 	struct nand_chip	chip;
 	struct pxa3xx_nand_cmdset *cmdset;
@@ -171,6 +176,12 @@ struct pxa3xx_nand_info {
 	struct pxa3xx_nand_host *host[NUM_CHIP_SELECT];
 	unsigned int		state;
 
+	/*
+	 * This driver supports NFCv1 (as found in PXA SoC)
+	 * and NFCv2 (as found in Armada 370/XP SoC).
+	 */
+	enum pxa3xx_nand_variant variant;
+
 	int			cs;
 	int			use_ecc;	/* use HW ECC ? */
 	int			use_dma;	/* use DMA ? */
@@ -1191,11 +1202,28 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 }
 
 static struct of_device_id pxa3xx_nand_dt_ids[] = {
-	{ .compatible = "marvell,pxa3xx-nand" },
+	{
+		.compatible = "marvell,pxa3xx-nand",
+		.data       = (void *) PXA3XX_NAND_VARIANT_PXA,
+	},
+	{
+		.compatible = "marvell,armada370-nand",
+		.data       = (void *) PXA3XX_NAND_VARIANT_ARMADA370,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, pxa3xx_nand_dt_ids);
 
+static enum pxa3xx_nand_variant
+pxa3xx_nand_get_variant(struct platform_device *pdev)
+{
+	const struct of_device_id *of_id =
+			of_match_device(pxa3xx_nand_dt_ids, &pdev->dev);
+	if (!of_id)
+		return PXA3XX_NAND_VARIANT_PXA;
+	return (enum pxa3xx_nand_variant) of_id->data;
+}
+
 static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
 {
 	struct pxa3xx_nand_platform_data *pdata;
@@ -1245,6 +1273,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 	}
 
 	info = platform_get_drvdata(pdev);
+	info->variant = pxa3xx_nand_get_variant(pdev);
 	probe_success = 0;
 	for (cs = 0; cs < pdata->num_cs; cs++) {
 		info->cs = cs;
-- 
1.8.1.5

