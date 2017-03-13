From: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/5] dmaengine: stm32-dma: Add support for STM32 DMAMUX
Date: Mon, 13 Mar 2017 15:16:00 +0100
Message-ID: <1489414561-28912-5-git-send-email-cedric.madianga@gmail.com>
References: <1489414561-28912-1-git-send-email-cedric.madianga@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489414561-28912-1-git-send-email-cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for STM32 DMAMUX.
When the STM32 DMA controller is behind a STM32 DMAMUX the request line
number has not to be handled by DMA but DMAMUX.

Signed-off-by: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/stm32-dma.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 786fc8f..3bf2893 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -179,6 +179,7 @@ struct stm32_dma_device {
 	struct clk *clk;
 	struct reset_control *rst;
 	bool mem2mem;
+	bool dmamux;
 	struct stm32_dma_chan chan[STM32_DMA_MAX_CHANNELS];
 };
 
@@ -968,10 +969,14 @@ static void stm32_dma_desc_free(struct virt_dma_desc *vdesc)
 static void stm32_dma_set_config(struct stm32_dma_chan *chan,
 			  struct stm32_dma_cfg *cfg)
 {
+	struct stm32_dma_device *dmadev = stm32_dma_get_dev(chan);
+
 	stm32_dma_clear_reg(&chan->chan_reg);
 
 	chan->chan_reg.dma_scr = cfg->stream_config & STM32_DMA_SCR_CFG_MASK;
-	chan->chan_reg.dma_scr |= STM32_DMA_SCR_REQ(cfg->request_line);
+
+	if (!dmadev->dmamux)
+		chan->chan_reg.dma_scr |= STM32_DMA_SCR_REQ(cfg->request_line);
 
 	/* Enable Interrupts  */
 	chan->chan_reg.dma_scr |= STM32_DMA_SCR_TEIE | STM32_DMA_SCR_TCIE;
@@ -998,8 +1003,8 @@ static struct dma_chan *stm32_dma_of_xlate(struct of_phandle_args *dma_spec,
 	cfg.stream_config = dma_spec->args[2];
 	cfg.threshold = dma_spec->args[3];
 
-	if ((cfg.channel_id >= STM32_DMA_MAX_CHANNELS) ||
-	    (cfg.request_line >= STM32_DMA_MAX_REQUEST_ID)) {
+	if ((!dmadev->dmamux && cfg.request_line >= STM32_DMA_MAX_REQUEST_ID) ||
+	    (cfg.channel_id >= STM32_DMA_MAX_CHANNELS)) {
 		dev_err(dev, "Bad channel and/or request id\n");
 		return NULL;
 	}
@@ -1058,6 +1063,8 @@ static int stm32_dma_probe(struct platform_device *pdev)
 	dmadev->mem2mem = of_property_read_bool(pdev->dev.of_node,
 						"st,mem2mem");
 
+	dmadev->dmamux = of_property_read_bool(pdev->dev.of_node, "st,dmamux");
+
 	dmadev->rst = devm_reset_control_get(&pdev->dev, NULL);
 	if (!IS_ERR(dmadev->rst)) {
 		reset_control_assert(dmadev->rst);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
