From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 13/20] mtd: nand: qcom: support for different DEV_CMD register offsets
Date: Sat,  5 Aug 2017 21:49:51 +0530
Message-ID: <1501949998-29859-14-git-send-email-absahu@codeaurora.org>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, boris.brezillon@free-electrons.com, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The FLASH_DEV_CMD registers starting offset is not same in
different QPIC NAND controller versions. This patch adds
the starting offset in NAND controller properties and uses
the same for calculating the actual offset of these registers.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index d7a2ca4..c940a20 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -195,6 +195,9 @@
 	      ((size) << READ_LOCATION_SIZE) |			\
 	      ((is_last) << READ_LOCATION_LAST))
 
+/* Returns the actual register address for NAND_FLASH_DEV_* */
+#define nandc_dev_addr(nandc, reg) ((nandc)->props->flash_dev_offset + (reg))
+
 #define QPIC_PER_CW_CMD_SGL		32
 #define QPIC_PER_CW_DATA_SGL		8
 
@@ -428,10 +431,12 @@ struct qcom_nand_host {
  * among different NAND controllers.
  * @ecc_modes - ecc mode for NAND
  * @is_bam - whether NAND controller is using BAM
+ * @flash_dev_offset - NAND_FLASH_DEV_* registers start offset
  */
 struct qcom_nandc_props {
 	u32 ecc_modes;
 	bool is_bam;
+	u32 flash_dev_offset;
 };
 
 /* Frees the BAM transaction memory */
@@ -846,6 +851,9 @@ static int read_reg_dma(struct qcom_nand_controller *nandc, int first,
 	if (first == NAND_READ_ID || first == NAND_FLASH_STATUS)
 		flow_control = true;
 
+	if (first == NAND_DEV_CMD_VLD || first == NAND_DEV_CMD1)
+		first = nandc_dev_addr(nandc, first);
+
 	size = num_regs * sizeof(u32);
 	vaddr = nandc->reg_read_buf + nandc->reg_read_pos;
 	nandc->reg_read_pos += num_regs;
@@ -883,11 +891,11 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 	if (first == NAND_EXEC_CMD)
 		flags |= NAND_BAM_NWD;
 
-	if (first == NAND_DEV_CMD1_RESTORE)
-		first = NAND_DEV_CMD1;
+	if (first == NAND_DEV_CMD1_RESTORE || first == NAND_DEV_CMD1)
+		first = nandc_dev_addr(nandc, NAND_DEV_CMD1);
 
-	if (first == NAND_DEV_CMD_VLD_RESTORE)
-		first = NAND_DEV_CMD_VLD;
+	if (first == NAND_DEV_CMD_VLD_RESTORE || first == NAND_DEV_CMD_VLD)
+		first = nandc_dev_addr(nandc, NAND_DEV_CMD_VLD);
 
 	size = num_regs * sizeof(u32);
 
@@ -2495,7 +2503,8 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 
 	/* kill onenand */
 	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
-	nandc_write(nandc, NAND_DEV_CMD_VLD, NAND_DEV_CMD_VLD_VAL);
+	nandc_write(nandc, nandc_dev_addr(nandc, NAND_DEV_CMD_VLD),
+		    NAND_DEV_CMD_VLD_VAL);
 
 	/* enable ADM or BAM DMA */
 	if (nandc->props->is_bam) {
@@ -2506,7 +2515,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	}
 
 	/* save the original values of these registers */
-	nandc->cmd1 = nandc_read(nandc, NAND_DEV_CMD1);
+	nandc->cmd1 = nandc_read(nandc, nandc_dev_addr(nandc, NAND_DEV_CMD1));
 	nandc->vld = NAND_DEV_CMD_VLD_VAL;
 
 	return 0;
@@ -2755,6 +2764,7 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 static const struct qcom_nandc_props ipq806x_nandc_props = {
 	.ecc_modes = (ECC_RS_4BIT | ECC_BCH_8BIT),
 	.is_bam = false,
+	.flash_dev_offset = 0x0,
 };
 
 /*
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
