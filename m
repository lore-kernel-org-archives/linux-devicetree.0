From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 7/7] dmaengine: at_xdmac: Add DMA_PRIVATE
Date: Thu, 13 Nov 2014 11:52:45 +0100
Message-ID: <1415875965-6905-8-git-send-email-ludovic.desroches@atmel.com>
References: <1415875965-6905-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415875965-6905-1-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

same issue as commit 7f5ae3553685:
"Without DMA_PRIVATE the driver is not able to allocate more than one channel.
Since it uses dma_get_any_slave_channel that calls private_candidate, the
second allocation fails at
/* some channels are already publicly allocated */
"

Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/at_xdmac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index 586275f..b60d77a 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -1394,6 +1394,11 @@ static int at_xdmac_probe(struct platform_device *pdev)
 	dma_cap_set(DMA_CYCLIC, atxdmac->dma.cap_mask);
 	dma_cap_set(DMA_MEMCPY, atxdmac->dma.cap_mask);
 	dma_cap_set(DMA_SLAVE, atxdmac->dma.cap_mask);
+	/*
+	 * Without DMA_PRIVATE the driver is not able to allocate more than
+	 * one channel, second allocation fails in private_candidate.
+	 */
+	dma_cap_set(DMA_PRIVATE, atxdmac->dma.cap_mask);
 	atxdmac->dma.dev				= &pdev->dev;
 	atxdmac->dma.device_alloc_chan_resources	= at_xdmac_alloc_chan_resources;
 	atxdmac->dma.device_free_chan_resources		= at_xdmac_free_chan_resources;
-- 
2.0.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
