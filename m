From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 07/20] mtd: nand: qcom: add BAM DMA descriptor handling
Date: Fri, 11 Aug 2017 17:09:22 +0530
Message-ID: <1502451575-15712-8-git-send-email-absahu@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@free-electrons.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

1. prepare_bam_async_desc is the function which will call
   all the DMA API’s. It will fetch the outstanding scatter gather
   list for passed channel and will do the DMA descriptor formation.
   The DMA flag is dependent upon the type of channel.

2. For ADM DMA, the descriptor is being formed for every DMA
   request so its sgl count will be always 1 while in BAM DMA, the
   clubbing of descriptor is being done to increase throughput.

3. ADM DMA uses only one channel while in BAM DMA, data descriptors
   will be submitted to tx channel (for write) or rx channel
   (for read) and all the registers read/write descriptors in
   command channel.

Reviewed-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 148 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 136 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 4f8306e..f52a692 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -203,11 +203,27 @@ struct bam_transaction {
 	u32 rx_sgl_start;
 };
 
+/*
+ * This data type corresponds to the nand dma descriptor
+ * @list - list for desc_info
+ * @dir - DMA transfer direction
+ * @adm_sgl - sgl which will be used for single sgl dma descriptor. Only used by
+ *	      ADM
+ * @bam_sgl - sgl which will be used for dma descriptor. Only used by BAM
+ * @sgl_cnt - number of SGL in bam_sgl. Only used by BAM
+ * @dma_desc - low level DMA engine descriptor
+ */
 struct desc_info {
 	struct list_head node;
 
 	enum dma_data_direction dir;
-	struct scatterlist sgl;
+	union {
+		struct scatterlist adm_sgl;
+		struct {
+			struct scatterlist *bam_sgl;
+			int sgl_cnt;
+		};
+	};
 	struct dma_async_tx_descriptor *dma_desc;
 };
 
@@ -568,9 +584,78 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 }
 
