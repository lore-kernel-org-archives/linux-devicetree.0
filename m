From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 23/23] usb: gadget: zero: allocate and init otg descriptor by otg capabilities
Date: Thu, 23 Jul 2015 11:37:47 +0800
Message-ID: <1437622667-6735-24-git-send-email-jun.li@freescale.com>
References: <1437622667-6735-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437622667-6735-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Allocate and initialize usb otg descriptor according to gadget otg
capabilities, add it for each usb configurations. If otg capability
is not defined, keep its original otg descriptor unchanged.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/gadget/legacy/zero.c | 41 ++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/gadget/legacy/zero.c b/drivers/usb/gadget/legacy/zero.c
index c986e8a..37a4100 100644
--- a/drivers/usb/gadget/legacy/zero.c
+++ b/drivers/usb/gadget/legacy/zero.c
@@ -121,24 +121,7 @@ static struct usb_device_descriptor device_desc = {
 	.bNumConfigurations =	2,
 };
 
-#ifdef CONFIG_USB_OTG
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
-#else
-#define otg_desc	NULL
-#endif
+static const struct usb_descriptor_header *otg_desc[2];
 
 /* string IDs are assigned dynamically */
 /* default serial number takes at least two packets */
@@ -341,6 +324,18 @@ static int zero_bind(struct usb_composite_dev *cdev)
 
 	/* support OTG systems */
 	if (gadget_is_otg(cdev->gadget)) {
+		if (!otg_desc[0]) {
+			struct usb_descriptor_header *usb_desc;
+
+			usb_desc = usb_otg_descriptor_alloc(cdev->gadget);
+			if (!usb_desc) {
+				status = -ENOMEM;
+				goto err_conf_flb;
+			}
+			usb_otg_descriptor_init(cdev->gadget, usb_desc);
+			otg_desc[0] = usb_desc;
+			otg_desc[1] = NULL;
+		}
 		sourcesink_driver.descriptors = otg_desc;
 		sourcesink_driver.bmAttributes |= USB_CONFIG_ATT_WAKEUP;
 		loopback_driver.descriptors = otg_desc;
@@ -359,12 +354,12 @@ static int zero_bind(struct usb_composite_dev *cdev)
 	}
 	status = usb_add_function(&sourcesink_driver, func_ss);
 	if (status)
-		goto err_conf_flb;
+		goto err_free_otg_desc;
 
 	usb_ep_autoconfig_reset(cdev->gadget);
 	status = usb_add_function(&loopback_driver, func_lb);
 	if (status)
-		goto err_conf_flb;
+		goto err_free_otg_desc;
 
 	usb_ep_autoconfig_reset(cdev->gadget);
 	usb_composite_overwrite_options(cdev, &coverwrite);
@@ -373,6 +368,9 @@ static int zero_bind(struct usb_composite_dev *cdev)
 
 	return 0;
 
+err_free_otg_desc:
+	kfree(otg_desc[0]);
+	otg_desc[0] = NULL;
 err_conf_flb:
 	usb_put_function(func_lb);
 	func_lb = NULL;
@@ -397,6 +395,9 @@ static int zero_unbind(struct usb_composite_dev *cdev)
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
