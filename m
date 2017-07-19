From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 13/25] mtd: nand: qcom: add QPIC NAND compatible string
Date: Wed, 19 Jul 2017 17:18:01 +0530
Message-ID: <1500464893-11352-14-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The current driver only support EBI2 NAND which uses ADM DMA. The
latest QCOM controller supports QPIC NAND which uses BAM DMA. NAND
registers and programming sequence are same for EBI2 and QPIC
NAND so the same driver can support QPIC NAND also by adding the
BAM DMA support. This patch adds the QPIC NAND support in current
NAND driver with compatible string "qcom,qpic-nandc-v1.4.0" and
maps it with different configuration parameter in driver data.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 3b0ae91..6d24630 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -323,9 +323,11 @@ struct qcom_nand_host {
  * This data type corresponds to the nand controller properties which varies
  * among different NAND controller IP's.
  * @ecc_modes - ecc mode for NAND
+ * @is_bam - whether NAND controller is using bam
  */
 struct qcom_props {
 	u32 ecc_modes;
+	bool is_bam;
 };
 
 static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
@@ -2245,6 +2247,12 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 
 static const struct qcom_props ebi2_nandc_data = {
 	.ecc_modes = (ECC_RS_4BIT | ECC_BCH_8BIT),
+	.is_bam = false,
+};
+
+static const struct qcom_props qpic_nandc_v1_4_0_data = {
+	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
+	.is_bam = true,
 };
 
 /*
@@ -2255,6 +2263,9 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 	{	.compatible = "qcom,ebi2-nandc",
 		.data = &ebi2_nandc_data,
 	},
+	{	.compatible = "qcom,qpic-nandc-v1.4.0",
+		.data = &qpic_nandc_v1_4_0_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_nandc_of_match);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
