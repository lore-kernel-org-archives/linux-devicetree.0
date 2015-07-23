From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 22/23] usb: gadget: serial: allocate and init otg descriptor by otg capabilities
Date: Thu, 23 Jul 2015 11:37:46 +0800
Message-ID: <1437622667-6735-23-git-send-email-jun.li@freescale.com>
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
 drivers/usb/gadget/legacy/serial.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/gadget/legacy/serial.c b/drivers/usb/gadget/legacy/serial.c
index 8b7528f..9836d16 100644
--- a/drivers/usb/gadget/legacy/serial.c
+++ b/drivers/usb/gadget/legacy/serial.c
@@ -79,20 +79,7 @@ static struct usb_device_descriptor device_desc = {
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
 
 /*-------------------------------------------------------------------------*/
 
@@ -191,6 +178,18 @@ static int gs_bind(struct usb_composite_dev *cdev)
 	serial_config_driver.iConfiguration = status;
 
 	if (gadget_is_otg(cdev->gadget)) {
+		if (!otg_desc[0]) {
+			struct usb_descriptor_header *usb_desc;
+
+			usb_desc = usb_otg_descriptor_alloc(cdev->gadget);
+			if (!usb_desc) {
+				status = -ENOMEM;
+				goto fail;
+			}
+			usb_otg_descriptor_init(cdev->gadget, usb_desc);
+			otg_desc[0] = usb_desc;
+			otg_desc[1] = NULL;
+		}
 		serial_config_driver.descriptors = otg_desc;
 		serial_config_driver.bmAttributes |= USB_CONFIG_ATT_WAKEUP;
 	}
@@ -208,13 +207,15 @@ static int gs_bind(struct usb_composite_dev *cdev)
 				"gser");
 	}
 	if (status < 0)
-		goto fail;
+		goto fail1;
 
 	usb_composite_overwrite_options(cdev, &coverwrite);
 	INFO(cdev, "%s\n", GS_VERSION_NAME);
 
 	return 0;
-
+fail1:
+	kfree(otg_desc[0]);
+	otg_desc[0] = NULL;
 fail:
 	return status;
 }
@@ -227,6 +228,10 @@ static int gs_unbind(struct usb_composite_dev *cdev)
 		usb_put_function(f_serial[i]);
 		usb_put_function_instance(fi_serial[i]);
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
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
