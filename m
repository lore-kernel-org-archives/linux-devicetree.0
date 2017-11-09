From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 8/8] USB: of: clean up device-node helper
Date: Thu,  9 Nov 2017 18:07:23 +0100
Message-ID: <20171109170723.10960-9-johan@kernel.org>
References: <20171109170723.10960-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171109170723.10960-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>, Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

Clean up the USB device-node helper that is used to look up a device
node given a parent hub device and a port number. Also pass in a struct
usb_device as first argument to provide some type checking.

Give the helper the more descriptive name usb_of_get_device_node(),
which matches the new usb_of_get_interface_node() helper that is used to
look up a second type of of child node from a USB device.

Note that the terms "device node" and "interface node" are defined and
used by the OF Recommended Practice for USB.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/core/ledtrig-usbport.c |  2 +-
 drivers/usb/core/of.c              | 27 ++++++++++++++-------------
 drivers/usb/core/usb.c             |  3 +--
 include/linux/usb/of.h             |  7 +++----
 4 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/core/ledtrig-usbport.c b/drivers/usb/core/ledtrig-usbport.c
index f1fde5165068..d775ffea20c3 100644
--- a/drivers/usb/core/ledtrig-usbport.c
+++ b/drivers/usb/core/ledtrig-usbport.c
@@ -142,7 +142,7 @@ static bool usbport_trig_port_observed(struct usbport_trig_data *usbport_data,
 	 *
 	 * FIXME: This is really the device node of the connected device
 	 */
-	port_np = usb_of_get_child_node(usb_dev->dev.of_node, port1);
+	port_np = usb_of_get_device_node(usb_dev, port1);
 	if (!port_np)
 		return false;
 
diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
index 074fabc26d6c..fd77442c2d12 100644
--- a/drivers/usb/core/of.c
+++ b/drivers/usb/core/of.c
@@ -12,31 +12,32 @@
 #include <linux/usb/of.h>
 
 /**
- * usb_of_get_child_node - Find the device node match port number
- * @parent: the parent device node
- * @portnum: the port number which device is connecting
+ * usb_of_get_device_node() - get a USB device node
+ * @hub: hub to which device is connected
+ * @port1: one-based index of port
  *
- * Find the node from device tree according to its port number.
+ * Look up the node of a USB device given its parent hub device and one-based
+ * port number.
  *
  * Return: A pointer to the node with incremented refcount if found, or
  * %NULL otherwise.
  */
-struct device_node *usb_of_get_child_node(struct device_node *parent,
-					int portnum)
+struct device_node *usb_of_get_device_node(struct usb_device *hub, int port1)
 {
 	struct device_node *node;
-	u32 port;
+	u32 reg;
 
-	for_each_child_of_node(parent, node) {
-		if (!of_property_read_u32(node, "reg", &port)) {
-			if (port == portnum)
-				return node;
-		}
+	for_each_child_of_node(hub->dev.of_node, node) {
+		if (of_property_read_u32(node, "reg", &reg))
+			continue;
+
+		if (reg == port1)
+			return node;
 	}
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(usb_of_get_child_node);
+EXPORT_SYMBOL_GPL(usb_of_get_device_node);
 
 /**
  * usb_of_has_combined_node() - determine whether a device has a combined node
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 845286f08ab0..2f5fbc56a9dd 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -645,8 +645,7 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
 			raw_port = usb_hcd_find_raw_port_number(usb_hcd,
 				port1);
 		}
-		dev->dev.of_node = usb_of_get_child_node(parent->dev.of_node,
-				raw_port);
+		dev->dev.of_node = usb_of_get_device_node(parent, raw_port);
 
 		/* hub driver sets up TT records */
 	}
diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h
index 0294ccac4f1d..dba55ccb9b53 100644
--- a/include/linux/usb/of.h
+++ b/include/linux/usb/of.h
@@ -19,8 +19,7 @@ enum usb_dr_mode of_usb_get_dr_mode_by_phy(struct device_node *np, int arg0);
 bool of_usb_host_tpl_support(struct device_node *np);
 int of_usb_update_otg_caps(struct device_node *np,
 			struct usb_otg_caps *otg_caps);
-struct device_node *usb_of_get_child_node(struct device_node *parent,
-			int portnum);
+struct device_node *usb_of_get_device_node(struct usb_device *hub, int port1);
 bool usb_of_has_combined_node(struct usb_device *udev);
 struct device_node *usb_of_get_interface_node(struct usb_device *udev,
 		u8 config, u8 ifnum);
@@ -40,8 +39,8 @@ static inline int of_usb_update_otg_caps(struct device_node *np,
 {
 	return 0;
 }
-static inline struct device_node *usb_of_get_child_node
-		(struct device_node *parent, int portnum)
+static inline struct device_node *
+usb_of_get_device_node(struct usb_device *hub, int port1)
 {
 	return NULL;
 }
-- 
2.15.0
