From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 17/22] usb: gadget: mass_storage: init usb_otg_descriptor via usb_otg_descriptor_add
Date: Mon, 8 Jun 2015 23:02:12 +0800
Message-ID: <1433775737-9816-18-git-send-email-jun.li@freescale.com>
References: <1433775737-9816-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433775737-9816-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use usb_otg_descriptor_add to allocate and initialize usb_otg_descriptor,
free it while composite unbind.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/gadget/legacy/mass_storage.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/legacy/mass_storage.c b/drivers/usb/gadget/legacy/mass_storage.c
index e7bfb08..20fdc2f 100644
--- a/drivers/usb/gadget/legacy/mass_storage.c
+++ b/drivers/usb/gadget/legacy/mass_storage.c
@@ -64,21 +64,7 @@ static struct usb_device_descriptor msg_device_desc = {
 	.bNumConfigurations =	1,
 };
 
-static struct usb_otg_descriptor otg_descriptor = {
-	.bLength =		sizeof otg_descriptor,
-	.bDescriptorType =	USB_DT_OTG,
-
-	/*
-	 * REVISIT SRP-only hardware is possible, although
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
 
 static struct usb_string strings_dev[] = {
 	[USB_GADGET_MANUFACTURER_IDX].s = "",
@@ -136,6 +122,13 @@ static int msg_do_config(struct usb_configuration *c)
 	int ret;
 
 	if (gadget_is_otg(c->cdev->gadget)) {
+		if (!otg_desc[0]) {
+			otg_desc[0] = (struct usb_descriptor_header *)
+				usb_otg_descriptor_add(c->cdev->gadget);
+			if (!otg_desc[0])
+				return -ENOMEM;
+			otg_desc[1] = NULL;
+		}
 		c->descriptors = otg_desc;
 		c->bmAttributes |= USB_CONFIG_ATT_WAKEUP;
 	}
@@ -243,6 +236,9 @@ static int msg_unbind(struct usb_composite_dev *cdev)
 	if (!IS_ERR(fi_msg))
 		usb_put_function_instance(fi_msg);
 
+	kfree(otg_desc[0]);
+	otg_desc[0] = NULL;
+
 	return 0;
 }
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
