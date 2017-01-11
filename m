From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [RFC PATCH 2/2] usb: host: xhci: plat: integrate the platform-roothub
Date: Wed, 11 Jan 2017 16:29:47 +0100
Message-ID: <20170111152947.27088-3-martin.blumenstingl@googlemail.com>
References: <20170111152947.27088-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170111152947.27088-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This enables the platform-roothub for the xhci-plat driver. This allows
specifying a PHY for each port via devicetree. All PHYs will then be
enabled/disabled by the platform-roothub driver.

One example where this is required is the Amlogic GXL and GXM SoCs:
They are using a dwc3 USB controller with up to three ports enabled on
the internal roothub. Using only the top-level "phy" properties does not
work here since one can only specify one "usb2-phy" and one "usb3-phy",
while actually at least two "usb2-phy" have to be specified.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt |  7 ++++
 drivers/usb/host/Kconfig                           |  1 +
 drivers/usb/host/xhci-plat.c                       | 37 ++++++++++++++++++++--
 drivers/usb/host/xhci.h                            |  3 ++
 4 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 0b7d8576001c..f05b2306ae19 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -28,6 +28,13 @@ Optional properties:
   - clocks: reference to a clock
   - usb3-lpm-capable: determines if platform is USB3 LPM capable
 
+sub-nodes:
+- optionally there can be a node for the root-hub, see usb-roothub.txt in the
+  current directory
+- one or more nodes with reg 1-31 for each port to which a device is connected.
+  See usb-device.txt in the current directory for more information.
+
+
 Example:
 	usb@f0931000 {
 		compatible = "generic-xhci";
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index eb7009460322..b83b5aa89b76 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -36,6 +36,7 @@ config USB_XHCI_PCI
 config USB_XHCI_PLATFORM
 	tristate "Generic xHCI driver for a platform device"
 	select USB_XHCI_RCAR if ARCH_RENESAS
+	select USB_PLATFORM_ROOTHUB
 	---help---
 	  Adds an xHCI host driver for a generic platform device, which
 	  provides a memory space and an irq.
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index e94bfd07e6c3..a0211cebac71 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -248,6 +248,12 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
+	xhci->platform_roothub = platform_roothub_init(sysdev);
+	if (IS_ERR(xhci->platform_roothub)) {
+		ret = PTR_ERR(xhci->platform_roothub);
+		goto disable_clk;
+	}
+
 	if (device_property_read_bool(sysdev, "usb3-lpm-capable"))
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 
@@ -266,10 +272,14 @@ static int xhci_plat_probe(struct platform_device *pdev)
 			goto put_usb3_hcd;
 	}
 
-	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
+	ret = platform_roothub_power_on(xhci->platform_roothub);
 	if (ret)
 		goto disable_usb_phy;
 
+	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
+	if (ret)
+		goto disable_platform_roothub;
+
 	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto dealloc_usb2_hcd;
@@ -280,6 +290,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 dealloc_usb2_hcd:
 	usb_remove_hcd(hcd);
 
+disable_platform_roothub:
+	platform_roothub_power_off(xhci->platform_roothub);
+
 disable_usb_phy:
 	usb_phy_shutdown(hcd->usb_phy);
 
@@ -305,6 +318,8 @@ static int xhci_plat_remove(struct platform_device *dev)
 	usb_remove_hcd(xhci->shared_hcd);
 	usb_phy_shutdown(hcd->usb_phy);
 
+	platform_roothub_power_off(xhci->platform_roothub);
+
 	usb_remove_hcd(hcd);
 	usb_put_hcd(xhci->shared_hcd);
 
@@ -320,6 +335,7 @@ static int xhci_plat_suspend(struct device *dev)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+	int ret;
 
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
@@ -329,15 +345,30 @@ static int xhci_plat_suspend(struct device *dev)
 	 * reconsider this when xhci_plat_suspend enlarges its scope, e.g.,
 	 * also applies to runtime suspend.
 	 */
-	return xhci_suspend(xhci, device_may_wakeup(dev));
+	ret = xhci_suspend(xhci, device_may_wakeup(dev));
+	if (ret)
+		return ret;
+
+	platform_roothub_power_off(xhci->platform_roothub);
+
+	return 0;
 }
 
 static int xhci_plat_resume(struct device *dev)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+	int ret;
 
-	return xhci_resume(xhci, 0);
+	ret = platform_roothub_power_on(xhci->platform_roothub);
+	if (ret)
+		return ret;
+
+	ret = xhci_resume(xhci, 0);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 static const struct dev_pm_ops xhci_plat_pm_ops = {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2d7b6374b58d..c1d384223419 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -34,6 +34,8 @@
 #include	"xhci-ext-caps.h"
 #include "pci-quirks.h"
 
+#include "platform-roothub.h"
+
 /* xHCI PCI Configuration Registers */
 #define XHCI_SBRN_OFFSET	(0x60)
 
@@ -1559,6 +1561,7 @@ struct xhci_hcd {
 	struct msix_entry	*msix_entries;
 	/* optional clock */
 	struct clk		*clk;
+	struct platform_roothub	*platform_roothub;
 	/* data structures */
 	struct xhci_device_context_array *dcbaa;
 	struct xhci_ring	*cmd_ring;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
