From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 14/20] mtd: nand: qcom: add command elements in BAM transaction
Date: Fri, 11 Aug 2017 17:09:29 +0530
Message-ID: <1502451575-15712-15-git-send-email-absahu@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@free-electrons.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

All the QPIC register read/write through BAM DMA requires
command descriptor which contains the array of command elements.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index c0c140b..d17c466 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -22,6 +22,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/delay.h>
+#include <linux/dma/qcom_bam_dma.h>
 
 /* NANDc reg offsets */
 #define	NAND_FLASH_CMD			0x00
@@ -196,6 +197,7 @@
 /* Returns the actual register address for NAND_FLASH_DEV_* */
 #define nandc_dev_addr(nandc, reg) ((nandc)->props->flash_dev_offset + (reg))
 
+#define QPIC_PER_CW_CMD_ELEMENTS	32
 #define QPIC_PER_CW_CMD_SGL		32
 #define QPIC_PER_CW_DATA_SGL		8
 
@@ -215,8 +217,13 @@
 /*
  * This data type corresponds to the BAM transaction which will be used for all
  * NAND transfers.
+ * @bam_ce - the array of BAM command elements
  * @cmd_sgl - sgl for NAND BAM command pipe
  * @data_sgl - sgl for NAND BAM consumer/producer pipe
+ * @bam_ce_pos - the index in bam_ce which is available for next sgl
+ * @bam_ce_start - the index in bam_ce which marks the start position ce
+ *		   for current sgl. It will be used for size calculation
+ *		   for current sgl
  * @cmd_sgl_pos - current index in command sgl.
  * @cmd_sgl_start - start index in command sgl.
  * @tx_sgl_pos - current index in data sgl for tx.
@@ -225,8 +232,11 @@
  * @rx_sgl_start - start index in data sgl for rx.
  */
 struct bam_transaction {
+	struct bam_cmd_element *bam_ce;
 	struct scatterlist *cmd_sgl;
 	struct scatterlist *data_sgl;
+	u32 bam_ce_pos;
+	u32 bam_ce_start;
 	u32 cmd_sgl_pos;
 	u32 cmd_sgl_start;
 	u32 tx_sgl_pos;
@@ -456,7 +466,8 @@ static void free_bam_transaction(struct qcom_nand_controller *nandc)
 
 	bam_txn_size =
 		sizeof(*bam_txn) + num_cw *
-		((sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL) +
+		((sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS) +
+		(sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL) +
 		(sizeof(*bam_txn->data_sgl) * QPIC_PER_CW_DATA_SGL));
 
 	bam_txn_buf = devm_kzalloc(nandc->dev, bam_txn_size, GFP_KERNEL);
@@ -466,6 +477,10 @@ static void free_bam_transaction(struct qcom_nand_controller *nandc)
 	bam_txn = bam_txn_buf;
 	bam_txn_buf += sizeof(*bam_txn);
 
+	bam_txn->bam_ce = bam_txn_buf;
+	bam_txn_buf +=
+		sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS * num_cw;
+
 	bam_txn->cmd_sgl = bam_txn_buf;
 	bam_txn_buf +=
 		sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL * num_cw;
@@ -483,6 +498,8 @@ static void clear_bam_transaction(struct qcom_nand_controller *nandc)
 	if (!nandc->props->is_bam)
 		return;
 
+	bam_txn->bam_ce_pos = 0;
+	bam_txn->bam_ce_start = 0;
 	bam_txn->cmd_sgl_pos = 0;
 	bam_txn->cmd_sgl_start = 0;
 	bam_txn->tx_sgl_pos = 0;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
