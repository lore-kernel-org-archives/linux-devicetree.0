From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 01/23] usb: add usb_otg20_descriptor for OTG 2.0 and above
Date: Thu, 23 Jul 2015 11:37:25 +0800
Message-ID: <1437622667-6735-2-git-send-email-jun.li@freescale.com>
References: <1437622667-6735-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437622667-6735-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

OTG 2.0 introduces bcdOTG in otg descriptor to identify the OTG and EH
supplement release number with which the OTG device is compliant, this
patch adds structure usb_otg20_descriptor for OTG 2.0 and above.

Signed-off-by: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
---
 include/uapi/linux/usb/ch9.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index aa33fd1..aec6899 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -674,6 +674,17 @@ struct usb_otg_descriptor {
 	__u8  bmAttributes;	/* support for HNP, SRP, etc */
 } __attribute__ ((packed));
 
+/* USB_DT_OTG (from OTG 2.0 supplement) */
+struct usb_otg20_descriptor {
+	__u8  bLength;
+	__u8  bDescriptorType;
+
+	__u8  bmAttributes;	/* support for HNP, SRP and ADP, etc */
+	__le16 bcdOTG;		/* OTG and EH supplement release number
+				 * in binary-coded decimal(i.e. 2.0 is 0200H)
+				 */
+} __attribute__ ((packed));
+
 /* from usb_otg_descriptor.bmAttributes */
 #define USB_OTG_SRP		(1 << 0)
 #define USB_OTG_HNP		(1 << 1)	/* swap host/device roles */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
