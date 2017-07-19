From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 21/25] mtd: nand: qcom: support for QPIC page read/write
Date: Wed, 19 Jul 2017 17:18:09 +0530
Message-ID: <1500464893-11352-22-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

1. Add the function for command descriptor preparation which
   will be used only by BAM DMA and it will form the DMA descriptors
   containing command elements.

2. Add the data descriptor preparation function which will be used
   only by BAM DMA for forming the data SGL’s.

3. Add clear BAM transaction and call it before every new request

4. Check DMA mode for ADM or BAM and call the appropriate
   descriptor formation function.

5. Enable the BAM in NAND_CTRL.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 197 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 180 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 89f6a89..d0e7b9f 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -156,6 +156,9 @@
 #define	FETCH_ID			0xb
 #define	RESET_DEVICE			0xd
 
+/* NAND_CTRL bits */
+#define	BAM_MODE_EN			BIT(0)
+
 /* Value for NAND_DEV_CMD_VLD */
 #define NAND_DEV_CMD_VLD_VAL		0x1d
 
@@ -185,6 +188,14 @@
 	      (offset << READ_LOCATION_OFFSET) | (size << READ_LOCATION_SIZE) |\
 	      (is_last << READ_LOCATION_LAST))
 
+/* Returns the dma address for reg read buffer */
+#define REG_BUF_DMA_ADDR(chip, vaddr) \
+	((chip)->reg_read_buf_phys + \
+	((uint8_t *)(vaddr) - (uint8_t *)(chip)->reg_read_buf))
+
+/* Returns the NAND register physical address */
+#define NAND_REG_PHYS(chip, offset) ((chip)->base_phys + (offset))
+
 #define QPIC_PER_CW_CMD_ELEMENTS	32
 #define QPIC_PER_CW_CMD_SGL		32
 #define QPIC_PER_CW_DATA_SGL		8
