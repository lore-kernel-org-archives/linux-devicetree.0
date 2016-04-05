From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 2/5] dmaengine: qcom: bam_dma: clear BAM interrupt only if
 it is rised
Date: Wed,  6 Apr 2016 01:56:19 +0300
Message-ID: <1459896982-30171-3-git-send-email-stanimir.varbanov@linaro.org>
References: <1459896982-30171-1-git-send-email-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1459896982-30171-1-git-send-email-stanimir.varbanov@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vinod Koul <vinod.koul@intel.com>, Andy Gross <andy.gross@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Sinan Kaya <okaya@codeaurora.org>, dmaengine@vger.kernel.org, Pramod Gurav <gpramod@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Currently we write BAM_IRQ_CLR register with zero even when no
BAM_IRQ occured. This write has some bad side effects when the
BAM instance is for the crypto engine. In case of crypto engine
some of the BAM registers are xPU protected and they cannot be
controlled by the driver.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Reviewed-by: Andy Gross <andy.gross@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index a486bc0f82e0..789d5f836bf7 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -801,13 +801,17 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
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
1.9.1
