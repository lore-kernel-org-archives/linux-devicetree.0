From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 02/20] mtd: nand: qcom: support for NAND controller properties
Date: Fri, 11 Aug 2017 17:09:17 +0530
Message-ID: <1502451575-15712-3-git-send-email-absahu@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@free-electrons.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
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
index e5cb8f1..79f7de8 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -240,7 +240,7 @@ struct nandc_regs {
  *				writes. contains the register values to be
  *				written to controller
  * @cmd1/vld:			some fixed controller register values
- * @ecc_modes:			supported ECC modes by the current controller,
+ * @props:			properties of current NAND controller,
  *				initialized via DT match data
  */
 struct qcom_nand_controller {
@@ -271,7 +271,7 @@ struct qcom_nand_controller {
 	struct nandc_regs *regs;
 
 	u32 cmd1, vld;
-	u32 ecc_modes;
+	const struct qcom_nandc_props *props;
 };
 
 /*
@@ -324,6 +324,15 @@ struct qcom_nand_host {
 	u32 clrreadstatus;
 };
 
+/*
+ * This data type corresponds to the NAND controller properties which varies
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
@@ -1824,7 +1833,7 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
 		 * uses lesser bytes for ECC. If RS is used, the ECC bytes is
 		 * always 10 bytes
 		 */
-		if (nandc->ecc_modes & ECC_BCH_4BIT) {
+		if (nandc->props->ecc_modes & ECC_BCH_4BIT) {
 			/* BCH */
 			host->bch_enabled = true;
 			ecc_mode = 0;
@@ -2171,7 +2180,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	nandc->ecc_modes = (unsigned long)dev_data;
+	nandc->props = dev_data;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	nandc->base = devm_ioremap_resource(dev, res);
@@ -2240,15 +2249,18 @@ static int qcom_nandc_remove(struct platform_device *pdev)
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
