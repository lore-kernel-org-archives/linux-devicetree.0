From: Andreas Larsson <andreas@gaisler.com>
Subject: [PATCH 7/7] usb: gadget: gr_udc: Use GFP_ATOMIC when allocating under help spinlock
Date: Thu, 27 Mar 2014 16:15:59 +0100
Message-ID: <1395933359-7109-8-git-send-email-andreas@gaisler.com>
References: <1395933359-7109-1-git-send-email-andreas@gaisler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395933359-7109-1-git-send-email-andreas@gaisler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dan Carpenter <dan.carpenter@oracle.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

As gr_ep_init must be called with dev->lock held, GFP_KERNEL must not be used.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Signed-off-by: Andreas Larsson <andreas@gaisler.com>
---
New patch but needs patch 1/7 to apply

 drivers/usb/gadget/gr_udc.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/gr_udc.c b/drivers/usb/gadget/gr_udc.c
index 72458be..4966971 100644
--- a/drivers/usb/gadget/gr_udc.c
+++ b/drivers/usb/gadget/gr_udc.c
@@ -1990,8 +1990,8 @@ static int gr_ep_init(struct gr_udc *dev, int num, int is_in, u32 maxplimit)
 	INIT_LIST_HEAD(&ep->queue);
 
 	if (num == 0) {
-		_req = gr_alloc_request(&ep->ep, GFP_KERNEL);
-		buf = devm_kzalloc(dev->dev, PAGE_SIZE, GFP_DMA | GFP_KERNEL);
+		_req = gr_alloc_request(&ep->ep, GFP_ATOMIC);
+		buf = devm_kzalloc(dev->dev, PAGE_SIZE, GFP_DMA | GFP_ATOMIC);
 		if (!_req || !buf) {
 			/* possible _req freed by gr_probe via gr_remove */
 			return -ENOMEM;
-- 
1.7.10.4
