From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 10/20] mtd: nand: qcom: erased codeword detection configuration
Date: Fri, 11 Aug 2017 17:09:25 +0530
Message-ID: <1502451575-15712-11-git-send-email-absahu@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@free-electrons.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The NAND controller returns ECC failure during read of completely
erased codeword. The NAND controller has hardware functionality
to detect erased codeword in case of BCH ECC algorithm. The
NAND_ERASED_CW_DETECT_CFG register controls the erased
codeword/page detection controller. This register should be reset
before every page read by setting and clearing bit 0 of
NAND_ERASED_CW_DETECT_CFG.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index b452cfb..3d9fd7f 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -200,6 +200,11 @@
 #define NAND_BAM_NWD			BIT(1)
 /* Finish writing in the current sgl and start writing in another sgl */
 #define NAND_BAM_NEXT_SGL		BIT(2)
+/*
+ * Erased codeword status is being used two times in single transfer so this
+ * flag will determine the current value of erased codeword status register
+ */
+#define NAND_ERASED_CW_SET		BIT(4)
 
 /*
  * This data type corresponds to the BAM transaction which will be used for all
@@ -278,6 +283,8 @@ struct nandc_regs {
 	__le32 read_location2;
 	__le32 read_location3;
 
+	__le32 erased_cw_detect_cfg_clr;
+	__le32 erased_cw_detect_cfg_set;
 };
 
 /*
@@ -805,6 +812,13 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 	if (first == NAND_FLASH_CMD)
 		flow_control = true;
 
+	if (first == NAND_ERASED_CW_DETECT_CFG) {
+		if (flags & NAND_ERASED_CW_SET)
+			vaddr = &regs->erased_cw_detect_cfg_set;
+		else
+			vaddr = &regs->erased_cw_detect_cfg_clr;
+	}
+
 	if (first == NAND_EXEC_CMD)
 		flags |= NAND_BAM_NWD;
 
@@ -857,6 +871,9 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
 	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
 	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
 	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
+	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1, 0);
+	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1,
+		      NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
 }
 
 /*
@@ -2258,6 +2275,10 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
 
 	host->clrflashstatus = FS_READY_BSY_N;
 	host->clrreadstatus = 0xc0;
+	nandc->regs->erased_cw_detect_cfg_clr =
+		cpu_to_le32(CLR_ERASED_PAGE_DET);
+	nandc->regs->erased_cw_detect_cfg_set =
+		cpu_to_le32(SET_ERASED_PAGE_DET);
 
 	dev_dbg(nandc->dev,
 		"cfg0 %x cfg1 %x ecc_buf_cfg %x ecc_bch cfg %x cw_size %d cw_data %d strength %d parity_bytes %d steps %d\n",
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
