From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 03/23] usb: otg: add usb_otg_caps structure for otg capabilities
Date: Thu, 23 Jul 2015 11:37:27 +0800
Message-ID: <1437622667-6735-4-git-send-email-jun.li@freescale.com>
References: <1437622667-6735-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437622667-6735-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds a structure usb_otg_caps to cover all otg related
capabilities of the device, including otg revision, and if hnp/srp/adp
is supported.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
---
 include/linux/usb/otg.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
index 52661c5..bd1dcf8 100644
--- a/include/linux/usb/otg.h
+++ b/include/linux/usb/otg.h
@@ -41,6 +41,21 @@ struct usb_otg {
 
 };
 
+/**
+ * struct usb_otg_caps - describes the otg capabilities of the device
+ * @otg_rev: The OTG revision number the device is compliant with, it's
+ *		in binary-coded decimal (i.e. 2.0 is 0200H).
+ * @hnp_support: Indicates if the device supports HNP.
+ * @srp_support: Indicates if the device supports SRP.
+ * @adp_support: Indicates if the device supports ADP.
+ */
+struct usb_otg_caps {
+	u16 otg_rev;
+	bool hnp_support;
+	bool srp_support;
+	bool adp_support;
+};
+
 extern const char *usb_otg_state_string(enum usb_otg_state state);
 
 /* Context: can sleep */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
