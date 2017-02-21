From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/2] usb: of: add functions to bind a companion controller
Date: Tue, 21 Feb 2017 19:59:47 +0900
Message-ID: <1487674788-12599-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1487674788-12599-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1487674788-12599-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: stern@rowland.harvard.edu, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

EHCI controllers will have a companion controller. However, on platform
bus, there was difficult to bind them in previous code. So, this
patch adds helper functions to bind them using a "companion" property.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/generic.txt |  1 +
 drivers/usb/core/of.c                             | 23 +++++++++++++++++++++++
 include/linux/usb/of.h                            |  5 +++++
 3 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
index bfadeb1..0a74ab8 100644
--- a/Documentation/devicetree/bindings/usb/generic.txt
+++ b/Documentation/devicetree/bindings/usb/generic.txt
@@ -22,6 +22,7 @@ Optional properties:
 			property is used if any real OTG features(HNP/SRP/ADP)
 			is enabled, if ADP is required, otg-rev should be
 			0x0200 or above.
+ - companion: phandle of a companion
  - hnp-disable: tells OTG controllers we want to disable OTG HNP, normally HNP
 			is the basic function of real OTG except you want it
 			to be a srp-capable only B device.
diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
index 3de4f88..d787f19 100644
--- a/drivers/usb/core/of.c
+++ b/drivers/usb/core/of.c
@@ -18,6 +18,7 @@
  */
 
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/usb/of.h>
 
 /**
@@ -46,3 +47,25 @@ struct device_node *usb_of_get_child_node(struct device_node *parent,
 }
 EXPORT_SYMBOL_GPL(usb_of_get_child_node);
 
+/**
+ * usb_of_get_companion_dev - Find the companion device
+ * @dev: the device pointer to find a companion
+ *
+ * Find the companion device from platform bus.
+ *
+ * Return: On success, a pointer to the companion device, %NULL on failure.
+ */
+struct device *usb_of_get_companion_dev(struct device *dev)
+{
+	struct device_node *node;
+	struct platform_device *pdev = NULL;
+
+	node = of_parse_phandle(dev->of_node, "companion", 0);
+	if (node)
+		pdev = of_find_device_by_node(node);
+
+	of_node_put(node);
+
+	return pdev ? &pdev->dev : NULL;
+}
+EXPORT_SYMBOL_GPL(usb_of_get_companion_dev);
diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h
index 5ff9032..4031f47 100644
--- a/include/linux/usb/of.h
+++ b/include/linux/usb/of.h
@@ -18,6 +18,7 @@ int of_usb_update_otg_caps(struct device_node *np,
 			struct usb_otg_caps *otg_caps);
 struct device_node *usb_of_get_child_node(struct device_node *parent,
 			int portnum);
+struct device *usb_of_get_companion_dev(struct device *dev);
 #else
 static inline enum usb_dr_mode
 of_usb_get_dr_mode_by_phy(struct device_node *np, int arg0)
@@ -38,6 +39,10 @@ static inline int of_usb_update_otg_caps(struct device_node *np,
 {
 	return NULL;
 }
+static inline struct device *usb_of_get_companion_dev(struct device *dev)
+{
+	return NULL;
+}
 #endif
 
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_USB_SUPPORT)
-- 
1.9.1
