From: Pramod Gurav <gpramod@codeaurora.org>
Subject: [PATCH 2/2] dmaengine: qcom_bam_dma: Bypass BAM init if not managed locally
Date: Tue, 22 Mar 2016 15:19:11 +0530
Message-ID: <1458640151-15150-3-git-send-email-gpramod@codeaurora.org>
References: <1458640151-15150-1-git-send-email-gpramod@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1458640151-15150-1-git-send-email-gpramod@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: andy.gross@linaro.org, linux-kernel@vger.kernel.org
Cc: dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, dan.j.williams@intel.com, vinod.koul@intel.com, okaya@codeaurora.org, architt@codeaurora.org, Pramod Gurav <gpramod@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On some QOCM platforms BAM control registers are managed remotely
hence can not be accessed by application processor for writes. Pass
a DT property qcom,bam_ctrl_remote to declare the same to skip bam_init.

Move the pipe number initialisation from bam_init to probe functiom
as it should be done for all platforms.

Signed-off-by: Pramod Gurav <gpramod@codeaurora.org>
---
 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt |  3 +++
 drivers/dma/qcom/bam_dma.c                             | 18 +++++++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
index 1c9d48e..46e33ae 100644
--- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
+++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
@@ -13,6 +13,8 @@ Required properties:
 - clock-names: must contain "bam_clk" entry
 - qcom,ee : indicates the active Execution Environment identifier (0-7) used in
   the secure world.
+- qcom,bam_ctrl_remote: Use when BAM global device control is managed remotely
+  and not locally by the application processor.
 
 Example:
 
@@ -24,6 +26,7 @@ Example:
 		clock-names = "bam_clk";
 		#dma-cells = <1>;
 		qcom,ee = <0>;
+		qcom,bam_ctrl_remote;
 	};
 
 DMA clients must use the format described in the dma.txt file, using a two cell
diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 0880345..04dd446 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -384,6 +384,7 @@ struct bam_device {
 	struct device_dma_parameters dma_parms;
 	struct bam_chan *channels;
 	u32 num_channels;
+	bool bam_ctrl_remote;
 
 	/* execution environment ID, from DT */
 	u32 ee;
@@ -1036,9 +1037,6 @@ static int bam_init(struct bam_device *bdev)
 	if (bdev->ee >= val)
 		return -EINVAL;
 
-	val = readl_relaxed(bam_addr(bdev, 0, BAM_NUM_PIPES));
-	bdev->num_channels = val & BAM_NUM_PIPES_MASK;
-
 	/* s/w reset bam */
 	/* after reset all pipes are disabled and idle */
 	val = readl_relaxed(bam_addr(bdev, 0, BAM_CTRL));
@@ -1095,7 +1093,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	struct bam_device *bdev;
 	const struct of_device_id *match;
 	struct resource *iores;
-	int ret, i;
+	int ret, i, val;
 
 	bdev = devm_kzalloc(&pdev->dev, sizeof(*bdev), GFP_KERNEL);
 	if (!bdev)
@@ -1136,9 +1134,15 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = bam_init(bdev);
-	if (ret)
-		goto err_disable_clk;
+	val = readl_relaxed(bam_addr(bdev, 0, BAM_NUM_PIPES));
+	bdev->num_channels = val & BAM_NUM_PIPES_MASK;
+
+	bdev->bam_ctrl_remote = of_property_read_bool(pdev->dev.of_node,
+						"qcom,bam_ctrl_remote");
+	if (bdev->bam_ctrl_remote != true)
+		ret = bam_init(bdev);
+		if (ret)
+			goto err_disable_clk;
 
 	tasklet_init(&bdev->task, dma_tasklet, (unsigned long)bdev);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
