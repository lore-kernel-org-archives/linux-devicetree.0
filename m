From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 23/25] mtd: nand: qcom: change register offset defines with enums
Date: Wed, 19 Jul 2017 17:18:11 +0530
Message-ID: <1500464893-11352-24-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The current driver defines the register offset with preprocessor
macro which is defined crossponding to NAND controller version
1.4.0. This patch changes these macro with enumeration. It also
adds mapping array which contains controller register offsets for
each register offset enumeration. This mapping array will be
referenced before each register read and writes, where the register
offset enumeration is being replaced with actual register offsets.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 154 +++++++++++++++++++++++++++---------------
 1 file changed, 100 insertions(+), 54 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 7a7db6b..0896e56 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -24,43 +24,6 @@
 #include <linux/delay.h>
 #include <linux/dma/qcom_bam_dma.h>
 
-/* NANDc reg offsets */
-#define	NAND_FLASH_CMD			0x00
-#define	NAND_ADDR0			0x04
-#define	NAND_ADDR1			0x08
-#define	NAND_FLASH_CHIP_SELECT		0x0c
-#define	NAND_EXEC_CMD			0x10
-#define	NAND_FLASH_STATUS		0x14
-#define	NAND_BUFFER_STATUS		0x18
-#define	NAND_DEV0_CFG0			0x20
-#define	NAND_DEV0_CFG1			0x24
-#define	NAND_DEV0_ECC_CFG		0x28
-#define	NAND_DEV1_ECC_CFG		0x2c
-#define	NAND_DEV1_CFG0			0x30
-#define	NAND_DEV1_CFG1			0x34
-#define	NAND_READ_ID			0x40
-#define	NAND_READ_STATUS		0x44
-#define	NAND_DEV_CMD0			0xa0
-#define	NAND_DEV_CMD1			0xa4
-#define	NAND_DEV_CMD2			0xa8
-#define	NAND_DEV_CMD_VLD		0xac
-#define	SFLASHC_BURST_CFG		0xe0
-#define	NAND_ERASED_CW_DETECT_CFG	0xe8
-#define	NAND_ERASED_CW_DETECT_STATUS	0xec
-#define	NAND_EBI2_ECC_BUF_CFG		0xf0
-#define	FLASH_BUF_ACC			0x100
-
-#define	NAND_CTRL			0xf00
-#define	NAND_VERSION			0xf08
-#define	NAND_READ_LOCATION_0		0xf20
-#define	NAND_READ_LOCATION_1		0xf24
-#define	NAND_READ_LOCATION_2		0xf28
-#define	NAND_READ_LOCATION_3		0xf2c
-
-/* dummy register offsets, used by write_reg_dma */
-#define	NAND_DEV_CMD1_RESTORE		0xdead
-#define	NAND_DEV_CMD_VLD_RESTORE	0xbeef
-
 /* NAND_FLASH_CMD bits */
 #define	PAGE_ACC			BIT(4)
 #define	LAST_PAGE			BIT(5)
@@ -196,6 +159,8 @@
 /* Returns the NAND register physical address */
 #define NAND_REG_PHYS(chip, offset) ((chip)->base_phys + (offset))
 
+#define NANDC_FLASH_BUF(nandc) nandc->props->reg_offsets[FLASH_BUF_ACC]
+
 #define QPIC_PER_CW_CMD_ELEMENTS	32
 #define QPIC_PER_CW_CMD_SGL		32
 #define QPIC_PER_CW_DATA_SGL		8
@@ -213,6 +178,44 @@
  */
 #define NAND_ERASED_CW_SET		BIT(4)
 
