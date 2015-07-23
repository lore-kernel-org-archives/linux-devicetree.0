From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 17/23] usb: gadget: hid: allocate and init otg descriptor by otg capabilities
Date: Thu, 23 Jul 2015 11:37:41 +0800
Message-ID: <1437622667-6735-18-git-send-email-jun.li@freescale.com>
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
 drivers/usb/gadget/legacy/hid.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/gadget/legacy/hid.c b/drivers/usb/gadget/legacy/hid.c
index 2baa572..e4874d3 100644
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
@@ -186,16 +172,30 @@ static int hid_bind(struct usb_composite_dev *cdev)
 	device_desc.iManufacturer = strings_dev[USB_GADGET_MANUFACTURER_IDX].id;
 	device_desc.iProduct = strings_dev[USB_GADGET_PRODUCT_IDX].id;
 
+	if (gadget_is_otg(gadget) && !otg_desc[0]) {
+		struct usb_descriptor_header *usb_desc;
+
+		usb_desc = usb_otg_descriptor_alloc(gadget);
+		if (!usb_desc)
+			goto put;
+		usb_otg_descriptor_init(gadget, usb_desc);
+		otg_desc[0] = usb_desc;
+		otg_desc[1] = NULL;
+	}
+
 	/* register our configuration */
 	status = usb_add_config(cdev, &config_driver, do_config);
 	if (status < 0)
-		goto put;
+		goto free_otg_desc;
 
 	usb_composite_overwrite_options(cdev, &coverwrite);
 	dev_info(&gadget->dev, DRIVER_DESC ", version: " DRIVER_VERSION "\n");
 
 	return 0;
 
+free_otg_desc:
+	kfree(otg_desc[0]);
+	otg_desc[0] = NULL;
 put:
 	list_for_each_entry(m, &hidg_func_list, node) {
 		if (m == n)
@@ -213,6 +213,10 @@ static int hid_unbind(struct usb_composite_dev *cdev)
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
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
