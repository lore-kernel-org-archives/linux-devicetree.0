From: kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org
Subject: [PATCH V2 1/3] dt/bindings: bcm2835: add interrupt-names property
Date: Mon, 11 Apr 2016 13:29:07 +0000
Message-ID: <1460381349-14408-2-git-send-email-kernel@martin.sperl.org>
References: <1460381349-14408-1-git-send-email-kernel@martin.sperl.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460381349-14408-1-git-send-email-kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>

Added standard interrupt-names property so that
platform_get_irq_byname() can get used to fetch the
interrupt corresponding to each dma_channel
instead of the current platform_get_irq() with
an assumed ordering of the interrupts.

Signed-off-by: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
---
 .../devicetree/bindings/dma/brcm,bcm2835-dma.txt   | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
index 1396078..baf9b34 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
@@ -12,6 +12,10 @@ Required properties:
 - reg: Should contain DMA registers location and length.
 - interrupts: Should contain the DMA interrupts associated
 		to the DMA channels in ascending order.
+- interrupt-names: Should contain the names of the interrupt
+		   in the form "dmaXX".
+		   Use "dma-shared-all" for the common interrupt line
+		   that is shared by all dma channels.
 - #dma-cells: Must be <1>, the cell in the dmas property of the
 		client device represents the DREQ number.
 - brcm,dma-channel-mask: Bit mask representing the channels
@@ -34,13 +38,35 @@ dma: dma@7e007000 {
 		     <1 24>,
 		     <1 25>,
 		     <1 26>,
+		     /* dma channel 11-14 share one irq */
 		     <1 27>,
+		     <1 27>,
+		     <1 27>,
+		     <1 27>,
+		     /* unused shared irq for all channels */
 		     <1 28>;
+	interrupt-names = "dma0",
+			  "dma1",
+			  "dma2",
+			  "dma3",
+			  "dma4",
+			  "dma5",
+			  "dma6",
+			  "dma7",
+			  "dma8",
+			  "dma9",
+			  "dma10",
+			  "dma11",
+			  "dma12",
+			  "dma13",
+			  "dma14",
+			  "dma-shared-all";
 
 	#dma-cells = <1>;
 	brcm,dma-channel-mask = <0x7f35>;
 };
 
+
 DMA clients connected to the BCM2835 DMA controller must use the format
 described in the dma.txt file, using a two-cell specifier for each channel.
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
