From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 09/20] mtd: nand: qcom: support for read location registers
Date: Fri, 11 Aug 2017 17:09:24 +0530
Message-ID: <1502451575-15712-10-git-send-email-absahu@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@free-electrons.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

In EBI2, all codeword data will be read in FLASH_BUF_ACC buffer
and ADM will copy the data from source (FLASH_BUF_ACC) to
destination (memory for data read).

In QPIC, there is no FLASH_BUF_ACC and all the codeword data will
held in QPIC BAM FIFO buffers. It provides multiple READ_LOCATION
registers which will be used for copying the data from FIFO to
memory. The READ_LOCATION register will be used to read a
specific amount of data from a specific offset within the flash
buffer. It supports sequential offset requests. Each request is
composed of the following fields:

a. Offset within the flash buffer from which data should be
   read
b. Amount of data to be read
c. Flag bit specifying the last read request from the flash
   buffer. Following the last read request the NANDc refers to the
   buffer as empty.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 64 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index d9c8a6b..b452cfb 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -53,6 +53,8 @@
 #define	NAND_VERSION			0xf08
 #define	NAND_READ_LOCATION_0		0xf20
 #define	NAND_READ_LOCATION_1		0xf24
+#define	NAND_READ_LOCATION_2		0xf28
+#define	NAND_READ_LOCATION_3		0xf2c
 
 /* dummy register offsets, used by write_reg_dma */
 #define	NAND_DEV_CMD1_RESTORE		0xdead
@@ -135,6 +137,11 @@
 #define	ERASED_PAGE			(PAGE_ALL_ERASED | PAGE_ERASED)
 #define	ERASED_CW			(CODEWORD_ALL_ERASED | CODEWORD_ERASED)
 
+/* NAND_READ_LOCATION_n bits */
+#define READ_LOCATION_OFFSET		0
+#define READ_LOCATION_SIZE		16
+#define READ_LOCATION_LAST		31
+
 /* Version Mask */
 #define	NAND_VERSION_MAJOR_MASK		0xf0000000
 #define	NAND_VERSION_MAJOR_SHIFT	28
@@ -177,6 +184,12 @@
 #define	ECC_BCH_4BIT	BIT(2)
 #define	ECC_BCH_8BIT	BIT(3)
 
+#define nandc_set_readl(nandc, reg, offset, size, is_last)	\
+nandc_set_reg(nandc, NAND_READ_LOCATION_##reg,			\
+	      ((offset) << READ_LOCATION_OFFSET) |		\
+	      ((size) << READ_LOCATION_SIZE) |			\
+	      ((is_last) << READ_LOCATION_LAST))
+
 #define QPIC_PER_CW_CMD_SGL		32
 #define QPIC_PER_CW_DATA_SGL		8
 
@@ -260,6 +273,11 @@ struct nandc_regs {
 	__le32 orig_vld;
 
 	__le32 ecc_buf_cfg;
+	__le32 read_location0;
+	__le32 read_location1;
+	__le32 read_location2;
+	__le32 read_location3;
+
 };
 
 /*
@@ -516,6 +534,14 @@ static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int offset)
 		return &regs->orig_vld;
 	case NAND_EBI2_ECC_BUF_CFG:
 		return &regs->ecc_buf_cfg;
+	case NAND_READ_LOCATION_0:
+		return &regs->read_location0;
+	case NAND_READ_LOCATION_1:
+		return &regs->read_location1;
+	case NAND_READ_LOCATION_2:
+		return &regs->read_location2;
+	case NAND_READ_LOCATION_3:
+		return &regs->read_location3;
 	default:
 		return NULL;
 	}
@@ -590,6 +616,10 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 	nandc_set_reg(nandc, NAND_FLASH_STATUS, host->clrflashstatus);
 	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
+
+	if (read)
+		nandc_set_readl(nandc, 0, 0, host->use_ecc ?
+				host->cw_data : host->cw_size, 1);
 }
 
 /*
@@ -835,6 +865,10 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
  */
 static void config_nand_cw_read(struct qcom_nand_controller *nandc)
 {
+	if (nandc->props->is_bam)
+		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
+			      NAND_BAM_NEXT_SGL);
+
 	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
@@ -923,6 +957,7 @@ static int nandc_param(struct qcom_nand_host *host)
 
 	nandc_set_reg(nandc, NAND_DEV_CMD1_RESTORE, nandc->cmd1);
 	nandc_set_reg(nandc, NAND_DEV_CMD_VLD_RESTORE, nandc->vld);
+	nandc_set_readl(nandc, 0, 0, 512, 1);
 
 	write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
 	write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
@@ -1398,6 +1433,19 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 			oob_size = host->ecc_bytes_hw + host->spare_bytes;
 		}
 
+		if (nandc->props->is_bam) {
+			if (data_buf && oob_buf) {
+				nandc_set_readl(nandc, 0, 0, data_size, 0);
+				nandc_set_readl(nandc, 1, data_size,
+						oob_size, 1);
+			} else if (data_buf) {
+				nandc_set_readl(nandc, 0, 0, data_size, 1);
+			} else {
+				nandc_set_readl(nandc, 0, data_size,
+						oob_size, 1);
+			}
+		}
+
 		config_nand_cw_read(nandc);
 
 		if (data_buf)
@@ -1457,6 +1505,7 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
 
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
 	update_rw_regs(host, 1, true);
+	nandc_set_readl(nandc, 0, 0, size, 1);
 
 	config_nand_single_cw_page_read(nandc);
 
@@ -1502,6 +1551,7 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 	u8 *data_buf, *oob_buf;
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	int i, ret;
+	int read_loc;
 
 	data_buf = buf;
 	oob_buf = chip->oob_poi;
@@ -1527,6 +1577,20 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 			oob_size2 = host->ecc_bytes_hw + host->spare_bytes;
 		}
 
+		if (nandc->props->is_bam) {
+			read_loc = 0;
+			nandc_set_readl(nandc, 0, read_loc, data_size1, 0);
+			read_loc += data_size1;
+
+			nandc_set_readl(nandc, 1, read_loc, oob_size1, 0);
+			read_loc += oob_size1;
+
+			nandc_set_readl(nandc, 2, read_loc, data_size2, 0);
+			read_loc += data_size2;
+
+			nandc_set_readl(nandc, 3, read_loc, oob_size2, 1);
+		}
+
 		config_nand_cw_read(nandc);
 
 		read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
