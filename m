From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 15/20] mtd: nand: qcom: support for command descriptor formation
Date: Fri, 11 Aug 2017 17:09:30 +0530
Message-ID: <1502451575-15712-16-git-send-email-absahu@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@free-electrons.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

1. Add the function for command descriptor preparation which will
   be used only by BAM DMA and it will form the DMA descriptors
   containing command elements
2. DMA_PREP_CMD flag should be used for forming command DMA
   descriptors

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 108 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 92 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index d17c466..f2cb696 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -194,6 +194,14 @@
 	      ((size) << READ_LOCATION_SIZE) |			\
 	      ((is_last) << READ_LOCATION_LAST))
 
+/* Returns the NAND register physical address */
+#define nandc_reg_phys(chip, offset) ((chip)->base_phys + (offset))
+
+/* Returns the dma address for reg read buffer */
+#define reg_buf_dma_addr(chip, vaddr) \
+	((chip)->reg_read_dma + \
+	((uint8_t *)(vaddr) - (uint8_t *)(chip)->reg_read_buf))
+
 /* Returns the actual register address for NAND_FLASH_DEV_* */
 #define nandc_dev_addr(nandc, reg) ((nandc)->props->flash_dev_offset + (reg))
 
@@ -311,7 +319,8 @@ struct nandc_regs {
  *				controller
  * @dev:			parent device
  * @base:			MMIO base
- * @base_dma:			physical base address of controller registers
+ * @base_phys:			physical base address of controller registers
+ * @base_dma:			dma base address of controller registers
  * @core_clk:			controller clock
  * @aon_clk:			another controller clock
  *
@@ -344,6 +353,7 @@ struct qcom_nand_controller {
 	struct device *dev;
 
 	void __iomem *base;
+	phys_addr_t base_phys;
 	dma_addr_t base_dma;
 
 	struct clk *core_clk;
@@ -745,6 +755,66 @@ static int prepare_bam_async_desc(struct qcom_nand_controller *nandc,
 }
 
 /*
+ * Prepares the command descriptor for BAM DMA which will be used for NAND
+ * register reads and writes. The command descriptor requires the command
+ * to be formed in command element type so this function uses the command
+ * element from bam transaction ce array and fills the same with required
+ * data. A single SGL can contain multiple command elements so
+ * NAND_BAM_NEXT_SGL will be used for starting the separate SGL
+ * after the current command element.
+ */
+static int prep_bam_dma_desc_cmd(struct qcom_nand_controller *nandc, bool read,
+				 int reg_off, const void *vaddr,
+				 int size, unsigned int flags)
+{
+	int bam_ce_size;
+	int i, ret;
+	struct bam_cmd_element *bam_ce_buffer;
+	struct bam_transaction *bam_txn = nandc->bam_txn;
+
+	bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_pos];
+
+	/* fill the command desc */
+	for (i = 0; i < size; i++) {
+		if (read)
+			bam_prep_ce(&bam_ce_buffer[i],
+				    nandc_reg_phys(nandc, reg_off + 4 * i),
+				    BAM_READ_COMMAND,
+				    reg_buf_dma_addr(nandc,
+						     (__le32 *)vaddr + i));
+		else
+			bam_prep_ce_le32(&bam_ce_buffer[i],
+					 nandc_reg_phys(nandc, reg_off + 4 * i),
+					 BAM_WRITE_COMMAND,
+					 *((__le32 *)vaddr + i));
+	}
+
+	bam_txn->bam_ce_pos += size;
+
+	/* use the separate sgl after this command */
+	if (flags & NAND_BAM_NEXT_SGL) {
+		bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_start];
+		bam_ce_size = (bam_txn->bam_ce_pos -
+				bam_txn->bam_ce_start) *
+				sizeof(struct bam_cmd_element);
+		sg_set_buf(&bam_txn->cmd_sgl[bam_txn->cmd_sgl_pos],
+			   bam_ce_buffer, bam_ce_size);
+		bam_txn->cmd_sgl_pos++;
+		bam_txn->bam_ce_start = bam_txn->bam_ce_pos;
+
+		if (flags & NAND_BAM_NWD) {
+			ret = prepare_bam_async_desc(nandc, nandc->cmd_chan,
+						     DMA_PREP_FENCE |
+						     DMA_PREP_CMD);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
  * Prepares the data descriptor for BAM DMA which will be used for NAND
  * data reads and writes.
  */
@@ -861,19 +931,22 @@ static int read_reg_dma(struct qcom_nand_controller *nandc, int first,
 {
 	bool flow_control = false;
 	void *vaddr;
-	int size;
 
-	if (first == NAND_READ_ID || first == NAND_FLASH_STATUS)
-		flow_control = true;
+	vaddr = nandc->reg_read_buf + nandc->reg_read_pos;
+	nandc->reg_read_pos += num_regs;
 
 	if (first == NAND_DEV_CMD_VLD || first == NAND_DEV_CMD1)
 		first = nandc_dev_addr(nandc, first);
 
-	size = num_regs * sizeof(u32);
-	vaddr = nandc->reg_read_buf + nandc->reg_read_pos;
-	nandc->reg_read_pos += num_regs;
+	if (nandc->props->is_bam)
+		return prep_bam_dma_desc_cmd(nandc, true, first, vaddr,
+					     num_regs, flags);
 
-	return prep_adm_dma_desc(nandc, true, first, vaddr, size, flow_control);
+	if (first == NAND_READ_ID || first == NAND_FLASH_STATUS)
+		flow_control = true;
+
+	return prep_adm_dma_desc(nandc, true, first, vaddr,
+				 num_regs * sizeof(u32), flow_control);
 }
 
 /*
@@ -889,13 +962,9 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 	bool flow_control = false;
 	struct nandc_regs *regs = nandc->regs;
 	void *vaddr;
-	int size;
 
 	vaddr = offset_to_nandc_reg(regs, first);
 
-	if (first == NAND_FLASH_CMD)
-		flow_control = true;
-
 	if (first == NAND_ERASED_CW_DETECT_CFG) {
 		if (flags & NAND_ERASED_CW_SET)
 			vaddr = &regs->erased_cw_detect_cfg_set;
@@ -912,10 +981,15 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 	if (first == NAND_DEV_CMD_VLD_RESTORE || first == NAND_DEV_CMD_VLD)
 		first = nandc_dev_addr(nandc, NAND_DEV_CMD_VLD);
 
-	size = num_regs * sizeof(u32);
+	if (nandc->props->is_bam)
+		return prep_bam_dma_desc_cmd(nandc, false, first, vaddr,
+					     num_regs, flags);
+
+	if (first == NAND_FLASH_CMD)
+		flow_control = true;
 
-	return prep_adm_dma_desc(nandc, false, first, vaddr, size,
-				 flow_control);
+	return prep_adm_dma_desc(nandc, false, first, vaddr,
+				 num_regs * sizeof(u32), flow_control);
 }
 
 /*
@@ -1177,7 +1251,8 @@ static int submit_descs(struct qcom_nand_controller *nandc)
 		}
 
 		if (bam_txn->cmd_sgl_pos > bam_txn->cmd_sgl_start) {
-			r = prepare_bam_async_desc(nandc, nandc->cmd_chan, 0);
+			r = prepare_bam_async_desc(nandc, nandc->cmd_chan,
+						   DMA_PREP_CMD);
 			if (r)
 				return r;
 		}
@@ -2713,6 +2788,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (IS_ERR(nandc->base))
 		return PTR_ERR(nandc->base);
 
+	nandc->base_phys = res->start;
 	nandc->base_dma = phys_to_dma(dev, (phys_addr_t)res->start);
 
 	nandc->core_clk = devm_clk_get(dev, "core");
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
