From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 12/23] usb: gadget: ether: allocate and init otg descriptor by otg capabilities
Date: Thu, 23 Jul 2015 11:37:36 +0800
Message-ID: <1437622667-6735-13-git-send-email-jun.li@freescale.com>
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
capabilities, add it for each usb configurations, free it while
ether unbind. If otg capability is not defined, keep its otg
descriptor unchanged.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/gadget/legacy/ether.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/gadget/legacy/ether.c b/drivers/usb/gadget/legacy/ether.c
index a3323dc..31e9160 100644
--- a/drivers/usb/gadget/legacy/ether.c
+++ b/drivers/usb/gadget/legacy/ether.c
@@ -171,20 +171,7 @@ static struct usb_device_descriptor device_desc = {
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
 
 static struct usb_string strings_dev[] = {
 	[USB_GADGET_MANUFACTURER_IDX].s = "",
@@ -416,17 +403,28 @@ static int eth_bind(struct usb_composite_dev *cdev)
 	device_desc.iManufacturer = strings_dev[USB_GADGET_MANUFACTURER_IDX].id;
 	device_desc.iProduct = strings_dev[USB_GADGET_PRODUCT_IDX].id;
 
+	if (gadget_is_otg(gadget) && !otg_desc[0]) {
+		struct usb_descriptor_header *usb_desc;
+
+		usb_desc = usb_otg_descriptor_alloc(gadget);
+		if (!usb_desc)
+			goto fail1;
+		usb_otg_descriptor_init(gadget, usb_desc);
+		otg_desc[0] = usb_desc;
+		otg_desc[1] = NULL;
+	}
+
 	/* register our configuration(s); RNDIS first, if it's used */
 	if (has_rndis()) {
 		status = usb_add_config(cdev, &rndis_config_driver,
 				rndis_do_config);
 		if (status < 0)
-			goto fail1;
+			goto fail2;
 	}
 
 	status = usb_add_config(cdev, &eth_config_driver, eth_do_config);
 	if (status < 0)
-		goto fail1;
+		goto fail2;
 
 	usb_composite_overwrite_options(cdev, &coverwrite);
 	dev_info(&gadget->dev, "%s, version: " DRIVER_VERSION "\n",
@@ -434,6 +432,9 @@ static int eth_bind(struct usb_composite_dev *cdev)
 
 	return 0;
 
+fail2:
+	kfree(otg_desc[0]);
+	otg_desc[0] = NULL;
 fail1:
 	if (has_rndis())
 		usb_put_function_instance(fi_rndis);
@@ -463,6 +464,9 @@ static int eth_unbind(struct usb_composite_dev *cdev)
 		usb_put_function(f_geth);
 		usb_put_function_instance(fi_geth);
 	}
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
