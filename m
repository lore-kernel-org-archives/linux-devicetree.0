From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 07/25] mtd: nand: qcom: reorganize nand page read
Date: Wed, 19 Jul 2017 17:17:55 +0530
Message-ID: <1500464893-11352-8-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Each NAND page consist of multiple codewords. Following is
sequence for NAND page read according to hardware guide.

1. Program Power-up configuration, page row, page column
address and flash configuration registers.
2. Write NAND_FLASH_CMD followed by NANC_EXEC_CMD for each
codeword.
3. Read NAND_FLASH_STATUS for each codeword.

The step 1 should be done once for each page and step 2,3 should
be done for each codeword.

Currently, all the 3 steps are being done for each codeword which
is wrong. Now this patch reorganizes read page functions to
configure page specific register once and per codeword specific
registers for each NAND ECC step.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 110a26a..27ea594 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -605,15 +605,23 @@ static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
 }
 
 /*
- * helper to prepare dma descriptors to configure registers needed for reading a
- * codeword/step in a page
+ * Helper to prepare DMA descriptors for configuring registers
+ * before reading a NAND page.
  */
-static void config_cw_read(struct qcom_nand_controller *nandc)
+static void config_nand_page_read(struct qcom_nand_controller *nandc)
 {
-	write_reg_dma(nandc, NAND_FLASH_CMD, 3);
+	write_reg_dma(nandc, NAND_ADDR0, 2);
 	write_reg_dma(nandc, NAND_DEV0_CFG0, 3);
 	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1);
+}
 
+/*
+ * Helper to prepare DMA descriptors for configuring registers
+ * before reading each codeword in NAND page.
+ */
+static void config_nand_cw_read(struct qcom_nand_controller *nandc)
+{
+	write_reg_dma(nandc, NAND_FLASH_CMD, 1);
 	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
 
 	read_reg_dma(nandc, NAND_FLASH_STATUS, 2);
@@ -621,9 +629,15 @@ static void config_cw_read(struct qcom_nand_controller *nandc)
 }
 
 /*
- * helpers to prepare dma descriptors used to configure registers needed for
- * writing a codeword/step in a page
+ * Helper to prepare dma descriptors to configure registers needed for reading a
+ * single codeword in page
  */
+static void config_nand_single_cw_page_read(struct qcom_nand_controller *nandc)
+{
+	config_nand_page_read(nandc);
+	config_nand_cw_read(nandc);
+}
+
 static void config_cw_write_pre(struct qcom_nand_controller *nandc)
 {
 	write_reg_dma(nandc, NAND_FLASH_CMD, 3);
@@ -692,7 +706,7 @@ static int nandc_param(struct qcom_nand_host *host)
 	nandc->buf_count = 512;
 	memset(nandc->data_buffer, 0xff, nandc->buf_count);
 
-	config_cw_read(nandc);
+	config_nand_single_cw_page_read(nandc);
 
 	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
 		      nandc->buf_count);
@@ -1105,6 +1119,8 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	int i, ret;
 
+	config_nand_page_read(nandc);
+
 	/* queue cmd descs for each codeword */
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size, oob_size;
@@ -1118,7 +1134,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 			oob_size = host->ecc_bytes_hw + host->spare_bytes;
 		}
 
-		config_cw_read(nandc);
+		config_nand_cw_read(nandc);
 
 		if (data_buf)
 			read_data_dma(nandc, FLASH_BUF_ACC, data_buf,
@@ -1178,7 +1194,7 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
 	update_rw_regs(host, 1, true);
 
-	config_cw_read(nandc);
+	config_nand_single_cw_page_read(nandc);
 
 	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size);
 
@@ -1228,6 +1244,7 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 
 	host->use_ecc = false;
 	update_rw_regs(host, ecc->steps, true);
+	config_nand_page_read(nandc);
 
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size1, data_size2, oob_size1, oob_size2;
@@ -1246,7 +1263,7 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 			oob_size2 = host->ecc_bytes_hw + host->spare_bytes;
 		}
 
-		config_cw_read(nandc);
+		config_nand_cw_read(nandc);
 
 		read_data_dma(nandc, reg_off, data_buf, data_size1);
 		reg_off += data_size1;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
