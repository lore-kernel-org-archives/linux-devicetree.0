From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/4] dmaengine: qcom_bam_dma: clear BAM interrupt only if it is rised
Date: Tue,  1 Dec 2015 11:14:57 +0200
Message-ID: <1448961299-15161-3-git-send-email-stanimir.varbanov@linaro.org>
References: <1448961299-15161-1-git-send-email-stanimir.varbanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448961299-15161-1-git-send-email-stanimir.varbanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andy Gross <agross@codeaurora.org>, Archit Taneja <architt@codeaurora.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-Id: devicetree@vger.kernel.org

Currently we write BAM_IRQ_CLR register with zero even when no
BAM_IRQ occured. This write has some bad side effects when the
BAM instance is for the crypto engine. In case of crypto engine
some of the BAM registers are xPU protected and they cannot be
controlled by the driver.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/dma/qcom_bam_dma.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom_bam_dma.c b/drivers/dma/qcom_bam_dma.c
index dc9da477eb69..0f06f3b7a72b 100644
--- a/drivers/dma/qcom_bam_dma.c
+++ b/drivers/dma/qcom_bam_dma.c
@@ -800,13 +800,17 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 	if (srcs & P_IRQ)
 		tasklet_schedule(&bdev->task);
 
-	if (srcs & BAM_IRQ)
+	if (srcs & BAM_IRQ) {
 		clr_mask = readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_STTS));
 
-	/* don't allow reorder of the various accesses to the BAM registers */
-	mb();
+		/*
+		 * don't allow reorder of the various accesses to the BAM
+		 * registers
+		 */
+		mb();
 
-	writel_relaxed(clr_mask, bam_addr(bdev, 0, BAM_IRQ_CLR));
+		writel_relaxed(clr_mask, bam_addr(bdev, 0, BAM_IRQ_CLR));
+	}
 
 	return IRQ_HANDLED;
 }
-- 
1.7.9.5
