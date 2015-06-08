From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 15/22] usb: gadget: g_ffs: init usb_otg_descriptor via usb_otg_descriptor_add
Date: Mon, 8 Jun 2015 23:02:10 +0800
Message-ID: <1433775737-9816-16-git-send-email-jun.li@freescale.com>
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
 drivers/usb/gadget/legacy/g_ffs.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/legacy/g_ffs.c b/drivers/usb/gadget/legacy/g_ffs.c
index 7b9ef7e..38e4452 100644
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
@@ -471,6 +457,9 @@ static int gfs_unbind(struct usb_composite_dev *cdev)
 	for (i = 0; i < N_CONF * func_num; ++i)
 		usb_put_function(*(f_ffs[0] + i));
 
+	kfree(gfs_otg_desc[0]);
+	gfs_otg_desc[0] = NULL;
+
 	return 0;
 }
 
@@ -489,6 +478,13 @@ static int gfs_do_config(struct usb_configuration *c)
 		return -ENODEV;
 
 	if (gadget_is_otg(c->cdev->gadget)) {
+		if (!gfs_otg_desc[0]) {
+			gfs_otg_desc[0] = (struct usb_descriptor_header *)
+					usb_otg_descriptor_add(c->cdev->gadget);
+			if (!gfs_otg_desc[0])
+				return -ENOMEM;
+			gfs_otg_desc[1] = NULL;
+		}
 		c->descriptors = gfs_otg_desc;
 		c->bmAttributes |= USB_CONFIG_ATT_WAKEUP;
 	}
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
