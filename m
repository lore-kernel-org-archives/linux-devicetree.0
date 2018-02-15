From: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Subject: [PATCH v3 3/5] dmaengine: qcom: bam_dma: get num-channels and num-ees from dt
Date: Thu, 15 Feb 2018 12:25:09 +0000
Message-ID: <20180215122511.13517-4-srinivas.kandagatla@linaro.org>
References: <20180215122511.13517-1-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180215122511.13517-1-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhe-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, ramkri-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org, sdharia-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

When Linux is master of BAM, it can directly read registers to know number
of supported channels, however when its remotely controlled reading these
registers would trigger a crash if the BAM is not yet initialized or
powered up on the remote side.

This patch allows driver to read num-channels and num-ees from Device Tree
for remotely controlled BAM.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/dma/qcom/bam_dma.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index b79691fcc82d..139e9f5e47a9 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -393,6 +393,7 @@ struct bam_device {
 	struct device_dma_parameters dma_parms;
 	struct bam_chan *channels;
 	u32 num_channels;
+	u32 num_ees;
 
 	/* execution environment ID, from DT */
 	u32 ee;
@@ -1128,15 +1129,19 @@ static int bam_init(struct bam_device *bdev)
 	u32 val;
 
 	/* read revision and configuration information */
-	val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION)) >> NUM_EES_SHIFT;
-	val &= NUM_EES_MASK;
+	if (!bdev->num_ees) {
+		val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
+		bdev->num_ees = (val >> NUM_EES_SHIFT) & NUM_EES_MASK;
+	}
 
 	/* check that configured EE is within range */
-	if (bdev->ee >= val)
+	if (bdev->ee >= bdev->num_ees)
 		return -EINVAL;
 
-	val = readl_relaxed(bam_addr(bdev, 0, BAM_NUM_PIPES));
-	bdev->num_channels = val & BAM_NUM_PIPES_MASK;
+	if (!bdev->num_channels) {
+		val = readl_relaxed(bam_addr(bdev, 0, BAM_NUM_PIPES));
+		bdev->num_channels = val & BAM_NUM_PIPES_MASK;
+	}
 
 	if (bdev->controlled_remotely)
 		return 0;
@@ -1232,6 +1237,18 @@ static int bam_dma_probe(struct platform_device *pdev)
 	bdev->controlled_remotely = of_property_read_bool(pdev->dev.of_node,
 						"qcom,controlled-remotely");
 
+	if (bdev->controlled_remotely) {
+		ret = of_property_read_u32(pdev->dev.of_node, "num-channels",
+					   &bdev->num_channels);
+		if (ret)
+			dev_err(bdev->dev, "num-channels unspecified in dt\n");
+
+		ret = of_property_read_u32(pdev->dev.of_node, "qcom,num-ees",
+					   &bdev->num_ees);
+		if (ret)
+			dev_err(bdev->dev, "num-ees unspecified in dt\n");
+	}
+
 	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
 	if (IS_ERR(bdev->bamclk)) {
 		if (!bdev->controlled_remotely)
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
