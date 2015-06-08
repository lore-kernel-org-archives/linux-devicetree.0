From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 20/22] usb: gadget: printer: init usb_otg_descriptor via usb_otg_descriptor_add
Date: Mon, 8 Jun 2015 23:02:15 +0800
Message-ID: <1433775737-9816-21-git-send-email-jun.li@freescale.com>
References: <1433775737-9816-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433775737-9816-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use usb_otg_descriptor_add to allocate and initialize usb_otg_descriptor,
free it while composite unbind.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/gadget/legacy/printer.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/legacy/printer.c b/drivers/usb/gadget/legacy/printer.c
index 1ce7df1..4611040 100644
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
 
@@ -136,7 +127,13 @@ static int printer_do_config(struct usb_configuration *c)
 	usb_gadget_set_selfpowered(gadget);
 
 	if (gadget_is_otg(gadget)) {
-		otg_descriptor.bmAttributes |= USB_OTG_HNP;
+		if (!otg_desc[0]) {
+			otg_desc[0] = (struct usb_descriptor_header *)
+				usb_otg_descriptor_add(c->cdev->gadget);
+			if (!otg_desc[0])
+				return -ENOMEM;
+			otg_desc[1] = NULL;
+		}
 		printer_cfg_driver.descriptors = otg_desc;
 		printer_cfg_driver.bmAttributes |= USB_CONFIG_ATT_WAKEUP;
 	}
@@ -196,6 +193,9 @@ static int printer_unbind(struct usb_composite_dev *cdev)
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
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
