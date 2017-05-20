From: "Thang Q. Nguyen" <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
Subject: [v2 1/1] usb:host:xhci support option to disable xHCI 1.0 USB2 HW LPM
Date: Sat, 20 May 2017 14:24:56 +0700
Message-ID: <1495265096-14851-1-git-send-email-tqnguyen@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thang Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org>, Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Duc Tran <dxtran-qTEPVZfXA3Y@public.gmane.org>, Quang Han <qhan-qTEPVZfXA3Y@public.gmane.org>, Tung Nguyen <tunguyen-qTEPVZfXA3Y@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

XHCI specification 1.1 does not require xHCI 1.0 compliant controllers
to always enable hardware USB2 LPM.
However, the current xHCI driver always enable it by setting HLE=1 when
seeing HLC=1. This makes certain xHCI controllers that have broken USB2
HW LPM fail to work as there is no way to disable this feature.
This patch adds support to control disabling USB2 Hardware LPM via
DT/ACPI attribute.

Signed-off-by: Tung Nguyen <tunguyen-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Thang Q. Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
---
Changes since v1:
 - Update DT/ACPI attribute and corresponding codes from HLE to LPM to
  be consistent with other attribute names.
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt |    1 +
 drivers/usb/host/xhci-plat.c                       |    3 +++
 drivers/usb/host/xhci.c                            |    7 ++++++-
 drivers/usb/host/xhci.h                            |    1 +
 4 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 2d80b60..96f1ac0 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -26,6 +26,7 @@ Required properties:
 
 Optional properties:
   - clocks: reference to a clock
+  - usb2-lpm-disable: disable USB2 LPM for hardware does not support it
   - usb3-lpm-capable: determines if platform is USB3 LPM capable
   - quirk-broken-port-ped: set if the controller has broken port disable mechanism
 
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 7c2a9e7..950eaf0 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -267,6 +267,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
+	if (device_property_read_bool(&pdev->dev, "usb2-lpm-disable"))
+		xhci->quirks |= XHCI_USB2_LPM_DISABLE;
+
 	if (device_property_read_bool(sysdev, "usb3-lpm-capable"))
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 2d13102..47d51d4 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4055,6 +4055,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 	unsigned long	flags;
 	int		hird, exit_latency;
 	int		ret;
+	int		usb2_lpm_disable = 0;
 
 	if (hcd->speed >= HCD_USB3 || !xhci->hw_lpm_support ||
 			!udev->lpm_capable)
@@ -4079,7 +4080,11 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 	xhci_dbg(xhci, "%s port %d USB2 hardware LPM\n",
 			enable ? "enable" : "disable", port_num + 1);
 
-	if (enable) {
+	/* Check for optional disable USB2 LPM if XHCI 1.0 */
+	if ((xhci->quirks & XHCI_USB2_LPM_DISABLE) && (xhci->hci_version == 0x100))
+		usb2_lpm_disable = 1;
+
+	if (enable && !usb2_lpm_disable) {
 		/* Host supports BESL timeout instead of HIRD */
 		if (udev->usb2_hw_lpm_besl_capable) {
 			/* if device doesn't have a preferred BESL value use a
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 73a28a9..cfb9f5d 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1819,6 +1819,7 @@ struct xhci_hcd {
 /* For controller with a broken Port Disable implementation */
 #define XHCI_BROKEN_PORT_PED	(1 << 25)
 #define XHCI_LIMIT_ENDPOINT_INTERVAL_7	(1 << 26)
+#define XHCI_USB2_LPM_DISABLE	(1 << 27)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
