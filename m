From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 11/14] qcom: mtd: nand: BAM raw read and write support
Date: Thu, 29 Jun 2017 12:46:03 +0530
Message-ID: <1498720566-20782-12-git-send-email-absahu@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

1. BAM uses READ_LOCATION registers to copy data from offset
   into data buffer.

2. BAM requires EOT flag should be set only for the last data
   write in a codeword.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 46 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 4c6e594..6d749b6 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -1033,7 +1033,7 @@ static void config_bam_page_read(struct qcom_nand_controller *nandc)
  */
 static void config_bam_cw_read(struct qcom_nand_controller *nandc)
 {
-	write_reg_dma(nandc, NAND_READ_LOCATION_0, 2, 0);
+	write_reg_dma(nandc, NAND_READ_LOCATION_0, 4, 0);
 	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
@@ -1734,6 +1734,7 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 	u8 *data_buf, *oob_buf;
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	int i, ret;
+	int read_location;
 
 	data_buf = buf;
 	oob_buf = chip->oob_poi;
@@ -1743,6 +1744,9 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 	clear_bam_transaction(nandc);
 	update_rw_regs(host, ecc->steps, true);
 
+	if (nandc->dma_bam_enabled)
+		config_bam_page_read(nandc);
+
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size1, data_size2, oob_size1, oob_size2;
 		int reg_off = FLASH_BUF_ACC;
@@ -1760,7 +1764,35 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 			oob_size2 = host->ecc_bytes_hw + host->spare_bytes;
 		}
 
-		config_cw_read(nandc);
+		if (nandc->dma_bam_enabled) {
+			read_location = 0;
+			nandc_set_reg(nandc, NAND_READ_LOCATION_0,
+				      (read_location << READ_LOCATION_OFFSET) |
+				      (data_size1 << READ_LOCATION_SIZE) |
+				      (0 << READ_LOCATION_LAST));
+			read_location += data_size1;
+
+			nandc_set_reg(nandc, NAND_READ_LOCATION_1,
+				      (read_location << READ_LOCATION_OFFSET) |
+				      (oob_size1 << READ_LOCATION_SIZE) |
+				      (0 << READ_LOCATION_LAST));
+			read_location += oob_size1;
+
+			nandc_set_reg(nandc, NAND_READ_LOCATION_2,
+				      (read_location << READ_LOCATION_OFFSET) |
+				      (data_size2 << READ_LOCATION_SIZE) |
+				      (0 << READ_LOCATION_LAST));
+			read_location += data_size2;
+
+			nandc_set_reg(nandc, NAND_READ_LOCATION_3,
+				      (read_location << READ_LOCATION_OFFSET) |
+				      (oob_size2 << READ_LOCATION_SIZE) |
+				      (1 << READ_LOCATION_LAST));
+
+			config_bam_cw_read(nandc);
+		} else {
+			config_cw_read(nandc);
+		}
 
 		read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
 		reg_off += data_size1;
@@ -1914,15 +1946,18 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
 
 		config_cw_write_pre(nandc);
 
-		write_data_dma(nandc, reg_off, data_buf, data_size1, 0);
+		write_data_dma(nandc, reg_off, data_buf, data_size1,
+			       NAND_BAM_NO_EOT);
 		reg_off += data_size1;
 		data_buf += data_size1;
 
-		write_data_dma(nandc, reg_off, oob_buf, oob_size1, 0);
+		write_data_dma(nandc, reg_off, oob_buf, oob_size1,
+			       NAND_BAM_NO_EOT);
 		reg_off += oob_size1;
 		oob_buf += oob_size1;
 
-		write_data_dma(nandc, reg_off, data_buf, data_size2, 0);
+		write_data_dma(nandc, reg_off, data_buf, data_size2,
+			       NAND_BAM_NO_EOT);
 		reg_off += data_size2;
 		data_buf += data_size2;
 
@@ -1968,6 +2003,7 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 		return ret;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	/* calculate the data and oob size for the last codeword/step */
 	data_size = ecc->size - ((ecc->steps - 1) << 2);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
