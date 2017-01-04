From: Manish Narani <manish.narani@xilinx.com>
Subject: [RFC PATCH] usb: dwc3: host: add support for OTG in DWC3 host driver
Date: Wed, 4 Jan 2017 18:52:59 +0530
Message-ID: <1483536181-22356-5-git-send-email-mnarani@xilinx.com>
References: <1483536181-22356-1-git-send-email-mnarani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483536181-22356-1-git-send-email-mnarani@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, balbi@kernel.org, gregkh@linuxfoundation.org, mathias.nyman@intel.com, agraf@suse.de, bharatku@xilinx.com, punnaiah.choudary.kalluri@xilinx.com, dhdang@apm.com, marc.zyngier@arm.com, mnarani@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: anirudh@xilinx.com, anuragku@xilinx.com
List-Id: devicetree@vger.kernel.org

This patch adds support for OTG host mode initialization in DWC3
host driver. Before the host initialization sequence begins. The
driver has to make sure the no OTG peripheral mode is enabled.

Signed-off-by: Manish Narani <mnarani@xilinx.com>
---
 drivers/usb/dwc3/host.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 487f0ff..4caa3fe 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -16,6 +16,8 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
 
 #include "core.h"
 
@@ -111,6 +113,18 @@ int dwc3_host_init(struct dwc3 *dwc)
 	phy_create_lookup(dwc->usb3_generic_phy, "usb3-phy",
 			  dev_name(dwc->dev));
 
+	if (dwc->dr_mode == USB_DR_MODE_OTG) {
+		struct usb_phy *phy;
+		/* Switch otg to host mode */
+		phy = usb_get_phy(USB_PHY_TYPE_USB3);
+		if (!IS_ERR(phy)) {
+			if (phy && phy->otg)
+				otg_set_host(phy->otg,
+						(struct usb_bus *)(long)1);
+			usb_put_phy(phy);
+		}
+	}
+
 	ret = platform_device_add(xhci);
 	if (ret) {
 		dev_err(dwc->dev, "failed to register xHCI device\n");
-- 
2.1.1
