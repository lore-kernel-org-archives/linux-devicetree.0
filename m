From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 1/4] mtd: nand: pxa3xx: Normalize ECC strength for ECC scheme selection
Date: Fri, 21 Mar 2014 08:34:47 -0300
Message-ID: <1395401690-25221-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395401690-25221-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Simon Guinot <sguinot-D+JDLXUtGQkAvxtiuMwx3w@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As preparation work to use the ECC devicetree binding, let's normalize
the ECC strength to a 512B step size. This will allow comparison between
different strengths.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/nand/pxa3xx_nand.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 7588fe2..92b3439 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1344,10 +1344,9 @@ static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
 }
 
 static int pxa_ecc_init(struct pxa3xx_nand_info *info,
-			struct nand_ecc_ctrl *ecc,
-			int strength, int ecc_stepsize, int page_size)
+			struct nand_ecc_ctrl *ecc, int strength, int page_size)
 {
-	if (strength == 1 && ecc_stepsize == 512 && page_size == 2048) {
+	if (strength == 1 && page_size == 2048) {
 		info->chunk_size = 2048;
 		info->spare_size = 40;
 		info->ecc_size = 24;
@@ -1356,7 +1355,7 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->strength = 1;
 		return 1;
 
-	} else if (strength == 1 && ecc_stepsize == 512 && page_size == 512) {
+	} else if (strength == 1 && page_size == 512) {
 		info->chunk_size = 512;
 		info->spare_size = 8;
 		info->ecc_size = 8;
@@ -1369,7 +1368,7 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 	 * Required ECC: 4-bit correction per 512 bytes
 	 * Select: 16-bit correction per 2048 bytes
 	 */
-	} else if (strength == 4 && ecc_stepsize == 512 && page_size == 2048) {
+	} else if (strength == 4 && page_size == 2048) {
 		info->ecc_bch = 1;
 		info->chunk_size = 2048;
 		info->spare_size = 32;
@@ -1380,7 +1379,7 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->strength = 16;
 		return 1;
 
-	} else if (strength == 4 && ecc_stepsize == 512 && page_size == 4096) {
+	} else if (strength == 4 && page_size == 4096) {
 		info->ecc_bch = 1;
 		info->chunk_size = 2048;
 		info->spare_size = 32;
@@ -1395,7 +1394,7 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 	 * Required ECC: 8-bit correction per 512 bytes
 	 * Select: 16-bit correction per 1024 bytes
 	 */
-	} else if (strength == 8 && ecc_stepsize == 512 && page_size == 4096) {
+	} else if (strength == 8 && page_size == 4096) {
 		info->ecc_bch = 1;
 		info->chunk_size = 1024;
 		info->spare_size = 0;
@@ -1525,8 +1524,8 @@ KEEP_CONFIG:
 		ecc_step = 512;
 	}
 
-	ret = pxa_ecc_init(info, &chip->ecc, ecc_strength,
-			   ecc_step, mtd->writesize);
+	ret = pxa_ecc_init(info, &chip->ecc, (ecc_strength * 512) / ecc_step,
+			   mtd->writesize);
 	if (!ret) {
 		dev_err(&info->pdev->dev,
 			"ECC strength %d at page size %d is not supported\n",
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
