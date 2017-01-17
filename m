From: Raviteja Garimella <raviteja.garimella@broadcom.com>
Subject: [RFC v2 3/5] UDC: Provide correct arguments for 'dma_pool_create'
Date: Tue, 17 Jan 2017 13:35:06 +0530
Message-ID: <1484640308-25976-4-git-send-email-raviteja.garimella@broadcom.com>
References: <1484640308-25976-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484640308-25976-1-git-send-email-raviteja.garimella@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Change the argument from NULL to a struct device for the
dma_pool_create call during dma init.

Signed-off-by: Raviteja Garimella <raviteja.garimella@broadcom.com>
---
 drivers/usb/gadget/udc/snps_udc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/snps_udc_core.c
index b7a6218..556fa0e 100644
--- a/drivers/usb/gadget/udc/snps_udc_core.c
+++ b/drivers/usb/gadget/udc/snps_udc_core.c
@@ -3094,7 +3094,7 @@ int init_dma_pools(struct udc *dev)
 	}
 
 	/* DMA setup */
-	dev->data_requests = dma_pool_create("data_requests", NULL,
+	dev->data_requests = dma_pool_create("data_requests", dev->dev,
 		sizeof(struct udc_data_dma), 0, 0);
 	if (!dev->data_requests) {
 		DBG(dev, "can't get request data pool\n");
@@ -3105,7 +3105,7 @@ int init_dma_pools(struct udc *dev)
 	dev->ep[UDC_EP0IN_IX].dma = &dev->regs->ctl;
 
 	/* dma desc for setup data */
-	dev->stp_requests = dma_pool_create("setup requests", NULL,
+	dev->stp_requests = dma_pool_create("setup requests", dev->dev,
 		sizeof(struct udc_stp_dma), 0, 0);
 	if (!dev->stp_requests) {
 		DBG(dev, "can't get stp request pool\n");
-- 
2.1.0
