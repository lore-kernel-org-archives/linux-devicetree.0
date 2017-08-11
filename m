From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 01/20] mtd: nand: qcom: fix read failure without complete bootchain
Date: Fri, 11 Aug 2017 17:09:16 +0530
Message-ID: <1502451575-15712-2-git-send-email-absahu@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@free-electrons.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The NAND page read fails without complete boot chain since
NAND_DEV_CMD_VLD value is not proper. The default power on reset
value for this register is

    0xe - ERASE_START_VALID | WRITE_START_VALID | READ_STOP_VALID

The READ_START_VALID should be enabled for sending PAGE_READ
command. READ_STOP_VALID should be cleared since normal NAND
page read does not require READ_STOP command.

Fixes: c76b78d8ec05a ("mtd: nand: Qualcomm NAND controller driver")
Cc: stable@vger.kernel.org
Reviewed-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 0e727d7..e5cb8f1 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -109,7 +109,11 @@
 #define	READ_ADDR			0
 
 /* NAND_DEV_CMD_VLD bits */
-#define	READ_START_VLD			0
+#define	READ_START_VLD			BIT(0)
+#define	READ_STOP_VLD			BIT(1)
+#define	WRITE_START_VLD			BIT(2)
+#define	ERASE_START_VLD			BIT(3)
+#define	SEQ_READ_START_VLD		BIT(4)
 
 /* NAND_EBI2_ECC_BUF_CFG bits */
 #define	NUM_STEPS			0
@@ -148,6 +152,10 @@
 #define	FETCH_ID			0xb
 #define	RESET_DEVICE			0xd
 
+/* Default Value for NAND_DEV_CMD_VLD */
+#define NAND_DEV_CMD_VLD_VAL		(READ_START_VLD | WRITE_START_VLD | \
+					 ERASE_START_VLD | SEQ_READ_START_VLD)
+
 /*
  * the NAND controller performs reads/writes with ECC in 516 byte chunks.
  * the driver calls the chunks 'step' or 'codeword' interchangeably
@@ -695,8 +703,7 @@ static int nandc_param(struct qcom_nand_host *host)
 
 	/* configure CMD1 and VLD for ONFI param probing */
 	nandc_set_reg(nandc, NAND_DEV_CMD_VLD,
-		      (nandc->vld & ~(1 << READ_START_VLD))
-		      | 0 << READ_START_VLD);
+		      (nandc->vld & ~READ_START_VLD));
 	nandc_set_reg(nandc, NAND_DEV_CMD1,
 		      (nandc->cmd1 & ~(0xFF << READ_ADDR))
 		      | NAND_CMD_PARAM << READ_ADDR);
@@ -1995,13 +2002,14 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
 	/* kill onenand */
 	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
+	nandc_write(nandc, NAND_DEV_CMD_VLD, NAND_DEV_CMD_VLD_VAL);
 
 	/* enable ADM DMA */
 	nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
 
 	/* save the original values of these registers */
 	nandc->cmd1 = nandc_read(nandc, NAND_DEV_CMD1);
-	nandc->vld = nandc_read(nandc, NAND_DEV_CMD_VLD);
+	nandc->vld = NAND_DEV_CMD_VLD_VAL;
 
 	return 0;
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
