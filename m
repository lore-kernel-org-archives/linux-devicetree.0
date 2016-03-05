From: kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org
Subject: [PATCH v3 04/11] ARM: bcm2835: dt: add bindings for shared interrupt properties
Date: Sat,  5 Mar 2016 10:52:15 +0000
Message-ID: <1457175142-28665-5-git-send-email-kernel@martin.sperl.org>
References: <1457175142-28665-1-git-send-email-kernel@martin.sperl.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457175142-28665-1-git-send-email-kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>

Add binding documentation for the new shared interrupt properties:
* brcm,dma-channel-shared-mask
* brcm,dma-shared-irq-index

Signed-off-by: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
---
 Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
index 1396078..f9e84ee 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
@@ -17,6 +17,10 @@ Required properties:
 - brcm,dma-channel-mask: Bit mask representing the channels
 			 not used by the firmware in ascending order,
 			 i.e. first channel corresponds to LSB.
+- brcm,dma-channel-shared-mask: Bit mask representing the channels
+				that use a shared interrupt
+- brcm,dma-shared-irq-index: index of which of the interrupts mentioned
+			     above is the shared interrupt
 
 Example:
 
@@ -39,6 +43,8 @@ dma: dma@7e007000 {
 
 	#dma-cells = <1>;
 	brcm,dma-channel-mask = <0x7f35>;
+	brcm,dma-channel-shared-mask = <0x0780>;
+	brcm,dma-shared-irq-index = <11>;
 };
 
 DMA clients connected to the BCM2835 DMA controller must use the format
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
