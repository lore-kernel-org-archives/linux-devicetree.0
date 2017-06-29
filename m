From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 13/14] qcom: mtd: nand: support for QPIC version 1.5.0
Date: Thu, 29 Jun 2017 12:46:05 +0530
Message-ID: <1498720566-20782-14-git-send-email-absahu@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498720566-20782-1-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The current QCOM NAND driver only supports version 1.4.0
QCOM QPIC NAND controller. This patch adds the support for
version 1.5.0 which contains some of the registers at
different offsets. The driver data contains the register offset
field which is being initialized with its crossponding register
offsets array. A new compatible string has been added for
version 1.5.0 in BAM mode which uses version 1.5.0 register
offsets.

Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../devicetree/bindings/mtd/qcom_nandc.txt         | 44 ++++++++++++++++++
 drivers/mtd/nand/qcom_nandc.c                      | 54 ++++++++++++++++++++--
 2 files changed, 95 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index 87b9a56..11e2da2 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -4,6 +4,8 @@ Required properties:
 - compatible:		must be one of the following:
 	* "qcom,ebi2-nandc" - EBI2 NAND which uses ADM DMA like IPQ8064.
 	* "qcom,qpic-nandc-v1.4.0" - QPIC NAND v1.4.0 which uses BAM DMA like IPQ4019.
+	* "qcom,qpic-nandc-v1.5.0" - QPIC NAND v1.5.0 which uses BAM DMA like IPQ8074.
+
 - reg:			MMIO address range
 - clocks:		must contain core clock and always on clock
 - clock-names:		must contain "core" for the core clock and "aon" for the
@@ -130,3 +132,45 @@ nand@79b0000 {
 		};
 	};
 };
+
+nand@79b0000 {
+	compatible = "qcom,qpic-nandc-v1.5.0";
+	reg = <0x79B0000 0x1000>;
+
+	clocks = <&gcc GCC_QPIC_CLK>,
+		<&gcc GCC_QPIC_AHB_CLK>;
+	clock-names = "core", "aon";
+
+	dmas = <&qpicbam 0>,
+		<&qpicbam 1>,
+		<&qpicbam 2>;
+	dma-names = "tx", "rx", "cmd";
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
index 24750e6..641e85d 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -430,15 +430,18 @@ struct qcom_nand_host {
  * This data type corresponds to the nand driver data which will be used at
  * driver probe time
  * @ecc_modes - ecc mode for nand
+ * @regs_offsets - contains the register offsets array pointer.
  * @dma_bam_enabled - whether this driver is using bam
  */
 struct qcom_nand_driver_data {
 	u32 ecc_modes;
+	const u32 *regs_offsets;
 	bool dma_bam_enabled;
 };
 
 /* Mapping table which contains the actual register offsets */
-static const u32 regs_offsets[] = {
+/* NAND controller Version 1.4.0 mapping table */
+static const u32 regs_offsets_v1_4_0[] = {
 	[NAND_FLASH_CMD] = 0x00,
 	[NAND_ADDR0] = 0x04,
 	[NAND_ADDR1] = 0x08,
@@ -471,6 +474,40 @@ struct qcom_nand_driver_data {
 	[NAND_READ_LOCATION_3] = 0xf2c,
 };
 
+/* NAND controller Version 1.5.0 mapping table */
+static const u32 regs_offsets_v1_5_0[] = {
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
@@ -2832,7 +2869,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 
 	nandc->ecc_modes = driver_data->ecc_modes;
 	nandc->dma_bam_enabled = driver_data->dma_bam_enabled;
-	nandc->regs_offsets = regs_offsets;
+	nandc->regs_offsets = driver_data->regs_offsets;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	nandc->base = devm_ioremap_resource(dev, res);
@@ -2902,16 +2939,24 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-
 static const struct qcom_nand_driver_data ebi2_nandc_data = {
 	.ecc_modes = (ECC_RS_4BIT | ECC_BCH_8BIT),
 	.dma_bam_enabled = false,
+	.regs_offsets = regs_offsets_v1_4_0,
 };
 
 static const struct qcom_nand_driver_data qpic_nandc_v1_4_0_data = {
 	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
 	.dma_bam_enabled = true,
+	.regs_offsets = regs_offsets_v1_4_0,
+};
+
+static const struct qcom_nand_driver_data qpic_nandc_v1_5_0_data = {
+	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
+	.dma_bam_enabled = true,
+	.regs_offsets = regs_offsets_v1_5_0,
 };
+
 /*
  * data will hold a struct pointer containing more differences once we support
  * more controller variants
@@ -2923,6 +2968,9 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 	{	.compatible = "qcom,qpic-nandc-v1.4.0",
 		.data = (void *)&qpic_nandc_v1_4_0_data,
 	},
+	{	.compatible = "qcom,qpic-nandc-v1.5.0",
+		.data = (void *)&qpic_nandc_v1_5_0_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_nandc_of_match);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
