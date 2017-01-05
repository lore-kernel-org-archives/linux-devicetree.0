From: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RESEND] dmaengine: stm32-dma: Add error messages if xlate fails
Date: Thu,  5 Jan 2017 09:09:40 +0100
Message-ID: <1483603780-3368-1-git-send-email-cedric.madianga@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds some error messages when a slave device fails to request a
channel.

Signed-off-by: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org>
---
Resolve conflicts issue
---
 drivers/dma/stm32-dma.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index fc9738e..4eacd9d 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -987,30 +987,36 @@ static struct dma_chan *stm32_dma_of_xlate(struct of_phandle_args *dma_spec,
 					   struct of_dma *ofdma)
 {
 	struct stm32_dma_device *dmadev = ofdma->of_dma_data;
+	struct device *dev = dmadev->ddev.dev;
 	struct stm32_dma_cfg cfg;
 	struct stm32_dma_chan *chan;
 	struct dma_chan *c;
 
-	if (dma_spec->args_count < 3)
+	if (dma_spec->args_count < 4) {
+		dev_err(dev, "Bad number of cells\n");
 		return NULL;
+	}
 
 	cfg.channel_id = dma_spec->args[0];
 	cfg.request_line = dma_spec->args[1];
 	cfg.stream_config = dma_spec->args[2];
-	cfg.threshold = 0;
+	cfg.threshold = dma_spec->args[3];
 
-	if ((cfg.channel_id >= STM32_DMA_MAX_CHANNELS) || (cfg.request_line >=
-				STM32_DMA_MAX_REQUEST_ID))
+	if ((cfg.channel_id >= STM32_DMA_MAX_CHANNELS) ||
+	    (cfg.request_line >= STM32_DMA_MAX_REQUEST_ID)) {
+		dev_err(dev, "Bad channel and/or request id\n");
 		return NULL;
-
-	if (dma_spec->args_count > 3)
-		cfg.threshold = dma_spec->args[3];
+	}
 
 	chan = &dmadev->chan[cfg.channel_id];
 
 	c = dma_get_slave_channel(&chan->vchan.chan);
-	if (c)
-		stm32_dma_set_config(chan, &cfg);
+	if (!c) {
+		dev_err(dev, "No more channel avalaible\n");
+		return NULL;
+	}
+
+	stm32_dma_set_config(chan, &cfg);
 
 	return c;
 }
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
