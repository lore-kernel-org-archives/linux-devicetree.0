From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 2/2] dmaengine: nbpfaxi: convert to tasklet
Date: Sun, 3 Aug 2014 19:13:07 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1408031912280.13820@axis700.grange>
References: <Pine.LNX.4.64.1408031909420.13820@axis700.grange>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.64.1408031909420.13820-0199iw4Nj15frtckUFj5Ag@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It is common among dmaengine drivers to use a tasklet for bottom half
interrupt processing. Convert nbpfaxi to do the same.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
---
 drivers/dma/nbpfaxi.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index 5b40ac8..cea6a37 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -197,6 +197,7 @@ struct nbpf_desc_page {
  */
 struct nbpf_channel {
 	struct dma_chan dma_chan;
+	struct tasklet_struct tasklet;
 	void __iomem *base;
 	struct nbpf_device *nbpf;
 	char name[16];
@@ -1111,9 +1112,9 @@ static struct dma_chan *nbpf_of_xlate(struct of_phandle_args *dma_spec,
 	return dchan;
 }
 
-static irqreturn_t nbpf_chan_irqt(int irq, void *dev)
+static void nbpf_chan_tasklet(unsigned long data)
 {
-	struct nbpf_channel *chan = dev;
+	struct nbpf_channel *chan = (struct nbpf_channel *)data;
 	struct nbpf_desc *desc, *tmp;
 	dma_async_tx_callback callback;
 	void *param;
@@ -1176,8 +1177,6 @@ static irqreturn_t nbpf_chan_irqt(int irq, void *dev)
 		if (must_put)
 			nbpf_desc_put(desc);
 	}
-
-	return IRQ_HANDLED;
 }
 
 static irqreturn_t nbpf_chan_irq(int irq, void *dev)
@@ -1186,6 +1185,7 @@ static irqreturn_t nbpf_chan_irq(int irq, void *dev)
 	bool done = nbpf_status_get(chan);
 	struct nbpf_desc *desc;
 	irqreturn_t ret;
+	bool bh = false;
 
 	if (!done)
 		return IRQ_NONE;
@@ -1200,7 +1200,8 @@ static irqreturn_t nbpf_chan_irq(int irq, void *dev)
 		ret = IRQ_NONE;
 		goto unlock;
 	} else {
-		ret = IRQ_WAKE_THREAD;
+		ret = IRQ_HANDLED;
+		bh = true;
 	}
 
 	list_move_tail(&desc->node, &chan->done);
@@ -1216,6 +1217,9 @@ static irqreturn_t nbpf_chan_irq(int irq, void *dev)
 unlock:
 	spin_unlock(&chan->lock);
 
+	if (bh)
+		tasklet_schedule(&chan->tasklet);
+
 	return ret;
 }
 
@@ -1258,8 +1262,9 @@ static int nbpf_chan_probe(struct nbpf_device *nbpf, int n)
 
 	snprintf(chan->name, sizeof(chan->name), "nbpf %d", n);
 
-	ret = devm_request_threaded_irq(dma_dev->dev, chan->irq,
-			nbpf_chan_irq, nbpf_chan_irqt, IRQF_SHARED,
+	tasklet_init(&chan->tasklet, nbpf_chan_tasklet, (unsigned long)chan);
+	ret = devm_request_irq(dma_dev->dev, chan->irq,
+			nbpf_chan_irq, IRQF_SHARED,
 			chan->name, chan);
 	if (ret < 0)
 		return ret;
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
