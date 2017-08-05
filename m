From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 02/20] mtd: nand: qcom: support for NAND controller properties
Date: Sat,  5 Aug 2017 21:49:40 +0530
Message-ID: <1501949998-29859-3-git-send-email-absahu@codeaurora.org>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, boris.brezillon@free-electrons.com, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Currently driver data is being assigned directly with ECC modes.
Now, the plan is to add more NAND controller versions which will
have different properties. This patch reorganizes the current driver
data assignment by creating NAND controller properties structure
which will contain all properties specific to NAND controller.

Reviewed-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 7406019..4dc6b7e 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -242,7 +242,7 @@ struct nandc_regs {
  *				writes. contains the register values to be
  *				written to controller
  * @cmd1/vld:			some fixed controller register values
- * @ecc_modes:			supported ECC modes by the current controller,
+ * @props:			properties of current NAND controller,
  *				initialized via DT match data
  */
 struct qcom_nand_controller {
@@ -273,7 +273,7 @@ struct qcom_nand_controller {
 	struct nandc_regs *regs;
 
 	u32 cmd1, vld;
-	u32 ecc_modes;
+	const struct qcom_nandc_props *props;
 };
 
 /*
@@ -326,6 +326,15 @@ struct qcom_nand_host {
 	u32 clrreadstatus;
 };
 
+/*
+ * This data type corresponds to the nand controller properties which varies
+ * among different NAND controllers.
+ * @ecc_modes - ecc mode for NAND
+ */
+struct qcom_nandc_props {
+	u32 ecc_modes;
+};
+
 static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
 {
 	return container_of(chip, struct qcom_nand_host, chip);
@@ -1827,7 +1836,7 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
 		 * uses lesser bytes for ECC. If RS is used, the ECC bytes is
 		 * always 10 bytes
 		 */
-		if (nandc->ecc_modes & ECC_BCH_4BIT) {
+		if (nandc->props->ecc_modes & ECC_BCH_4BIT) {
 			/* BCH */
 			host->bch_enabled = true;
 			ecc_mode = 0;
@@ -2174,7 +2183,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	nandc->ecc_modes = (unsigned long)dev_data;
+	nandc->props = dev_data;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	nandc->base = devm_ioremap_resource(dev, res);
@@ -2243,15 +2252,18 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#define EBI2_NANDC_ECC_MODES	(ECC_RS_4BIT | ECC_BCH_8BIT)
+static const struct qcom_nandc_props ipq806x_nandc_props = {
+	.ecc_modes = (ECC_RS_4BIT | ECC_BCH_8BIT),
+};
 
 /*
  * data will hold a struct pointer containing more differences once we support
  * more controller variants
  */
 static const struct of_device_id qcom_nandc_of_match[] = {
-	{	.compatible = "qcom,ipq806x-nand",
-		.data = (void *)EBI2_NANDC_ECC_MODES,
+	{
+		.compatible = "qcom,ipq806x-nand",
+		.data = &ipq806x_nandc_props,
 	},
 	{}
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
