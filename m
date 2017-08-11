From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 05/20] mtd: nand: qcom: DMA mapping support for register read buffer
Date: Fri, 11 Aug 2017 17:09:20 +0530
Message-ID: <1502451575-15712-6-git-send-email-absahu@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@free-electrons.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The EBI2 NAND controller directly remaps register read buffer with
dma_map_sg and DMA address of this buffer will be passed to DMA
API’s. While, on QPIC NAND controller, which uses BAM DMA, we read
the controller registers by preparing a BAM command descriptor. This
command descriptor requires the

  - controller register address
  - the DMA address in which we want to store the value read
    back from the controller register.

This command descriptor will be remapped with dma_map_sg
and its DMA address will be passed to DMA API’s. Therefore,
it's required that we also map our register read buffer for
DMA (using dma_map_single). We use the returned DMA address
for preparing entries in our command descriptor.

This patch adds the DMA mapping support for register read
buffer. This buffer will be DMA mapped during allocation
time. Before starting of any operation, this buffer will
be synced for device operation and after operation
completion, it will be synced again for CPU.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 59b764a..590fc1d 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -234,6 +234,7 @@ struct nandc_regs {
  *				by upper layers directly
  * @buf_size/count/start:	markers for chip->read_buf/write_buf functions
  * @reg_read_buf:		local buffer for reading back registers via DMA
+ * @reg_read_dma:		contains dma address for register read buffer
  * @reg_read_pos:		marker for data read in reg_read_buf
  *
  * @regs:			a contiguous chunk of memory for DMA register
@@ -279,6 +280,7 @@ struct qcom_nand_controller {
 	int		buf_start;
 
 	__le32 *reg_read_buf;
+	dma_addr_t reg_read_dma;
 	int reg_read_pos;
 
 	struct nandc_regs *regs;
@@ -371,6 +373,24 @@ static inline void nandc_write(struct qcom_nand_controller *nandc, int offset,
 	iowrite32(val, nandc->base + offset);
 }
 
+static inline void nandc_read_buffer_sync(struct qcom_nand_controller *nandc,
+					  bool is_cpu)
+{
+	if (!nandc->props->is_bam)
+		return;
+
+	if (is_cpu)
+		dma_sync_single_for_cpu(nandc->dev, nandc->reg_read_dma,
+					MAX_REG_RD *
+					sizeof(*nandc->reg_read_buf),
+					DMA_FROM_DEVICE);
+	else
+		dma_sync_single_for_device(nandc->dev, nandc->reg_read_dma,
+					   MAX_REG_RD *
+					   sizeof(*nandc->reg_read_buf),
+					   DMA_FROM_DEVICE);
+}
+
 static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int offset)
 {
 	switch (offset) {
@@ -854,6 +874,7 @@ static void free_descs(struct qcom_nand_controller *nandc)
 static void clear_read_regs(struct qcom_nand_controller *nandc)
 {
 	nandc->reg_read_pos = 0;
+	nandc_read_buffer_sync(nandc, false);
 }
 
 static void pre_command(struct qcom_nand_host *host, int command)
@@ -883,6 +904,7 @@ static void parse_erase_write_errors(struct qcom_nand_host *host, int command)
 	int i;
 
 	num_cw = command == NAND_CMD_PAGEPROG ? ecc->steps : 1;
+	nandc_read_buffer_sync(nandc, true);
 
 	for (i = 0; i < num_cw; i++) {
 		u32 flash_status = le32_to_cpu(nandc->reg_read_buf[i]);
@@ -904,6 +926,7 @@ static void post_command(struct qcom_nand_host *host, int command)
 
 	switch (command) {
 	case NAND_CMD_READID:
+		nandc_read_buffer_sync(nandc, true);
 		memcpy(nandc->data_buffer, nandc->reg_read_buf,
 		       nandc->buf_count);
 		break;
@@ -1067,6 +1090,7 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 	int i;
 
 	buf = (struct read_stats *)nandc->reg_read_buf;
+	nandc_read_buffer_sync(nandc, true);
 
 	for (i = 0; i < ecc->steps; i++, buf++) {
 		u32 flash, buffer, erased_cw;
@@ -2003,6 +2027,16 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 		return -ENOMEM;
 
 	if (nandc->props->is_bam) {
+		nandc->reg_read_dma =
+			dma_map_single(nandc->dev, nandc->reg_read_buf,
+				       MAX_REG_RD *
+				       sizeof(*nandc->reg_read_buf),
+				       DMA_FROM_DEVICE);
+		if (dma_mapping_error(nandc->dev, nandc->reg_read_dma)) {
+			dev_err(nandc->dev, "failed to DMA MAP reg buffer\n");
+			return -EIO;
+		}
+
 		nandc->tx_chan = dma_request_slave_channel(nandc->dev, "tx");
 		if (!nandc->tx_chan) {
 			dev_err(nandc->dev, "failed to request tx channel\n");
@@ -2040,6 +2074,12 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 static void qcom_nandc_unalloc(struct qcom_nand_controller *nandc)
 {
 	if (nandc->props->is_bam) {
+		if (!dma_mapping_error(nandc->dev, nandc->reg_read_dma))
+			dma_unmap_single(nandc->dev, nandc->reg_read_dma,
+					 MAX_REG_RD *
+					 sizeof(*nandc->reg_read_buf),
+					 DMA_FROM_DEVICE);
+
 		if (nandc->tx_chan)
 			dma_release_channel(nandc->tx_chan);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
