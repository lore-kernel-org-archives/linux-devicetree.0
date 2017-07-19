From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 18/25] mtd: nand: qcom: support for passing flags in transfer functions
Date: Wed, 19 Jul 2017 17:18:06 +0530
Message-ID: <1500464893-11352-19-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The BAM has multiple flags to control the transfer. This patch
adds flags parameter in register and data transfer functions and
modifies all these function call with appropriate flags.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 120 ++++++++++++++++++++++++------------------
 1 file changed, 68 insertions(+), 52 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 589108b..8a6034f 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -177,6 +177,14 @@
 #define QPIC_PER_CW_CMD_SGL		32
 #define QPIC_PER_CW_DATA_SGL		8
 
+/* Flags used for BAM DMA desc preparation*/
+/* Don't set the EOT in current tx sgl */
+#define NAND_BAM_NO_EOT			BIT(0)
+/* Set the NWD flag in current sgl */
+#define NAND_BAM_NWD			BIT(1)
+/* Finish writing in the current sgl and start writing in another sgl */
+#define NAND_BAM_NEXT_SGL		BIT(2)
+
 /*
  * This data type corresponds to the BAM transaction which will be used for all
  * NAND transfers.
@@ -735,7 +743,7 @@ static int prep_adm_dma_desc(struct qcom_nand_controller *nandc, bool read,
  * @num_regs:		number of registers to read
  */
 static int read_reg_dma(struct qcom_nand_controller *nandc, int first,
-			int num_regs)
+			int num_regs, unsigned int flags)
 {
 	bool flow_control = false;
 	void *vaddr;
@@ -759,7 +767,7 @@ static int read_reg_dma(struct qcom_nand_controller *nandc, int first,
  * @num_regs:		number of registers to write
  */
 static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
-			 int num_regs)
+			 int num_regs, unsigned int flags)
 {
 	bool flow_control = false;
 	struct nandc_regs *regs = nandc->regs;
@@ -771,6 +779,9 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 	if (first == NAND_FLASH_CMD)
 		flow_control = true;
 
+	if (first == NAND_EXEC_CMD)
+		flags |= NAND_BAM_NWD;
+
 	if (first == NAND_DEV_CMD1_RESTORE)
 		first = NAND_DEV_CMD1;
 
@@ -792,7 +803,7 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
  * @size:		DMA transaction size in bytes
  */
 static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
-			 const u8 *vaddr, int size)
+			 const u8 *vaddr, int size, unsigned int flags)
 {
 	return prep_adm_dma_desc(nandc, true, reg_off, vaddr, size, false);
 }
@@ -806,7 +817,7 @@ static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
  * @size:		DMA transaction size in bytes
  */
 static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
-			  const u8 *vaddr, int size)
+			  const u8 *vaddr, int size, unsigned int flags)
 {
 	return prep_adm_dma_desc(nandc, false, reg_off, vaddr, size, false);
 }
