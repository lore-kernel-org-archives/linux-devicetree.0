From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 11/20] mtd: nand: qcom: enable BAM or ADM mode
Date: Fri, 11 Aug 2017 17:09:26 +0530
Message-ID: <1502451575-15712-12-git-send-email-absahu@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@free-electrons.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

1. DM_EN is only required for EBI2 NAND controller which uses ADM
2. BAM mode will be disabled after power on reset which needs to
   be enabled before starting any BAM transfers.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 3d9fd7f..ae873d3 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -163,6 +163,9 @@
 #define NAND_DEV_CMD_VLD_VAL		(READ_START_VLD | WRITE_START_VLD | \
 					 ERASE_START_VLD | SEQ_READ_START_VLD)
 
+/* NAND_CTRL bits */
+#define	BAM_MODE_EN			BIT(0)
+
 /*
  * the NAND controller performs reads/writes with ECC in 516 byte chunks.
  * the driver calls the chunks 'step' or 'codeword' interchangeably
@@ -1035,7 +1038,8 @@ static int read_id(struct qcom_nand_host *host, int column)
 	nandc_set_reg(nandc, NAND_FLASH_CMD, FETCH_ID);
 	nandc_set_reg(nandc, NAND_ADDR0, column);
 	nandc_set_reg(nandc, NAND_ADDR1, 0);
-	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
+	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT,
+		      nandc->props->is_bam ? 0 : DM_EN);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
 	write_reg_dma(nandc, NAND_FLASH_CMD, 4, NAND_BAM_NEXT_SGL);
@@ -2408,12 +2412,19 @@ static void qcom_nandc_unalloc(struct qcom_nand_controller *nandc)
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
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
