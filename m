From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [RFCv3 usb-next 3/3] usb: host: xhci: plat: integrate the platform-roothub
Date: Tue, 15 Aug 2017 00:45:42 +0200
Message-ID: <20170814224542.18257-4-martin.blumenstingl@googlemail.com>
References: <20170814224542.18257-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170814224542.18257-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
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
 Documentation/devicetree/bindings/usb/usb-xhci.txt |  7 +++++
 drivers/usb/host/Kconfig                           |  1 +
 drivers/usb/host/xhci-plat.c                       | 35 ++++++++++++++++++++--
 drivers/usb/host/xhci.h                            |  2 ++
 4 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 2d80b60eeabe..31b4f681e9ca 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -29,6 +29,13 @@ Optional properties:
   - usb3-lpm-capable: determines if platform is USB3 LPM capable
   - quirk-broken-port-ped: set if the controller has broken port disable mechanism
 
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
index b8b05c786b2a..3bdc49e89c0f 100644
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
index c04144b25a67..daf5bbcc310a 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -21,6 +21,7 @@
 #include <linux/slab.h>
 #include <linux/acpi.h>
 
+#include "platform-roothub.h"
 #include "xhci.h"
 #include "xhci-plat.h"
 #include "xhci-mvebu.h"
@@ -285,9 +286,19 @@ static int xhci_plat_probe(struct platform_device *pdev)
 			goto put_usb3_hcd;
 	}
 
+	xhci->platform_roothub = platform_roothub_init(sysdev);
+	if (IS_ERR(xhci->platform_roothub)) {
+		ret = PTR_ERR(xhci->platform_roothub);
+		goto disable_usb_phy;
+	}
+
+	ret = platform_roothub_power_on(xhci->platform_roothub);
+	if (ret)
+		goto exit_plat_roothub;
+
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret)
-		goto disable_usb_phy;
+		goto disable_plat_roothub;
 
 	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
 		xhci->shared_hcd->can_do_streams = 1;
@@ -311,6 +322,12 @@ static int xhci_plat_probe(struct platform_device *pdev)
 dealloc_usb2_hcd:
 	usb_remove_hcd(hcd);
 
+disable_plat_roothub:
+	platform_roothub_power_off(xhci->platform_roothub);
+
+exit_plat_roothub:
+	platform_roothub_exit(xhci->platform_roothub);
+
 disable_usb_phy:
 	usb_phy_shutdown(hcd->usb_phy);
 
@@ -342,6 +359,9 @@ static int xhci_plat_remove(struct platform_device *dev)
 	usb_remove_hcd(xhci->shared_hcd);
 	usb_phy_shutdown(hcd->usb_phy);
 
+	platform_roothub_power_off(xhci->platform_roothub);
+	platform_roothub_exit(xhci->platform_roothub);
+
 	usb_remove_hcd(hcd);
 	usb_put_hcd(xhci->shared_hcd);
 
@@ -374,7 +394,14 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
 	if (!device_may_wakeup(dev) && !IS_ERR(xhci->clk))
 		clk_disable_unprepare(xhci->clk);
 
-	return ret;
+	if (ret)
+		return ret;
+
+	ret = platform_roothub_power_off(xhci->platform_roothub);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 static int __maybe_unused xhci_plat_resume(struct device *dev)
@@ -386,6 +413,10 @@ static int __maybe_unused xhci_plat_resume(struct device *dev)
 	if (!device_may_wakeup(dev) && !IS_ERR(xhci->clk))
 		clk_prepare_enable(xhci->clk);
 
+	ret = platform_roothub_power_on(xhci->platform_roothub);
+	if (ret)
+		return ret;
+
 	ret = xhci_priv_resume_quirk(hcd);
 	if (ret)
 		return ret;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index e3e935291ed6..76118e254a54 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1725,6 +1725,8 @@ struct xhci_hcd {
 	int		msix_count;
 	/* optional clock */
 	struct clk		*clk;
+	/* optional platform root-hub */
+	struct platform_roothub	*platform_roothub;
 	/* data structures */
 	struct xhci_device_context_array *dcbaa;
 	struct xhci_ring	*cmd_ring;
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
