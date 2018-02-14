From: srinivas.kandagatla@linaro.org
Subject: [PATCH v2 5/5] dmaengine: qcom: bam_dma: disable runtime pm on remote controlled
Date: Wed, 14 Feb 2018 14:44:59 +0000
Message-ID: <20180214144459.29813-6-srinivas.kandagatla@linaro.org>
References: <20180214144459.29813-1-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180214144459.29813-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, andy.gross@linaro.org, dmaengine@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, david.brown@linaro.org, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Remotely controlled BAM instance should not do any power management from
CPU side, as cpu can not reliably say if the BAM is busy or not.

Disable it for such instances.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 88ec515ad125..6e4fe398f0c8 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1330,6 +1330,11 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unregister_dma;
 
+	if (bdev->controlled_remotely) {
+		pm_runtime_disable(&pdev->dev);
+		return 0;
+	}
+
 	pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, BAM_DMA_AUTOSUSPEND_DELAY);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -1413,7 +1418,8 @@ static int __maybe_unused bam_dma_suspend(struct device *dev)
 {
 	struct bam_device *bdev = dev_get_drvdata(dev);
 
-	pm_runtime_force_suspend(dev);
+	if (!bdev->controlled_remotely)
+		pm_runtime_force_suspend(dev);
 
 	clk_unprepare(bdev->bamclk);
 
@@ -1429,7 +1435,8 @@ static int __maybe_unused bam_dma_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	pm_runtime_force_resume(dev);
+	if (!bdev->controlled_remotely)
+		pm_runtime_force_resume(dev);
 
 	return 0;
 }
-- 
2.15.1
