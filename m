From: kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org
Subject: [PATCH v3 05/11] dmaengine: bcm2835: add additional defines for DMA-registers
Date: Sat,  5 Mar 2016 10:52:16 +0000
Message-ID: <1457175142-28665-6-git-send-email-kernel@martin.sperl.org>
References: <1457175142-28665-1-git-send-email-kernel@martin.sperl.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457175142-28665-1-git-send-email-kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>

Add additional defines describing the DMA registers
as well as adding some more documentation to those registers.

Signed-off-by: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Reviewed-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
---
 drivers/dma/bcm2835-dma.c | 57 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 49 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index fe7d5a6..2cdc256 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -99,26 +99,67 @@ struct bcm2835_desc {
 
 #define BCM2835_DMA_CS		0x00
 #define BCM2835_DMA_ADDR	0x04
+#define BCM2835_DMA_TI		0x08
 #define BCM2835_DMA_SOURCE_AD	0x0c
 #define BCM2835_DMA_DEST_AD	0x10
-#define BCM2835_DMA_NEXTCB	0x1C
+#define BCM2835_DMA_LEN		0x14
+#define BCM2835_DMA_STRIDE	0x18
+#define BCM2835_DMA_NEXTCB	0x1c
+#define BCM2835_DMA_DEBUG	0x20
 
 /* DMA CS Control and Status bits */
-#define BCM2835_DMA_ACTIVE	BIT(0)
-#define BCM2835_DMA_INT	BIT(2)
+#define BCM2835_DMA_ACTIVE	BIT(0)  /* activate the DMA */
+#define BCM2835_DMA_END		BIT(1)  /* current CB has ended */
+#define BCM2835_DMA_INT		BIT(2)  /* interrupt status */
+#define BCM2835_DMA_DREQ	BIT(3)  /* DREQ state */
 #define BCM2835_DMA_ISPAUSED	BIT(4)  /* Pause requested or not active */
 #define BCM2835_DMA_ISHELD	BIT(5)  /* Is held by DREQ flow control */
-#define BCM2835_DMA_ERR	BIT(8)
+#define BCM2835_DMA_WAITING_FOR_WRITES BIT(6) /* waiting for last
+					       * AXI-write to ack
+					       */
+#define BCM2835_DMA_ERR		BIT(8)
+#define BCM2835_DMA_PRIORITY(x) ((x & 15) << 16) /* AXI priority */
+#define BCM2835_DMA_PANIC_PRIORITY(x) ((x & 15) << 20) /* panic priority */
+/* current value of TI.BCM2835_DMA_WAIT_RESP */
+#define BCM2835_DMA_WAIT_FOR_WRITES BIT(28)
+#define BCM2835_DMA_DIS_DEBUG	BIT(29) /* disable debug pause signal */
 #define BCM2835_DMA_ABORT	BIT(30) /* Stop current CB, go to next, WO */
 #define BCM2835_DMA_RESET	BIT(31) /* WO, self clearing */
 
+/* Transfer information bits - also bcm2835_cb.info field */
 #define BCM2835_DMA_INT_EN	BIT(0)
+#define BCM2835_DMA_TDMODE	BIT(1) /* 2D-Mode */
+#define BCM2835_DMA_WAIT_RESP	BIT(3) /* wait for AXI-write to be acked */
 #define BCM2835_DMA_D_INC	BIT(4)
-#define BCM2835_DMA_D_DREQ	BIT(6)
+#define BCM2835_DMA_D_WIDTH	BIT(5) /* 128bit writes if set */
+#define BCM2835_DMA_D_DREQ	BIT(6) /* enable DREQ for destination */
+#define BCM2835_DMA_D_IGNORE	BIT(7) /* ignore destination writes */
 #define BCM2835_DMA_S_INC	BIT(8)
-#define BCM2835_DMA_S_DREQ	BIT(10)
-
-#define BCM2835_DMA_PER_MAP(x)	((x) << 16)
+#define BCM2835_DMA_S_WIDTH	BIT(9) /* 128bit writes if set */
+#define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
+#define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
+#define BCM2835_DMA_BURST_LENGTH(x) ((x & 15) << 12)
+#define BCM2835_DMA_PER_MAP(x)	((x & 31) << 16) /* REQ source */
+#define BCM2835_DMA_WAIT(x)	((x & 31) << 21) /* add DMA-wait cycles */
+#define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
+
+/* debug register bits */
+#define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
+#define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
+#define BCM2835_DMA_DEBUG_READ_ERR		BIT(2)
+#define BCM2835_DMA_DEBUG_OUTSTANDING_WRITES_SHIFT 4
+#define BCM2835_DMA_DEBUG_OUTSTANDING_WRITES_BITS 4
+#define BCM2835_DMA_DEBUG_ID_SHIFT		16
+#define BCM2835_DMA_DEBUG_ID_BITS		9
+#define BCM2835_DMA_DEBUG_STATE_SHIFT		16
+#define BCM2835_DMA_DEBUG_STATE_BITS		9
+#define BCM2835_DMA_DEBUG_VERSION_SHIFT		25
+#define BCM2835_DMA_DEBUG_VERSION_BITS		3
+#define BCM2835_DMA_DEBUG_LITE			BIT(28)
+
+/* shared registers for all dma channels */
+#define BCM2835_DMA_INT_STATUS         0xfe0
+#define BCM2835_DMA_ENABLE             0xff0
 
 #define BCM2835_DMA_DATA_TYPE_S8	1
 #define BCM2835_DMA_DATA_TYPE_S16	2
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
