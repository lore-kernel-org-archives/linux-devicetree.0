From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [RFC PATCH 1/5] usb: hub: add device tree support for populating onboard usb device
Date: Fri, 18 Dec 2015 17:33:55 +0800
Message-ID: <1450431239-16439-2-git-send-email-peter.chen@freescale.com>
References: <1450431239-16439-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450431239-16439-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Although most of USB device is hot-plug's, there are still some
USB devices are soldered on the board, and these kinds of devices
maybe the upstream device at 1st or 2nd level hub's, so in order to
detect all onboard devices, we put the detect device node code
at hub's driver, and it will populate platform device under this HUB.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/core/hub.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5e32ce7..889f188 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -26,6 +26,7 @@
 #include <linux/mutex.h>
 #include <linux/random.h>
 #include <linux/pm_qos.h>
+#include <linux/of_platform.h>
 
 #include <asm/uaccess.h>
 #include <asm/byteorder.h>
@@ -1334,6 +1335,34 @@ static int hub_post_reset(struct usb_interface *intf)
 	return 0;
 }
 
+static int hub_of_children_register(struct usb_device *hdev)
+{
+	struct device *dev;
+
+	if (hdev->parent)
+		dev = &hdev->dev;
+	else
+		dev = bus_to_hcd(hdev->bus)->self.controller;
+
+	if (!dev->of_node)
+		return 0;
+
+	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+}
+
+static void hub_of_children_unregister(struct usb_device *hdev)
+{
+	struct device *dev;
+
+	if (hdev->parent)
+		dev = &hdev->dev;
+	else
+		dev = bus_to_hcd(hdev->bus)->self.controller;
+
+	if (dev->of_node)
+		of_platform_depopulate(dev);
+}
+
 static int hub_configure(struct usb_hub *hub,
 	struct usb_endpoint_descriptor *endpoint)
 {
@@ -1677,6 +1706,7 @@ static void hub_disconnect(struct usb_interface *intf)
 	usb_set_intfdata(intf, NULL);
 	spin_unlock_irq(&device_state_lock);
 
+	hub_of_children_unregister(hdev);
 	for (; port1 > 0; --port1)
 		usb_hub_remove_port_device(hub, port1);
 
@@ -1701,6 +1731,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_endpoint_descriptor *endpoint;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -1820,6 +1851,12 @@ descriptor_error:
 	if (id->driver_info & HUB_QUIRK_CHECK_PORT_AUTOSUSPEND)
 		hub->quirk_check_port_auto_suspend = 1;
 
+	ret = hub_of_children_register(hdev);
+	if (ret) {
+		dev_err(&hdev->dev, "Failed to register child device\n");
+		return ret;
+	}
+
 	if (hub_configure(hub, endpoint) >= 0)
 		return 0;
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
