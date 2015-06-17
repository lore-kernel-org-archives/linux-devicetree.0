From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v5 13/23] usb: gadget: acm_ms: allocate and init otg descriptor by otg capabilities
Date: Wed, 17 Jun 2015 19:40:20 +0800
Message-ID: <1434541230-15090-14-git-send-email-jun.li@freescale.com>
References: <1434541230-15090-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434541230-15090-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allocate and initialize usb otg descriptor according to gadget otg
capabilities, add it for each usb configurations. If otg capability
is not defined, keep its original otg descriptor unchanged.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/gadget/legacy/acm_ms.c | 44 ++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/legacy/acm_ms.c b/drivers/usb/gadget/legacy/acm_ms.c
index 1194b09..8c840b9 100644
--- a/drivers/usb/gadget/legacy/acm_ms.c
+++ b/drivers/usb/gadget/legacy/acm_ms.c
@@ -58,21 +58,7 @@ static struct usb_device_descriptor device_desc = {
 	/*.bNumConfigurations =	DYNAMIC*/
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
 
 /* string IDs are assigned dynamically */
 static struct usb_string strings_dev[] = {
@@ -126,11 +112,6 @@ static int acm_ms_do_config(struct usb_configuration *c)
 	struct fsg_opts *opts;
 	int	status;
 
-	if (gadget_is_otg(c->cdev->gadget)) {
-		c->descriptors = otg_desc;
-		c->bmAttributes |= USB_CONFIG_ATT_WAKEUP;
-	}
-
 	opts = fsg_opts_from_func_inst(fi_msg);
 
 	f_acm = usb_get_function(f_acm_inst);
@@ -225,10 +206,25 @@ static int acm_ms_bind(struct usb_composite_dev *cdev)
 	device_desc.iManufacturer = strings_dev[USB_GADGET_MANUFACTURER_IDX].id;
 	device_desc.iProduct = strings_dev[USB_GADGET_PRODUCT_IDX].id;
 
+	if (gadget_is_otg(gadget)) {
+		if (!otg_desc[0]) {
+			struct usb_descriptor_header *usb_desc;
+
+			usb_desc = usb_otg_descriptor_alloc(gadget);
+			if (!usb_desc)
+				goto fail_string_ids;
+			usb_otg_descriptor_init(gadget, usb_desc);
+			otg_desc[0] = usb_desc;
+			otg_desc[1] = NULL;
+		}
+		acm_ms_config_driver.descriptors = otg_desc;
+		acm_ms_config_driver.bmAttributes |= USB_CONFIG_ATT_WAKEUP;
+	}
+
 	/* register our configuration */
 	status = usb_add_config(cdev, &acm_ms_config_driver, acm_ms_do_config);
 	if (status < 0)
-		goto fail_string_ids;
+		goto fail_otg_desc;
 
 	usb_composite_overwrite_options(cdev, &coverwrite);
 	dev_info(&gadget->dev, "%s, version: " DRIVER_VERSION "\n",
@@ -236,6 +232,9 @@ static int acm_ms_bind(struct usb_composite_dev *cdev)
 	return 0;
 
 	/* error recovery */
+fail_otg_desc:
+	kfree(otg_desc[0]);
+	otg_desc[0] = NULL;
 fail_string_ids:
 	fsg_common_remove_luns(opts->common);
 fail_set_cdev:
@@ -255,6 +254,9 @@ static int acm_ms_unbind(struct usb_composite_dev *cdev)
 	usb_put_function_instance(fi_msg);
 	usb_put_function(f_acm);
 	usb_put_function_instance(f_acm_inst);
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
