From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 21/23] usb: gadget: printer: allocate and init otg descriptor by otg capabilities
Date: Thu, 23 Jul 2015 11:37:45 +0800
Message-ID: <1437622667-6735-22-git-send-email-jun.li@freescale.com>
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
 drivers/usb/gadget/legacy/printer.c | 49 +++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/gadget/legacy/printer.c b/drivers/usb/gadget/legacy/printer.c
index 1ce7df1..0c1fc06 100644
--- a/drivers/usb/gadget/legacy/printer.c
+++ b/drivers/usb/gadget/legacy/printer.c
@@ -82,16 +82,7 @@ static struct usb_device_descriptor device_desc = {
 	.bNumConfigurations =	1
 };
 
-static struct usb_otg_descriptor otg_descriptor = {
-	.bLength =              sizeof otg_descriptor,
-	.bDescriptorType =      USB_DT_OTG,
-	.bmAttributes =         USB_OTG_SRP,
-};
-
-static const struct usb_descriptor_header *otg_desc[] = {
-	(struct usb_descriptor_header *) &otg_descriptor,
-	NULL,
-};
+static const struct usb_descriptor_header *otg_desc[2];
 
 /*-------------------------------------------------------------------------*/
 
@@ -136,7 +127,6 @@ static int printer_do_config(struct usb_configuration *c)
 	usb_gadget_set_selfpowered(gadget);
 
 	if (gadget_is_otg(gadget)) {
-		otg_descriptor.bmAttributes |= USB_OTG_HNP;
 		printer_cfg_driver.descriptors = otg_desc;
 		printer_cfg_driver.bmAttributes |= USB_CONFIG_ATT_WAKEUP;
 	}
@@ -174,21 +164,39 @@ static int printer_bind(struct usb_composite_dev *cdev)
 	opts->q_len = QLEN;
 
 	ret = usb_string_ids_tab(cdev, strings);
-	if (ret < 0) {
-		usb_put_function_instance(fi_printer);
-		return ret;
-	}
+	if (ret < 0)
+		goto fail_put_func_inst;
+
 	device_desc.iManufacturer = strings[USB_GADGET_MANUFACTURER_IDX].id;
 	device_desc.iProduct = strings[USB_GADGET_PRODUCT_IDX].id;
 	device_desc.iSerialNumber = strings[USB_GADGET_SERIAL_IDX].id;
 
-	ret = usb_add_config(cdev, &printer_cfg_driver, printer_do_config);
-	if (ret) {
-		usb_put_function_instance(fi_printer);
-		return ret;
+	if (gadget_is_otg(cdev->gadget) && !otg_desc[0]) {
+		struct usb_descriptor_header *usb_desc;
+
+		usb_desc = usb_otg_descriptor_alloc(cdev->gadget);
+		if (!usb_desc) {
+			ret = -ENOMEM;
+			goto fail_put_func_inst;
+		}
+		usb_otg_descriptor_init(cdev->gadget, usb_desc);
+		otg_desc[0] = usb_desc;
+		otg_desc[1] = NULL;
 	}
+
+	ret = usb_add_config(cdev, &printer_cfg_driver, printer_do_config);
+	if (ret)
+		goto fail_free_otg_desc;
+
 	usb_composite_overwrite_options(cdev, &coverwrite);
 	return ret;
+
+fail_free_otg_desc:
+	kfree(otg_desc[0]);
+	otg_desc[0] = NULL;
+fail_put_func_inst:
+	usb_put_function_instance(fi_printer);
+	return ret;
 }
 
 static int printer_unbind(struct usb_composite_dev *cdev)
@@ -196,6 +204,9 @@ static int printer_unbind(struct usb_composite_dev *cdev)
 	usb_put_function(f_printer);
 	usb_put_function_instance(fi_printer);
 
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
