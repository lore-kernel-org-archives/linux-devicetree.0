From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v4 14/23] usb: gadget: audio: allocate and init otg descriptor by otg capabilities
Date: Wed, 17 Jun 2015 13:43:46 +0800
Message-ID: <1434519835-27745-15-git-send-email-jun.li@freescale.com>
References: <1434519835-27745-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434519835-27745-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allocate and initialize usb otg descriptor according to gadget otg
capabilities, add it for each usb configurations, free it while
composite unbind. If otg capability is not defined, keep its otg
descriptor unchanged.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/gadget/legacy/audio.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/legacy/audio.c b/drivers/usb/gadget/legacy/audio.c
index f289caf..a30b23b 100644
--- a/drivers/usb/gadget/legacy/audio.c
+++ b/drivers/usb/gadget/legacy/audio.c
@@ -150,20 +150,7 @@ static struct usb_device_descriptor device_desc = {
 	.bNumConfigurations =	1,
 };
 
-static struct usb_otg_descriptor otg_descriptor = {
-	.bLength =		sizeof otg_descriptor,
-	.bDescriptorType =	USB_DT_OTG,
-
-	/* REVISIT SRP-only hardware is possible, although
-	 * it would not be called "OTG" ...
-	 */
-	.bmAttributes =		USB_OTG_SRP | USB_OTG_HNP,
-};
-
-static const struct usb_descriptor_header *otg_desc[] = {
-	(struct usb_descriptor_header *) &otg_descriptor,
-	NULL,
-};
+static const struct usb_descriptor_header *otg_desc[2];
 
 /*-------------------------------------------------------------------------*/
 
@@ -174,6 +161,16 @@ static int audio_do_config(struct usb_configuration *c)
 	/* FIXME alloc iConfiguration string, set it in c->strings */
 
 	if (gadget_is_otg(c->cdev->gadget)) {
+		if (!otg_desc[0]) {
+			struct usb_descriptor_header *usb_desc;
+
+			usb_desc = usb_otg_descriptor_alloc(c->cdev->gadget);
+			if (!usb_desc)
+				return -ENOMEM;
+			usb_otg_descriptor_init(c->cdev->gadget, usb_desc);
+			otg_desc[0] = usb_desc;
+			otg_desc[1] = NULL;
+		}
 		c->descriptors = otg_desc;
 		c->bmAttributes |= USB_CONFIG_ATT_WAKEUP;
 	}
@@ -289,6 +286,9 @@ static int audio_unbind(struct usb_composite_dev *cdev)
 	if (!IS_ERR_OR_NULL(fi_uac2))
 		usb_put_function_instance(fi_uac2);
 #endif
+	kfree(otg_desc[0]);
+	otg_desc[0] = NULL;
+
 	return 0;
 }
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
