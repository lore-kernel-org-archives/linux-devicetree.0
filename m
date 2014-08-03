From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/2] dmaengine: nbpfaxi: fix a theoretical race
Date: Sun, 3 Aug 2014 19:13:03 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1408031909420.13820@axis700.grange>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

A race possibility exists if a DMA slave driver tries to free channel
resources witout waiting for all transfers to complete and without
explicitly terminating all requests. In such a case the IRQ processing
thread can race with .device_free_chan_resources(). To fix this race empty
all descriptor lists before freeing descriptor cache.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/nbpfaxi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index 77c5a89..5b40ac8 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -1054,6 +1054,7 @@ static void nbpf_free_chan_resources(struct dma_chan *dchan)
 	dev_dbg(dchan->device->dev, "Entry %s()\n", __func__);
 
 	nbpf_chan_halt(chan);
+	nbpf_chan_idle(chan);
 	/* Clean up for if a channel is re-used for MEMCPY after slave DMA */
 	nbpf_chan_prepare_default(chan);
 
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
