From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 11/23] usb: gadget: configfs: allocate and init otg descriptor by otg capabilities
Date: Thu, 23 Jul 2015 11:37:35 +0800
Message-ID: <1437622667-6735-12-git-send-email-jun.li@freescale.com>
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
composite unbind. If otg capability is not defined, keep its otg
descriptor unchanged.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/gadget/configfs.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 0495c94..c7b62ef 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -41,6 +41,8 @@ int check_user_usb_string(const char *name,
 #define MAX_NAME_LEN	40
 #define MAX_USB_STRING_LANGS 2
 
+static const struct usb_descriptor_header *otg_desc[2];
+
 struct gadget_info {
 	struct config_group group;
 	struct config_group functions_group;
@@ -55,9 +57,6 @@ struct gadget_info {
 	struct list_head available_func;
 
 	const char *udc_name;
-#ifdef CONFIG_USB_OTG
-	struct usb_otg_descriptor otg;
-#endif
 	struct usb_composite_driver composite;
 	struct usb_composite_dev cdev;
 	bool use_os_desc;
@@ -1376,6 +1375,19 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 		memcpy(cdev->qw_sign, gi->qw_sign, OS_STRING_QW_SIGN_LEN);
 	}
 
+	if (gadget_is_otg(gadget) && !otg_desc[0]) {
+		struct usb_descriptor_header *usb_desc;
+
+		usb_desc = usb_otg_descriptor_alloc(gadget);
+		if (!usb_desc) {
+			ret = -ENOMEM;
+			goto err_comp_cleanup;
+		}
+		usb_otg_descriptor_init(gadget, usb_desc);
+		otg_desc[0] = usb_desc;
+		otg_desc[1] = NULL;
+	}
+
 	/* Go through all configs, attach all functions */
 	list_for_each_entry(c, &gi->cdev.configs, list) {
 		struct config_usb_cfg *cfg;
@@ -1383,6 +1395,9 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 		struct usb_function *tmp;
 		struct gadget_config_name *cn;
 
+		if (gadget_is_otg(gadget))
+			c->descriptors = otg_desc;
+
 		cfg = container_of(c, struct config_usb_cfg, c);
 		if (!list_empty(&cfg->string_list)) {
 			i = 0;
@@ -1437,6 +1452,8 @@ static void configfs_composite_unbind(struct usb_gadget *gadget)
 	cdev = get_gadget_data(gadget);
 	gi = container_of(cdev, struct gadget_info, cdev);
 
+	kfree(otg_desc[0]);
+	otg_desc[0] = NULL;
 	purge_configs_funcs(gi);
 	composite_dev_cleanup(cdev);
 	usb_ep_autoconfig_reset(cdev->gadget);
@@ -1510,12 +1527,6 @@ static struct config_group *gadgets_make(
 	if (!gi->composite.gadget_driver.function)
 		goto err;
 
-#ifdef CONFIG_USB_OTG
-	gi->otg.bLength = sizeof(struct usb_otg_descriptor);
-	gi->otg.bDescriptorType = USB_DT_OTG;
-	gi->otg.bmAttributes = USB_OTG_SRP | USB_OTG_HNP;
-#endif
