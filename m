From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 1/2] usb: dwc2: optionally assert phy "full reset" when waking up
Date: Fri, 30 Oct 2015 13:17:53 -0700
Message-ID: <1446236275-12698-2-git-send-email-dianders@chromium.org>
References: <1446236275-12698-1-git-send-email-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446236275-12698-1-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: johnyoun@synopsys.com, balbi@ti.com
Cc: heiko@sntech.de, gregkh@linuxfoundation.org, lyz@rock-chips.com, wulf@rock-chips.com, Doug Anderson <dianders@chromium.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, paulz@synopsys.com, gregory.herrero@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Doug Anderson <dianders@chromium.org>

On the rk3288 USB host-only port (the one that's not the OTG-enabled
port) the PHY can get into a bad state when a wakeup is asserted (not
just a wakeup from full system suspend but also a wakeup from
autosuspend).

We can get the PHY out of its bad state by asserting its "port reset",
but unfortunately that seems to assert a reset onto the USB bus so it
could confuse things if we don't actually deenumerate / reenumerate the
device.

We can also get the PHY out of its bad state by fully resetting it using
the reset from the CRU (clock reset unit), which does a more full
reset.  The CRU-based reset appears to actually cause devices on the bus
to be removed and reinserted, which fixes the problem (albeit in a hacky
way).

It's unfortunate that we need to do a full re-enumeration of devices at
wakeup time, but this is better than alternative of letting the bus get
wedged.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Yunzhi Li <lyz@rock-chips.com>
---
Changes in v2:
- Use a full PHY reset for safety; no PHY changes needed for that.

 Documentation/devicetree/bindings/usb/dwc2.txt |  7 +++++++
 drivers/usb/dwc2/core.h                        |  5 +++++
 drivers/usb/dwc2/core_intr.c                   | 14 ++++++++++++++
 drivers/usb/dwc2/platform.c                    | 13 +++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index fd132cbee70e..0de78c48c12d 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -17,6 +17,13 @@ Refer to clk/clock-bindings.txt for generic clock consumer properties
 Optional properties:
 - phys: phy provider specifier
 - phy-names: shall be "usb2-phy"
+- snps,need-phy-full-reset-on-wake: if present indicates that we need to reset
+  the PHY when we detect a wakeup due to a hardware errata.  If present you
+  must specify a "phy-full-reset" reset.
+
+Resets:
+- phy-full-reset (optional): Fully resets the PHY.
+
 Refer to phy/phy-bindings.txt for generic phy consumer properties
 - dr_mode: shall be one of "host", "peripheral" and "otg"
   Refer to usb/generic.txt
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index a66d3cb62b65..ce1ef961ae6c 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -582,8 +582,11 @@ struct dwc2_hregs_backup {
  * @hcd_enabled		Host mode sub-driver initialization indicator.
  * @gadget_enabled	Peripheral mode sub-driver initialization indicator.
  * @ll_hw_enabled	Status of low-level hardware resources.
+ * @need_phy_full_reset_on_wake: Quirk saying that we should assert
+ *                               phy_full_reset on a remote wakeup.
  * @phy:                The otg phy transceiver structure for phy control.
  * @uphy:               The otg phy transceiver structure for old USB phy control.
+ * @phy_full_reset:     Reset control for the PHY's "full reset".
  * @plat:               The platform specific configuration data. This can be removed once
  *                      all SoCs support usb transceiver.
  * @supplies:           Definition of USB power supplies
@@ -710,9 +713,11 @@ struct dwc2_hsotg {
 	unsigned int hcd_enabled:1;
 	unsigned int gadget_enabled:1;
 	unsigned int ll_hw_enabled:1;
+	unsigned int need_phy_full_reset_on_wake:1;
 
 	struct phy *phy;
 	struct usb_phy *uphy;
+	struct reset_control *phy_full_reset;
 	struct dwc2_hsotg_plat *plat;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(dwc2_hsotg_supply_names)];
 	u32 phyif;
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 27daa42788b1..275484260192 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -45,6 +45,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/reset.h>
 #include <linux/usb.h>
 
 #include <linux/usb/hcd.h>
@@ -378,6 +379,19 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
 			/* Restart the Phy Clock */
 			pcgcctl &= ~PCGCTL_STOPPCLK;
 			dwc2_writel(pcgcctl, hsotg->regs + PCGCTL);
+
+			/*
+			 * If we've got this quirk then the PHY is stuck upon
+			 * wakeup.  Assert reset.  This will propagate out and
+			 * eventually we'll re-enumerate the device.  Not great
+			 * but the best we can do.
+			 */
+			if (hsotg->need_phy_full_reset_on_wake) {
+				reset_control_assert(hsotg->phy_full_reset);
+				udelay(50);
+				reset_control_deassert(hsotg->phy_full_reset);
+			}
+
 			mod_timer(&hsotg->wkp_timer,
 				  jiffies + msecs_to_jiffies(71));
 		} else {
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 5859b0fa19ee..1379b9cb0d39 100644
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
 
+	hsotg->need_phy_full_reset_on_wake =
+		of_property_read_bool(dev->dev.of_node,
+				      "snps,need-phy-full-reset-on-wake");
+	hsotg->phy_full_reset = devm_reset_control_get(hsotg->dev,
+						       "phy-full-reset");
+	if (IS_ERR(hsotg->phy_full_reset) &&
+	    hsotg->need_phy_full_reset_on_wake) {
+		dev_warn(hsotg->dev, "Missing phy full reset (%ld); skipping\n",
+			 PTR_ERR(hsotg->phy_full_reset));
+		hsotg->need_phy_full_reset_on_wake = false;
+	}
+
 	retval = dwc2_lowlevel_hw_init(hsotg);
 	if (retval)
 		return retval;
-- 
2.6.0.rc2.230.g3dd15c0
