From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] usb: gadget: at91_udc: move the dereference below the NULL test
Date: Fri, 7 Sep 2012 14:54:25 +0800
Message-ID: <CAPgLHd9qouNBdAfoDhP8qc4T4PrcPS=v6u9M+20rv0oyt34e5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

The dereference should be moved below the NULL test.

spatch with a semantic match is used to found this.
(http://coccinelle.lip6.fr/)

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 drivers/usb/gadget/at91_udc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/at91_udc.c b/drivers/usb/gadget/at91_udc.c
index c9e66df..d95f6b0 100644
--- a/drivers/usb/gadget/at91_udc.c
+++ b/drivers/usb/gadget/at91_udc.c
@@ -469,7 +469,7 @@ static int at91_ep_enable(struct usb_ep *_ep,
 				const struct usb_endpoint_descriptor *desc)
 {
 	struct at91_ep	*ep = container_of(_ep, struct at91_ep, ep);
-	struct at91_udc	*udc = ep->udc;
+	struct at91_udc *udc;
 	u16		maxpacket;
 	u32		tmp;
 	unsigned long	flags;
@@ -484,6 +484,7 @@ static int at91_ep_enable(struct usb_ep *_ep,
 		return -EINVAL;
 	}
 
+	udc = ep->udc;
 	if (!udc->driver || udc->gadget.speed == USB_SPEED_UNKNOWN) {
 		DBG("bogus device state\n");
 		return -ESHUTDOWN;

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