@@ -817,9 +828,9 @@ static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
  */
 static void config_nand_page_read(struct qcom_nand_controller *nandc)
 {
-	write_reg_dma(nandc, NAND_ADDR0, 2);
-	write_reg_dma(nandc, NAND_DEV0_CFG0, 3);
-	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1);
+	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
+	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
+	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
 }
 
 /*
@@ -828,11 +839,12 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
  */
 static void config_nand_cw_read(struct qcom_nand_controller *nandc)
 {
-	write_reg_dma(nandc, NAND_FLASH_CMD, 1);
-	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
+	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
+	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
-	read_reg_dma(nandc, NAND_FLASH_STATUS, 2);
-	read_reg_dma(nandc, NAND_ERASED_CW_DETECT_STATUS, 1);
+	read_reg_dma(nandc, NAND_FLASH_STATUS, 2, 0);
+	read_reg_dma(nandc, NAND_ERASED_CW_DETECT_STATUS, 1,
+		     NAND_BAM_NEXT_SGL);
 }
 
 /*
@@ -851,9 +863,10 @@ static void config_nand_single_cw_page_read(struct qcom_nand_controller *nandc)
  */
 static void config_nand_page_write(struct qcom_nand_controller *nandc)
 {
-	write_reg_dma(nandc, NAND_ADDR0, 2);
-	write_reg_dma(nandc, NAND_DEV0_CFG0, 3);
-	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1);
+	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
+	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
+	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1,
+		      NAND_BAM_NEXT_SGL);
 }
 
 /*
@@ -862,13 +875,13 @@ static void config_nand_page_write(struct qcom_nand_controller *nandc)
  */
 static void config_nand_cw_write(struct qcom_nand_controller *nandc)
 {
-	write_reg_dma(nandc, NAND_FLASH_CMD, 1);
-	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
+	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
+	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
-	read_reg_dma(nandc, NAND_FLASH_STATUS, 1);
+	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
 
-	write_reg_dma(nandc, NAND_FLASH_STATUS, 1);
-	write_reg_dma(nandc, NAND_READ_STATUS, 1);
+	write_reg_dma(nandc, NAND_FLASH_STATUS, 1, 0);
+	write_reg_dma(nandc, NAND_READ_STATUS, 1, NAND_BAM_NEXT_SGL);
 }
 
 /*
@@ -916,8 +929,8 @@ static int nandc_param(struct qcom_nand_host *host)
 	nandc_set_reg(nandc, NAND_DEV_CMD1_RESTORE, nandc->cmd1);
 	nandc_set_reg(nandc, NAND_DEV_CMD_VLD_RESTORE, nandc->vld);
 
-	write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1);
-	write_reg_dma(nandc, NAND_DEV_CMD1, 1);
+	write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
+	write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
 
 	nandc->buf_count = 512;
 	memset(nandc->data_buffer, 0xff, nandc->buf_count);
@@ -925,11 +938,11 @@ static int nandc_param(struct qcom_nand_host *host)
 	config_nand_single_cw_page_read(nandc);
 
 	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
-		      nandc->buf_count);
+		      nandc->buf_count, 0);
 
 	/* restore CMD1 and VLD regs */
-	write_reg_dma(nandc, NAND_DEV_CMD1_RESTORE, 1);
-	write_reg_dma(nandc, NAND_DEV_CMD_VLD_RESTORE, 1);
+	write_reg_dma(nandc, NAND_DEV_CMD1_RESTORE, 1, 0);
+	write_reg_dma(nandc, NAND_DEV_CMD_VLD_RESTORE, 1, NAND_BAM_NEXT_SGL);
 
 	return 0;
 }
@@ -951,14 +964,14 @@ static int erase_block(struct qcom_nand_host *host, int page_addr)
 	nandc_set_reg(nandc, NAND_FLASH_STATUS, host->clrflashstatus);
 	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
 
-	write_reg_dma(nandc, NAND_FLASH_CMD, 3);
-	write_reg_dma(nandc, NAND_DEV0_CFG0, 2);
-	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
+	write_reg_dma(nandc, NAND_FLASH_CMD, 3, NAND_BAM_NEXT_SGL);
+	write_reg_dma(nandc, NAND_DEV0_CFG0, 2, NAND_BAM_NEXT_SGL);
+	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
-	read_reg_dma(nandc, NAND_FLASH_STATUS, 1);
+	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
 
-	write_reg_dma(nandc, NAND_FLASH_STATUS, 1);
-	write_reg_dma(nandc, NAND_READ_STATUS, 1);
+	write_reg_dma(nandc, NAND_FLASH_STATUS, 1, 0);
+	write_reg_dma(nandc, NAND_READ_STATUS, 1, NAND_BAM_NEXT_SGL);
 
 	return 0;
 }
@@ -978,10 +991,10 @@ static int read_id(struct qcom_nand_host *host, int column)
 	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
-	write_reg_dma(nandc, NAND_FLASH_CMD, 4);
-	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
+	write_reg_dma(nandc, NAND_FLASH_CMD, 4, NAND_BAM_NEXT_SGL);
+	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
-	read_reg_dma(nandc, NAND_READ_ID, 1);
+	read_reg_dma(nandc, NAND_READ_ID, 1, NAND_BAM_NEXT_SGL);
 
 	return 0;
 }
@@ -995,10 +1008,10 @@ static int reset(struct qcom_nand_host *host)
 	nandc_set_reg(nandc, NAND_FLASH_CMD, RESET_DEVICE);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
-	write_reg_dma(nandc, NAND_FLASH_CMD, 1);
-	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
+	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
+	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
-	read_reg_dma(nandc, NAND_FLASH_STATUS, 1);
+	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
 
 	return 0;
 }