-static int prep_dma_desc(struct qcom_nand_controller *nandc, bool read,
-			 int reg_off, const void *vaddr, int size,
-			 bool flow_control)
+/*
+ * Maps the scatter gather list for DMA transfer and forms the DMA descriptor
+ * for BAM. This descriptor will be added in the NAND DMA descriptor queue
+ * which will be submitted to DMA engine.
+ */
+static int prepare_bam_async_desc(struct qcom_nand_controller *nandc,
+				  struct dma_chan *chan,
+				  unsigned long flags)
+{
+	struct desc_info *desc;
+	struct scatterlist *sgl;
+	unsigned int sgl_cnt;
+	int ret;
+	struct bam_transaction *bam_txn = nandc->bam_txn;
+	enum dma_transfer_direction dir_eng;
+	struct dma_async_tx_descriptor *dma_desc;
+
+	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+
+	if (chan == nandc->cmd_chan) {
+		sgl = &bam_txn->cmd_sgl[bam_txn->cmd_sgl_start];
+		sgl_cnt = bam_txn->cmd_sgl_pos - bam_txn->cmd_sgl_start;
+		bam_txn->cmd_sgl_start = bam_txn->cmd_sgl_pos;
+		dir_eng = DMA_MEM_TO_DEV;
+		desc->dir = DMA_TO_DEVICE;
+	} else if (chan == nandc->tx_chan) {
+		sgl = &bam_txn->data_sgl[bam_txn->tx_sgl_start];
+		sgl_cnt = bam_txn->tx_sgl_pos - bam_txn->tx_sgl_start;
+		bam_txn->tx_sgl_start = bam_txn->tx_sgl_pos;
+		dir_eng = DMA_MEM_TO_DEV;
+		desc->dir = DMA_TO_DEVICE;
+	} else {
+		sgl = &bam_txn->data_sgl[bam_txn->rx_sgl_start];
+		sgl_cnt = bam_txn->rx_sgl_pos - bam_txn->rx_sgl_start;
+		bam_txn->rx_sgl_start = bam_txn->rx_sgl_pos;
+		dir_eng = DMA_DEV_TO_MEM;
+		desc->dir = DMA_FROM_DEVICE;
+	}
+
+	sg_mark_end(sgl + sgl_cnt - 1);
+	ret = dma_map_sg(nandc->dev, sgl, sgl_cnt, desc->dir);
+	if (ret == 0) {
+		dev_err(nandc->dev, "failure in mapping desc\n");
+		kfree(desc);
+		return -ENOMEM;
+	}
+
+	desc->sgl_cnt = sgl_cnt;
+	desc->bam_sgl = sgl;
+
+	dma_desc = dmaengine_prep_slave_sg(chan, sgl, sgl_cnt, dir_eng,
+					   flags);
+
+	if (!dma_desc) {
+		dev_err(nandc->dev, "failure in prep desc\n");
+		dma_unmap_sg(nandc->dev, sgl, sgl_cnt, desc->dir);
+		kfree(desc);
+		return -EINVAL;
+	}
+
+	desc->dma_desc = dma_desc;
+
+	list_add_tail(&desc->node, &nandc->desc_list);
+
+	return 0;
+}
+
+static int prep_adm_dma_desc(struct qcom_nand_controller *nandc, bool read,
+			     int reg_off, const void *vaddr, int size,
+			     bool flow_control)
 {
 	struct desc_info *desc;
 	struct dma_async_tx_descriptor *dma_desc;
@@ -583,7 +668,7 @@ static int prep_dma_desc(struct qcom_nand_controller *nandc, bool read,
 	if (!desc)
 		return -ENOMEM;
 
-	sgl = &desc->sgl;
+	sgl = &desc->adm_sgl;
 
 	sg_init_one(sgl, vaddr, size);
 
@@ -659,7 +744,7 @@ static int read_reg_dma(struct qcom_nand_controller *nandc, int first,
 	vaddr = nandc->reg_read_buf + nandc->reg_read_pos;
 	nandc->reg_read_pos += num_regs;
 
-	return prep_dma_desc(nandc, true, first, vaddr, size, flow_control);
+	return prep_adm_dma_desc(nandc, true, first, vaddr, size, flow_control);
 }
 
 /*
@@ -690,7 +775,8 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 
 	size = num_regs * sizeof(u32);
 
-	return prep_dma_desc(nandc, false, first, vaddr, size, flow_control);
+	return prep_adm_dma_desc(nandc, false, first, vaddr, size,
+				 flow_control);
 }
 
 /*
@@ -704,7 +790,7 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
 			 const u8 *vaddr, int size)
 {
-	return prep_dma_desc(nandc, true, reg_off, vaddr, size, false);
+	return prep_adm_dma_desc(nandc, true, reg_off, vaddr, size, false);
 }
 
 /*
@@ -718,7 +804,7 @@ static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
 static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
 			  const u8 *vaddr, int size)
 {
-	return prep_dma_desc(nandc, false, reg_off, vaddr, size, false);
+	return prep_adm_dma_desc(nandc, false, reg_off, vaddr, size, false);
 }
 
 /*
@@ -917,12 +1003,43 @@ static int submit_descs(struct qcom_nand_controller *nandc)
 {
 	struct desc_info *desc;
 	dma_cookie_t cookie = 0;
+	struct bam_transaction *bam_txn = nandc->bam_txn;
+	int r;
+
+	if (nandc->props->is_bam) {
+		if (bam_txn->rx_sgl_pos > bam_txn->rx_sgl_start) {
+			r = prepare_bam_async_desc(nandc, nandc->rx_chan, 0);
+			if (r)
+				return r;
+		}
+
+		if (bam_txn->tx_sgl_pos > bam_txn->tx_sgl_start) {
+			r = prepare_bam_async_desc(nandc, nandc->tx_chan,
+						   DMA_PREP_INTERRUPT);
+			if (r)
+				return r;
+		}
+
+		if (bam_txn->cmd_sgl_pos > bam_txn->cmd_sgl_start) {
+			r = prepare_bam_async_desc(nandc, nandc->cmd_chan, 0);
+			if (r)
+				return r;
+		}
+	}
 
 	list_for_each_entry(desc, &nandc->desc_list, node)
 		cookie = dmaengine_submit(desc->dma_desc);
 
-	if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE)
-		return -ETIMEDOUT;
+	if (nandc->props->is_bam) {
+		dma_async_issue_pending(nandc->tx_chan);
+		dma_async_issue_pending(nandc->rx_chan);
+
+		if (dma_sync_wait(nandc->cmd_chan, cookie) != DMA_COMPLETE)
+			return -ETIMEDOUT;
+	} else {
+		if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE)
+			return -ETIMEDOUT;
+	}
 
 	return 0;
 }
@@ -933,7 +1050,14 @@ static void free_descs(struct qcom_nand_controller *nandc)
 
 	list_for_each_entry_safe(desc, n, &nandc->desc_list, node) {
 		list_del(&desc->node);
-		dma_unmap_sg(nandc->dev, &desc->sgl, 1, desc->dir);
+
+		if (nandc->props->is_bam)
+			dma_unmap_sg(nandc->dev, desc->bam_sgl,
+				     desc->sgl_cnt, desc->dir);
+		else
+			dma_unmap_sg(nandc->dev, &desc->adm_sgl, 1,
+				     desc->dir);
+
 		kfree(desc);
 	}
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
