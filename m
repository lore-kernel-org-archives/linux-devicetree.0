From: Raviteja Garimella <raviteja.garimella@broadcom.com>
Subject: [RESEND PATCH v3 5/7] UDC: Use struct dma_pool instead of pci_pool
Date: Fri, 31 Mar 2017 18:39:11 +0530
Message-ID: <1490965753-3511-5-git-send-email-raviteja.garimella@broadcom.com>
References: <1490965753-3511-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490965753-3511-1-git-send-email-raviteja.garimella@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Using dma_pool instead of pci_pool will make snps_udc_core driver
to be compatible with non-pci platforms.

Signed-off-by: Raviteja Garimella <raviteja.garimella@broadcom.com>
---
 drivers/usb/gadget/udc/snps_udc_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/snps_udc_core.c
index 5ca8b7b..d592f77 100644
--- a/drivers/usb/gadget/udc/snps_udc_core.c
+++ b/drivers/usb/gadget/udc/snps_udc_core.c
@@ -543,7 +543,7 @@ udc_alloc_request(struct usb_ep *usbep, gfp_t gfp)
 
 	if (ep->dma) {
 		/* ep0 in requests are allocated from data pool here */
-		dma_desc = pci_pool_alloc(ep->dev->data_requests, gfp,
+		dma_desc = dma_pool_alloc(ep->dev->data_requests, gfp,
 						&req->td_phys);
 		if (!dma_desc) {
 			kfree(req);
@@ -582,7 +582,7 @@ static void udc_free_dma_chain(struct udc *dev, struct udc_request *req)
 	for (i = 1; i < req->chain_len; i++) {
 		td = phys_to_virt(addr);
 		addr_next = (dma_addr_t)td->next;
-		pci_pool_free(dev->data_requests, td, addr);
+		dma_pool_free(dev->data_requests, td, addr);
 		addr = addr_next;
 	}
 }
@@ -608,7 +608,7 @@ udc_free_request(struct usb_ep *usbep, struct usb_request *usbreq)
 		if (req->chain_len > 1)
 			udc_free_dma_chain(ep->dev, req);
 
-		pci_pool_free(ep->dev->data_requests, req->td_data,
+		dma_pool_free(ep->dev->data_requests, req->td_data,
 							req->td_phys);
 	}
 	kfree(req);
@@ -803,7 +803,7 @@ static int udc_create_dma_chain(
 	for (i = buf_len; i < bytes; i += buf_len) {
 		/* create or determine next desc. */
 		if (create_new_chain) {
-			td = pci_pool_alloc(ep->dev->data_requests,
+			td = dma_pool_alloc(ep->dev->data_requests,
 					    gfp_flags, &dma_addr);
 			if (!td)
 				return -ENOMEM;
-- 
2.1.0
