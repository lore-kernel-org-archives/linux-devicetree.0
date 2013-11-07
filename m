From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 25/31] mtd: nand: pxa3xx: Add a read/write buffers markers
Date: Thu,  7 Nov 2013 12:17:29 -0300
Message-ID: <1383837455-30721-26-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383837455-30721-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In preparation to support multiple (aka chunked, aka splitted)
page I/O, this commit adds 'data_buff_pos' and 'oob_buff_pos' fields
to keep track of where the next read (or write) should be done.

This will allow multiple calls to handle_data_pio() to continue
the read (or write) operation.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/nand/pxa3xx_nand.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index e09c901..59efd72 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -176,6 +176,8 @@ struct pxa3xx_nand_info {
 	unsigned int 		buf_start;
 	unsigned int		buf_count;
 	unsigned int		buf_size;
+	unsigned int		data_buff_pos;
+	unsigned int		oob_buff_pos;
 
 	/* DMA information */
 	int			drcmr_dat;
@@ -338,11 +340,12 @@ static void pxa3xx_nand_set_timing(struct pxa3xx_nand_host *host,
  * spare and ECC configuration.
  * Only applicable to READ0, READOOB and PAGEPROG commands.
  */
-static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
+static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info,
+				struct mtd_info *mtd)
 {
 	int oob_enable = info->reg_ndcr & NDCR_SPARE_EN;
 
-	info->data_size = info->fifo_size;
+	info->data_size = mtd->writesize;
 	if (!oob_enable)
 		return;
 
@@ -430,26 +433,39 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
 
 static void handle_data_pio(struct pxa3xx_nand_info *info)
 {
+	unsigned int do_bytes = min(info->data_size, info->fifo_size);
+
 	switch (info->state) {
 	case STATE_PIO_WRITING:
-		__raw_writesl(info->mmio_base + NDDB, info->data_buff,
-				DIV_ROUND_UP(info->data_size, 4));
+		__raw_writesl(info->mmio_base + NDDB,
+			      info->data_buff + info->data_buff_pos,
+			      DIV_ROUND_UP(do_bytes, 4));
+
 		if (info->oob_size > 0)
-			__raw_writesl(info->mmio_base + NDDB, info->oob_buff,
-					DIV_ROUND_UP(info->oob_size, 4));
+			__raw_writesl(info->mmio_base + NDDB,
+				      info->oob_buff + info->oob_buff_pos,
+				      DIV_ROUND_UP(info->oob_size, 4));
 		break;
 	case STATE_PIO_READING:
-		__raw_readsl(info->mmio_base + NDDB, info->data_buff,
-				DIV_ROUND_UP(info->data_size, 4));
+		__raw_readsl(info->mmio_base + NDDB,
+			     info->data_buff + info->data_buff_pos,
+			     DIV_ROUND_UP(do_bytes, 4));
+
 		if (info->oob_size > 0)
-			__raw_readsl(info->mmio_base + NDDB, info->oob_buff,
-					DIV_ROUND_UP(info->oob_size, 4));
+			__raw_readsl(info->mmio_base + NDDB,
+				     info->oob_buff + info->oob_buff_pos,
+				     DIV_ROUND_UP(info->oob_size, 4));
 		break;
 	default:
 		dev_err(&info->pdev->dev, "%s: invalid state %d\n", __func__,
 				info->state);
 		BUG();
 	}
+
+	/* Update buffer pointers for multi-page read/write */
+	info->data_buff_pos += do_bytes;
+	info->oob_buff_pos += info->oob_size;
+	info->data_size -= do_bytes;
 }
 
 #ifdef ARCH_HAS_DMA
@@ -616,6 +632,8 @@ static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 	info->buf_start		= 0;
 	info->buf_count		= 0;
 	info->oob_size		= 0;
+	info->data_buff_pos	= 0;
+	info->oob_buff_pos	= 0;
 	info->use_ecc		= 0;
 	info->use_spare		= 1;
 	info->retcode		= ERR_NONE;
@@ -626,7 +644,7 @@ static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 	case NAND_CMD_PAGEPROG:
 		info->use_ecc = 1;
 	case NAND_CMD_READOOB:
-		pxa3xx_set_datasize(info);
+		pxa3xx_set_datasize(info, mtd);
 		break;
 	case NAND_CMD_PARAM:
 		info->use_spare = 0;
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
