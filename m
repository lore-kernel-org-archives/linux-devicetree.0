From: "Thang Q. Nguyen" <tqnguyen@apm.com>
Subject: [v1 1/1] usb:host:xhci support option to disable xHCI 1.0 USB2 HW LPM
Date: Sat, 13 May 2017 07:13:14 +0700
Message-ID: <1494634394-24388-1-git-send-email-tqnguyen@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thang Nguyen <tqnguyen@apm.com>, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Duc Tran <dxtran@apm.com>, Quang Han <qhan@apm.com>, Tung Nguyen <tunguyen@apm.com>, patches@apm.com
List-Id: devicetree@vger.kernel.org

XHCI specification 1.1 does not require xHCI 1.0 compliant controllers
to always enable hardware USB2 LPM.
However, the current xHCI driver always enable it by setting HLE=1 when
seeing HLC=1. This makes certain xHCI controllers that have broken USB2
HW LPM fail to work as there is no way to disable this feature.
This patch adds support to control disabling USB2 Hardware LPM via
DT/ACPI attribute.

Signed-off-by: Tung Nguyen <tunguyen@apm.com>
Signed-off-by: Thang Q. Nguyen <tqnguyen@apm.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt |    1 +
 drivers/usb/host/xhci-plat.c                       |    3 +++
 drivers/usb/host/xhci.c                            |    7 ++++++-
 drivers/usb/host/xhci.h                            |    1 +
 4 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 2d80b60..b5da569 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -26,6 +26,7 @@ Required properties:
 
 Optional properties:
   - clocks: reference to a clock
+  - usb2-hle-disable: disable USB2 LPM for hardware does not support it
   - usb3-lpm-capable: determines if platform is USB3 LPM capable
   - quirk-broken-port-ped: set if the controller has broken port disable mechanism
 
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 7c2a9e7..7d316bc 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -267,6 +267,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
+	if (device_property_read_bool(&pdev->dev, "usb2-hle-disable"))
+		xhci->quirks |= XHCI_HLE_DISABLE;
+
 	if (device_property_read_bool(sysdev, "usb3-lpm-capable"))
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 2d13102..4ad243a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4055,6 +4055,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 	unsigned long	flags;
 	int		hird, exit_latency;
 	int		ret;
+	int		disable_hle = 0;
 
 	if (hcd->speed >= HCD_USB3 || !xhci->hw_lpm_support ||
 			!udev->lpm_capable)
@@ -4079,7 +4080,11 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 	xhci_dbg(xhci, "%s port %d USB2 hardware LPM\n",
 			enable ? "enable" : "disable", port_num + 1);
 
-	if (enable) {
+	/* Check for optional disable HLE if XHCI 1.0 */
+	if ((xhci->quirks & XHCI_HLE_DISABLE) && (xhci->hci_version == 0x100))
+		disable_hle = 1;
+
+	if (enable && !disable_hle) {
 		/* Host supports BESL timeout instead of HIRD */
 		if (udev->usb2_hw_lpm_besl_capable) {
 			/* if device doesn't have a preferred BESL value use a
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 73a28a9..44ca323 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1819,6 +1819,7 @@ struct xhci_hcd {
 /* For controller with a broken Port Disable implementation */
 #define XHCI_BROKEN_PORT_PED	(1 << 25)
 #define XHCI_LIMIT_ENDPOINT_INTERVAL_7	(1 << 26)
+#define XHCI_HLE_DISABLE	(1 << 27)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
1.7.1
