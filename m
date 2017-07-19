From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 11/25] mtd: nand: qcom: support for NAND controller properties
Date: Wed, 19 Jul 2017 17:17:59 +0530
Message-ID: <1500464893-11352-12-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Currently driver data is being assigned directly with ECC modes.
Now, the plan is to add more NAND controller versions, so
reorganized the current driver data assignment by creating NAND
controller properties structure.  This will contain all
properties specific to NAND controller.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 8f9e86c..3b0ae91 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -235,7 +235,7 @@ struct nandc_regs {
  *				writes. contains the register values to be
  *				written to controller
  * @cmd1/vld:			some fixed controller register values
- * @ecc_modes:			supported ECC modes by the current controller,
+ * @props:			properties of current NAND controller IP,
  *				initialized via DT match data
  */
 struct qcom_nand_controller {
@@ -266,7 +266,7 @@ struct qcom_nand_controller {
 	struct nandc_regs *regs;
 
 	u32 cmd1, vld;
-	u32 ecc_modes;
+	const struct qcom_props *props;
 };
 
 /*
@@ -319,6 +319,15 @@ struct qcom_nand_host {
 	u32 clrreadstatus;
 };
 
+/*
+ * This data type corresponds to the nand controller properties which varies
+ * among different NAND controller IP's.
+ * @ecc_modes - ecc mode for NAND
+ */
+struct qcom_props {
+	u32 ecc_modes;
+};
+
 static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
 {
 	return container_of(chip, struct qcom_nand_host, chip);
@@ -1820,7 +1829,7 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
 		 * uses lesser bytes for ECC. If RS is used, the ECC bytes is
 		 * always 10 bytes
 		 */
-		if (nandc->ecc_modes & ECC_BCH_4BIT) {
+		if (nandc->props->ecc_modes & ECC_BCH_4BIT) {
 			/* BCH */
 			host->bch_enabled = true;
 			ecc_mode = 0;
@@ -2165,7 +2174,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	nandc->ecc_modes = (unsigned long)dev_data;
+	nandc->props = dev_data;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	nandc->base = devm_ioremap_resource(dev, res);
@@ -2234,7 +2243,9 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#define EBI2_NANDC_ECC_MODES	(ECC_RS_4BIT | ECC_BCH_8BIT)
+static const struct qcom_props ebi2_nandc_data = {
+	.ecc_modes = (ECC_RS_4BIT | ECC_BCH_8BIT),
+};
 
 /*
  * data will hold a struct pointer containing more differences once we support
@@ -2242,7 +2253,7 @@ static int qcom_nandc_remove(struct platform_device *pdev)
  */
 static const struct of_device_id qcom_nandc_of_match[] = {
 	{	.compatible = "qcom,ebi2-nandc",
-		.data = (void *)EBI2_NANDC_ECC_MODES,
+		.data = &ebi2_nandc_data,
 	},
 	{}
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
