From: Pramod Gurav <gpramod@codeaurora.org>
Subject: [PATCH 1/2] dmaengine: qcom_bam_dma: Clear IRQ only if its set
Date: Tue, 22 Mar 2016 15:19:10 +0530
Message-ID: <1458640151-15150-2-git-send-email-gpramod@codeaurora.org>
References: <1458640151-15150-1-git-send-email-gpramod@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1458640151-15150-1-git-send-email-gpramod@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: andy.gross@linaro.org, linux-kernel@vger.kernel.org
Cc: dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, dan.j.williams@intel.com, vinod.koul@intel.com, okaya@codeaurora.org, architt@codeaurora.org, Pramod Gurav <gpramod@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Clear the BAM IRQ bit only if there is a BAM interrupt.

Signed-off-by: Pramod Gurav <gpramod@codeaurora.org>
---
 drivers/dma/qcom/bam_dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index d5e0a9c..0880345 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -807,7 +807,8 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 	/* don't allow reorder of the various accesses to the BAM registers */
 	mb();
 
-	writel_relaxed(clr_mask, bam_addr(bdev, 0, BAM_IRQ_CLR));
+	if (srcs & BAM_IRQ)
+		writel_relaxed(clr_mask, bam_addr(bdev, 0, BAM_IRQ_CLR));
 
 	return IRQ_HANDLED;
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
