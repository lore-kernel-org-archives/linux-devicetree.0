From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 14/14] qcom: mtd: nand: programmed NAND_DEV_CMD_VLD register
Date: Thu, 29 Jun 2017 12:46:06 +0530
Message-ID: <1498720566-20782-15-git-send-email-absahu@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The current driver is failing without complete bootchain in
BAM mode since NAND_DEV_CMD_VLD value is not valid. So
programmed the required value in NAND_DEV_CMD_VLD register.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 641e85d..260167b 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -121,6 +121,9 @@
 
 /* NAND_CTRL bits */
 #define	BAM_MODE_EN			BIT(0)
+
+/* Value for NAND_DEV_CMD_VLD */
+#define NAND_DEV_CMD_VLD_VAL		(0x1d)
 /*
  * the NAND controller performs reads/writes with ECC in 516 byte chunks.
  * the driver calls the chunks 'step' or 'codeword' interchangeably
@@ -2676,6 +2679,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 
 	/* kill onenand */
 	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
+	nandc_write(nandc, NAND_DEV_CMD_VLD, NAND_DEV_CMD_VLD_VAL);
 
 	/* enable ADM or BAM DMA */
 	if (!nandc->dma_bam_enabled) {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
