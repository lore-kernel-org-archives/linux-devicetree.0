From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 19/23] usb: gadget: multi: allocate and init otg descriptor by otg capabilities
Date: Thu, 23 Jul 2015 11:37:43 +0800
Message-ID: <1437622667-6735-20-git-send-email-jun.li@freescale.com>
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
 drivers/usb/gadget/legacy/multi.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/legacy/multi.c b/drivers/usb/gadget/legacy/multi.c
index b21b51f..c38ead1 100644
--- a/drivers/usb/gadget/legacy/multi.c
+++ b/drivers/usb/gadget/legacy/multi.c
@@ -78,21 +78,7 @@ static struct usb_device_descriptor device_desc = {
 	.idProduct =		cpu_to_le16(MULTI_PRODUCT_NUM),
 };
 
-
-static const struct usb_descriptor_header *otg_desc[] = {
-	(struct usb_descriptor_header *) &(struct usb_otg_descriptor){
-		.bLength =		sizeof(struct usb_otg_descriptor),
-		.bDescriptorType =	USB_DT_OTG,
-
-		/*
-		 * REVISIT SRP-only hardware is possible, although
-		 * it would not be called "OTG" ...
-		 */
-		.bmAttributes =		USB_OTG_SRP | USB_OTG_HNP,
-	},
-	NULL,
-};
-
+static const struct usb_descriptor_header *otg_desc[2];
 
 enum {
 	MULTI_STRING_RNDIS_CONFIG_IDX = USB_GADGET_FIRST_AVAIL_IDX,
@@ -429,14 +415,25 @@ static int __ref multi_bind(struct usb_composite_dev *cdev)
 		goto fail_string_ids;
 	device_desc.iProduct = strings_dev[USB_GADGET_PRODUCT_IDX].id;
 
+	if (gadget_is_otg(gadget) && !otg_desc[0]) {
+		struct usb_descriptor_header *usb_desc;
+
+		usb_desc = usb_otg_descriptor_alloc(gadget);
+		if (!usb_desc)
+			goto fail_string_ids;
+		usb_otg_descriptor_init(gadget, usb_desc);
+		otg_desc[0] = usb_desc;
+		otg_desc[1] = NULL;
+	}
+
 	/* register configurations */
 	status = rndis_config_register(cdev);
 	if (unlikely(status < 0))
-		goto fail_string_ids;
+		goto fail_otg_desc;
 
 	status = cdc_config_register(cdev);
 	if (unlikely(status < 0))
-		goto fail_string_ids;
+		goto fail_otg_desc;
 	usb_composite_overwrite_options(cdev, &coverwrite);
 
 	/* we're done */
@@ -445,6 +442,9 @@ static int __ref multi_bind(struct usb_composite_dev *cdev)
 
 
 	/* error recovery */
+fail_otg_desc:
+	kfree(otg_desc[0]);
+	otg_desc[0] = NULL;
 fail_string_ids:
 	fsg_common_remove_luns(fsg_opts->common);
 fail_set_cdev:
@@ -490,6 +490,9 @@ static int multi_unbind(struct usb_composite_dev *cdev)
 	usb_put_function(f_ecm);
 	usb_put_function_instance(fi_ecm);
 #endif
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
