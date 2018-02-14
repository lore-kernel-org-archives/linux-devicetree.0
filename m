From: srinivas.kandagatla@linaro.org
Subject: [PATCH v2 4/5] dmaengine: qcom: bam_dma: do not write to global regs in remote mode
Date: Wed, 14 Feb 2018 14:44:58 +0000
Message-ID: <20180214144459.29813-5-srinivas.kandagatla@linaro.org>
References: <20180214144459.29813-1-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180214144459.29813-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, andy.gross@linaro.org, dmaengine@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, david.brown@linaro.org, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

BAM_DESC_CNT_TRSHLD register is global register, which can only be written
when BAM is in master mode, So check the mode of operation before writing
it.

Without this check SOC's xPU would catch such access and crash the system.
First noticed on DB820c while testing SLIMBus BAM.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 146b5d03256f..88ec515ad125 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -935,12 +935,15 @@ static void bam_apply_new_config(struct bam_chan *bchan,
 	struct bam_device *bdev = bchan->bdev;
 	u32 maxburst;
 
-	if (dir == DMA_DEV_TO_MEM)
-		maxburst = bchan->slave.src_maxburst;
-	else
-		maxburst = bchan->slave.dst_maxburst;
+	if (!bdev->controlled_remotely) {
+		if (dir == DMA_DEV_TO_MEM)
+			maxburst = bchan->slave.src_maxburst;
+		else
+			maxburst = bchan->slave.dst_maxburst;
 
-	writel_relaxed(maxburst, bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
+		writel_relaxed(maxburst,
+			       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
+	}
 
 	bchan->reconfigure = 0;
 }
-- 
2.15.1
