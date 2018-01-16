From: srinivas.kandagatla@linaro.org
Subject: [PATCH 3/4] dmaengine: qcom: bam_dma: do not write to global regs in remote mode
Date: Tue, 16 Jan 2018 19:02:35 +0000
Message-ID: <20180116190236.14558-4-srinivas.kandagatla@linaro.org>
References: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, Andy Gross <andy.gross@linaro.org>, dmaengine@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

BAM_DESC_CNT_TRSHLD register is global register, which can only be written
when BAM is in master mode, So check the mode of operation before writing it.

Without this check SOC's xPU would catch such access and crash the system.
First noticed on DB820c while testing SLIMBus BAM.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 523bd178047a..bbbb755d7549 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -905,12 +905,15 @@ static void bam_apply_new_config(struct bam_chan *bchan,
 	struct bam_device *bdev = bchan->bdev;
 	u32 maxburst;
 
-	if (dir == DMA_DEV_TO_MEM)
-		maxburst = bchan->slave.src_maxburst;
-	else
-		maxburst = bchan->slave.dst_maxburst;
-
-	writel_relaxed(maxburst, bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
+	if (!bdev->controlled_remotely) {
+		if (dir == DMA_DEV_TO_MEM)
+			maxburst = bchan->slave.src_maxburst;
+		else
+			maxburst = bchan->slave.dst_maxburst;
+
+		writel_relaxed(maxburst,
+			       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
+	}
 
 	bchan->reconfigure = 0;
 }
-- 
2.15.1
