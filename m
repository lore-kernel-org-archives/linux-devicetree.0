From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 06/22] usb: common: add API to get usb otg features from device tree
Date: Mon, 8 Jun 2015 23:02:01 +0800
Message-ID: <1433775737-9816-7-git-send-email-jun.li@freescale.com>
References: <1433775737-9816-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433775737-9816-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Check property of usb hardware to get otg version and if SRP, HNP and ADP
are supported.

Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/common/common.c | 64 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/of.h      | 20 ++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index b530fd4..7b0594b 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -154,6 +154,70 @@ bool of_usb_host_tpl_support(struct device_node *np)
 	return false;
 }
 EXPORT_SYMBOL_GPL(of_usb_host_tpl_support);
+
+/**
+ * of_usb_otg_srp_support -  to get if otg srp is supported by the otg controller
+ * @np: Pointer to the given device_node
+ *
+ * The function gets if the otg port supports SRP
+ */
+bool of_usb_otg_srp_support(struct device_node *np)
+{
+	if (of_find_property(np, "srp-support", NULL))
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(of_usb_otg_srp_support);
+
+/**
+ * of_usb_otg_hnp_support -  to get if otg hnp is supported by the otg controller
+ * @np: Pointer to the given device_node
+ *
+ * The function gets if the otg port supports HNP
+ */
+bool of_usb_otg_hnp_support(struct device_node *np)
+{
+	if (of_find_property(np, "hnp-support", NULL))
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(of_usb_otg_hnp_support);
+
+/**
+ * of_usb_otg_adp_support -  to get if otg adp is supported by the otg controller
+ * @np: Pointer to the given device_node
+ *
+ * The function gets if the otg port supports ADP
+ */
+bool of_usb_otg_adp_support(struct device_node *np)
+{
+	if (of_find_property(np, "adp-support", NULL))
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(of_usb_otg_adp_support);
+
+/**
+ * of_usb_otg_rev_number -  to get the otg release number the device is
+ * compliant with.
+ * @np: Pointer to the given device_node
+ *
+ * The function gets OTG and EH supplement release number in binary-coded
+ * decimal (i.e. 2.0 is 0200H).
+ */
+int of_usb_otg_rev_number(struct device_node *np)
+{
+	u32 otg_rev;
+
+	if (!of_property_read_u32(np, "otg-rev", &otg_rev))
+		return otg_rev;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_usb_otg_rev_number);
 #endif
 
 MODULE_LICENSE("GPL");
diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h
index cfe0528..9a3e82a 100644
--- a/include/linux/usb/of.h
+++ b/include/linux/usb/of.h
@@ -15,6 +15,10 @@
 enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np);
 enum usb_device_speed of_usb_get_maximum_speed(struct device_node *np);
 bool of_usb_host_tpl_support(struct device_node *np);
+bool of_usb_otg_srp_support(struct device_node *np);
+bool of_usb_otg_hnp_support(struct device_node *np);
+bool of_usb_otg_adp_support(struct device_node *np);
+int of_usb_otg_rev_number(struct device_node *np);
 #else
 static inline enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np)
 {
@@ -30,6 +34,22 @@ static inline bool of_usb_host_tpl_support(struct device_node *np)
 {
 	return false;
 }
+static inline bool of_usb_otg_srp_support(struct device_node *np)
+{
+	return false;
+}
+static inline bool of_usb_otg_hnp_support(struct device_node *np)
+{
+	return false;
+}
+static inline bool of_usb_otg_adp_support(struct device_node *np)
+{
+	return false;
+}
+static inline int of_usb_otg_rev_number(struct device_node *np)
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
