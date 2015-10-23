From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 2/4] usb: dwc2: optionally assert phy "port reset" when waking up
Date: Fri, 23 Oct 2015 11:28:09 -0700
Message-ID: <1445624891-31680-3-git-send-email-dianders@chromium.org>
References: <1445624891-31680-1-git-send-email-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445624891-31680-1-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, kishon@ti.com, johnyoun@synopsys.com, balbi@ti.com
Cc: gregkh@linuxfoundation.org, lyz@rock-chips.com, wulf@rock-chips.com, Douglas Anderson <dianders@chromium.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, paulz@synopsys.com, gregory.herrero@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On the rk3288 USB host-only port (the one that's not the OTG-enabled
port) the phy can get into a bad state when a wakeup is asserted (not
just a wakeup from full system suspend but also a wakeup from
autosuspend).  Asserting the "port reset" bit in the PHY upon wakeup
seems to resolve the issue.

Here we add the ability to specify the PHY "port reset" source to dwc2
and add a quirk property that says that we should assert the PHY "port
reset" source when we get a wakeup.

See the patch ("phy: rockchip-usb: Support the PHY's "port reset"") for
some details on the reset that we plan to use.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Yunzhi Li <lyz@rock-chips.com>
---
 Documentation/devicetree/bindings/usb/dwc2.txt |  7 +++++++
 drivers/usb/dwc2/core.h                        |  5 +++++
 drivers/usb/dwc2/core_intr.c                   |  7 +++++++
 drivers/usb/dwc2/platform.c                    | 13 +++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index fd132cb..36c4919 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -17,6 +17,13 @@ Refer to clk/clock-bindings.txt for generic clock consumer properties
 Optional properties:
 - phys: phy provider specifier
 - phy-names: shall be "usb2-phy"
+- snps,need-phy-port-reset-on-wake: if present indicates that we need to assert
+  the PHY "port reset" when we detect a wakeup due to a hardware errata.  If
+  present you must specify a "phy-port-reset" reset.
+
+Resets:
+- phy-port-reset (optional): Asserts the PHY's "port reset".
+
 Refer to phy/phy-bindings.txt for generic phy consumer properties
 - dr_mode: shall be one of "host", "peripheral" and "otg"
   Refer to usb/generic.txt
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index a66d3cb..5cd58ab 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -582,8 +582,11 @@ struct dwc2_hregs_backup {
  * @hcd_enabled		Host mode sub-driver initialization indicator.
  * @gadget_enabled	Peripheral mode sub-driver initialization indicator.
  * @ll_hw_enabled	Status of low-level hardware resources.
+ * @need_phy_port_reset_on_wake: Quirk saying that we should assert
+ *                               phy_port_reset on a remote wakeup.
  * @phy:                The otg phy transceiver structure for phy control.
  * @uphy:               The otg phy transceiver structure for old USB phy control.
+ * @phy_port_reset:     Reset control for the PHY's "port reset".
  * @plat:               The platform specific configuration data. This can be removed once
  *                      all SoCs support usb transceiver.
  * @supplies:           Definition of USB power supplies
@@ -710,9 +713,11 @@ struct dwc2_hsotg {
 	unsigned int hcd_enabled:1;
 	unsigned int gadget_enabled:1;
 	unsigned int ll_hw_enabled:1;
+	unsigned int need_phy_port_reset_on_wake:1;
 
 	struct phy *phy;
 	struct usb_phy *uphy;
+	struct reset_control *phy_port_reset;
 	struct dwc2_hsotg_plat *plat;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(dwc2_hsotg_supply_names)];
 	u32 phyif;
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 27daa42..52e22a5 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -45,6 +45,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/reset.h>
 #include <linux/usb.h>
 
 #include <linux/usb/hcd.h>
@@ -378,6 +379,12 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
 			/* Restart the Phy Clock */
 			pcgcctl &= ~PCGCTL_STOPPCLK;
 			dwc2_writel(pcgcctl, hsotg->regs + PCGCTL);
+
+			if (hsotg->need_phy_port_reset_on_wake) {
+				reset_control_assert(hsotg->phy_port_reset);
+				reset_control_deassert(hsotg->phy_port_reset);
+			}
+
 			mod_timer(&hsotg->wkp_timer,
 				  jiffies + msecs_to_jiffies(71));
 		} else {
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 5859b0f..2f7b5d0 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -45,6 +45,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_data/s3c-hsotg.h>
+#include <linux/reset.h>
 
 #include <linux/usb/of.h>
 
@@ -376,6 +377,18 @@ static int dwc2_driver_probe(struct platform_device *dev)
 			"Configuration mismatch. Forcing peripheral mode\n");
 	}
 
+	hsotg->need_phy_port_reset_on_wake =
+		of_property_read_bool(dev->dev.of_node,
+				      "snps,need-phy-port-reset-on-wake");
+	hsotg->phy_port_reset = devm_reset_control_get(hsotg->dev,
+						       "phy-port-reset");
+	if (IS_ERR(hsotg->phy_port_reset) &&
+	    hsotg->need_phy_port_reset_on_wake) {
+		dev_warn(hsotg->dev, "Missing phy port reset (%ld); skipping\n",
+			 PTR_ERR(hsotg->phy_port_reset));
+		hsotg->need_phy_port_reset_on_wake = false;
+	}
+
 	retval = dwc2_lowlevel_hw_init(hsotg);
 	if (retval)
 		return retval;
-- 
2.6.0.rc2.230.g3dd15c0
