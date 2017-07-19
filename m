From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 25/25] mtd: nand: qcom: support for QPIC version 1.5.0
Date: Wed, 19 Jul 2017 17:18:13 +0530
Message-ID: <1500464893-11352-26-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The current QCOM NAND driver only supports version 1.4.0
QCOM QPIC NAND controller. This patch adds the support for
version 1.5.0 which contains some of the registers at
different offsets. The driver data contains the register offset
field which is being initialized with its corresponding register
offsets array. A new compatible string has been added for
version 1.5.0 in BAM mode which uses version 1.5.0 register
offsets.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 52 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 0896e56..52173f1 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -445,8 +445,9 @@ struct qcom_props {
 	const u32 *reg_offsets;
 };
 
-/* Mapping table which contains the actual register offsets */
-static const u32 nandc_reg_offsets[] = {
+/* Mapping tables which contains the actual register offsets */
+/* NAND controller Version 1.4.0 mapping table */
+static const u32 reg_offsets_v1_4_0[] = {
 	[NAND_FLASH_CMD] = 0x00,
 	[NAND_ADDR0] = 0x04,
 	[NAND_ADDR1] = 0x08,
@@ -479,6 +480,40 @@ struct qcom_props {
 	[NAND_READ_LOCATION_3] = 0xf2c,
 };
 
+/* NAND controller Version 1.5.0 mapping table */
+static const u32 reg_offsets_v1_5_0[] = {
+	[NAND_FLASH_CMD] = 0x00,
+	[NAND_ADDR0] = 0x04,
+	[NAND_ADDR1] = 0x08,
+	[NAND_FLASH_CHIP_SELECT] = 0x0c,
+	[NAND_EXEC_CMD] = 0x10,
+	[NAND_FLASH_STATUS] = 0x14,
+	[NAND_BUFFER_STATUS] = 0x18,
+	[NAND_DEV0_CFG0] = 0x20,
+	[NAND_DEV0_CFG1] = 0x24,
+	[NAND_DEV0_ECC_CFG] = 0x28,
+	[NAND_DEV1_ECC_CFG] = 0x2c,
+	[NAND_DEV1_CFG0] = 0x30,
+	[NAND_DEV1_CFG1] = 0x34,
+	[NAND_READ_ID] = 0x40,
+	[NAND_READ_STATUS] = 0x44,
+	[NAND_DEV_CMD0] = 0x70a0,
+	[NAND_DEV_CMD1] = 0x70a4,
+	[NAND_DEV_CMD2] = 0x70a8,
+	[NAND_DEV_CMD_VLD] = 0x70ac,
+	[SFLASHC_BURST_CFG] = 0xe0,
+	[NAND_ERASED_CW_DETECT_CFG] = 0xe8,
+	[NAND_ERASED_CW_DETECT_STATUS] = 0xec,
+	[NAND_EBI2_ECC_BUF_CFG] = 0xf0,
+	[FLASH_BUF_ACC] = 0x100,
+	[NAND_CTRL] = 0xf00,
+	[NAND_VERSION] = 0x4f08,
+	[NAND_READ_LOCATION_0] = 0xf20,
+	[NAND_READ_LOCATION_1] = 0xf24,
+	[NAND_READ_LOCATION_2] = 0xf28,
+	[NAND_READ_LOCATION_3] = 0xf2c,
+};
+
 /* Frees the BAM transaction memory */
 static void free_bam_transaction(struct qcom_nand_controller *nandc)
 {
@@ -2882,13 +2917,19 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 static const struct qcom_props ebi2_nandc_data = {
 	.ecc_modes = (ECC_RS_4BIT | ECC_BCH_8BIT),
 	.is_bam = false,
-	.reg_offsets = nandc_reg_offsets,
+	.reg_offsets = reg_offsets_v1_4_0,
 };
 
 static const struct qcom_props qpic_nandc_v1_4_0_data = {
 	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
 	.is_bam = true,
-	.reg_offsets = nandc_reg_offsets,
+	.reg_offsets = reg_offsets_v1_4_0,
+};
+
+static const struct qcom_props qpic_nandc_v1_5_0_data = {
+	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
+	.is_bam = true,
+	.reg_offsets = reg_offsets_v1_5_0,
 };
 
 /*
@@ -2902,6 +2943,9 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 	{	.compatible = "qcom,qpic-nandc-v1.4.0",
 		.data = &qpic_nandc_v1_4_0_data,
 	},
+	{	.compatible = "qcom,qpic-nandc-v1.5.0",
+		.data = (void *)&qpic_nandc_v1_5_0_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_nandc_of_match);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
