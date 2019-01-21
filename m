From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 02/10] usb: host: xhci: mvebu: add reset on resume quirk
Date: Mon, 21 Jan 2019 12:23:28 +0100
Message-ID: <20190121112336.23489-3-miquel.raynal@bootlin.com>
References: <20190121112336.23489-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190121112336.23489-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, linux-usb@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Ofer Heifetz <oferh@marvell.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Ofer Heifetz <oferh@marvell.com>

The mvebu xHCI host driver does not have suspend/resume support. Use of
the XHCI_RESET_ON_RESUME quirk is mandatory in order to avoid failures
after resume. This will work only if no USB device is plugged-in.

While at it, mention in the Kconfig file that this IP is also present
on the A3700 SoC.

Signed-off-by: Ofer Heifetz <oferh@marvell.com>
[miquel.raynal@bootlin.com: Reword the commit message]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/usb/host/Kconfig      |  4 ++--
 drivers/usb/host/xhci-mvebu.c | 11 +++++++++++
 drivers/usb/host/xhci-mvebu.h |  6 ++++++
 drivers/usb/host/xhci-plat.c  |  7 +++++++
 4 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 16758b12a5e9..3a32f5e45840 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -69,13 +69,13 @@ config USB_XHCI_MTK
 	  If unsure, say N.
 
 config USB_XHCI_MVEBU
-	tristate "xHCI support for Marvell Armada 375/38x"
+	tristate "xHCI support for Marvell Armada 375/38x/37xx"
 	select USB_XHCI_PLATFORM
 	depends on HAS_IOMEM
 	depends on ARCH_MVEBU || COMPILE_TEST
 	---help---
 	  Say 'Y' to enable the support for the xHCI host controller
-	  found in Marvell Armada 375/38x ARM SOCs.
+	  found in Marvell Armada 375/38x/37xx ARM SOCs.
 
 config USB_XHCI_RCAR
 	tristate "xHCI support for Renesas R-Car SoCs"
diff --git a/drivers/usb/host/xhci-mvebu.c b/drivers/usb/host/xhci-mvebu.c
index 32e158568788..60651a50770f 100644
--- a/drivers/usb/host/xhci-mvebu.c
+++ b/drivers/usb/host/xhci-mvebu.c
@@ -13,6 +13,7 @@
 #include <linux/usb/hcd.h>
 
 #include "xhci-mvebu.h"
+#include "xhci.h"
 
 #define USB3_MAX_WINDOWS	4
 #define USB3_WIN_CTRL(w)	(0x0 + ((w) * 8))
@@ -72,3 +73,13 @@ int xhci_mvebu_mbus_init_quirk(struct usb_hcd *hcd)
 
 	return 0;
 }
+
+int xhci_mvebu_a3700_init_quirk(struct usb_hcd *hcd)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+
+	/* Without reset on resume, the HC won't work at all */
+	xhci->quirks |= XHCI_RESET_ON_RESUME;
+
+	return 0;
+}
diff --git a/drivers/usb/host/xhci-mvebu.h b/drivers/usb/host/xhci-mvebu.h
index 09791df2cec0..ca0a3a5721dd 100644
--- a/drivers/usb/host/xhci-mvebu.h
+++ b/drivers/usb/host/xhci-mvebu.h
@@ -12,10 +12,16 @@ struct usb_hcd;
 
 #if IS_ENABLED(CONFIG_USB_XHCI_MVEBU)
 int xhci_mvebu_mbus_init_quirk(struct usb_hcd *hcd);
+int xhci_mvebu_a3700_init_quirk(struct usb_hcd *hcd);
 #else
 static inline int xhci_mvebu_mbus_init_quirk(struct usb_hcd *hcd)
 {
 	return 0;
 }
+
+static inline int xhci_mvebu_a3700_init_quirk(struct usb_hcd *hcd)
+{
+	return 0;
+}
 #endif
 #endif /* __LINUX_XHCI_MVEBU_H */
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index ef09cb06212f..0ac4ec975547 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -98,6 +98,10 @@ static const struct xhci_plat_priv xhci_plat_marvell_armada = {
 	.init_quirk = xhci_mvebu_mbus_init_quirk,
 };
 
+static const struct xhci_plat_priv xhci_plat_marvell_armada3700 = {
+	.init_quirk = xhci_mvebu_a3700_init_quirk,
+};
+
 static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen2 = {
 	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V1,
 	.init_quirk = xhci_rcar_init_quirk,
@@ -123,6 +127,9 @@ static const struct of_device_id usb_xhci_of_match[] = {
 	}, {
 		.compatible = "marvell,armada-380-xhci",
 		.data = &xhci_plat_marvell_armada,
+	}, {
+		.compatible = "marvell,armada3700-xhci",
+		.data = &xhci_plat_marvell_armada3700,
 	}, {
 		.compatible = "renesas,xhci-r8a7790",
 		.data = &xhci_plat_renesas_rcar_gen2,
-- 
2.19.1
