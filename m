From: "Thang Q. Nguyen" <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v3 1/1] usb:host:xhci support option to disable the xHCI USB2 HW LPM
Date: Fri, 23 Jun 2017 10:02:12 +0700
Message-ID: <1498186932-29277-1-git-send-email-tqnguyen@apm.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thang Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org>, Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Tung Nguyen <tunguyen-qTEPVZfXA3Y@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

XHCI specification 1.1 does not require xHCI-compliant controllers
to always enable hardware USB2 LPM. However, the current xHCI
driver always enable it when seeing HLC=1.
This patch supports an option for users to control disabling
USB2 Hardware LPM via DT/ACPI attribute.
This option is needed in case user would like to disable this
feature. For example, their xHCI controller has its USB2 HW LPM
broken.

Signed-off-by: Tung Nguyen <tunguyen-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Thang Q. Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
---
Changes since v2:
 - Change code to disable HW LPM as an option for user which
   is set via ACPI/DT.
Changes since v1:
 - Update DT/ACPI attribute and corresponding codes from HLE to LPM to
   be consistent with other attribute names.
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt |    1 +
 drivers/usb/host/xhci-plat.c                       |    3 +++
 drivers/usb/host/xhci.c                            |    3 +++
 drivers/usb/host/xhci.h                            |    1 +
 4 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 2d80b60..ae6e484 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -26,6 +26,7 @@ Required properties:
 
 Optional properties:
   - clocks: reference to a clock
+  - usb2-lpm-disable: indicate if we don't want to enable USB2 HW LPM
   - usb3-lpm-capable: determines if platform is USB3 LPM capable
   - quirk-broken-port-ped: set if the controller has broken port disable mechanism
 
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c04144b..9028fb5 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -267,6 +267,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
+	if (device_property_read_bool(sysdev, "usb2-lpm-disable"))
+		xhci->quirks |= XHCI_HW_LPM_DISABLE;
+
 	if (device_property_read_bool(sysdev, "usb3-lpm-capable"))
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 30f47d9..49d05c7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4061,6 +4061,9 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 			!udev->lpm_capable)
 		return -EPERM;
 
+	if (xhci->quirks & XHCI_HW_LPM_DISABLE)
+		return -EPERM;
+
 	if (!udev->parent || udev->parent->parent ||
 			udev->descriptor.bDeviceClass == USB_CLASS_HUB)
 		return -EPERM;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 73a28a9..03d50e8 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1819,6 +1819,7 @@ struct xhci_hcd {
 /* For controller with a broken Port Disable implementation */
 #define XHCI_BROKEN_PORT_PED	(1 << 25)
 #define XHCI_LIMIT_ENDPOINT_INTERVAL_7	(1 << 26)
+#define XHCI_HW_LPM_DISABLE	(1 << 27)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
