From: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 6/6] dmaengine: qcom: bam_dma: rename BAM_MAX_DATA_SIZE define
Date: Mon, 11 Apr 2016 11:38:43 +0300
Message-ID: <1460363923-16296-7-git-send-email-stanimir.varbanov@linaro.org>
References: <1460363923-16296-1-git-send-email-stanimir.varbanov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460363923-16296-1-git-send-email-stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pramod Gurav <gpramod-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It seems that the define has not been with acurate name and
makes confusion while reading the code. The more acurate
name should be BAM_FIFO_SIZE.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/dma/qcom/bam_dma.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 7e5ad1c25e21..969b48176745 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -342,7 +342,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 #define BAM_DESC_FIFO_SIZE	SZ_32K
 #define MAX_DESCRIPTORS (BAM_DESC_FIFO_SIZE / sizeof(struct bam_desc_hw) - 1)
-#define BAM_MAX_DATA_SIZE	(SZ_32K - 8)
+#define BAM_FIFO_SIZE	(SZ_32K - 8)
 
 struct bam_chan {
 	struct virt_dma_chan vc;
@@ -459,7 +459,7 @@ static void bam_chan_init_hw(struct bam_chan *bchan,
 	 */
 	writel_relaxed(ALIGN(bchan->fifo_phys, sizeof(struct bam_desc_hw)),
 			bam_addr(bdev, bchan->id, BAM_P_DESC_FIFO_ADDR));
-	writel_relaxed(BAM_MAX_DATA_SIZE,
+	writel_relaxed(BAM_FIFO_SIZE,
 			bam_addr(bdev, bchan->id, BAM_P_FIFO_SIZES));
 
 	/* enable the per pipe interrupts, enable EOT, ERR, and INT irqs */
@@ -605,7 +605,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 
 	/* calculate number of required entries */
 	for_each_sg(sgl, sg, sg_len, i)
-		num_alloc += DIV_ROUND_UP(sg_dma_len(sg), BAM_MAX_DATA_SIZE);
+		num_alloc += DIV_ROUND_UP(sg_dma_len(sg), BAM_FIFO_SIZE);
 
 	/* allocate enough room to accomodate the number of entries */
 	async_desc = kzalloc(sizeof(*async_desc) +
@@ -636,10 +636,10 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 			desc->addr = cpu_to_le32(sg_dma_address(sg) +
 						 curr_offset);
 
-			if (remainder > BAM_MAX_DATA_SIZE) {
-				desc->size = cpu_to_le16(BAM_MAX_DATA_SIZE);
-				remainder -= BAM_MAX_DATA_SIZE;
-				curr_offset += BAM_MAX_DATA_SIZE;
+			if (remainder > BAM_FIFO_SIZE) {
+				desc->size = cpu_to_le16(BAM_FIFO_SIZE);
+				remainder -= BAM_FIFO_SIZE;
+				curr_offset += BAM_FIFO_SIZE;
 			} else {
 				desc->size = cpu_to_le16(remainder);
 				remainder = 0;
@@ -1174,7 +1174,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	/* set max dma segment size */
 	bdev->common.dev = bdev->dev;
 	bdev->common.dev->dma_parms = &bdev->dma_parms;
-	ret = dma_set_max_seg_size(bdev->common.dev, BAM_MAX_DATA_SIZE);
+	ret = dma_set_max_seg_size(bdev->common.dev, BAM_FIFO_SIZE);
 	if (ret) {
 		dev_err(bdev->dev, "cannot set maximum segment size\n");
 		goto err_bam_channel_exit;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
