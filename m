From: srinivas.kandagatla@linaro.org
Subject: [PATCH 4/4] dmaengine: qcom: bam_dma: Add num-ees dt binding for remotely controlled
Date: Tue, 16 Jan 2018 19:02:36 +0000
Message-ID: <20180116190236.14558-5-srinivas.kandagatla@linaro.org>
References: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, Andy Gross <andy.gross@linaro.org>, dmaengine@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

When Linux is master of BAM, it can directly read registers to know number
of supported execution enviroments, however when its remotely controlled
reading these registers would trigger a crash if the BAM is not yet
intialized/powered up on the remote side.

This patch adds new binding num-ees to specify supported number of
Execution Environments when BAM is remotely controlled.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt |  2 ++
 drivers/dma/qcom/bam_dma.c                             | 15 ++++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
index aa6822cbb230..f0d10c2b393e 100644
--- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
+++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
@@ -17,6 +17,8 @@ Required properties:
   remote proccessor i.e. execution environment.
 - num-channels : optional, indicates supported number of DMA channels in a
   remotely controlled bam.
+- num-ees : optional, indicates supported number of Execution Environments in a
+  remotely controlled bam.
 
 Example:
 
diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index bbbb755d7549..7a8727271d60 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -387,6 +387,7 @@ struct bam_device {
 	struct device_dma_parameters dma_parms;
 	struct bam_chan *channels;
 	u32 num_channels;
+	u32 num_ees;
 
 	/* execution environment ID, from DT */
 	u32 ee;
@@ -1079,11 +1080,14 @@ static int bam_init(struct bam_device *bdev)
 	u32 val;
 
 	/* read revision and configuration information */
-	val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION)) >> NUM_EES_SHIFT;
-	val &= NUM_EES_MASK;
+	if (!bdev->num_ees) {
+		val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION)) >> NUM_EES_SHIFT;
+		val &= NUM_EES_MASK;
+		bdev->num_ees = val;
+	}
 
 	/* check that configured EE is within range */
-	if (bdev->ee >= val)
+	if (bdev->ee >= bdev->num_ees)
 		return -EINVAL;
 
 	if (!bdev->num_channels) {
@@ -1189,6 +1193,11 @@ static int bam_dma_probe(struct platform_device *pdev)
 					   &bdev->num_channels);
 		if (ret)
 			dev_err(bdev->dev, "num-channels unspecified in dt\n");
+
+		ret = of_property_read_u32(pdev->dev.of_node, "num-ees",
+					   &bdev->num_ees);
+		if (ret)
+			dev_err(bdev->dev, "num-ees unspecified in dt\n");
 	}
 
 	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
-- 
2.15.1
