From: "Thang Q. Nguyen" <tqnguyen@apm.com>
Subject: [PATCH v4 1/1] usb:host:xhci support option to disable the xHCI USB2 HW LPM
Date: Wed, 12 Jul 2017 15:06:48 +0700
Message-ID: <1499846808-25981-1-git-send-email-tqnguyen@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thang Nguyen <tqnguyen@apm.com>, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Tung Nguyen <tunguyen@apm.com>, patches@apm.com
List-Id: devicetree@vger.kernel.org

XHCI specification 1.1 does not require xHCI-compliant controllers
to always enable hardware USB2 LPM. However, the current xHCI
driver always enable it when seeing HLC=1.
This patch supports an option for users to control disabling
USB2 Hardware LPM via DT/ACPI attribute.
This option is needed in case user would like to disable this
feature. For example, their xHCI controller has its USB2 HW LPM
broken.

Signed-off-by: Tung Nguyen <tunguyen@apm.com>
Signed-off-by: Thang Q. Nguyen <tqnguyen@apm.com>
---
Changes since v3:
 - Bypass updating LPM parameters when HW LPM is optionally disabled.
Changes since v2:
 - Change code to disable HW LPM as an option for user which
   is set via ACPI/DT.
Changes since v1:
 - Update DT/ACPI attribute and corresponding codes from HLE to LPM to
   be consistent with other attribute names.
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt |    1 +
 drivers/usb/host/xhci-plat.c                       |    3 +++
 drivers/usb/host/xhci.c                            |    6 ++++++
 drivers/usb/host/xhci.h                            |    1 +
 4 files changed, 11 insertions(+), 0 deletions(-)

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
index 56f85df..73b24bc 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4060,6 +4060,9 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 			!udev->lpm_capable)
 		return -EPERM;
 
+	if (xhci->quirks & XHCI_HW_LPM_DISABLE)
+		return -EPERM;
+
 	if (!udev->parent || udev->parent->parent ||
 			udev->descriptor.bDeviceClass == USB_CLASS_HUB)
 		return -EPERM;
@@ -4177,6 +4180,9 @@ static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
 			!udev->lpm_capable)
 		return 0;
 
+	if (xhci->quirks & XHCI_HW_LPM_DISABLE)
+		return 0;
+
 	/* we only support lpm for non-hub device connected to root hub yet */
 	if (!udev->parent || udev->parent->parent ||
 			udev->descriptor.bDeviceClass == USB_CLASS_HUB)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 3c6da1f..3cbf4a9 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1820,6 +1820,7 @@ struct xhci_hcd {
 #define XHCI_BROKEN_PORT_PED	(1 << 25)
 #define XHCI_LIMIT_ENDPOINT_INTERVAL_7	(1 << 26)
 #define XHCI_U2_DISABLE_WAKE	(1 << 27)
+#define XHCI_HW_LPM_DISABLE	(1 << 28)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
1.7.1
