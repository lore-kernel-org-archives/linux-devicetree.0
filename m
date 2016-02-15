From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH v2 1/4] dma: mmp_pdma: Add the #dma-requests DT property documentation
Date: Mon, 15 Feb 2016 21:57:45 +0100
Message-ID: <1455569868-25017-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

For pxa based platforms, the number of requestor lines should be
specified, so that the driver can check if the flow control should be
activated (when a requestor line is asked for) or not.

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
Since v1: rename of property to #dma-requests
      	  modify default value to 32 as suggested by Vinod
---
 Documentation/devicetree/bindings/dma/mmp-dma.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/mmp-dma.txt b/Documentation/devicetree/bindings/dma/mmp-dma.txt
index 7a802f64e5bd..8f7364a7b349 100644
--- a/Documentation/devicetree/bindings/dma/mmp-dma.txt
+++ b/Documentation/devicetree/bindings/dma/mmp-dma.txt
@@ -12,6 +12,8 @@ Required properties:
 Optional properties:
 - #dma-channels: Number of DMA channels supported by the controller (defaults
   to 32 when not specified)
+- #dma-requests: Number of DMA requestor lines supported by the controller
+  (defaults to 32 when not specified)
 
 "marvell,pdma-1.0"
 Used platforms: pxa25x, pxa27x, pxa3xx, pxa93x, pxa168, pxa910, pxa688.
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
