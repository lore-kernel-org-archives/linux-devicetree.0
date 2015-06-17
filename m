From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v5 15/23] usb: gadget: cdc2: allocate and init otg descriptor by otg capabilities
Date: Wed, 17 Jun 2015 19:40:22 +0800
Message-ID: <1434541230-15090-16-git-send-email-jun.li@freescale.com>
References: <1434541230-15090-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434541230-15090-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allocate and initialize usb otg descriptor according to gadget otg
capabilities, add it for each usb configurations. If otg capability
is not defined, keep its original otg descriptor unchanged.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/gadget/legacy/cdc2.c | 44 +++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/legacy/cdc2.c b/drivers/usb/gadget/legacy/cdc2.c
index afd3e37..531b8e0 100644
--- a/drivers/usb/gadget/legacy/cdc2.c
+++ b/drivers/usb/gadget/legacy/cdc2.c
@@ -60,21 +60,7 @@ static struct usb_device_descriptor device_desc = {
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
@@ -108,11 +94,6 @@ static int cdc_do_config(struct usb_configuration *c)
 {
 	int	status;
 
-	if (gadget_is_otg(c->cdev->gadget)) {
-		c->descriptors = otg_desc;
-		c->bmAttributes |= USB_CONFIG_ATT_WAKEUP;
-	}
-
 	f_ecm = usb_get_function(fi_ecm);
 	if (IS_ERR(f_ecm)) {
 		status = PTR_ERR(f_ecm);
@@ -193,10 +174,25 @@ static int cdc_bind(struct usb_composite_dev *cdev)
 	device_desc.iManufacturer = strings_dev[USB_GADGET_MANUFACTURER_IDX].id;
 	device_desc.iProduct = strings_dev[USB_GADGET_PRODUCT_IDX].id;
 
+	if (gadget_is_otg(gadget)) {
+		if (!otg_desc[0]) {
+			struct usb_descriptor_header *usb_desc;
+
+			usb_desc = usb_otg_descriptor_alloc(gadget);
+			if (!usb_desc)
+				goto fail1;
+			usb_otg_descriptor_init(gadget, usb_desc);
+			otg_desc[0] = usb_desc;
+			otg_desc[1] = NULL;
+		}
+		cdc_config_driver.descriptors = otg_desc;
+		cdc_config_driver.bmAttributes |= USB_CONFIG_ATT_WAKEUP;
+	}
+
 	/* register our configuration */
 	status = usb_add_config(cdev, &cdc_config_driver, cdc_do_config);
 	if (status < 0)
-		goto fail1;
+		goto fail2;
 
 	usb_composite_overwrite_options(cdev, &coverwrite);
 	dev_info(&gadget->dev, "%s, version: " DRIVER_VERSION "\n",
@@ -204,6 +200,9 @@ static int cdc_bind(struct usb_composite_dev *cdev)
 
 	return 0;
 
+fail2:
+	kfree(otg_desc[0]);
+	otg_desc[0] = NULL;
 fail1:
 	usb_put_function_instance(fi_serial);
 fail:
@@ -219,6 +218,9 @@ static int cdc_unbind(struct usb_composite_dev *cdev)
 		usb_put_function(f_ecm);
 	if (!IS_ERR_OR_NULL(fi_ecm))
 		usb_put_function_instance(fi_ecm);
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