@@ -296,7 +307,8 @@ struct nandc_regs {
  *				controller
  * @dev:			parent device
  * @base:			MMIO base
- * @base_dma:			physical base address of controller registers
+ * @base_phys:			physical base address of controller registers
+ * @base_dma:			dma base address of controller registers
  * @core_clk:			controller clock
  * @aon_clk:			another controller clock
  *
@@ -329,6 +341,7 @@ struct qcom_nand_controller {
 	struct device *dev;
 
 	void __iomem *base;
+	phys_addr_t base_phys;
 	dma_addr_t base_dma;
 
 	struct clk *core_clk;
@@ -471,6 +484,29 @@ static void free_bam_transaction(struct qcom_nand_controller *nandc)
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
+	bam_txn->bam_ce_pos = 0;
+	bam_txn->bam_ce_start = 0;
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
@@ -708,6 +744,101 @@ static int prepare_bam_async_desc(struct qcom_nand_controller *nandc,
 	return 0;
 }
 
+/*
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
+				    NAND_REG_PHYS(nandc, reg_off + 4 * i),
+				    BAM_READ_COMMAND,
+				    REG_BUF_DMA_ADDR(nandc,
+						     (__le32 *)vaddr + i));
+		else
+			bam_prep_ce_le32(&bam_ce_buffer[i],
+					 NAND_REG_PHYS(nandc, reg_off + 4 * i),
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
@@ -790,16 +921,19 @@ static int read_reg_dma(struct qcom_nand_controller *nandc, int first,
 {
 	bool flow_control = false;
 	void *vaddr;
-	int size;
 
-	if (first == NAND_READ_ID || first == NAND_FLASH_STATUS)
-		flow_control = true;
-
-	size = num_regs * sizeof(u32);
 	vaddr = nandc->reg_read_buf + nandc->reg_read_pos;
 	nandc->reg_read_pos += num_regs;
 
-	return prep_adm_dma_desc(nandc, true, first, vaddr, size, flow_control);
+	if (nandc->props->is_bam)
+		return prep_bam_dma_desc_cmd(nandc, true, first, vaddr,
+					     num_regs, flags);
+
+	if (first == NAND_READ_ID || first == NAND_FLASH_STATUS)
+		flow_control = true;
+
+	return prep_adm_dma_desc(nandc, true, first, vaddr,
+				 num_regs * sizeof(u32), flow_control);
 }
 
 /*
@@ -815,13 +949,9 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
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
@@ -838,10 +968,15 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 	if (first == NAND_DEV_CMD_VLD_RESTORE)
 		first = NAND_DEV_CMD_VLD;
 
-	size = num_regs * sizeof(u32);
+	if (nandc->props->is_bam)
+		return prep_bam_dma_desc_cmd(nandc, false, first, vaddr,
+					     num_regs, flags);
 
-	return prep_adm_dma_desc(nandc, false, first, vaddr, size,
-				 flow_control);
+	if (first == NAND_FLASH_CMD)
+		flow_control = true;
+
+	return prep_adm_dma_desc(nandc, false, first, vaddr,
+				 num_regs * sizeof(u32), flow_control);
 }
 
 /*
@@ -855,6 +990,9 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
 			 const u8 *vaddr, int size, unsigned int flags)
 {
+	if (nandc->props->is_bam)
+		return prep_bam_dma_desc_data(nandc, true, vaddr, size, flags);
+
 	return prep_adm_dma_desc(nandc, true, reg_off, vaddr, size, false);
 }
 
@@ -869,6 +1007,9 @@ static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
 static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
 			  const u8 *vaddr, int size, unsigned int flags)
 {
+	if (nandc->props->is_bam)
+		return prep_bam_dma_desc_data(nandc, false, vaddr, size, flags);
+
 	return prep_adm_dma_desc(nandc, false, reg_off, vaddr, size, false);
 }
 
@@ -1046,7 +1187,8 @@ static int read_id(struct qcom_nand_host *host, int column)
 	nandc_set_reg(nandc, NAND_FLASH_CMD, FETCH_ID);
 	nandc_set_reg(nandc, NAND_ADDR0, column);
 	nandc_set_reg(nandc, NAND_ADDR1, 0);
-	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
+	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT,
+		      nandc->props->is_bam ? 0 : DM_EN);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
 	write_reg_dma(nandc, NAND_FLASH_CMD, 4, NAND_BAM_NEXT_SGL);
@@ -1157,6 +1299,9 @@ static void pre_command(struct qcom_nand_host *host, int command)
 	host->last_command = command;
 
 	clear_read_regs(nandc);
+	if (command == NAND_CMD_RESET || command == NAND_CMD_READID ||
+	    command == NAND_CMD_PARAM || command == NAND_CMD_ERASE1)
+		clear_bam_transaction(nandc);
 }
 
 /*
@@ -1561,6 +1706,7 @@ static int qcom_nandc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	data_buf = buf;
 	oob_buf = oob_required ? chip->oob_poi : NULL;
 
+	clear_bam_transaction(nandc);
 	ret = read_page_ecc(host, data_buf, oob_buf);
 	if (ret) {
 		dev_err(nandc->dev, "failure to read page\n");
@@ -1586,6 +1732,8 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 	oob_buf = chip->oob_poi;
 
 	host->use_ecc = false;
+
+	clear_bam_transaction(nandc);
 	update_rw_regs(host, ecc->steps, true);
 	config_nand_page_read(nandc);
 
@@ -1657,6 +1805,7 @@ static int qcom_nandc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 	int ret;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	host->use_ecc = true;
 	set_address(host, 0, page);
@@ -1680,6 +1829,7 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	int i, ret;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	data_buf = (u8 *)buf;
 	oob_buf = chip->oob_poi;
@@ -1745,6 +1895,7 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
 	int i, ret;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	data_buf = (u8 *)buf;
 	oob_buf = chip->oob_poi;
@@ -1819,11 +1970,13 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 
 	host->use_ecc = true;
 
+	clear_bam_transaction(nandc);
 	ret = copy_last_cw(host, page);
 	if (ret)
 		return ret;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	/* calculate the data and oob size for the last codeword/step */
 	data_size = ecc->size - ((ecc->steps - 1) << 2);
@@ -1876,6 +2029,7 @@ static int qcom_nandc_block_bad(struct mtd_info *mtd, loff_t ofs)
 	 */
 	host->use_ecc = false;
 
+	clear_bam_transaction(nandc);
 	ret = copy_last_cw(host, page);
 	if (ret)
 		goto err;
@@ -1906,6 +2060,7 @@ static int qcom_nandc_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	int page, ret, status = 0;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	/*
 	 * to mark the BBM as bad, we flash the entire last codeword with 0s.
@@ -2418,12 +2573,19 @@ static void qcom_nandc_unalloc(struct qcom_nand_controller *nandc)
 /* one time setup of a few nand controller registers */
 static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
+	u32 nand_ctrl;
+
 	/* kill onenand */
 	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
 	nandc_write(nandc, NAND_DEV_CMD_VLD, NAND_DEV_CMD_VLD_VAL);
 
-	/* enable ADM DMA */
-	nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
+	/* enable ADM or BAM DMA */
+	if (nandc->props->is_bam) {
+		nand_ctrl = nandc_read(nandc, NAND_CTRL);
+		nandc_write(nandc, NAND_CTRL, nand_ctrl | BAM_MODE_EN);
+	} else {
+		nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
+	}
 
 	/* save the original values of these registers */
 	nandc->cmd1 = nandc_read(nandc, NAND_DEV_CMD1);
@@ -2608,6 +2770,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (IS_ERR(nandc->base))
 		return PTR_ERR(nandc->base);
 
+	nandc->base_phys = res->start;
 	nandc->base_dma = phys_to_dma(dev, (phys_addr_t)res->start);
 
 	nandc->core_clk = devm_clk_get(dev, "core");
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
