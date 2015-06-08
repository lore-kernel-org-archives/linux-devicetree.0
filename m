From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 22/22] usb: gadget: zero: init usb_otg_descriptor via usb_otg_descriptor_add
Date: Mon, 8 Jun 2015 23:02:17 +0800
Message-ID: <1433775737-9816-23-git-send-email-jun.li@freescale.com>
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
 drivers/usb/gadget/legacy/zero.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/legacy/zero.c b/drivers/usb/gadget/legacy/zero.c
index c986e8a..fe8cddb 100644
--- a/drivers/usb/gadget/legacy/zero.c
+++ b/drivers/usb/gadget/legacy/zero.c
@@ -122,20 +122,7 @@ static struct usb_device_descriptor device_desc = {
 };
 
 #ifdef CONFIG_USB_OTG
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
 #else
 #define otg_desc	NULL
 #endif
@@ -341,6 +328,13 @@ static int zero_bind(struct usb_composite_dev *cdev)
 
 	/* support OTG systems */
 	if (gadget_is_otg(cdev->gadget)) {
+		if (!otg_desc[0]) {
+			otg_desc[0] = (struct usb_descriptor_header *)
+					usb_otg_descriptor_add(cdev->gadget);
+			if (!otg_desc[0])
+				return -ENOMEM;
+			otg_desc[1] = NULL;
+		}
 		sourcesink_driver.descriptors = otg_desc;
 		sourcesink_driver.bmAttributes |= USB_CONFIG_ATT_WAKEUP;
 		loopback_driver.descriptors = otg_desc;
@@ -397,6 +391,9 @@ static int zero_unbind(struct usb_composite_dev *cdev)
 	if (!IS_ERR_OR_NULL(func_lb))
 		usb_put_function(func_lb);
 	usb_put_function_instance(func_inst_lb);
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
