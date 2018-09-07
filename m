From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH] usb: xhci: fix interrupt transfer error happened on MTK platforms
Date: Fri, 7 Sep 2018 13:51:48 +0800
Message-ID: <afafa68eb3a74a414848c116382e95811f924905.1536298766.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The MTK xHCI controller use some reserved bytes in endpoint context for
bandwidth scheduling, so need keep them in xhci_endpoint_copy();

The issue is introduced by:
commit f5249461b504 ("xhci: Clear the host side toggle manually when
endpoint is soft reset")
It resets endpoints and will drop bandwidth scheduling parameters used
by interrupt or isochronous endpoints on MTK xHCI controller.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index ef350c3..b1f27aa 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1613,6 +1613,10 @@ void xhci_endpoint_copy(struct xhci_hcd *xhci,
 	in_ep_ctx->ep_info2 = out_ep_ctx->ep_info2;
 	in_ep_ctx->deq = out_ep_ctx->deq;
 	in_ep_ctx->tx_info = out_ep_ctx->tx_info;
+	if (xhci->quirks & XHCI_MTK_HOST) {
+		in_ep_ctx->reserved[0] = out_ep_ctx->reserved[0];
+		in_ep_ctx->reserved[1] = out_ep_ctx->reserved[1];
+	}
 }
 
 /* Copy output xhci_slot_ctx to the input xhci_slot_ctx.
-- 
1.9.1