@@ -1395,7 +1408,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 
 		if (data_buf)
 			read_data_dma(nandc, FLASH_BUF_ACC, data_buf,
-				      data_size);
+				      data_size, 0);
 
 		/*
 		 * when ecc is enabled, the controller doesn't read the real
@@ -1411,7 +1424,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 				*oob_buf++ = 0xff;
 
 			read_data_dma(nandc, FLASH_BUF_ACC + data_size,
-				      oob_buf, oob_size);
+				      oob_buf, oob_size, 0);
 		}
 
 		if (data_buf)
@@ -1453,7 +1466,7 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
 
 	config_nand_single_cw_page_read(nandc);
 
-	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size);
+	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size, 0);
 
 	ret = submit_descs(nandc);
 	if (ret)
@@ -1522,19 +1535,19 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 
 		config_nand_cw_read(nandc);
 
-		read_data_dma(nandc, reg_off, data_buf, data_size1);
+		read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
 		reg_off += data_size1;
 		data_buf += data_size1;
 
-		read_data_dma(nandc, reg_off, oob_buf, oob_size1);
+		read_data_dma(nandc, reg_off, oob_buf, oob_size1, 0);
 		reg_off += oob_size1;
 		oob_buf += oob_size1;
 
-		read_data_dma(nandc, reg_off, data_buf, data_size2);
+		read_data_dma(nandc, reg_off, data_buf, data_size2, 0);
 		reg_off += data_size2;
 		data_buf += data_size2;
 
-		read_data_dma(nandc, reg_off, oob_buf, oob_size2);
+		read_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
 		oob_buf += oob_size2;
 	}
 
@@ -1601,7 +1614,8 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 		}
 
 
-		write_data_dma(nandc, FLASH_BUF_ACC, data_buf, data_size);
+		write_data_dma(nandc, FLASH_BUF_ACC, data_buf, data_size,
+			       i == (ecc->steps - 1) ? NAND_BAM_NO_EOT : 0);
 
 		/*
 		 * when ECC is enabled, we don't really need to write anything
@@ -1614,7 +1628,7 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 			oob_buf += host->bbm_size;
 
 			write_data_dma(nandc, FLASH_BUF_ACC + data_size,
-				       oob_buf, oob_size);
+				       oob_buf, oob_size, 0);
 		}
 
 		config_nand_cw_write(nandc);
@@ -1669,19 +1683,20 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
 			oob_size2 = host->ecc_bytes_hw + host->spare_bytes;
 		}
 
-		write_data_dma(nandc, reg_off, data_buf, data_size1);
+		write_data_dma(nandc, reg_off, data_buf, data_size1,
+			       NAND_BAM_NO_EOT);
 		reg_off += data_size1;
 		data_buf += data_size1;
 
-		write_data_dma(nandc, reg_off, oob_buf, oob_size1);
+		write_data_dma(nandc, reg_off, oob_buf, oob_size1, 0);
 		reg_off += oob_size1;
 		oob_buf += oob_size1;
 
-		write_data_dma(nandc, reg_off, data_buf, data_size2);
+		write_data_dma(nandc, reg_off, data_buf, data_size2, 0);
 		reg_off += data_size2;
 		data_buf += data_size2;
 
-		write_data_dma(nandc, reg_off, oob_buf, oob_size2);
+		write_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
 		oob_buf += oob_size2;
 
 		config_nand_cw_write(nandc);
@@ -1735,8 +1750,8 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 	update_rw_regs(host, 1, false);
 
 	config_nand_page_write(nandc);
-	write_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
-		       data_size + oob_size);
+	write_data_dma(nandc, FLASH_BUF_ACC,
+		       nandc->data_buffer, data_size + oob_size, 0);
 	config_nand_cw_write(nandc);
 
 	ret = submit_descs(nandc);
@@ -1820,7 +1835,8 @@ static int qcom_nandc_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	update_rw_regs(host, 1, false);
 
 	config_nand_page_write(nandc);
-	write_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, host->cw_size);
+	write_data_dma(nandc, FLASH_BUF_ACC,
+		       nandc->data_buffer, host->cw_size, 0);
 	config_nand_cw_write(nandc);
 
 	ret = submit_descs(nandc);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
