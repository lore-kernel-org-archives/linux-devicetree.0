From: <min.guo@mediatek.com>
Subject: [PATCH v2 3/4] usb: musb: Extract set toggle as a separate interface
Date: Tue, 15 Jan 2019 09:43:45 +0800
Message-ID: <1547516626-5084-4-git-send-email-min.guo@mediatek.com>
References: <1547516626-5084-1-git-send-email-min.guo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547516626-5084-1-git-send-email-min.guo@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Min Guo <min.guo@mediatek.com>

Add a common interface for set data toggle

Signed-off-by: Min Guo <min.guo@mediatek.com>
---
 drivers/usb/musb/musb_host.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index b59ce9a..16d0ba4 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -306,6 +306,25 @@ static inline void musb_save_toggle(struct musb_qh *qh, int is_in,
 	usb_settoggle(urb->dev, qh->epnum, !is_in, csr ? 1 : 0);
 }
 
+static inline u16 musb_set_toggle(struct musb_qh *qh, int is_in,
+	struct urb *urb)
+{
+	u16 csr = 0;
+	u16 toggle = 0;
+
+	toggle = usb_gettoggle(urb->dev, qh->epnum, !is_in);
+
+	if (is_in)
+		csr = toggle ? (MUSB_RXCSR_H_WR_DATATOGGLE
+				| MUSB_RXCSR_H_DATATOGGLE) : 0;
+	else
+		csr = toggle ? (MUSB_TXCSR_H_WR_DATATOGGLE
+				| MUSB_TXCSR_H_DATATOGGLE)
+				: MUSB_TXCSR_CLRDATATOG;
+
+	return csr;
+}
+
 /*
  * Advance this hardware endpoint's queue, completing the specified URB and
  * advancing to either the next URB queued to that qh, or else invalidating
@@ -772,13 +791,8 @@ static void musb_ep_program(struct musb *musb, u8 epnum,
 					);
 			csr |= MUSB_TXCSR_MODE;
 
-			if (!hw_ep->tx_double_buffered) {
-				if (usb_gettoggle(urb->dev, qh->epnum, 1))
-					csr |= MUSB_TXCSR_H_WR_DATATOGGLE
-						| MUSB_TXCSR_H_DATATOGGLE;
-				else
-					csr |= MUSB_TXCSR_CLRDATATOG;
-			}
+			if (!hw_ep->tx_double_buffered)
+				csr |= musb_set_toggle(qh, !is_out, urb);
 
 			musb_writew(epio, MUSB_TXCSR, csr);
 			/* REVISIT may need to clear FLUSHFIFO ... */
@@ -860,17 +874,12 @@ static void musb_ep_program(struct musb *musb, u8 epnum,
 
 	/* IN/receive */
 	} else {
-		u16	csr;
+		u16 csr = 0;
 
 		if (hw_ep->rx_reinit) {
 			musb_rx_reinit(musb, qh, epnum);
+			csr |= musb_set_toggle(qh, !is_out, urb);
 
-			/* init new state: toggle and NYET, maybe DMA later */
-			if (usb_gettoggle(urb->dev, qh->epnum, 0))
-				csr = MUSB_RXCSR_H_WR_DATATOGGLE
-					| MUSB_RXCSR_H_DATATOGGLE;
-			else
-				csr = 0;
 			if (qh->type == USB_ENDPOINT_XFER_INT)
 				csr |= MUSB_RXCSR_DISNYET;
 
-- 
1.9.1
