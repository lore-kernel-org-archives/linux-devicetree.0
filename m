From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 07/23] usb: common: add API to update usb otg capabilities by device tree
Date: Thu, 23 Jul 2015 11:37:31 +0800
Message-ID: <1437622667-6735-8-git-send-email-jun.li@freescale.com>
References: <1437622667-6735-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437622667-6735-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Check property of usb hardware to update otg version and disable SRP, HNP
and ADP if its disable flag is present.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/common/common.c | 56 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/of.h      |  7 ++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index b530fd4..9e39286 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -154,6 +154,62 @@ bool of_usb_host_tpl_support(struct device_node *np)
 	return false;
 }
 EXPORT_SYMBOL_GPL(of_usb_host_tpl_support);
+
+/**
+ * of_usb_update_otg_caps - to update usb otg capabilities according to
+ * the passed properties in DT.
+ * @np: Pointer to the given device_node
+ * @otg_caps: Pointer to the target usb_otg_caps to be set
+ *
+ * The function updates the otg capabilities
+ */
+int of_usb_update_otg_caps(struct device_node *np,
+			struct usb_otg_caps *otg_caps)
+{
+	u32 otg_rev;
+
+	if (!otg_caps)
+		return -EINVAL;
+
+	if (!of_property_read_u32(np, "otg-rev", &otg_rev)) {
+		switch (otg_rev) {
+		case 0x0100:
+		case 0x0120:
+		case 0x0130:
+		case 0x0200:
+			/* Choose the lesser one if it's already been set */
+			if (otg_caps->otg_rev)
+				otg_caps->otg_rev = min_t(u16, otg_rev,
+							otg_caps->otg_rev);
+			else
+				otg_caps->otg_rev = otg_rev;
+			break;
+		default:
+			pr_err("%s: unsupported otg-rev: 0x%x\n",
+						np->full_name, otg_rev);
+			return -EINVAL;
+		}
+	} else {
+		/*
+		 * otg-rev is mandatory for otg properties, if not passed
+		 * we set it to be 0 and assume it's a legacy otg device.
+		 * Non-dt platform can set it afterwards.
+		 */
+		otg_caps->otg_rev = 0;
+	}
+
+	if (of_find_property(np, "hnp-disable", NULL))
+		otg_caps->hnp_support = false;
+	if (of_find_property(np, "srp-disable", NULL))
+		otg_caps->srp_support = false;
+	if (of_find_property(np, "adp-disable", NULL) ||
+				(otg_caps->otg_rev < 0x0200))
+		otg_caps->adp_support = false;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_usb_update_otg_caps);
+
 #endif
 
 MODULE_LICENSE("GPL");
diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h
index cfe0528..8c5a818 100644
--- a/include/linux/usb/of.h
+++ b/include/linux/usb/of.h
@@ -15,6 +15,8 @@
 enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np);
 enum usb_device_speed of_usb_get_maximum_speed(struct device_node *np);
 bool of_usb_host_tpl_support(struct device_node *np);
+int of_usb_update_otg_caps(struct device_node *np,
+			struct usb_otg_caps *otg_caps);
 #else
 static inline enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np)
 {
@@ -30,6 +32,11 @@ static inline bool of_usb_host_tpl_support(struct device_node *np)
 {
 	return false;
 }
+static inline int of_usb_update_otg_caps(struct device_node *np,
+				struct usb_otg_caps *otg_caps)
+{
+	return 0;
+}
 #endif
 
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_USB_SUPPORT)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
