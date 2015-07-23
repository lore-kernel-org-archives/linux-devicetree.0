From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 10/23] usb: gadget: add usb otg descriptor allocate and init interface
Date: Thu, 23 Jul 2015 11:37:34 +0800
Message-ID: <1437622667-6735-11-git-send-email-jun.li@freescale.com>
References: <1437622667-6735-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437622667-6735-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Allocate usb otg descriptor and initialize it according to gadget's otg
capabilities, if usb_otg_caps is not set, keep settings as current gadget
drivers. With this 2 new interfaces, gadget can use usb_otg_descriptor
for OTG 1.x, and usb_otg20_descriptor for OTG 2.0 or above, and otg
features can be decided by the combination of usb hardware property
and driver config.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/gadget/config.c | 56 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/gadget.h  |  4 ++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/usb/gadget/config.c b/drivers/usb/gadget/config.c
index 34e12fc..0fafa7a 100644
--- a/drivers/usb/gadget/config.c
+++ b/drivers/usb/gadget/config.c
@@ -20,6 +20,7 @@
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 #include <linux/usb/composite.h>
+#include <linux/usb/otg.h>
 
 /**
  * usb_descriptor_fillbuf - fill buffer with descriptors
@@ -195,3 +196,58 @@ void usb_free_all_descriptors(struct usb_function *f)
 	usb_free_descriptors(f->ss_descriptors);
 }
 EXPORT_SYMBOL_GPL(usb_free_all_descriptors);
+
+struct usb_descriptor_header *usb_otg_descriptor_alloc(
+				struct usb_gadget *gadget)
+{
+	struct usb_descriptor_header *otg_desc;
+	unsigned length = 0;
+
+	if (gadget->otg_caps && (gadget->otg_caps->otg_rev >= 0x0200))
+		length = sizeof(struct usb_otg20_descriptor);
+	else
+		length = sizeof(struct usb_otg_descriptor);
+
+	otg_desc = kzalloc(length, GFP_KERNEL);
+	return otg_desc;
+}
+EXPORT_SYMBOL_GPL(usb_otg_descriptor_alloc);
+
+int usb_otg_descriptor_init(struct usb_gadget *gadget,
+		struct usb_descriptor_header *otg_desc)
+{
+	struct usb_otg_descriptor *otg1x_desc;
+	struct usb_otg20_descriptor *otg20_desc;
+	struct usb_otg_caps *otg_caps = gadget->otg_caps;
+	u8 otg_attributes = 0;
+
+	if (!otg_desc)
+		return -EINVAL;
+
+	if (otg_caps && otg_caps->otg_rev) {
+		if (otg_caps->hnp_support)
+			otg_attributes |= USB_OTG_HNP;
+		if (otg_caps->srp_support)
+			otg_attributes |= USB_OTG_SRP;
+		if (otg_caps->adp_support && (otg_caps->otg_rev >= 0x0200))
+			otg_attributes |= USB_OTG_ADP;
+	} else {
+		otg_attributes = USB_OTG_SRP | USB_OTG_HNP;
+	}
+
+	if (otg_caps && (otg_caps->otg_rev >= 0x0200)) {
+		otg20_desc = (struct usb_otg20_descriptor *)otg_desc;
+		otg20_desc->bLength = sizeof(struct usb_otg20_descriptor);
+		otg20_desc->bDescriptorType = USB_DT_OTG;
+		otg20_desc->bmAttributes = otg_attributes;
+		otg20_desc->bcdOTG = cpu_to_le16(otg_caps->otg_rev);
+	} else {
+		otg1x_desc = (struct usb_otg_descriptor *)otg_desc;
+		otg1x_desc->bLength = sizeof(struct usb_otg_descriptor);
+		otg1x_desc->bDescriptorType = USB_DT_OTG;
+		otg1x_desc->bmAttributes = otg_attributes;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_otg_descriptor_init);
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 6b39087..5f65bd2 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -1004,6 +1004,10 @@ int usb_assign_descriptors(struct usb_function *f,
 		struct usb_descriptor_header **ss);
 void usb_free_all_descriptors(struct usb_function *f);
 
+struct usb_descriptor_header *usb_otg_descriptor_alloc(
+				struct usb_gadget *gadget);
+int usb_otg_descriptor_init(struct usb_gadget *gadget,
+		struct usb_descriptor_header *otg_desc);
 /*-------------------------------------------------------------------------*/
 
 /* utility to simplify map/unmap of usb_requests to/from DMA */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
