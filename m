From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 16/22] usb: gadget: hid: init usb_otg_descriptor via usb_otg_descriptor_add
Date: Tue, 16 Jun 2015 14:52:06 +0800
Message-ID: <1434437532-23678-17-git-send-email-jun.li@freescale.com>
References: <1434437532-23678-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434437532-23678-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use usb_otg_descriptor_add to allocate and initialize usb_otg_descriptor,
free it while composite unbind.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/gadget/legacy/hid.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/legacy/hid.c b/drivers/usb/gadget/legacy/hid.c
index 2baa572..6e7bbda 100644
--- a/drivers/usb/gadget/legacy/hid.c
+++ b/drivers/usb/gadget/legacy/hid.c
@@ -68,21 +68,7 @@ static struct usb_device_descriptor device_desc = {
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
-
+static const struct usb_descriptor_header *otg_desc[2];
 
 /* string IDs are assigned dynamically */
 static struct usb_string strings_dev[] = {
@@ -112,6 +98,21 @@ static int do_config(struct usb_configuration *c)
 	int status = 0;
 
 	if (gadget_is_otg(c->cdev->gadget)) {
+		if (!otg_desc[0]) {
+			struct usb_descriptor_header *usb_desc;
+			unsigned length;
+
+			if (c->cdev->gadget->otg_rev >= 0x0200)
+				length = sizeof(struct usb_otg20_descriptor);
+			else
+				length = sizeof(struct usb_otg_descriptor);
+			usb_desc = kzalloc(length, GFP_KERNEL);
+			if (!usb_desc)
+				return -ENOMEM;
+			usb_otg_descriptor_init(c->cdev->gadget, usb_desc);
+			otg_desc[0] = usb_desc;
+			otg_desc[1] = NULL;
+		}
 		c->descriptors = otg_desc;
 		c->bmAttributes |= USB_CONFIG_ATT_WAKEUP;
 	}
@@ -213,6 +214,10 @@ static int hid_unbind(struct usb_composite_dev *cdev)
 		usb_put_function(n->f);
 		usb_put_function_instance(n->fi);
 	}
+
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
