From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 6/8] USB: add device-tree support for interfaces
Date: Thu,  9 Nov 2017 18:07:21 +0100
Message-ID: <20171109170723.10960-7-johan@kernel.org>
References: <20171109170723.10960-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171109170723.10960-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>, Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

Add OF device-tree support for USB interfaces.

USB "interface nodes" are children of USB "device nodes" and are
identified by an interface number and a configuration value:

	&usb1 { /* host controller */
		dev1: device@1 { /* device at port 1 */
			compatible = "usb1234,5678";
			reg = <1>;

			#address-cells = <2>;
			#size-cells = <0>;

			interface@0,2 { /* interface 0 of configuration 2 */
				compatible = "usbif1234,5678.config2.0";
				reg = <0 2>;
			};
		};
	};

The configuration component is not included in the textual
representation of an interface-node unit address for configuration 1:

	&dev1 {
		interface@0 {	/* interface 0 of configuration 1 */
			compatible = "usbif1234,5678.config1.0";
			reg = <0 1>;
		};
	};

When a USB device of class 0 or 9 (hub) has only a single configuration
with a single interface, a special case "combined node" is used instead
of a device node with an interface node:

	&usb1 {
		device@2 {
			compatible = "usb1234,abcd";
			reg = <2>;
		};
	};

Combined nodes are shared by the two device structures representing the
USB device and its interface in the kernel's device model.

Note that, as for device nodes, the compatible strings for interface
nodes are currently not used.

For more details see "Open Firmware Recommended Practice: Universal
Serial Bus Version 1" and the binding documentation.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/core/message.c | 18 ++++++++----
 drivers/usb/core/of.c      | 70 +++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/usb/of.h     | 14 ++++++++++
 3 files changed, 96 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 5e8379b42f47..05ed740b6b4c 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -18,6 +18,7 @@
 #include <linux/usb/cdc.h>
 #include <linux/usb/quirks.h>
 #include <linux/usb/hcd.h>	/* for usbcore internals */
+#include <linux/usb/of.h>
 #include <asm/byteorder.h>
 
 #include "usb.h"
@@ -1548,6 +1549,7 @@ static void usb_release_interface(struct device *dev)
 
 	kref_put(&intfc->ref, usb_release_interface_cache);
 	usb_put_dev(interface_to_usbdev(intf));
+	of_node_put(dev->of_node);
 	kfree(intf);
 }
 
@@ -1833,6 +1835,7 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 		struct usb_interface_cache *intfc;
 		struct usb_interface *intf;
 		struct usb_host_interface *alt;
+		u8 ifnum;
 
 		cp->interface[i] = intf = new_interfaces[i];
 		intfc = cp->intf_cache[i];
@@ -1851,11 +1854,17 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 		if (!alt)
 			alt = &intf->altsetting[0];
 
-		intf->intf_assoc =
-			find_iad(dev, cp, alt->desc.bInterfaceNumber);
+		ifnum = alt->desc.bInterfaceNumber;
+		intf->intf_assoc = find_iad(dev, cp, ifnum);
 		intf->cur_altsetting = alt;
 		usb_enable_interface(dev, intf, true);
 		intf->dev.parent = &dev->dev;
+		if (usb_of_has_combined_node(dev)) {
+			device_set_of_node_from_dev(&intf->dev, &dev->dev);
+		} else {
+			intf->dev.of_node = usb_of_get_interface_node(dev,
+					configuration, ifnum);
+		}
 		intf->dev.driver = NULL;
 		intf->dev.bus = &usb_bus_type;
 		intf->dev.type = &usb_if_device_type;
@@ -1870,9 +1879,8 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 		intf->minor = -1;
 		device_initialize(&intf->dev);
 		pm_runtime_no_callbacks(&intf->dev);
-		dev_set_name(&intf->dev, "%d-%s:%d.%d",
-			dev->bus->busnum, dev->devpath,
-			configuration, alt->desc.bInterfaceNumber);
+		dev_set_name(&intf->dev, "%d-%s:%d.%d", dev->bus->busnum,
+				dev->devpath, configuration, ifnum);
 		usb_get_dev(dev);
 	}
 	kfree(new_interfaces);
diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
index 2be968353257..074fabc26d6c 100644
--- a/drivers/usb/core/of.c
+++ b/drivers/usb/core/of.c
@@ -3,7 +3,8 @@
  * of.c		The helpers for hcd device tree support
  *
  * Copyright (C) 2016 Freescale Semiconductor, Inc.
- * Author: Peter Chen <peter.chen@freescale.com>
+ *	Author: Peter Chen <peter.chen@freescale.com>
+ * Copyright (C) 2017 Johan Hovold <johan@kernel.org>
  */
 
 #include <linux/of.h>
@@ -37,6 +38,73 @@ struct device_node *usb_of_get_child_node(struct device_node *parent,
 }
 EXPORT_SYMBOL_GPL(usb_of_get_child_node);
 
+/**
+ * usb_of_has_combined_node() - determine whether a device has a combined node
+ * @udev: USB device
+ *
+ * Determine whether a USB device has a so called combined node which is
+ * shared with its sole interface. This is the case if and only if the device
+ * has a node and its decriptors report the following:
+ *
+ *	1) bDeviceClass is 0 or 9, and
+ *	2) bNumConfigurations is 1, and
+ *	3) bNumInterfaces is 1.
+ *
+ * Return: True iff the device has a device node and its descriptors match the
+ * criteria for a combined node.
+ */
+bool usb_of_has_combined_node(struct usb_device *udev)
+{
+	struct usb_device_descriptor *ddesc = &udev->descriptor;
+	struct usb_config_descriptor *cdesc;
+
+	if (!udev->dev.of_node)
+		return false;
+
+	switch (ddesc->bDeviceClass) {
+	case USB_CLASS_PER_INTERFACE:
+	case USB_CLASS_HUB:
+		if (ddesc->bNumConfigurations == 1) {
+			cdesc = &udev->config->desc;
+			if (cdesc->bNumInterfaces == 1)
+				return true;
+		}
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(usb_of_has_combined_node);
+
+/**
+ * usb_of_get_interface_node() - get a USB interface node
+ * @udev: USB device of interface
+ * @config: configuration value
+ * @ifnum: interface number
+ *
+ * Look up the node of a USB interface given its USB device, configuration
+ * value and interface number.
+ *
+ * Return: A pointer to the node with incremented refcount if found, or
+ * %NULL otherwise.
+ */
+struct device_node *
+usb_of_get_interface_node(struct usb_device *udev, u8 config, u8 ifnum)
+{
+	struct device_node *node;
+	u32 reg[2];
+
+	for_each_child_of_node(udev->dev.of_node, node) {
+		if (of_property_read_u32_array(node, "reg", reg, 2))
+			continue;
+
+		if (reg[0] == ifnum && reg[1] == config)
+			return node;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(usb_of_get_interface_node);
+
 /**
  * usb_of_get_companion_dev - Find the companion device
  * @dev: the device pointer to find a companion
diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h
index 6cbe7a5c2b57..0294ccac4f1d 100644
--- a/include/linux/usb/of.h
+++ b/include/linux/usb/of.h
@@ -12,6 +12,8 @@
 #include <linux/usb/otg.h>
 #include <linux/usb/phy.h>
 
+struct usb_device;
+
 #if IS_ENABLED(CONFIG_OF)
 enum usb_dr_mode of_usb_get_dr_mode_by_phy(struct device_node *np, int arg0);
 bool of_usb_host_tpl_support(struct device_node *np);
@@ -19,6 +21,9 @@ int of_usb_update_otg_caps(struct device_node *np,
 			struct usb_otg_caps *otg_caps);
 struct device_node *usb_of_get_child_node(struct device_node *parent,
 			int portnum);
+bool usb_of_has_combined_node(struct usb_device *udev);
+struct device_node *usb_of_get_interface_node(struct usb_device *udev,
+		u8 config, u8 ifnum);
 struct device *usb_of_get_companion_dev(struct device *dev);
 #else
 static inline enum usb_dr_mode
@@ -40,6 +45,15 @@ static inline struct device_node *usb_of_get_child_node
 {
 	return NULL;
 }
+static inline bool usb_of_has_combined_node(struct usb_device *udev)
+{
+	return false;
+}
+static inline struct device_node *
+usb_of_get_interface_node(struct usb_device *udev, u8 config, u8 ifnum)
+{
+	return NULL;
+}
 static inline struct device *usb_of_get_companion_dev(struct device *dev)
 {
 	return NULL;
-- 
2.15.0
