From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RFC v6 1/5] dma: mpc512x: reorder mpc8308 specific instructions
Date: Tue, 24 Dec 2013 16:06:25 +0400
Message-ID: <1387886789-20249-2-git-send-email-a13xp0p0v88@gmail.com>
References: <1387886789-20249-1-git-send-email-a13xp0p0v88@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387886789-20249-1-git-send-email-a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Concentrate the specific code for MPC8308 in the 'if' branch
and handle MPC512x in the 'else' branch.
This modification only reorders instructions but doesn't change behaviour.

Signed-off-by: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/mpc512x_dma.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
index 448750d..2ce248b 100644
--- a/drivers/dma/mpc512x_dma.c
+++ b/drivers/dma/mpc512x_dma.c
@@ -52,9 +52,17 @@
 #define MPC_DMA_DESCRIPTORS	64
 
 /* Macro definitions */
-#define MPC_DMA_CHANNELS	64
 #define MPC_DMA_TCD_OFFSET	0x1000
 
+/*
+ * Maximum channel counts for individual hardware variants
+ * and the maximum channel count over all supported controllers,
+ * used for data structure size
+ */
+#define MPC8308_DMACHAN_MAX	16
+#define MPC512x_DMACHAN_MAX	64
+#define MPC_DMA_CHANNELS	64
+
 /* Arbitration mode of group and channel */
 #define MPC_DMA_DMACR_EDCG	(1 << 31)
 #define MPC_DMA_DMACR_ERGA	(1 << 3)
@@ -710,10 +718,10 @@ static int mpc_dma_probe(struct platform_device *op)
 
 	dma = &mdma->dma;
 	dma->dev = dev;
-	if (!mdma->is_mpc8308)
-		dma->chancnt = MPC_DMA_CHANNELS;
+	if (mdma->is_mpc8308)
+		dma->chancnt = MPC8308_DMACHAN_MAX;
 	else
-		dma->chancnt = 16; /* MPC8308 DMA has only 16 channels */
+		dma->chancnt = MPC512x_DMACHAN_MAX;
 	dma->device_alloc_chan_resources = mpc_dma_alloc_chan_resources;
 	dma->device_free_chan_resources = mpc_dma_free_chan_resources;
 	dma->device_issue_pending = mpc_dma_issue_pending;
@@ -747,7 +755,19 @@ static int mpc_dma_probe(struct platform_device *op)
 	 * - Round-robin group arbitration,
 	 * - Round-robin channel arbitration.
 	 */
-	if (!mdma->is_mpc8308) {
+	if (mdma->is_mpc8308) {
+		/* MPC8308 has 16 channels and lacks some registers */
+		out_be32(&mdma->regs->dmacr, MPC_DMA_DMACR_ERCA);
+
+		/* enable snooping */
+		out_be32(&mdma->regs->dmagpor, MPC_DMA_DMAGPOR_SNOOP_ENABLE);
+		/* Disable error interrupts */
+		out_be32(&mdma->regs->dmaeeil, 0);
+
+		/* Clear interrupts status */
+		out_be32(&mdma->regs->dmaintl, 0xFFFF);
+		out_be32(&mdma->regs->dmaerrl, 0xFFFF);
+	} else {
 		out_be32(&mdma->regs->dmacr, MPC_DMA_DMACR_EDCG |
 					MPC_DMA_DMACR_ERGA | MPC_DMA_DMACR_ERCA);
 
@@ -768,18 +788,6 @@ static int mpc_dma_probe(struct platform_device *op)
 		/* Route interrupts to IPIC */
 		out_be32(&mdma->regs->dmaihsa, 0);
 		out_be32(&mdma->regs->dmailsa, 0);
-	} else {
-		/* MPC8308 has 16 channels and lacks some registers */
-		out_be32(&mdma->regs->dmacr, MPC_DMA_DMACR_ERCA);
-
-		/* enable snooping */
-		out_be32(&mdma->regs->dmagpor, MPC_DMA_DMAGPOR_SNOOP_ENABLE);
-		/* Disable error interrupts */
-		out_be32(&mdma->regs->dmaeeil, 0);
-
-		/* Clear interrupts status */
-		out_be32(&mdma->regs->dmaintl, 0xFFFF);
-		out_be32(&mdma->regs->dmaerrl, 0xFFFF);
 	}
 
 	/* Register DMA engine */
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
