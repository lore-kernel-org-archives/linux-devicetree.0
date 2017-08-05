From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 12/20] mtd: nand: qcom: QPIC data descriptors handling
Date: Sat,  5 Aug 2017 21:49:50 +0530
Message-ID: <1501949998-29859-13-git-send-email-absahu@codeaurora.org>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, boris.brezillon@free-electrons.com, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

1. Add the data descriptor preparation function which will be used
   only by BAM DMA for forming the data SGL’s
2. Add clear BAM transaction and call it before every new request
3. Check DMA mode for ADM or BAM and call the appropriate
   descriptor formation function.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 76 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index af69a89..d7a2ca4 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -472,6 +472,27 @@ static void free_bam_transaction(struct qcom_nand_controller *nandc)
 	return bam_txn;
 }
 
+/* Clears the BAM transaction indexes */
+static void clear_bam_transaction(struct qcom_nand_controller *nandc)
+{
+	struct bam_transaction *bam_txn = nandc->bam_txn;
+
+	if (!nandc->props->is_bam)
+		return;
+
+	bam_txn->cmd_sgl_pos = 0;
+	bam_txn->cmd_sgl_start = 0;
+	bam_txn->tx_sgl_pos = 0;
+	bam_txn->tx_sgl_start = 0;
+	bam_txn->rx_sgl_pos = 0;
+	bam_txn->rx_sgl_start = 0;
+
+	sg_init_table(bam_txn->cmd_sgl, nandc->max_cwperpage *
+		      QPIC_PER_CW_CMD_SGL);
+	sg_init_table(bam_txn->data_sgl, nandc->max_cwperpage *
+		      QPIC_PER_CW_DATA_SGL);
+}
+
 static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
 {
 	return container_of(chip, struct qcom_nand_host, chip);
@@ -703,6 +724,41 @@ static int prepare_bam_async_desc(struct qcom_nand_controller *nandc,
 	return 0;
 }
 
+/*
+ * Prepares the data descriptor for BAM DMA which will be used for NAND
+ * data reads and writes.
+ */
+static int prep_bam_dma_desc_data(struct qcom_nand_controller *nandc, bool read,
+				  const void *vaddr,
+				  int size, unsigned int flags)
+{
+	int ret;
+	struct bam_transaction *bam_txn = nandc->bam_txn;
+
+	if (read) {
+		sg_set_buf(&bam_txn->data_sgl[bam_txn->rx_sgl_pos],
+			   vaddr, size);
+		bam_txn->rx_sgl_pos++;
+	} else {
+		sg_set_buf(&bam_txn->data_sgl[bam_txn->tx_sgl_pos],
+			   vaddr, size);
+		bam_txn->tx_sgl_pos++;
+
+		/*
+		 * BAM will only set EOT for DMA_PREP_INTERRUPT so if this flag
+		 * is not set, form the DMA descriptor
+		 */
+		if (!(flags & NAND_BAM_NO_EOT)) {
+			ret = prepare_bam_async_desc(nandc, nandc->tx_chan,
+						     DMA_PREP_INTERRUPT);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int prep_adm_dma_desc(struct qcom_nand_controller *nandc, bool read,
 			     int reg_off, const void *vaddr, int size,
 			     bool flow_control)
@@ -850,6 +906,9 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
 			 const u8 *vaddr, int size, unsigned int flags)
 {
+	if (nandc->props->is_bam)
+		return prep_bam_dma_desc_data(nandc, true, vaddr, size, flags);
+
 	return prep_adm_dma_desc(nandc, true, reg_off, vaddr, size, false);
 }
 
@@ -864,6 +923,9 @@ static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
 static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
 			  const u8 *vaddr, int size, unsigned int flags)
 {
+	if (nandc->props->is_bam)
+		return prep_bam_dma_desc_data(nandc, false, vaddr, size, flags);
+
 	return prep_adm_dma_desc(nandc, false, reg_off, vaddr, size, false);
 }
 
@@ -1152,6 +1214,10 @@ static void pre_command(struct qcom_nand_host *host, int command)
 	host->last_command = command;
 
 	clear_read_regs(nandc);
+
+	if (command == NAND_CMD_RESET || command == NAND_CMD_READID ||
+	    command == NAND_CMD_PARAM || command == NAND_CMD_ERASE1)
+		clear_bam_transaction(nandc);
 }
 
 /*
@@ -1556,6 +1622,7 @@ static int qcom_nandc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	data_buf = buf;
 	oob_buf = oob_required ? chip->oob_poi : NULL;
 
+	clear_bam_transaction(nandc);
 	ret = read_page_ecc(host, data_buf, oob_buf);
 	if (ret) {
 		dev_err(nandc->dev, "failure to read page\n");
@@ -1581,6 +1648,8 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 	oob_buf = chip->oob_poi;
 
 	host->use_ecc = false;
+
+	clear_bam_transaction(nandc);
 	update_rw_regs(host, ecc->steps, true);
 	config_nand_page_read(nandc);
 
@@ -1652,6 +1721,7 @@ static int qcom_nandc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 	int ret;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	host->use_ecc = true;
 	set_address(host, 0, page);
@@ -1675,6 +1745,7 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	int i, ret;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	data_buf = (u8 *)buf;
 	oob_buf = chip->oob_poi;
@@ -1740,6 +1811,7 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
 	int i, ret;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	data_buf = (u8 *)buf;
 	oob_buf = chip->oob_poi;
@@ -1816,11 +1888,13 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 
 	host->use_ecc = true;
 
+	clear_bam_transaction(nandc);
 	ret = copy_last_cw(host, page);
 	if (ret)
 		return ret;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	/* calculate the data and oob size for the last codeword/step */
 	data_size = ecc->size - ((ecc->steps - 1) << 2);
@@ -1873,6 +1947,7 @@ static int qcom_nandc_block_bad(struct mtd_info *mtd, loff_t ofs)
 	 */
 	host->use_ecc = false;
 
+	clear_bam_transaction(nandc);
 	ret = copy_last_cw(host, page);
 	if (ret)
 		goto err;
@@ -1903,6 +1978,7 @@ static int qcom_nandc_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	int page, ret, status = 0;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	/*
 	 * to mark the BBM as bad, we flash the entire last codeword with 0s.
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