+/* NANDc reg offsets enumeration */
+enum {
+	NAND_FLASH_CMD,
+	NAND_ADDR0,
+	NAND_ADDR1,
+	NAND_FLASH_CHIP_SELECT,
+	NAND_EXEC_CMD,
+	NAND_FLASH_STATUS,
+	NAND_BUFFER_STATUS,
+	NAND_DEV0_CFG0,
+	NAND_DEV0_CFG1,
+	NAND_DEV0_ECC_CFG,
+	NAND_DEV1_ECC_CFG,
+	NAND_DEV1_CFG0,
+	NAND_DEV1_CFG1,
+	NAND_READ_ID,
+	NAND_READ_STATUS,
+	NAND_DEV_CMD0,
+	NAND_DEV_CMD1,
+	NAND_DEV_CMD2,
+	NAND_DEV_CMD_VLD,
+	SFLASHC_BURST_CFG,
+	NAND_ERASED_CW_DETECT_CFG,
+	NAND_ERASED_CW_DETECT_STATUS,
+	NAND_EBI2_ECC_BUF_CFG,
+	FLASH_BUF_ACC,
+	NAND_CTRL,
+	NAND_VERSION,
+	NAND_READ_LOCATION_0,
+	NAND_READ_LOCATION_1,
+	NAND_READ_LOCATION_2,
+	NAND_READ_LOCATION_3,
+
+	/* dummy register offsets, used by write_reg_dma */
+	NAND_DEV_CMD1_RESTORE,
+	NAND_DEV_CMD_VLD_RESTORE,
+};
+
 /*
  * This data type corresponds to the BAM transaction which will be used for all
  * NAND transfers.
@@ -434,10 +437,46 @@ struct qcom_nand_host {
  * among different NAND controller IP's.
  * @ecc_modes - ecc mode for NAND
  * @is_bam - whether NAND controller is using bam
+ * @reg_offsets:		register offset mapping array
  */
 struct qcom_props {
 	u32 ecc_modes;
 	bool is_bam;
+	const u32 *reg_offsets;
+};
+
+/* Mapping table which contains the actual register offsets */
+static const u32 nandc_reg_offsets[] = {
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
+	[NAND_DEV_CMD0] = 0xa0,
+	[NAND_DEV_CMD1] = 0xa4,
+	[NAND_DEV_CMD2] = 0xa8,
+	[NAND_DEV_CMD_VLD] = 0xac,
+	[SFLASHC_BURST_CFG] = 0xe0,
+	[NAND_ERASED_CW_DETECT_CFG] = 0xe8,
+	[NAND_ERASED_CW_DETECT_STATUS] = 0xec,
+	[NAND_EBI2_ECC_BUF_CFG] = 0xf0,
+	[FLASH_BUF_ACC] = 0x100,
+	[NAND_CTRL] = 0xf00,
+	[NAND_VERSION] = 0xf08,
+	[NAND_READ_LOCATION_0] = 0xf20,
+	[NAND_READ_LOCATION_1] = 0xf24,
+	[NAND_READ_LOCATION_2] = 0xf28,
+	[NAND_READ_LOCATION_3] = 0xf2c,
 };
 
 /* Frees the BAM transaction memory */
