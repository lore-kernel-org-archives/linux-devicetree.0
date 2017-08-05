From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 04/20] mtd: nand: qcom: add and initialize QPIC DMA resources
Date: Sat,  5 Aug 2017 21:49:42 +0530
Message-ID: <1501949998-29859-5-git-send-email-absahu@codeaurora.org>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, boris.brezillon@free-electrons.com, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

1. QPIC NAND controller uses 3 BAM channels: command, data tx
   and data rx while EBI2 NAND controller uses only single ADM
   channel.
2. CRCI is only required for ADM DMA and it's not required for
   BAM DMA.

Reviewed-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 86 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 68 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 08cda7d..0b2c8a1 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -257,9 +257,22 @@ struct qcom_nand_controller {
 	struct clk *core_clk;
 	struct clk *aon_clk;
 
-	struct dma_chan *chan;
-	unsigned int cmd_crci;
-	unsigned int data_crci;
+	union {
+		/* will be used only by QPIC for BAM DMA */
+		struct {
+			struct dma_chan *tx_chan;
+			struct dma_chan *rx_chan;
+			struct dma_chan *cmd_chan;
+		};
+
+		/* will be used only by EBI2 for ADM DMA */
+		struct {
+			struct dma_chan *chan;
+			unsigned int cmd_crci;
+			unsigned int data_crci;
+		};
+	};
+
 	struct list_head desc_list;
 
 	u8		*data_buffer;
@@ -1992,10 +2005,31 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 	if (!nandc->reg_read_buf)
 		return -ENOMEM;
 
-	nandc->chan = dma_request_slave_channel(nandc->dev, "rxtx");
-	if (!nandc->chan) {
-		dev_err(nandc->dev, "failed to request slave channel\n");
-		return -ENODEV;
+	if (nandc->props->is_bam) {
+		nandc->tx_chan = dma_request_slave_channel(nandc->dev, "tx");
+		if (!nandc->tx_chan) {
+			dev_err(nandc->dev, "failed to request tx channel\n");
+			return -ENODEV;
+		}
+
+		nandc->rx_chan = dma_request_slave_channel(nandc->dev, "rx");
+		if (!nandc->rx_chan) {
+			dev_err(nandc->dev, "failed to request rx channel\n");
+			return -ENODEV;
+		}
+
+		nandc->cmd_chan = dma_request_slave_channel(nandc->dev, "cmd");
+		if (!nandc->cmd_chan) {
+			dev_err(nandc->dev, "failed to request cmd channel\n");
+			return -ENODEV;
+		}
+	} else {
+		nandc->chan = dma_request_slave_channel(nandc->dev, "rxtx");
+		if (!nandc->chan) {
+			dev_err(nandc->dev,
+				"failed to request slave channel\n");
+			return -ENODEV;
+		}
 	}
 
 	INIT_LIST_HEAD(&nandc->desc_list);
@@ -2008,7 +2042,19 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 
 static void qcom_nandc_unalloc(struct qcom_nand_controller *nandc)
 {
-	dma_release_channel(nandc->chan);
+	if (nandc->props->is_bam) {
+		if (nandc->tx_chan)
+			dma_release_channel(nandc->tx_chan);
+
+		if (nandc->rx_chan)
+			dma_release_channel(nandc->rx_chan);
+
+		if (nandc->cmd_chan)
+			dma_release_channel(nandc->cmd_chan);
+	} else {
+		if (nandc->chan)
+			dma_release_channel(nandc->chan);
+	}
 }
 
 /* one time setup of a few nand controller registers */
@@ -2149,16 +2195,20 @@ static int qcom_nandc_parse_dt(struct platform_device *pdev)
 	struct device_node *np = nandc->dev->of_node;
 	int ret;
 
-	ret = of_property_read_u32(np, "qcom,cmd-crci", &nandc->cmd_crci);
-	if (ret) {
-		dev_err(nandc->dev, "command CRCI unspecified\n");
-		return ret;
-	}
+	if (!nandc->props->is_bam) {
+		ret = of_property_read_u32(np, "qcom,cmd-crci",
+					   &nandc->cmd_crci);
+		if (ret) {
+			dev_err(nandc->dev, "command CRCI unspecified\n");
+			return ret;
+		}
 
-	ret = of_property_read_u32(np, "qcom,data-crci", &nandc->data_crci);
-	if (ret) {
-		dev_err(nandc->dev, "data CRCI unspecified\n");
-		return ret;
+		ret = of_property_read_u32(np, "qcom,data-crci",
+					   &nandc->data_crci);
+		if (ret) {
+			dev_err(nandc->dev, "data CRCI unspecified\n");
+			return ret;
+		}
 	}
 
 	return 0;
@@ -2208,7 +2258,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 
 	ret = qcom_nandc_alloc(nandc);
 	if (ret)
-		return ret;
+		goto err_core_clk;
 
 	ret = clk_prepare_enable(nandc->core_clk);
 	if (ret)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
