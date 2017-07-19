From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 02/25] mtd: nand: qcom: program NAND_DEV_CMD_VLD register
Date: Wed, 19 Jul 2017 17:17:50 +0530
Message-ID: <1500464893-11352-3-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The current driver is failing without complete bootchain since
NAND_DEV_CMD_VLD value is not valid.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index bc0408c..f3b995d 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -148,6 +148,9 @@
 #define	FETCH_ID			0xb
 #define	RESET_DEVICE			0xd
 
+/* Value for NAND_DEV_CMD_VLD */
+#define NAND_DEV_CMD_VLD_VAL		0x1d
+
 /*
  * the NAND controller performs reads/writes with ECC in 516 byte chunks.
  * the driver calls the chunks 'step' or 'codeword' interchangeably
@@ -1972,6 +1975,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
 	/* kill onenand */
 	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
+	nandc_write(nandc, NAND_DEV_CMD_VLD, NAND_DEV_CMD_VLD_VAL);
 
 	/* enable ADM DMA */
 	nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
