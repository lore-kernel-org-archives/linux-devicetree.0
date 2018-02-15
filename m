From: srinivas.kandagatla@linaro.org
Subject: [PATCH v3 1/5] dmaengine: qcom: bam_dma: make bam clk optional
Date: Thu, 15 Feb 2018 12:25:07 +0000
Message-ID: <20180215122511.13517-2-srinivas.kandagatla@linaro.org>
References: <20180215122511.13517-1-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20180215122511.13517-1-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: vinod.koul@intel.com, andy.gross@linaro.org, dmaengine@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, david.brown@linaro.org, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

When BAM is remotely controlled it does not sound correct to control
its clk on Linux side. Make it optional, so that its not mandatory
for remote controlled BAM instances.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index d076940e0c69..b79691fcc82d 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1233,8 +1233,12 @@ static int bam_dma_probe(struct platform_device *pdev)
 						"qcom,controlled-remotely");
 
 	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
-	if (IS_ERR(bdev->bamclk))
-		return PTR_ERR(bdev->bamclk);
+	if (IS_ERR(bdev->bamclk)) {
+		if (!bdev->controlled_remotely)
+			return PTR_ERR(bdev->bamclk);
+
+		bdev->bamclk = NULL;
+	}
 
 	ret = clk_prepare_enable(bdev->bamclk);
 	if (ret) {
-- 
2.15.1
