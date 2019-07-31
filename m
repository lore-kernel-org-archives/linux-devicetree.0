From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v2 5/5] drivers: xhci: Add quirk to reset xHCI port PHY
Date: Wed, 31 Jul 2019 15:49:55 +0530
Message-ID: <1564568395-9980-6-git-send-email-srinath.mannam@broadcom.com>
References: <1564568395-9980-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564568395-9980-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

Stingray USB HS PHY has an issue, that USB High Speed device detects
at Full Speed if the same port was connected to Full speed device.
This problem can be resolved by resetting that port's PHY on disconnect.
Add a quirk to reset xHCI port PHY on port disconnect event.
XHCI_RESET_PHY_ON_DISCONNECT quirk is introduced with xhci_plat_brcm_sr
platform data. New quirks parameter added in xhci_plat_priv structure to
assign platform specific quirks.

Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
---
 drivers/usb/core/hcd.c       |  6 ++++++
 drivers/usb/core/phy.c       | 19 +++++++++++++++++++
 drivers/usb/core/phy.h       |  1 +
 drivers/usb/host/xhci-plat.c | 10 ++++++++++
 drivers/usb/host/xhci-plat.h |  1 +
 drivers/usb/host/xhci-ring.c |  9 ++++++---
 drivers/usb/host/xhci.h      |  1 +
 include/linux/usb/hcd.h      |  1 +
 8 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 94d2255..a23441b 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2675,6 +2675,12 @@ int usb_hcd_find_raw_port_number(struct usb_hcd *hcd, int port1)
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
index 7580493..4d1ac31 100644
--- a/drivers/usb/core/phy.c
+++ b/drivers/usb/core/phy.c
@@ -190,6 +190,25 @@ void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub)
 }
 EXPORT_SYMBOL_GPL(usb_phy_roothub_power_off);
 
+int usb_phy_roothub_port_reset(struct usb_phy_roothub *phy_roothub, int port)
+{
+	struct usb_phy_roothub *roothub_entry;
+	struct list_head *head;
+
+	if (!phy_roothub)
+		return -EINVAL;
+
+	head = &phy_roothub->list;
+
+	list_for_each_entry(roothub_entry, head, list) {
+		if (phy_get_phy_ports(roothub_entry->phy) & BIT(port))
+			return phy_reset(roothub_entry->phy);
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
index dad564e..3f682e8 100644
--- a/drivers/usb/core/phy.h
+++ b/drivers/usb/core/phy.h
@@ -20,6 +20,7 @@ int usb_phy_roothub_set_mode(struct usb_phy_roothub *phy_roothub,
 			     enum phy_mode mode);
 int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
 void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub);
+int usb_phy_roothub_port_reset(struct usb_phy_roothub *phy_roothub, int port);
 
 int usb_phy_roothub_suspend(struct device *controller_dev,
 			    struct usb_phy_roothub *phy_roothub);
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 998241f..af23e92 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -47,6 +47,9 @@ static void xhci_priv_plat_start(struct usb_hcd *hcd)
 static int xhci_priv_init_quirk(struct usb_hcd *hcd)
 {
 	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+
+	xhci->quirks |= priv->quirks;
 
 	if (!priv->init_quirk)
 		return 0;
@@ -116,6 +119,10 @@ static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
 	.resume_quirk = xhci_rcar_resume_quirk,
 };
 
+static const struct xhci_plat_priv xhci_plat_brcm_sr = {
+	.quirks = XHCI_RESET_PHY_ON_DISCONNECT,
+};
+
 static const struct of_device_id usb_xhci_of_match[] = {
 	{
 		.compatible = "generic-xhci",
@@ -151,6 +158,9 @@ static const struct of_device_id usb_xhci_of_match[] = {
 	}, {
 		.compatible = "renesas,rcar-gen3-xhci",
 		.data = &xhci_plat_renesas_rcar_gen3,
+	}, {
+		.compatible = "brcm,sr-xhci",
+		.data = &xhci_plat_brcm_sr,
 	},
 	{},
 };
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index ae29f22..0cd61c6 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -15,6 +15,7 @@ struct xhci_plat_priv {
 	void (*plat_start)(struct usb_hcd *);
 	int (*init_quirk)(struct usb_hcd *);
 	int (*resume_quirk)(struct usb_hcd *);
+	unsigned long long	quirks;
 };
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index feffceb..77e94e8 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1696,9 +1696,12 @@ static void handle_port_status(struct xhci_hcd *xhci,
 
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
index 7f8b950..f3b336b 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1856,6 +1856,7 @@ struct xhci_hcd {
 #define XHCI_DEFAULT_PM_RUNTIME_ALLOW	BIT_ULL(33)
 #define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
 #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
+#define XHCI_RESET_PHY_ON_DISCONNECT	BIT_ULL(36)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index bb57b5a..2590666 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -461,6 +461,7 @@ extern int usb_add_hcd(struct usb_hcd *hcd,
 		unsigned int irqnum, unsigned long irqflags);
 extern void usb_remove_hcd(struct usb_hcd *hcd);
 extern int usb_hcd_find_raw_port_number(struct usb_hcd *hcd, int port1);
+extern int usb_hcd_phy_port_reset(struct usb_hcd *hcd, int port);
 
 struct platform_device;
 extern void usb_hcd_platform_shutdown(struct platform_device *dev);
-- 
2.7.4
