From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 09/31] mtd: nand: pxa3xx: read_page() returns max_bitflips
Date: Thu,  7 Nov 2013 12:17:13 -0300
Message-ID: <1383837455-30721-10-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383837455-30721-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As per the ecc.read_page() prototype, we must return the maximum number
of bitflips that were corrected on any one region covering an ecc step.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/nand/pxa3xx_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index c578ca7..521d43e 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -751,6 +751,7 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
 {
 	struct pxa3xx_nand_host *host = mtd->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
+	int max_bitflips = 0;
 
 	chip->read_buf(mtd, buf, mtd->writesize);
 	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
@@ -758,6 +759,7 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
 	if (info->retcode == ERR_SBERR) {
 		switch (info->use_ecc) {
 		case 1:
+			max_bitflips = 1;
 			mtd->ecc_stats.corrected++;
 			break;
 		case 0:
@@ -776,7 +778,7 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
 			mtd->ecc_stats.failed++;
 	}
 
-	return 0;
+	return max_bitflips;
 }
 
 static uint8_t pxa3xx_nand_read_byte(struct mtd_info *mtd)
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
