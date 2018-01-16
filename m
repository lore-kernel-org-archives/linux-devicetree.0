From: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Subject: [PATCH 2/4] dmaengine: qcom: bam_dma: add num-channels binding for remotely controlled
Date: Tue, 16 Jan 2018 19:02:34 +0000
Message-ID: <20180116190236.14558-3-srinivas.kandagatla@linaro.org>
References: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180116190236.14558-1-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhe-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, ramkri-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org, sdharia-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

When Linux is master of BAM, it can directly read registers to know number
of supported channels, however when its remotely controlled reading these
registers would trigger a crash if the BAM is not yet intialized/powered up
on the remote side.

This patch adds num-channels binding to specify number of supported
dma channels on remotely controlled BAM.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt |  2 ++
 drivers/dma/qcom/bam_dma.c                             | 13 +++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
index 9cbf5d9df8fd..aa6822cbb230 100644
--- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
+++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
@@ -15,6 +15,8 @@ Required properties:
   the secure world.
 - qcom,controlled-remotely : optional, indicates that the bam is controlled by
   remote proccessor i.e. execution environment.
+- num-channels : optional, indicates supported number of DMA channels in a
+  remotely controlled bam.
 
 Example:
 
diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 78e488e8f96d..523bd178047a 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1083,8 +1083,10 @@ static int bam_init(struct bam_device *bdev)
 	if (bdev->ee >= val)
 		return -EINVAL;
 
-	val = readl_relaxed(bam_addr(bdev, 0, BAM_NUM_PIPES));
-	bdev->num_channels = val & BAM_NUM_PIPES_MASK;
+	if (!bdev->num_channels) {
+		val = readl_relaxed(bam_addr(bdev, 0, BAM_NUM_PIPES));
+		bdev->num_channels = val & BAM_NUM_PIPES_MASK;
+	}
 
 	if (bdev->controlled_remotely)
 		return 0;
@@ -1179,6 +1181,13 @@ static int bam_dma_probe(struct platform_device *pdev)
 	bdev->controlled_remotely = of_property_read_bool(pdev->dev.of_node,
 						"qcom,controlled-remotely");
 
+	if (bdev->controlled_remotely) {
+		ret = of_property_read_u32(pdev->dev.of_node, "num-channels",
+					   &bdev->num_channels);
+		if (ret)
+			dev_err(bdev->dev, "num-channels unspecified in dt\n");
+	}
+
 	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
 	if (IS_ERR(bdev->bamclk)) {
 		bdev->bamclk = NULL;
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
