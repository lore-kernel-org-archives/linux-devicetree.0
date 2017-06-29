From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 01/14] qcom: mtd: nand: Add driver data for QPIC DMA
Date: Thu, 29 Jun 2017 12:45:53 +0530
Message-ID: <1498720566-20782-2-git-send-email-absahu@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498720566-20782-1-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The current driver only support EBI2 NAND which uses ADM DMA. The
latest QCOM controller supports QPIC NAND which uses BAM DMA. NAND
registers and programming sequence are same for EBI2 and QPIC
NAND so the same driver can support QPIC NAND also by adding the
BAM DMA support. This patch adds the QPIC NAND support in current
NAND driver with compatible string "qcom,qpic-nandc-v1.4.0" and
maps it with different configuration parameter in driver data.

Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../devicetree/bindings/mtd/qcom_nandc.txt         | 41 +++++++++++++++++++++-
 drivers/mtd/nand/qcom_nandc.c                      | 37 ++++++++++++++++---
 2 files changed, 73 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index 70dd511..5d0f7ae 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -1,7 +1,9 @@
 * Qualcomm NAND controller
 
 Required properties:
-- compatible:		should be "qcom,ipq806x-nand"
+- compatible:		must be one of the following:
+	* "qcom,ebi2-nandc" - EBI2 NAND which uses ADM DMA like IPQ8064.
+	* "qcom,qpic-nandc-v1.4.0" - QPIC NAND v1.4.0 which uses BAM DMA like IPQ4019.
 - reg:			MMIO address range
 - clocks:		must contain core clock and always on clock
 - clock-names:		must contain "core" for the core clock and "aon" for the
@@ -84,3 +86,40 @@ nand@1ac00000 {
 		};
 	};
 };
+
+nand@79b0000 {
+	compatible = "qcom,qpic-nandc-v1.4.0";
+	reg = <0x79b0000 0x1000>;
+
+	clocks = <&gcc GCC_QPIC_CLK>,
+		<&gcc GCC_QPIC_AHB_CLK>;
+	clock-names = "core", "aon";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	nandcs@0 {
+		compatible = "qcom,nandcs";
+		reg = <0>;
+
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+		nand-bus-width = <8>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "boot-nand";
+				reg = <0 0x58a0000>;
+			};
+
+			partition@58a0000 {
+				label = "fs-nand";
+				reg = <0x58a0000 0x4000000>;
+			};
+		};
+	};
+};
diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 57d483a..f55f728 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2016-2017, The Linux Foundation. All rights reserved.
  *
  * This software is licensed under the terms of the GNU General Public
  * License version 2, as published by the Free Software Foundation, and
@@ -234,6 +234,8 @@ struct nandc_regs {
  * @cmd1/vld:			some fixed controller register values
  * @ecc_modes:			supported ECC modes by the current controller,
  *				initialized via DT match data
+ * @dma_bam_enabled:		flag to tell whether nand controller is using
+ *				bam dma
  */
 struct qcom_nand_controller {
 	struct nand_hw_control controller;
@@ -253,6 +255,7 @@ struct qcom_nand_controller {
 	struct list_head desc_list;
 
 	u8		*data_buffer;
+	bool		dma_bam_enabled;
 	int		buf_size;
 	int		buf_count;
 	int		buf_start;
@@ -316,6 +319,17 @@ struct qcom_nand_host {
 	u32 clrreadstatus;
 };
 
+/*
+ * This data type corresponds to the nand driver data which will be used at
+ * driver probe time
+ * @ecc_modes - ecc mode for nand
+ * @dma_bam_enabled - whether this driver is using bam
+ */
+struct qcom_nand_driver_data {
+	u32 ecc_modes;
+	bool dma_bam_enabled;
+};
+
 static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
 {
 	return container_of(chip, struct qcom_nand_host, chip);
@@ -2073,6 +2087,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	struct device_node *dn = dev->of_node, *child;
 	struct resource *res;
 	int ret;
+	const struct qcom_nand_driver_data *driver_data;
 
 	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
 	if (!nandc)
@@ -2087,7 +2102,10 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	nandc->ecc_modes = (unsigned long)dev_data;
+	driver_data = (const struct qcom_nand_driver_data *)dev_data;
+
+	nandc->ecc_modes = driver_data->ecc_modes;
+	nandc->dma_bam_enabled = driver_data->dma_bam_enabled;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	nandc->base = devm_ioremap_resource(dev, res);
@@ -2179,15 +2197,26 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#define EBI2_NANDC_ECC_MODES	(ECC_RS_4BIT | ECC_BCH_8BIT)
 
+static const struct qcom_nand_driver_data ebi2_nandc_data = {
+	.ecc_modes = (ECC_RS_4BIT | ECC_BCH_8BIT),
+	.dma_bam_enabled = false,
+};
+
+static const struct qcom_nand_driver_data qpic_nandc_v1_4_0_data = {
+	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
+	.dma_bam_enabled = true,
+};
 /*
  * data will hold a struct pointer containing more differences once we support
  * more controller variants
  */
 static const struct of_device_id qcom_nandc_of_match[] = {
 	{	.compatible = "qcom,ipq806x-nand",
-		.data = (void *)EBI2_NANDC_ECC_MODES,
+		.data = (void *)&ebi2_nandc_data,
+	},
+	{	.compatible = "qcom,qpic-nandc-v1.4.0",
+		.data = (void *)&qpic_nandc_v1_4_0_data,
 	},
 	{}
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
