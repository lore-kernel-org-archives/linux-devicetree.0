From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 4/6] usb: roles: add API to get usb_role_switch by node
Date: Fri, 15 Mar 2019 15:38:31 +0800
Message-ID: <1552635513-2378-5-git-send-email-chunfeng.yun@mediatek.com>
References: <1552635513-2378-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552635513-2378-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add usb_role_switch_get_by_node() to make easier to get
usb_role_switch by node which register it.
It's useful when there is not device_connection registered
between two drivers and only knows the node which register
usb_role_switch.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/roles/class.c | 30 ++++++++++++++++++++++++++++++
 include/linux/usb/role.h  |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 99116af07f1d..284b19856dc4 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -11,6 +11,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 
 static struct class *role_class;
@@ -121,6 +122,35 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_get);
 
+static int __switch_match_node(struct device *dev, const void *node)
+{
+	return dev->parent->of_node == (const struct device_node *)node;
+}
+
+/**
+ * usb_role_switch_get_by_node - Find USB role switch by it's parent node
+ * @node: The node that register USB role switch
+ *
+ * Finds and returns role switch registered by @node. The reference count
+ * for the found switch is incremented.
+ */
+struct usb_role_switch *usb_role_switch_get_by_node(struct device_node *node)
+{
+	struct usb_role_switch *sw;
+	struct device *dev;
+
+	dev = class_find_device(role_class, NULL, node,
+				__switch_match_node);
+	if (!dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	sw = to_role_switch(dev);
+	WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
+
+	return sw;
+}
+EXPORT_SYMBOL_GPL(usb_role_switch_get_by_node);
+
 /**
  * usb_role_switch_put - Release handle to a switch
  * @sw: USB Role Switch
diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
index edc51be4a77c..056498b83dee 100644
--- a/include/linux/usb/role.h
+++ b/include/linux/usb/role.h
@@ -42,6 +42,7 @@ struct usb_role_switch_desc {
 
 int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role);
 enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw);
+struct usb_role_switch *usb_role_switch_get_by_node(struct device_node *node);
 struct usb_role_switch *usb_role_switch_get(struct device *dev);
 void usb_role_switch_put(struct usb_role_switch *sw);
 
-- 
2.20.1
