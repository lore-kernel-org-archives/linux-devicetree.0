From: Rameshwar Prasad Sahu <rsahu@apm.com>
Subject: [PATCH] dmaengine: xgene-dma: Fix double IRQ issue by setting
 IRQ_DISABLE_UNLAZY flag
Date: Tue, 22 Dec 2015 18:22:06 +0530
Message-ID: <1450788726-19981-1-git-send-email-rsahu@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: vinod.koul@intel.com, dan.j.williams@intel.com
Cc: devicetree@vger.kernel.org, arnd@arndb.de, jcm@redhat.com, Rameshwar Prasad Sahu <rsahu@apm.com>, patches@apm.com, linux-kernel@vger.kernel.org, kgondkar@apm.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

For interrupt controller that doesn't support irq_disable and hardware
with level interrupt, an extra interrupt can be pending. This patch fixes
the issue by setting IRQ_DISABLE_UNLAZY flag for the interrupt line.

Reference: http://git.kernel.org/tip/e9849777d0e27cdd2902805be51da73e7c79578c

Signed-off-by: Rameshwar Prasad Sahu <rsahu@apm.com>
---
 drivers/dma/xgene-dma.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index 9dfa2b0..6363e84 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -29,6 +29,7 @@
 #include <linux/dmapool.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of_device.h>

@@ -1610,6 +1611,7 @@ static int xgene_dma_request_irqs(struct xgene_dma *pdma)
 	/* Register DMA channel rx irq */
 	for (i = 0; i < XGENE_DMA_MAX_CHANNEL; i++) {
 		chan = &pdma->chan[i];
+		irq_set_status_flags(chan->rx_irq, IRQ_DISABLE_UNLAZY);
 		ret = devm_request_irq(chan->dev, chan->rx_irq,
 				       xgene_dma_chan_ring_isr,
 				       0, chan->name, chan);
@@ -1620,6 +1622,7 @@ static int xgene_dma_request_irqs(struct xgene_dma *pdma)

 			for (j = 0; j < i; j++) {
 				chan = &pdma->chan[i];
+				irq_clear_status_flags(chan->rx_irq, IRQ_DISABLE_UNLAZY);
 				devm_free_irq(chan->dev, chan->rx_irq, chan);
 			}

@@ -1640,6 +1643,7 @@ static void xgene_dma_free_irqs(struct xgene_dma *pdma)

 	for (i = 0; i < XGENE_DMA_MAX_CHANNEL; i++) {
 		chan = &pdma->chan[i];
+		irq_clear_status_flags(chan->rx_irq, IRQ_DISABLE_UNLAZY);
 		devm_free_irq(chan->dev, chan->rx_irq, chan);
 	}
 }
--
1.7.1
