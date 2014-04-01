From: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 7/7] usb: gadget: gr_udc: Use GFP_ATOMIC when allocating under held spinlock
Date: Tue,  1 Apr 2014 12:15:17 +0200
Message-ID: <1396347317-3861-1-git-send-email-andreas@gaisler.com>
References: <1395933359-7109-8-git-send-email-andreas@gaisler.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395933359-7109-8-git-send-email-andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

As gr_ep_init must be called with dev->lock held, GFP_KERNEL must not be used.

Reported-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
---
Differences since v1: Fixed typo in commit message
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
