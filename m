From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 11/20] mtd: nand: qcom: enable BAM or ADM mode
Date: Sat,  5 Aug 2017 21:49:49 +0530
Message-ID: <1501949998-29859-12-git-send-email-absahu@codeaurora.org>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, boris.brezillon@free-electrons.com, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

1. DM_EN is only required for EBI2 NAND controller which uses ADM
2. BAM mode will be disabled after power on reset which needs to
   be enabled before starting any BAM transfers.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 67c7e62..af69a89 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -165,6 +165,9 @@
 					 BIT(ERASE_START_VALID)	| \
 					 BIT(SEQ_READ_START_VLD))
 
+/* NAND_CTRL bits */
+#define	BAM_MODE_EN			BIT(0)
+
 /*
  * the NAND controller performs reads/writes with ECC in 516 byte chunks.
  * the driver calls the chunks 'step' or 'codeword' interchangeably
@@ -1038,7 +1041,8 @@ static int read_id(struct qcom_nand_host *host, int column)
 	nandc_set_reg(nandc, NAND_FLASH_CMD, FETCH_ID);
 	nandc_set_reg(nandc, NAND_ADDR0, column);
 	nandc_set_reg(nandc, NAND_ADDR1, 0);
-	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
+	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT,
+		      nandc->props->is_bam ? 0 : DM_EN);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
 	write_reg_dma(nandc, NAND_FLASH_CMD, 4, NAND_BAM_NEXT_SGL);
@@ -2411,12 +2415,19 @@ static void qcom_nandc_unalloc(struct qcom_nand_controller *nandc)
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
