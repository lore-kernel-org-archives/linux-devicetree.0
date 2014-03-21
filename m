From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 3/4] mtd: nand: pxa3xx: Use ECC strength and step size devicetree binding
Date: Fri, 21 Mar 2014 08:34:49 -0300
Message-ID: <1395401690-25221-4-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395401690-25221-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Simon Guinot <sguinot-D+JDLXUtGQkAvxtiuMwx3w@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds support for the user to specify the ECC strength
and step size through the devicetree. We keep the previous behavior,
when there is no DT parameter provided.

Also, if there is an ONFI-specified minimum ECC strength requirement,
and the DT-specified ECC strength is weaker, print a warning and try to
select a strength compatible with the ONFI requirement.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/nand/pxa3xx_nand.c                | 47 +++++++++++++++++++--------
 include/linux/platform_data/mtd-nand-pxa3xx.h |  3 ++
 2 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index cf7d757..cc13896 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1344,8 +1344,30 @@ static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
 }
 
 static int pxa_ecc_init(struct pxa3xx_nand_info *info,
-			struct nand_ecc_ctrl *ecc, int strength, int page_size)
+			struct nand_chip *chip,
+			struct pxa3xx_nand_platform_data *pdata,
+			unsigned int page_size)
 {
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	unsigned int strength, onfi_strength;
+
+	/* We need to normalize the ECC strengths, in order to compare them. */
+	strength = (pdata->ecc_strength * 512) / pdata->ecc_step_size;
+	onfi_strength = (chip->ecc_strength_ds * 512) / chip->ecc_step_ds;
+
+	/*
+	 * The user requested ECC strength cannot be weaker than the ONFI
+	 * minimum specified ECC strength.
+	 */
+	if (strength && strength < onfi_strength) {
+		dev_warn(&info->pdev->dev,
+			 "requested ECC strength is too weak\n");
+		strength = onfi_strength;
+	}
+
+	if (!strength)
+		strength = onfi_strength ? onfi_strength : 1;
+
 	if (strength == 1 && page_size == 2048) {
 		info->chunk_size = 2048;
 		info->spare_size = 40;
@@ -1375,7 +1397,6 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->size = info->chunk_size;
 		ecc->layout = &ecc_layout_2KB_bch4bit;
 		ecc->strength = 16;
-		return 1;
 
 	} else if (strength == 4 && page_size == 4096) {
 		info->ecc_bch = 1;
@@ -1424,7 +1445,6 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	uint32_t id = -1;
 	uint64_t chipsize;
 	int i, ret, num;
-	uint16_t ecc_strength, ecc_step;
 
 	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
 		goto KEEP_CONFIG;
@@ -1519,17 +1539,8 @@ KEEP_CONFIG:
 		}
 	}
 
-	ecc_strength = chip->ecc_strength_ds;
-	ecc_step = chip->ecc_step_ds;
-
-	/* Set default ECC strength requirements on non-ONFI devices */
-	if (ecc_strength < 1 && ecc_step < 1) {
-		ecc_strength = 1;
-		ecc_step = 512;
-	}
-
-	ret = pxa_ecc_init(info, &chip->ecc, (ecc_strength * 512) / ecc_step,
-			   mtd->writesize);
+	/* Selects an ECC and fills pxa3xx_nand_info and nand_chip */
+	ret = pxa_ecc_init(info, chip, pdata, mtd->writesize);
 	if (ret)
 		return ret;
 
@@ -1729,6 +1740,14 @@ static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
 	of_property_read_u32(np, "num-cs", &pdata->num_cs);
 	pdata->flash_bbt = of_get_nand_on_flash_bbt(np);
 
+	pdata->ecc_strength = of_get_nand_ecc_strength(np);
+	if (pdata->ecc_strength < 0)
+		pdata->ecc_strength = 0;
+
+	pdata->ecc_step_size = of_get_nand_ecc_step_size(np);
+	if (pdata->ecc_step_size < 0)
+		pdata->ecc_step_size = 0;
+
 	pdev->dev.platform_data = pdata;
 
 	return 0;
diff --git a/include/linux/platform_data/mtd-nand-pxa3xx.h b/include/linux/platform_data/mtd-nand-pxa3xx.h
index a941471..5c0f2e3 100644
--- a/include/linux/platform_data/mtd-nand-pxa3xx.h
+++ b/include/linux/platform_data/mtd-nand-pxa3xx.h
@@ -58,6 +58,9 @@ struct pxa3xx_nand_platform_data {
 	/* use an flash-based bad block table */
 	bool	flash_bbt;
 
+	/* requested ECC strength and ECC step size */
+	unsigned int ecc_strength, ecc_step_size;
+
 	const struct mtd_partition		*parts[NUM_CHIP_SELECT];
 	unsigned int				nr_parts[NUM_CHIP_SELECT];
 
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
