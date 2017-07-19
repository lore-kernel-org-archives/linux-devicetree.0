From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 16/25] mtd: nand: qcom: allocate BAM transaction
Date: Wed, 19 Jul 2017 17:18:04 +0530
Message-ID: <1500464893-11352-17-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500464893-11352-1-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The BAM transaction is the core data structure which will be used
for all the data transfers in QPIC NAND. Since the base layer is
serializing all the NAND requests so allocating BAM transaction
before every transfer will be overhead. The memory for it be
allocated during probe time and before every transfer, it will be
cleared. The BAM transaction contains the array of command
elements, command and data scatter gather list and indexes. For
every transfer, all the resource will be taken from BAM
transaction.

Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/mtd/nand/qcom_nandc.c | 114 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index f49c3da..fc29c97 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -22,6 +22,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/delay.h>
+#include <linux/dma/qcom_bam_dma.h>
 
 /* NANDc reg offsets */
 #define	NAND_FLASH_CMD			0x00
@@ -172,6 +173,45 @@
 #define	ECC_BCH_4BIT	BIT(2)
 #define	ECC_BCH_8BIT	BIT(3)
 
+#define QPIC_PER_CW_CMD_ELEMENTS	32
+#define QPIC_PER_CW_CMD_SGL		32
+#define QPIC_PER_CW_DATA_SGL		8
+
+/*
+ * This data type corresponds to the BAM transaction which will be used for all
+ * NAND transfers.
+ * @bam_ce - the array of bam command elements
+ * @cmd_sgl - sgl for nand bam command pipe
+ * @data_sgl - sgl for nand bam consumer/producer pipe
+ * @bam_ce_pos - the index in bam_ce which is available for next sgl request
+ * @bam_ce_start - the index in bam_ce which marks the start position ce
+ *		   for current sgl. It will be used for size calculation
+ *		   for current sgl
+ * @cmd_sgl_pos - current index in command sgl.
+ * @tx_sgl_pos - current index in data sgl for tx.
+ * @rx_sgl_pos - current index in data sgl for rx.
+ */
+struct bam_transaction {
+	struct bam_cmd_element *bam_ce;
+	struct scatterlist *cmd_sgl;
+	struct scatterlist *data_sgl;
+	u32 bam_ce_pos;
+	u32 bam_ce_start;
+	u32 cmd_sgl_pos;
+	u32 cmd_sgl_start;
+	u32 tx_sgl_pos;
+	u32 tx_sgl_start;
+	u32 rx_sgl_pos;
+	u32 rx_sgl_start;
+};
+
+/*
+ * This data type corresponds to the nand dma descriptor
+ * @list - list for desc_info
+ * @dir - DMA transfer direction
+ * @sgl - sgl which will be used for single sgl dma descriptor
+ * @dma_desc - low level dma engine descriptor
+ */
 struct desc_info {
 	struct list_head node;
 
@@ -238,6 +278,8 @@ struct nandc_regs {
  * @cmd1/vld:			some fixed controller register values
  * @props:			properties of current NAND controller IP,
  *				initialized via DT match data
+ * @max_cwperpage:		maximum qpic codeword required. calcualted
+ *				from all nand device pagesize
  */
 struct qcom_nand_controller {
 	struct nand_hw_control controller;
@@ -265,11 +307,13 @@ struct qcom_nand_controller {
 	};
 
 	struct list_head desc_list;
+	struct bam_transaction *bam_txn;
 
 	u8		*data_buffer;
 	int		buf_size;
 	int		buf_count;
 	int		buf_start;
+	unsigned int	max_cwperpage;
 
 	__le32 *reg_read_buf;
 	dma_addr_t reg_read_buf_phys;
@@ -342,6 +386,50 @@ struct qcom_props {
 	bool is_bam;
 };
 
+/* Frees the BAM transaction memory */
+static void free_bam_transaction(struct qcom_nand_controller *nandc)
+{
+	struct bam_transaction *bam_txn = nandc->bam_txn;
+
+	devm_kfree(nandc->dev, bam_txn);
+}
+
+/* Allocates and Initializes the BAM transaction */
+static struct bam_transaction *
+alloc_bam_transaction(struct qcom_nand_controller *nandc)
+{
+	struct bam_transaction *bam_txn;
+	size_t bam_txn_size;
+	unsigned int num_cw = nandc->max_cwperpage;
+	void *bam_txn_buf;
+
+	bam_txn_size =
+		sizeof(*bam_txn) + num_cw *
+		((sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS) +
+		(sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL) +
+		(sizeof(*bam_txn->data_sgl) * QPIC_PER_CW_DATA_SGL));
+
+	bam_txn_buf = devm_kzalloc(nandc->dev, bam_txn_size, GFP_KERNEL);
+	if (!bam_txn_buf)
+		return NULL;
+
+	bam_txn = bam_txn_buf;
+	bam_txn_buf += sizeof(*bam_txn);
+
+	bam_txn->bam_ce = bam_txn_buf;
+	bam_txn_buf +=
+		sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS * num_cw;
+
+	bam_txn->cmd_sgl = bam_txn_buf;
+	bam_txn_buf +=
+		sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_SGL * num_cw;
+
+	bam_txn->data_sgl = bam_txn_buf;
+	nandc->max_cwperpage = num_cw;
+
+	return bam_txn;
+}
+
 static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
 {
 	return container_of(chip, struct qcom_nand_host, chip);
@@ -1913,6 +2001,8 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
 	mtd_set_ooblayout(mtd, &qcom_nand_ooblayout_ops);
 
 	cwperpage = mtd->writesize / ecc->size;
+	nandc->max_cwperpage = max_t(unsigned int, nandc->max_cwperpage,
+				     cwperpage);
 
 	/*
 	 * DATA_UD_BYTES varies based on whether the read/write command protects
@@ -2047,6 +2137,20 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 			dev_err(nandc->dev, "failed to request cmd channel\n");
 			return -ENODEV;
 		}
+
+		/*
+		 * Initially allocate BAM transaction to read ONFI param page.
+		 * After detecting all the devices, this BAM transaction will
+		 * be freed and the next BAM tranasction will be allocated with
+		 * maximum codeword size
+		 */
+		nandc->max_cwperpage = 1;
+		nandc->bam_txn = alloc_bam_transaction(nandc);
+		if (!nandc->bam_txn) {
+			dev_err(nandc->dev,
+				"failed to allocate bam transaction\n");
+			return -ENOMEM;
+		}
 	} else {
 		nandc->chan = dma_request_slave_channel(nandc->dev, "rxtx");
 		if (!nandc->chan) {
@@ -2202,6 +2306,16 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	if (list_empty(&nandc->host_list))
 		return -ENODEV;
 
+	if (nandc->props->is_bam) {
+		free_bam_transaction(nandc);
+		nandc->bam_txn = alloc_bam_transaction(nandc);
+		if (!nandc->bam_txn) {
+			dev_err(nandc->dev,
+				"failed to allocate bam transaction\n");
+			return -ENOMEM;
+		}
+	}
+
 	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
 		ret = qcom_nand_mtd_register(nandc, host, child);
 		if (ret) {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