@@ -521,13 +560,13 @@ static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
 
 static inline u32 nandc_read(struct qcom_nand_controller *nandc, int offset)
 {
-	return ioread32(nandc->base + offset);
+	return ioread32(nandc->base + nandc->props->reg_offsets[offset]);
 }
 
 static inline void nandc_write(struct qcom_nand_controller *nandc, int offset,
 			       u32 val)
 {
-	iowrite32(val, nandc->base + offset);
+	iowrite32(val, nandc->base + nandc->props->reg_offsets[offset]);
 }
 
 static inline void nandc_read_buffer_sync(struct qcom_nand_controller *nandc,
@@ -920,19 +959,20 @@ static int read_reg_dma(struct qcom_nand_controller *nandc, int first,
 			int num_regs, unsigned int flags)
 {
 	bool flow_control = false;
+	u32 reg_offset = nandc->props->reg_offsets[first];
 	void *vaddr;
 
 	vaddr = nandc->reg_read_buf + nandc->reg_read_pos;
 	nandc->reg_read_pos += num_regs;
 
 	if (nandc->props->is_bam)
-		return prep_bam_dma_desc_cmd(nandc, true, first, vaddr,
+		return prep_bam_dma_desc_cmd(nandc, true, reg_offset, vaddr,
 					     num_regs, flags);
 
 	if (first == NAND_READ_ID || first == NAND_FLASH_STATUS)
 		flow_control = true;
 
-	return prep_adm_dma_desc(nandc, true, first, vaddr,
+	return prep_adm_dma_desc(nandc, true, reg_offset, vaddr,
 				 num_regs * sizeof(u32), flow_control);
 }
 
@@ -948,6 +988,7 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 {
 	bool flow_control = false;
 	struct nandc_regs *regs = nandc->regs;
+	u32 reg_offset;
 	void *vaddr;
 
 	vaddr = offset_to_nandc_reg(regs, first);
@@ -968,14 +1009,15 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 	if (first == NAND_DEV_CMD_VLD_RESTORE)
 		first = NAND_DEV_CMD_VLD;
 
+	reg_offset = nandc->props->reg_offsets[first];
 	if (nandc->props->is_bam)
-		return prep_bam_dma_desc_cmd(nandc, false, first, vaddr,
+		return prep_bam_dma_desc_cmd(nandc, false, reg_offset, vaddr,
 					     num_regs, flags);
 
 	if (first == NAND_FLASH_CMD)
 		flow_control = true;
 
-	return prep_adm_dma_desc(nandc, false, first, vaddr,
+	return prep_adm_dma_desc(nandc, false, reg_offset, vaddr,
 				 num_regs * sizeof(u32), flow_control);
 }
 
@@ -1136,7 +1178,7 @@ static int nandc_param(struct qcom_nand_host *host)
 
 	config_nand_single_cw_page_read(nandc);
 
-	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
+	read_data_dma(nandc, NANDC_FLASH_BUF(nandc), nandc->data_buffer,
 		      nandc->buf_count, 0);
 
 	/* restore CMD1 and VLD regs */
@@ -1623,7 +1665,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 		config_nand_cw_read(nandc);
 
 		if (data_buf)
-			read_data_dma(nandc, FLASH_BUF_ACC, data_buf,
+			read_data_dma(nandc, NANDC_FLASH_BUF(nandc), data_buf,
 				      data_size, 0);
 
 		/*
@@ -1639,7 +1681,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 			for (j = 0; j < host->bbm_size; j++)
 				*oob_buf++ = 0xff;
 
-			read_data_dma(nandc, FLASH_BUF_ACC + data_size,
+			read_data_dma(nandc, NANDC_FLASH_BUF(nandc) + data_size,
 				      oob_buf, oob_size, 0);
 		}
 
@@ -1683,7 +1725,8 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
 
 	config_nand_single_cw_page_read(nandc);
 
-	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size, 0);
+	read_data_dma(nandc, NANDC_FLASH_BUF(nandc), nandc->data_buffer,
+		      size, 0);
 
 	ret = submit_descs(nandc);
 	if (ret)
@@ -1739,7 +1782,7 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size1, data_size2, oob_size1, oob_size2;
-		int reg_off = FLASH_BUF_ACC;
+		int reg_off = NANDC_FLASH_BUF(nandc);
 
 		data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 		oob_size1 = host->bbm_size;
@@ -1851,7 +1894,8 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 		}
 
 
-		write_data_dma(nandc, FLASH_BUF_ACC, data_buf, data_size,
+		write_data_dma(nandc, NANDC_FLASH_BUF(nandc), data_buf,
+			       data_size,
 			       i == (ecc->steps - 1) ? NAND_BAM_NO_EOT : 0);
 
 		/*
@@ -1864,8 +1908,8 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 		if (i == (ecc->steps - 1)) {
 			oob_buf += host->bbm_size;
 
-			write_data_dma(nandc, FLASH_BUF_ACC + data_size,
-				       oob_buf, oob_size, 0);
+			write_data_dma(nandc, NANDC_FLASH_BUF(nandc) +
+				       data_size, oob_buf, oob_size, 0);
 		}
 
 		config_nand_cw_write(nandc);
@@ -1906,7 +1950,7 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
 
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size1, data_size2, oob_size1, oob_size2;
-		int reg_off = FLASH_BUF_ACC;
+		int reg_off = NANDC_FLASH_BUF(nandc);
 
 		data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 		oob_size1 = host->bbm_size;
@@ -1992,7 +2036,7 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 	update_rw_regs(host, 1, false);
 
 	config_nand_page_write(nandc);
-	write_data_dma(nandc, FLASH_BUF_ACC,
+	write_data_dma(nandc, NANDC_FLASH_BUF(nandc),
 		       nandc->data_buffer, data_size + oob_size, 0);
 	config_nand_cw_write(nandc);
 
@@ -2079,7 +2123,7 @@ static int qcom_nandc_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	update_rw_regs(host, 1, false);
 
 	config_nand_page_write(nandc);
-	write_data_dma(nandc, FLASH_BUF_ACC,
+	write_data_dma(nandc, NANDC_FLASH_BUF(nandc),
 		       nandc->data_buffer, host->cw_size, 0);
 	config_nand_cw_write(nandc);
 
@@ -2838,11 +2882,13 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 static const struct qcom_props ebi2_nandc_data = {
 	.ecc_modes = (ECC_RS_4BIT | ECC_BCH_8BIT),
 	.is_bam = false,
+	.reg_offsets = nandc_reg_offsets,
 };
 
 static const struct qcom_props qpic_nandc_v1_4_0_data = {
 	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
 	.is_bam = true,
+	.reg_offsets = nandc_reg_offsets,
 };
 
 /*
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
