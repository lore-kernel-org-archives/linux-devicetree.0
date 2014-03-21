From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 2/4] mtd: nand: pxa3xx: Clean pxa_ecc_init() error handling
Date: Fri, 21 Mar 2014 08:34:48 -0300
Message-ID: <1395401690-25221-3-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395401690-25221-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Simon Guinot <sguinot-D+JDLXUtGQkAvxtiuMwx3w@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Let's make pxa_ecc_init() return a negative errno on error or zero
if succesful, which is standard kernel practice. Also, report the
selected ECC strength and step size, which is important information.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/nand/pxa3xx_nand.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 92b3439..cf7d757 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1353,7 +1353,6 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->mode = NAND_ECC_HW;
 		ecc->size = 512;
 		ecc->strength = 1;
-		return 1;
 
 	} else if (strength == 1 && page_size == 512) {
 		info->chunk_size = 512;
@@ -1362,7 +1361,6 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->mode = NAND_ECC_HW;
 		ecc->size = 512;
 		ecc->strength = 1;
-		return 1;
 
 	/*
 	 * Required ECC: 4-bit correction per 512 bytes
@@ -1388,7 +1386,6 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->size = info->chunk_size;
 		ecc->layout = &ecc_layout_4KB_bch4bit;
 		ecc->strength = 16;
-		return 1;
 
 	/*
 	 * Required ECC: 8-bit correction per 512 bytes
@@ -1403,8 +1400,15 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->size = info->chunk_size;
 		ecc->layout = &ecc_layout_4KB_bch8bit;
 		ecc->strength = 16;
-		return 1;
+	} else {
+		dev_err(&info->pdev->dev,
+			"ECC strength %d at page size %d is not supported\n",
+			strength, page_size);
+		return -ENODEV;
 	}
+
+	dev_info(&info->pdev->dev, "ECC strength %d, ECC step size %d\n",
+		 ecc->strength, ecc->size);
 	return 0;
 }
 
@@ -1526,12 +1530,8 @@ KEEP_CONFIG:
 
 	ret = pxa_ecc_init(info, &chip->ecc, (ecc_strength * 512) / ecc_step,
 			   mtd->writesize);
-	if (!ret) {
-		dev_err(&info->pdev->dev,
-			"ECC strength %d at page size %d is not supported\n",
-			ecc_strength, mtd->writesize);
-		return -ENODEV;
-	}
+	if (ret)
+		return ret;
 
 	/* calculate addressing information */
 	if (mtd->writesize >= 2048)
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
