From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 20/20] mtd: nand: qcom: Support for IPQ8074 QPIC NAND controller
Date: Sat,  5 Aug 2017 21:49:58 +0530
Message-ID: <1501949998-29859-21-git-send-email-absahu@codeaurora.org>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, boris.brezillon@free-electrons.com, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add the compatible string for IPQ8074 QPIC NAND controller
version 1.5.0 which uses BAM DMA and its FLASH_DEV_CMD registers
starting offset is 0x7000.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index cc58e8f..d606262 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -2866,6 +2866,12 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 	.flash_dev_offset = 0x0,
 };
 
+static const struct qcom_nandc_props ipq8074_nandc_props = {
+	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
+	.is_bam = true,
+	.flash_dev_offset = 0x7000,
+};
+
 /*
  * data will hold a struct pointer containing more differences once we support
  * more controller variants
@@ -2879,6 +2885,10 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 		.compatible = "qcom,ipq4019-nand",
 		.data = &ipq4019_nandc_props,
 	},
+	{
+		.compatible = "qcom,ipq8074-nand",
+		.data = &ipq8074_nandc_props,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_nandc_of_match);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
