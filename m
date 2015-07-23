From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 16/23] usb: gadget: g_ffs: allocate and init otg descriptor by otg capabilities
Date: Thu, 23 Jul 2015 11:37:40 +0800
Message-ID: <1437622667-6735-17-git-send-email-jun.li@freescale.com>
References: <1437622667-6735-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437622667-6735-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Allocate and initialize usb otg descriptor according to gadget otg
capabilities, add it for each usb configurations. If otg capability
is not defined, keep its original otg descriptor unchanged.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/gadget/legacy/g_ffs.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/legacy/g_ffs.c b/drivers/usb/gadget/legacy/g_ffs.c
index e821931..320a81b 100644
--- a/drivers/usb/gadget/legacy/g_ffs.c
+++ b/drivers/usb/gadget/legacy/g_ffs.c
@@ -88,21 +88,7 @@ MODULE_PARM_DESC(bDeviceProtocol, "USB Device protocol");
 module_param_array_named(functions, func_names, charp, &func_num, 0);
 MODULE_PARM_DESC(functions, "USB Functions list");
 
-static const struct usb_descriptor_header *gfs_otg_desc[] = {
-	(const struct usb_descriptor_header *)
-	&(const struct usb_otg_descriptor) {
-		.bLength		= sizeof(struct usb_otg_descriptor),
-		.bDescriptorType	= USB_DT_OTG,
-
-		/*
-		 * REVISIT SRP-only hardware is possible, although
-		 * it would not be called "OTG" ...
-		 */
-		.bmAttributes		= USB_OTG_SRP | USB_OTG_HNP,
-	},
-
-	NULL
-};
+static const struct usb_descriptor_header *gfs_otg_desc[2];
 
 /* String IDs are assigned dynamically */
 static struct usb_string gfs_strings[] = {
@@ -412,6 +398,17 @@ static int gfs_bind(struct usb_composite_dev *cdev)
 		goto error_rndis;
 	gfs_dev_desc.iProduct = gfs_strings[USB_GADGET_PRODUCT_IDX].id;
 
+	if (gadget_is_otg(cdev->gadget) && !gfs_otg_desc[0]) {
+		struct usb_descriptor_header *usb_desc;
+
+		usb_desc = usb_otg_descriptor_alloc(cdev->gadget);
+		if (!usb_desc)
+			goto error_rndis;
+		usb_otg_descriptor_init(cdev->gadget, usb_desc);
+		gfs_otg_desc[0] = usb_desc;
+		gfs_otg_desc[1] = NULL;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(gfs_configurations); ++i) {
 		struct gfs_configuration *c = gfs_configurations + i;
 		int sid = USB_GADGET_FIRST_AVAIL_IDX + i;
@@ -432,6 +429,8 @@ static int gfs_bind(struct usb_composite_dev *cdev)
 
 /* TODO */
 error_unbind:
+	kfree(gfs_otg_desc[0]);
+	gfs_otg_desc[0] = NULL;
 error_rndis:
 #ifdef CONFIG_USB_FUNCTIONFS_RNDIS
 	usb_put_function_instance(fi_rndis);
@@ -473,6 +472,9 @@ static int gfs_unbind(struct usb_composite_dev *cdev)
 	for (i = 0; i < N_CONF * func_num; ++i)
 		usb_put_function(*(f_ffs[0] + i));
 
+	kfree(gfs_otg_desc[0]);
+	gfs_otg_desc[0] = NULL;
+
 	return 0;
 }
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
