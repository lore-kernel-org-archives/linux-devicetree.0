From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v7 usb-next 2/4] usb: core: add a wrapper for the USB PHYs on the root-hub
Date: Mon, 23 Oct 2017 23:57:16 +0200
Message-ID: <20171023215718.3446-3-martin.blumenstingl@googlemail.com>
References: <20171023215718.3446-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171023215718.3446-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Many SoC platforms have separate devices for the USB PHY which are
registered through the generic PHY framework. These PHYs have to be
enabled to make the USB controller actually work. They also have to be
disabled again on shutdown/suspend.

Currently (at least) the following HCI platform drivers are using custom
code to obtain all PHYs via devicetree for the roothub/controller and
disable/enable them when required:
- ehci-platform.c has ehci_platform_power_{on,off}
- xhci-mtk.c has xhci_mtk_phy_{init,exit,power_on,power_off}
- ohci-platform.c has ohci_platform_power_{on,off}

These drivers are not using the generic devicetree USB device bindings
(for the root-hub) yet which were only introduced recently (documentation
is available in devicetree/bindings/usb/usb-device.txt).

With this new wrapper the usb2-phy and usb3-phy can be specified directly
in the child-node of the corresponding port of the roothub via
devicetree.
This allows SoCs like the Amlogic Meson GXL family to operate correctly
because all USB PHYs are initialized (instead of the first USB PHY
only).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Tested-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/core/Makefile |   2 +-
 drivers/usb/core/phy.c    | 176 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/phy.h    |   7 ++
 3 files changed, 184 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/core/phy.c
 create mode 100644 drivers/usb/core/phy.h

diff --git a/drivers/usb/core/Makefile b/drivers/usb/core/Makefile
index 250ec1d662d9..b6e181d08bf6 100644
--- a/drivers/usb/core/Makefile
+++ b/drivers/usb/core/Makefile
@@ -5,7 +5,7 @@
 usbcore-y := usb.o hub.o hcd.o urb.o message.o driver.o
 usbcore-y += config.o file.o buffer.o sysfs.o endpoint.o
 usbcore-y += devio.o notify.o generic.o quirks.o devices.o
-usbcore-y += port.o
+usbcore-y += phy.o port.o
 
 usbcore-$(CONFIG_OF)		+= of.o
 usbcore-$(CONFIG_USB_PCI)		+= hcd-pci.o
diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
new file mode 100644
index 000000000000..31245b4abdbf
--- /dev/null
+++ b/drivers/usb/core/phy.c
@@ -0,0 +1,176 @@
+/*
+ * USB PHY roothub driver - a wrapper for multiple PHYs which passes all phy_*
+ * function calls to multiple (actual) PHY devices. This is comes handy when
+ * initializing all PHYs on a root-hub and to keep them all in the same state.
+ *
+ * Copyright (C) 2017 Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/phy/phy.h>
+#include <linux/of.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+#include <linux/usb/of.h>
+
+#include "phy.h"
+
+#define ROOTHUB_PORTNUM		0
+
+struct usb_phy_roothub {
+	struct phy		*phy;
+	struct list_head	list;
+};
+
+static struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev)
+{
+	struct usb_phy_roothub *roothub_entry;
+
+	roothub_entry = devm_kzalloc(dev, sizeof(*roothub_entry), GFP_KERNEL);
+	if (!roothub_entry)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&roothub_entry->list);
+
+	return roothub_entry;
+}
+
+static int usb_phy_roothub_add_phy(struct device *dev,
+				   struct device_node *port_np,
+				   const char *con_id, struct list_head *list)
+{
+	struct usb_phy_roothub *roothub_entry;
+	struct phy *phy = devm_of_phy_get(dev, port_np, con_id);
+
+	if (IS_ERR_OR_NULL(phy)) {
+		if (!phy || PTR_ERR(phy) == -ENODEV)
+			return 0;
+		else
+			return PTR_ERR(phy);
+	}
+
+	roothub_entry = usb_phy_roothub_alloc(dev);
+	if (IS_ERR(roothub_entry))
+		return PTR_ERR(roothub_entry);
+
+	roothub_entry->phy = phy;
+
+	list_add_tail(&roothub_entry->list, list);
+
+	return 0;
+}
+
+struct usb_phy_roothub *usb_phy_roothub_init(struct device *dev)
+{
+	struct device_node *roothub_np, *port_np;
+	struct usb_phy_roothub *phy_roothub;
+	struct usb_phy_roothub *roothub_entry;
+	struct list_head *head;
+	int err;
+
+	roothub_np = usb_of_get_child_node(dev->of_node, ROOTHUB_PORTNUM);
+	if (!of_device_is_available(roothub_np))
+		return NULL;
+
+	phy_roothub = usb_phy_roothub_alloc(dev);
+	if (IS_ERR(phy_roothub))
+		return phy_roothub;
+
+	for_each_available_child_of_node(roothub_np, port_np) {
+		err = usb_phy_roothub_add_phy(dev, port_np, "usb2-phy",
+					      &phy_roothub->list);
+		if (err)
+			goto err_out;
+
+		err = usb_phy_roothub_add_phy(dev, port_np, "usb3-phy",
+					      &phy_roothub->list);
+		if (err)
+			goto err_out;
+	}
+
+	head = &phy_roothub->list;
+
+	list_for_each_entry(roothub_entry, head, list) {
+		err = phy_init(roothub_entry->phy);
+		if (err)
+			goto err_exit_phys;
+	}
+
+	return phy_roothub;
+
+err_exit_phys:
+	list_for_each_entry_continue_reverse(roothub_entry, head, list)
+		phy_exit(roothub_entry->phy);
+
+err_out:
+	return ERR_PTR(err);
+}
+EXPORT_SYMBOL_GPL(usb_phy_roothub_init);
+
+int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub)
+{
+	struct usb_phy_roothub *roothub_entry;
+	struct list_head *head;
+	int err, ret = 0;
+
+	if (!phy_roothub)
+		return 0;
+
+	head = &phy_roothub->list;
+
+	list_for_each_entry(roothub_entry, head, list) {
+		err = phy_exit(roothub_entry->phy);
+		if (err)
+			ret = ret;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(usb_phy_roothub_exit);
+
+int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub)
+{
+	struct usb_phy_roothub *roothub_entry;
+	struct list_head *head;
+	int err;
+
+	if (!phy_roothub)
+		return 0;
+
+	head = &phy_roothub->list;
+
+	list_for_each_entry(roothub_entry, head, list) {
+		err = phy_power_on(roothub_entry->phy);
+		if (err)
+			goto err_out;
+	}
+
+	return 0;
+
+err_out:
+	list_for_each_entry_continue_reverse(roothub_entry, head, list)
+		phy_power_off(roothub_entry->phy);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(usb_phy_roothub_power_on);
+
+void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub)
+{
+	struct usb_phy_roothub *roothub_entry;
+
+	if (!phy_roothub)
+		return;
+
+	list_for_each_entry_reverse(roothub_entry, &phy_roothub->list, list)
+		phy_power_off(roothub_entry->phy);
+}
+EXPORT_SYMBOL_GPL(usb_phy_roothub_power_off);
diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
new file mode 100644
index 000000000000..6fde59bfbff8
--- /dev/null
+++ b/drivers/usb/core/phy.h
@@ -0,0 +1,7 @@
+struct usb_phy_roothub;
+
+struct usb_phy_roothub *usb_phy_roothub_init(struct device *dev);
+int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
+
+int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
+void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub);
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
