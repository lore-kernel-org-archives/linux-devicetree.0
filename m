From: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Subject: [PATCH v2 1/5] dmaengine: qcom: bam_dma: make bam clk optional
Date: Wed, 14 Feb 2018 14:44:55 +0000
Message-ID: <20180214144459.29813-2-srinivas.kandagatla@linaro.org>
References: <20180214144459.29813-1-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180214144459.29813-1-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhe-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, ramkri-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org, sdharia-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

When BAM is remotely controlled it does not sound correct to control
its clk on Linux side. Make it optional, so that its not mandatory
for remote controlled BAM instances.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/dma/qcom/bam_dma.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index d076940e0c69..ae4c7b6930b8 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1233,13 +1233,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 						"qcom,controlled-remotely");
 
 	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
-	if (IS_ERR(bdev->bamclk))
-		return PTR_ERR(bdev->bamclk);
-
-	ret = clk_prepare_enable(bdev->bamclk);
-	if (ret) {
-		dev_err(bdev->dev, "failed to prepare/enable clock\n");
-		return ret;
+	if (IS_ERR(bdev->bamclk)) {
+		bdev->bamclk = NULL;
+	} else {
+		ret = clk_prepare_enable(bdev->bamclk);
+		if (ret) {
+			dev_err(bdev->dev, "failed to prepare/enable clock\n");
+			return ret;
+		}
 	}
 
 	ret = bam_init(bdev);
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
