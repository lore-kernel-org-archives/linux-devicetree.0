From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 09/22] usb: gadget: add usb_otg_descriptor_add interface to init usb_otg_descriptor
Date: Tue, 16 Jun 2015 14:51:59 +0800
Message-ID: <1434437532-23678-10-git-send-email-jun.li@freescale.com>
References: <1434437532-23678-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434437532-23678-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allocate usb_otg_descriptor and initialize it according to gadget otg
options, if none of options is not set, keep bmAttributes setting as
current gadget drivers, with this new interface, usb_otg_descriptor can
include bcdOTG if OTG 2.0 or later, and otg features can be decided by
the combination of usb hardware property and driver config.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/gadget/config.c | 39 +++++++++++++++++++++++++++++++++++++++
 include/linux/usb/gadget.h  |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/usb/gadget/config.c b/drivers/usb/gadget/config.c
index 34e12fc..9ebc052 100644
--- a/drivers/usb/gadget/config.c
+++ b/drivers/usb/gadget/config.c
@@ -195,3 +195,42 @@ void usb_free_all_descriptors(struct usb_function *f)
 	usb_free_descriptors(f->ss_descriptors);
 }
 EXPORT_SYMBOL_GPL(usb_free_all_descriptors);
+
+int usb_otg_descriptor_init(struct usb_gadget *gadget,
+		struct usb_descriptor_header *otg_desc)
+{
+	struct usb_otg_descriptor *otg1x_desc;
+	struct usb_otg20_descriptor *otg20_desc;
+	u8 otg_attributes = 0;
+
+	if (!otg_desc)
+		return -EINVAL;
+
+	if (gadget->adp_support || gadget->hnp_support ||
+					gadget->srp_support) {
+		if (gadget->adp_support)
+			otg_attributes |= USB_OTG_ADP;
+		if (gadget->hnp_support)
+			otg_attributes |= USB_OTG_HNP;
+		if (gadget->srp_support)
+			otg_attributes |= USB_OTG_SRP;
+	} else {
+		otg_attributes = USB_OTG_SRP | USB_OTG_HNP;
+	}
+
+	if (gadget->otg_rev >= 0x0200) {
+		otg20_desc = (struct usb_otg20_descriptor *)otg_desc;
+		otg20_desc->bLength = sizeof(struct usb_otg20_descriptor);
+		otg20_desc->bDescriptorType = USB_DT_OTG;
+		otg20_desc->bmAttributes = otg_attributes;
+		otg20_desc->bcdOTG = cpu_to_le16(gadget->otg_rev);
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
index 814cb70..b77730e 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -1013,6 +1013,8 @@ int usb_assign_descriptors(struct usb_function *f,
 		struct usb_descriptor_header **ss);
 void usb_free_all_descriptors(struct usb_function *f);
 
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
