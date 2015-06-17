From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v5 18/23] usb: gadget: mass_storage: allocate and init otg descriptor by otg capabilities
Date: Wed, 17 Jun 2015 19:40:25 +0800
Message-ID: <1434541230-15090-19-git-send-email-jun.li@freescale.com>
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
 drivers/usb/gadget/legacy/mass_storage.c | 44 +++++++++++++++++---------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/legacy/mass_storage.c b/drivers/usb/gadget/legacy/mass_storage.c
index e7bfb08..42b4666 100644
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
@@ -135,11 +121,6 @@ static int msg_do_config(struct usb_configuration *c)
 	struct fsg_opts *opts;
 	int ret;
 
-	if (gadget_is_otg(c->cdev->gadget)) {
-		c->descriptors = otg_desc;
-		c->bmAttributes |= USB_CONFIG_ATT_WAKEUP;
-	}
-
 	opts = fsg_opts_from_func_inst(fi_msg);
 
 	f_msg = usb_get_function(fi_msg);
@@ -214,9 +195,24 @@ static int msg_bind(struct usb_composite_dev *cdev)
 		goto fail_string_ids;
 	msg_device_desc.iProduct = strings_dev[USB_GADGET_PRODUCT_IDX].id;
 
+	if (gadget_is_otg(cdev->gadget)) {
+		if (!otg_desc[0]) {
+			struct usb_descriptor_header *usb_desc;
+
+			usb_desc = usb_otg_descriptor_alloc(cdev->gadget);
+			if (!usb_desc)
+				goto fail_string_ids;
+			usb_otg_descriptor_init(cdev->gadget, usb_desc);
+			otg_desc[0] = usb_desc;
+			otg_desc[1] = NULL;
+		}
+		msg_config_driver.descriptors = otg_desc;
+		msg_config_driver.bmAttributes |= USB_CONFIG_ATT_WAKEUP;
+	}
+
 	status = usb_add_config(cdev, &msg_config_driver, msg_do_config);
 	if (status < 0)
-		goto fail_string_ids;
+		goto fail_otg_desc;
 
 	usb_composite_overwrite_options(cdev, &coverwrite);
 	dev_info(&cdev->gadget->dev,
@@ -224,6 +220,9 @@ static int msg_bind(struct usb_composite_dev *cdev)
 	set_bit(0, &msg_registered);
 	return 0;
 
+fail_otg_desc:
+	kfree(otg_desc[0]);
+	otg_desc[0] = NULL;
 fail_string_ids:
 	fsg_common_remove_luns(opts->common);
 fail_set_cdev:
@@ -243,6 +242,9 @@ static int msg_unbind(struct usb_composite_dev *cdev)
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
