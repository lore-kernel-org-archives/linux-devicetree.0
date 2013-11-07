From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 20/31] mtd: nand: pxa3xx: Add helper function to set page address
Date: Thu,  7 Nov 2013 12:17:24 -0300
Message-ID: <1383837455-30721-21-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383837455-30721-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Let's simplify the code by first introducing a helper function
to set the page address, as done by the READ0, READOOB and SEQIN
commands.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/nand/pxa3xx_nand.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index aa8768c..660427e 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -587,6 +587,26 @@ static inline int is_buf_blank(uint8_t *buf, size_t len)
 	return 1;
 }
 
+static void set_command_address(struct pxa3xx_nand_info *info,
+		unsigned int page_size, uint16_t column, int page_addr)
+{
+	/* small page addr setting */
+	if (page_size < PAGE_CHUNK_SIZE) {
+		info->ndcb1 = ((page_addr & 0xFFFFFF) << 8)
+				| (column & 0xFF);
+
+		info->ndcb2 = 0;
+	} else {
+		info->ndcb1 = ((page_addr & 0xFFFF) << 16)
+				| (column & 0xFFFF);
+
+		if (page_addr & 0xFF0000)
+			info->ndcb2 = (page_addr & 0xFF0000) >> 16;
+		else
+			info->ndcb2 = 0;
+	}
+}
+
 static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 		uint16_t column, int page_addr)
 {
@@ -650,22 +670,8 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 			info->ndcb0 |= NDCB0_DBC | (NAND_CMD_READSTART << 8);
 
 	case NAND_CMD_SEQIN:
-		/* small page addr setting */
-		if (unlikely(mtd->writesize < PAGE_CHUNK_SIZE)) {
-			info->ndcb1 = ((page_addr & 0xFFFFFF) << 8)
-					| (column & 0xFF);
-
-			info->ndcb2 = 0;
-		} else {
-			info->ndcb1 = ((page_addr & 0xFFFF) << 16)
-					| (column & 0xFFFF);
-
-			if (page_addr & 0xFF0000)
-				info->ndcb2 = (page_addr & 0xFF0000) >> 16;
-			else
-				info->ndcb2 = 0;
-		}
 
+		set_command_address(info, mtd->writesize, column, page_addr);
 		info->buf_count = mtd->writesize + mtd->oobsize;
 		memset(info->data_buff, 0xFF, info->buf_count);
 
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
