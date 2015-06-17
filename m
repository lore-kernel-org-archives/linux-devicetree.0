From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v4 07/23] usb: common: add API to get usb otg features from device tree
Date: Wed, 17 Jun 2015 13:43:39 +0800
Message-ID: <1434519835-27745-8-git-send-email-jun.li@freescale.com>
References: <1434519835-27745-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434519835-27745-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Check property of usb hardware to get otg version and if SRP, HNP and ADP
are supported.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/common/common.c | 29 +++++++++++++++++++++++++++++
 include/linux/usb/of.h      |  7 +++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index b530fd4..b846172 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -154,6 +154,35 @@ bool of_usb_host_tpl_support(struct device_node *np)
 	return false;
 }
 EXPORT_SYMBOL_GPL(of_usb_host_tpl_support);
+
+/**
+ * of_usb_get_otg_caps - to get usb otg capabilities according to
+ * the passed properties in DT.
+ * @np: Pointer to the given device_node
+ * @otg_caps: Pointer to the target usb_otg_caps to be set
+ *
+ * The function gets and sets the otg capabilities
+ */
+void of_usb_get_otg_caps(struct device_node *np, struct usb_otg_caps *otg_caps)
+{
+	u32 otg_rev;
+
+	if (!otg_caps)
+		return;
+
+	if (!of_property_read_u32(np, "otg-rev", &otg_rev)) {
+		otg_caps->otg_rev = otg_rev;
+		if (!of_find_property(np, "hnp-disable", NULL))
+			otg_caps->hnp_support = true;
+		if (!of_find_property(np, "srp-disable", NULL))
+			otg_caps->hnp_support = true;
+		if (!of_find_property(np, "adp-disable", NULL) &&
+					(otg_caps->otg_rev >= 0x0200))
+			otg_caps->hnp_support = true;
+	}
+}
+EXPORT_SYMBOL_GPL(of_usb_get_otg_caps);
+
 #endif
 
 MODULE_LICENSE("GPL");
diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h
index cfe0528..bbf302b9 100644
--- a/include/linux/usb/of.h
+++ b/include/linux/usb/of.h
@@ -15,6 +15,8 @@
 enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np);
 enum usb_device_speed of_usb_get_maximum_speed(struct device_node *np);
 bool of_usb_host_tpl_support(struct device_node *np);
+void of_usb_get_otg_caps(struct device_node *np,
+			struct usb_otg_caps *otg_caps);
 #else
 static inline enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np)
 {
@@ -30,6 +32,11 @@ static inline bool of_usb_host_tpl_support(struct device_node *np)
 {
 	return false;
 }
+static inline void of_usb_get_otg_caps(struct device_node *np,
+				struct usb_otg_caps *otg_caps)
+{
+
+}
 #endif
 
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_USB_SUPPORT)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
