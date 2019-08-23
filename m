From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH next v10 08/11] usb: roles: get usb-role-switch from parent
Date: Fri, 23 Aug 2019 15:57:18 +0800
Message-ID: <1566547041-20804-9-git-send-email-chunfeng.yun@mediatek.com>
References: <1566547041-20804-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566547041-20804-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: devicetree@vger.kernel.org

when the USB host controller is the parent of the connector,
usually type-B, sometimes don't need the graph, so we should
check whether it's parent registers usb-role-switch or not
firstly, and get it if exists.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v10: no changes

v9:
  1. replace signed-off-by by suggested-by Heikki
  2. use class_find_device_by_fwnode()

v8: no changes
v7:
  add signed-off-by Chunfeng

v6:
  new patch
---
 drivers/usb/roles/class.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 2abb6fe384ca..94b4e7db2b94 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -102,6 +102,19 @@ static void *usb_role_switch_match(struct device_connection *con, int ep,
 	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
 }
 
+static struct usb_role_switch *
+usb_role_switch_is_parent(struct fwnode_handle *fwnode)
+{
+	struct fwnode_handle *parent = fwnode_get_parent(fwnode);
+	struct device *dev;
+
+	if (!parent || !fwnode_property_present(parent, "usb-role-switch"))
+		return NULL;
+
+	dev = class_find_device_by_fwnode(role_class, parent);
+	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
+}
+
 /**
  * usb_role_switch_get - Find USB role switch linked with the caller
  * @dev: The caller device
@@ -113,8 +126,10 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
 {
 	struct usb_role_switch *sw;
 
-	sw = device_connection_find_match(dev, "usb-role-switch", NULL,
-					  usb_role_switch_match);
+	sw = usb_role_switch_is_parent(dev_fwnode(dev));
+	if (!sw)
+		sw = device_connection_find_match(dev, "usb-role-switch", NULL,
+						  usb_role_switch_match);
 
 	if (!IS_ERR_OR_NULL(sw))
 		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
@@ -134,8 +149,10 @@ struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
 {
 	struct usb_role_switch *sw;
 
-	sw = fwnode_connection_find_match(fwnode, "usb-role-switch", NULL,
-					  usb_role_switch_match);
+	sw = usb_role_switch_is_parent(fwnode);
+	if (!sw)
+		sw = fwnode_connection_find_match(fwnode, "usb-role-switch",
+						  NULL, usb_role_switch_match);
 	if (!IS_ERR_OR_NULL(sw))
 		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
 
-- 
2.23.0
