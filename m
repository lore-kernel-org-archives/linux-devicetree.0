From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 06/20] mtd: nand: qcom: allocate BAM transaction
Date: Sat,  5 Aug 2017 21:49:44 +0530
Message-ID: <1501949998-29859-7-git-send-email-absahu@codeaurora.org>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: dwmw2@infradead.org, boris.brezillon@free-electrons.com, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

- The BAM transaction is the core data structure which will be used
for all the data transfers in QPIC NAND. Since the core framework
in nand_base.c is serializing all the NAND requests so allocating
BAM transaction before every transfer will be overhead. The memory
for it be allocated during probe time and before every transfer,
it will be cleared.

- The BAM transaction contains the array of
command and data scatter gather list and indexes. For
every transfer, all the resource will be taken from BAM
transaction.

- The size of the buffer used for BAM transactions
is calculated based on the NAND device with the maximum page size,
among all the devices connected to the
controller.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 94 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 064d06b..89bdee9 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -179,6 +179,32 @@
 #define	ECC_BCH_4BIT	BIT(2)
 #define	ECC_BCH_8BIT	BIT(3)
 
+#define QPIC_PER_CW_CMD_SGL		32
+#define QPIC_PER_CW_DATA_SGL		8
+
+/*
+ * This data type corresponds to the BAM transaction which will be used for all
+ * NAND transfers.
+ * @cmd_sgl - sgl for NAND BAM command pipe
+ * @data_sgl - sgl for NAND BAM consumer/producer pipe
+ * @cmd_sgl_pos - current index in command sgl.
+ * @cmd_sgl_start - start index in command sgl.
+ * @tx_sgl_pos - current index in data sgl for tx.
+ * @tx_sgl_start - start index in data sgl for tx.
+ * @rx_sgl_pos - current index in data sgl for rx.
+ * @rx_sgl_start - start index in data sgl for rx.
+ */
+struct bam_transaction {
+	struct scatterlist *cmd_sgl;
+	struct scatterlist *data_sgl;
+	u32 cmd_sgl_pos;
+	u32 cmd_sgl_start;
+	u32 tx_sgl_pos;
+	u32 tx_sgl_start;
+	u32 rx_sgl_pos;
+	u32 rx_sgl_start;
+};
+
 struct desc_info {
 	struct list_head node;
 
@@ -245,6 +271,8 @@ struct nandc_regs {
  * @cmd1/vld:			some fixed controller register values
  * @props:			properties of current NAND controller,
  *				initialized via DT match data
+ * @max_cwperpage:		maximum QPIC codewords required. calculated
+ *				from all connected NAND devices pagesize
  */
 struct qcom_nand_controller {
 	struct nand_hw_control controller;
@@ -275,11 +303,13 @@ struct qcom_nand_controller {
 	};
 
 	struct list_head desc_list;
+	struct bam_transaction *bam_txn;
 
 	u8		*data_buffer;
 	int		buf_size;
 	int		buf_count;
 	int		buf_start;
+	unsigned int	max_cwperpage;
 
 	__le32 *reg_read_buf;
 	dma_addr_t reg_read_dma;
@@ -352,6 +382,44 @@ struct qcom_nandc_props {
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
+		((sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL) +
+		(sizeof(*bam_txn->data_sgl) * QPIC_PER_CW_DATA_SGL));
+
+	bam_txn_buf = devm_kzalloc(nandc->dev, bam_txn_size, GFP_KERNEL);
+	if (!bam_txn_buf)
+		return NULL;
+
+	bam_txn = bam_txn_buf;
+	bam_txn_buf += sizeof(*bam_txn);
+
+	bam_txn->cmd_sgl = bam_txn_buf;
+	bam_txn_buf +=
+		sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL * num_cw;
+
+	bam_txn->data_sgl = bam_txn_buf;
+
+	return bam_txn;
+}
+
 static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
 {
 	return container_of(chip, struct qcom_nand_host, chip);
@@ -1923,6 +1991,8 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
 	mtd_set_ooblayout(mtd, &qcom_nand_ooblayout_ops);
 
 	cwperpage = mtd->writesize / ecc->size;
+	nandc->max_cwperpage = max_t(unsigned int, nandc->max_cwperpage,
+				     cwperpage);
 
 	/*
 	 * DATA_UD_BYTES varies based on whether the read/write command protects
@@ -2057,6 +2127,20 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
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
@@ -2214,6 +2298,16 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
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
