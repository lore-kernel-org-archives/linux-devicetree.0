From: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/9] dmaengine: stm32-dma: Rework starting transfer management
Date: Tue, 13 Dec 2016 14:40:47 +0100
Message-ID: <1481636451-27863-6-git-send-email-cedric.madianga@gmail.com>
References: <1481636451-27863-1-git-send-email-cedric.madianga@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481636451-27863-1-git-send-email-cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch reworks the way to manage transfer starting.
Now, starting DMA is only allowed when the channel is not busy.
Then, stm32_dma_start_transfer is declared as void.
At least, after each transfer completion, we start the next transfer if a
new descriptor as been queued in the issued list during an ongoing
transfer.

Signed-off-by: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org>
---
 drivers/dma/stm32-dma.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 3056ce7..adb846c 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -421,7 +421,7 @@ static void stm32_dma_dump_reg(struct stm32_dma_chan *chan)
 	dev_dbg(chan2dev(chan), "SFCR:  0x%08x\n", sfcr);
 }
 
-static int stm32_dma_start_transfer(struct stm32_dma_chan *chan)
+static void stm32_dma_start_transfer(struct stm32_dma_chan *chan)
 {
 	struct stm32_dma_device *dmadev = stm32_dma_get_dev(chan);
 	struct virt_dma_desc *vdesc;
@@ -432,12 +432,12 @@ static int stm32_dma_start_transfer(struct stm32_dma_chan *chan)
 
 	ret = stm32_dma_disable_chan(chan);
 	if (ret < 0)
-		return ret;
+		return;
 
 	if (!chan->desc) {
 		vdesc = vchan_next_desc(&chan->vchan);
 		if (!vdesc)
-			return -EPERM;
+			return;
 
 		chan->desc = to_stm32_dma_desc(vdesc);
 		chan->next_sg = 0;
@@ -471,7 +471,7 @@ static int stm32_dma_start_transfer(struct stm32_dma_chan *chan)
 
 	chan->busy = true;
 
-	return 0;
+	dev_dbg(chan2dev(chan), "vchan %p: started\n", &chan->vchan);
 }
 
 static void stm32_dma_configure_next_sg(struct stm32_dma_chan *chan)
@@ -552,15 +552,13 @@ static void stm32_dma_issue_pending(struct dma_chan *c)
 {
 	struct stm32_dma_chan *chan = to_stm32_dma_chan(c);
 	unsigned long flags;
-	int ret;
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
-	if (!chan->busy) {
-		if (vchan_issue_pending(&chan->vchan) && !chan->desc) {
-			ret = stm32_dma_start_transfer(chan);
-			if ((!ret) && (chan->desc->cyclic))
-				stm32_dma_configure_next_sg(chan);
-		}
+	if (vchan_issue_pending(&chan->vchan) && !chan->desc && !chan->busy) {
+		dev_dbg(chan2dev(chan), "vchan %p: issued\n", &chan->vchan);
+		stm32_dma_start_transfer(chan);
+		if (chan->desc->cyclic)
+			stm32_dma_configure_next_sg(chan);
 	}
 	spin_unlock_irqrestore(&chan->vchan.lock, flags);
 }
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
