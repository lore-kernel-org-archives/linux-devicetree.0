From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 09/14] qcom: mtd: nand: BAM support for read page
Date: Thu, 29 Jun 2017 12:46:01 +0530
Message-ID: <1498720566-20782-10-git-send-email-absahu@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498720566-20782-1-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

1. The BAM mode requires few registers configuration before each
   NAND page read and codeword read which is different from ADM
   so add the helper functions which will be called in BAM mode
   only.

2. The NAND page read handling of BAM is different from ADM so
   call the appropriate helper functions

Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/mtd/nand/qcom_nandc.c | 63 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 8e7dc9e..17766af 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -870,6 +870,35 @@ static void config_cw_read(struct qcom_nand_controller *nandc)
 }
 
 /*
+ * Helpers to prepare DMA descriptors for configuring registers
+ * before reading a NAND page with BAM.
+ */
+static void config_bam_page_read(struct qcom_nand_controller *nandc)
+{
+	write_reg_dma(nandc, NAND_FLASH_CMD, 3, 0);
+	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
+	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
+	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1, 0);
+	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1,
+		      NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
+}
+
+/*
+ * Helpers to prepare DMA descriptors for configuring registers
+ * before reading each codeword in NAND page with BAM.
+ */
+static void config_bam_cw_read(struct qcom_nand_controller *nandc)
+{
+	write_reg_dma(nandc, NAND_READ_LOCATION_0, 2, 0);
+	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
+	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
+
+	read_reg_dma(nandc, NAND_FLASH_STATUS, 2, 0);
+	read_reg_dma(nandc, NAND_ERASED_CW_DETECT_STATUS, 1,
+		     NAND_BAM_NEXT_SGL);
+}
+
+/*
  * helpers to prepare dma descriptors used to configure registers needed for
  * writing a codeword/step in a page
  */
@@ -1398,6 +1427,9 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	int i, ret;
 
+	if (nandc->dma_bam_enabled)
+		config_bam_page_read(nandc);
+
 	/* queue cmd descs for each codeword */
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size, oob_size;
@@ -1411,7 +1443,36 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 			oob_size = host->ecc_bytes_hw + host->spare_bytes;
 		}
 
-		config_cw_read(nandc);
+		if (nandc->dma_bam_enabled) {
+			if (data_buf && oob_buf) {
+				nandc_set_reg(nandc, NAND_READ_LOCATION_0,
+					      (0 << READ_LOCATION_OFFSET) |
+					      (data_size <<
+					      READ_LOCATION_SIZE) |
+					      (0 << READ_LOCATION_LAST));
+				nandc_set_reg(nandc, NAND_READ_LOCATION_1,
+					      (data_size <<
+					      READ_LOCATION_OFFSET) |
+					      (oob_size << READ_LOCATION_SIZE) |
+					      (1 << READ_LOCATION_LAST));
+			} else if (data_buf) {
+				nandc_set_reg(nandc, NAND_READ_LOCATION_0,
+					      (0 << READ_LOCATION_OFFSET) |
+					      (data_size <<
+					      READ_LOCATION_SIZE) |
+					      (1 << READ_LOCATION_LAST));
+			} else {
+				nandc_set_reg(nandc, NAND_READ_LOCATION_0,
+					      (data_size <<
+					      READ_LOCATION_OFFSET) |
+					      (oob_size << READ_LOCATION_SIZE) |
+					      (1 << READ_LOCATION_LAST));
+			}
+
+			config_bam_cw_read(nandc);
+		} else {
+			config_cw_read(nandc);
+		}
 
 		if (data_buf)
 			read_data_dma(nandc, FLASH_BUF_ACC, data_buf,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
