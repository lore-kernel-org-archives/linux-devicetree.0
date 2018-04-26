Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v2 3/6] usb: common: roles: add a new API to find the graph
Date: Thu, 26 Apr 2018 20:26:43 +0900
Message-Id: <1524742006-17984-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524742006-17984-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524742006-17984-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds a new API "usb_role_switch_get_by_graph()" to find
device connection by using graph.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/common/roles.c | 30 ++++++++++++++++++++++++++++++
 include/linux/usb/role.h   |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/usb/common/roles.c b/drivers/usb/common/roles.c
index 15cc76e..9fa26c1 100644
--- a/drivers/usb/common/roles.c
+++ b/drivers/usb/common/roles.c
@@ -114,6 +114,36 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_get);
 
+static int by_graph_match(struct device *dev, void *parent)
+{
+	return dev->parent == parent;
+}
+
+/**
+ * usb_role_switch_get_by_graph - Find USB role switch linked with the caller
+ * @dev: The caller device
+ * @port: identifier of the @dev port node
+ * @endpoint: identifier of the @dev endpoint node
+ *
+ * Finds and returns role switch linked with @dev, port and endpoint.
+ * The reference count for the found switch is incremented.
+ */
+struct usb_role_switch *usb_role_switch_get_by_graph(struct device *dev,
+						     u32 port, u32 endpoint)
+{
+	struct device *conn;
+	struct device *sw;
+
+	conn = device_connection_find_by_graph(dev, port, endpoint);
+	if (IS_ERR_OR_NULL(conn))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	sw = device_find_child(conn, conn, by_graph_match);
+
+	return !IS_ERR(sw) ? to_role_switch(sw) : ERR_PTR(-EPROBE_DEFER);
+}
+EXPORT_SYMBOL_GPL(usb_role_switch_get_by_graph);
+
 /**
  * usb_role_switch_put - Release handle to a switch
  * @sw: USB Role Switch
diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
index edc51be..6573fdd 100644
--- a/include/linux/usb/role.h
+++ b/include/linux/usb/role.h
@@ -43,6 +43,8 @@ struct usb_role_switch_desc {
 int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role);
 enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw);
 struct usb_role_switch *usb_role_switch_get(struct device *dev);
+struct usb_role_switch *usb_role_switch_get_by_graph(struct device *dev,
+						     u32 port, u32 endpoint);
 void usb_role_switch_put(struct usb_role_switch *sw);
 
 struct usb_role_switch *
-- 
1.9.1
