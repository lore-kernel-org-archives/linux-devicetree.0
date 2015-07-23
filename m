From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 05/23] usb: gadget: composite: add USB_DT_OTG request handling
Date: Thu, 23 Jul 2015 11:37:29 +0800
Message-ID: <1437622667-6735-6-git-send-email-jun.li@freescale.com>
References: <1437622667-6735-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437622667-6735-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Copy usb_otg_descriptor from config's descriptor if host requests
USB_DT_OTG.

Signed-off-by: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/gadget/composite.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 4e3447b..2c1c6eb 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -19,6 +19,7 @@
 #include <linux/utsname.h>
 
 #include <linux/usb/composite.h>
+#include <linux/usb/otg.h>
 #include <asm/unaligned.h>
 
 #include "u_os_desc.h"
@@ -1534,6 +1535,32 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 				value = min(w_length, (u16) value);
 			}
 			break;
+		case USB_DT_OTG:
+			if (gadget_is_otg(gadget)) {
+				struct usb_configuration *config;
+				int otg_desc_len = 0;
+
+				if (cdev->config)
+					config = cdev->config;
+				else
+					config = list_first_entry(
+							&cdev->configs,
+						struct usb_configuration, list);
+				if (!config)
+					goto done;
+
+				if (gadget->otg_caps &&
+					(gadget->otg_caps->otg_rev >= 0x0200))
+					otg_desc_len += sizeof(
+						struct usb_otg20_descriptor);
+				else
+					otg_desc_len += sizeof(
+						struct usb_otg_descriptor);
+
+				value = min_t(int, w_length, otg_desc_len);
+				memcpy(req->buf, config->descriptors[0], value);
+			}
+			break;
 		}
 		break;
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
