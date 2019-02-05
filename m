From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH 2/2] drivers: xhci: Add quirk to reset xHCI port PHY
Date: Tue,  5 Feb 2019 11:48:54 +0530
Message-ID: <1549347534-11320-3-git-send-email-srinath.mannam@broadcom.com>
References: <1549347534-11320-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549347534-11320-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add a quirk to reset xHCI port PHY on port disconnect event.
Stingray USB HS PHY has an issue, that USB High Speed device detected
at Full Speed after the same port has connected to Full speed device.
This problem can be resolved with that port PHY reset on disconnect.

Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
---
 drivers/usb/core/hcd.c       |  6 ++++++
 drivers/usb/core/phy.c       | 21 +++++++++++++++++++++
 drivers/usb/core/phy.h       |  1 +
 drivers/usb/host/xhci-plat.c |  3 +++
 drivers/usb/host/xhci-ring.c |  9 ++++++---
 drivers/usb/host/xhci.h      |  1 +
 include/linux/usb/hcd.h      |  1 +
 7 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 015b126..e2b87a6 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2663,6 +2663,12 @@ int usb_hcd_find_raw_port_number(struct usb_hcd *hcd, int port1)
 	return hcd->driver->find_raw_port_number(hcd, port1);
 }
 
+int usb_hcd_phy_port_reset(struct usb_hcd *hcd, int port)
+{
+	return usb_phy_roothub_port_reset(hcd->phy_roothub, port);
+}
+EXPORT_SYMBOL_GPL(usb_hcd_phy_port_reset);
+
 static int usb_hcd_request_irqs(struct usb_hcd *hcd,
 		unsigned int irqnum, unsigned long irqflags)
 {
diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
index 38b2c77..c64767d 100644
--- a/drivers/usb/core/phy.c
+++ b/drivers/usb/core/phy.c
@@ -162,6 +162,27 @@ void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub)
 }
 EXPORT_SYMBOL_GPL(usb_phy_roothub_power_off);
 
+int usb_phy_roothub_port_reset(struct usb_phy_roothub *phy_roothub, int port)
+{
+	struct usb_phy_roothub *roothub_entry;
+	struct list_head *head;
+	int i = 0;
+
+	if (!phy_roothub)
+		return -EINVAL;
+
+	head = &phy_roothub->list;
+
+	list_for_each_entry(roothub_entry, head, list) {
+		if (i == port)
+			return phy_reset(roothub_entry->phy);
+		i++;
+	}
+
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(usb_phy_roothub_port_reset);
+
 int usb_phy_roothub_suspend(struct device *controller_dev,
 			    struct usb_phy_roothub *phy_roothub)
 {
diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
index 88a3c03..e8be444 100644
--- a/drivers/usb/core/phy.h
+++ b/drivers/usb/core/phy.h
@@ -18,6 +18,7 @@ int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
 
 int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
 void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub);
+int usb_phy_roothub_port_reset(struct usb_phy_roothub *phy_roothub, int port);
 
 int usb_phy_roothub_suspend(struct device *controller_dev,
 			    struct usb_phy_roothub *phy_roothub);
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index ef09cb0..5a3b486 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -289,6 +289,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		if (device_property_read_bool(tmpdev, "quirk-broken-port-ped"))
 			xhci->quirks |= XHCI_BROKEN_PORT_PED;
 
+		if (device_property_read_bool(tmpdev, "usb-phy-port-reset"))
+			xhci->quirks |= XHCI_RESET_PHY_ON_DISCONNECT;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 	}
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 40fa25c..2dc3116 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1685,9 +1685,12 @@ static void handle_port_status(struct xhci_hcd *xhci,
 
 	if (hcd->speed < HCD_USB3) {
 		xhci_test_and_clear_bit(xhci, port, PORT_PLC);
-		if ((xhci->quirks & XHCI_RESET_PLL_ON_DISCONNECT) &&
-		    (portsc & PORT_CSC) && !(portsc & PORT_CONNECT))
-			xhci_cavium_reset_phy_quirk(xhci);
+		if ((portsc & PORT_CSC) && !(portsc & PORT_CONNECT)) {
+			if (xhci->quirks & XHCI_RESET_PLL_ON_DISCONNECT)
+				xhci_cavium_reset_phy_quirk(xhci);
+			else if (xhci->quirks & XHCI_RESET_PHY_ON_DISCONNECT)
+				usb_hcd_phy_port_reset(hcd, port_id - 1);
+		}
 	}
 
 cleanup:
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 652dc36..530c5ff 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1846,6 +1846,7 @@ struct xhci_hcd {
 #define XHCI_DEFAULT_PM_RUNTIME_ALLOW	BIT_ULL(33)
 #define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
 #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
+#define XHCI_RESET_PHY_ON_DISCONNECT	BIT_ULL(36)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 7dc3a41..a5ea26f 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -456,6 +456,7 @@ extern int usb_add_hcd(struct usb_hcd *hcd,
 		unsigned int irqnum, unsigned long irqflags);
 extern void usb_remove_hcd(struct usb_hcd *hcd);
 extern int usb_hcd_find_raw_port_number(struct usb_hcd *hcd, int port1);
+extern int usb_hcd_phy_port_reset(struct usb_hcd *hcd, int port);
 
 struct platform_device;
 extern void usb_hcd_platform_shutdown(struct platform_device *dev);
-- 
2.7.4
