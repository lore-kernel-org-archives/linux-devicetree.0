From: Randy Li <ayaka@soulik.info>
Subject: [PATCH v10 1/2] usb: dwc2: assert phy reset when waking up in rk3288 platform
Date: Sun, 11 Dec 2016 23:36:07 +0800
Message-ID: <1481470568-32072-2-git-send-email-ayaka@soulik.info>
References: <1481470568-32072-1-git-send-email-ayaka@soulik.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481470568-32072-1-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: John.Youn@synopsys.com, kishon@ti.com, felipe.balbi@linux.intel.com, mark.rutland@arm.com, devicetree@vger.kernel.org, heiko@sntech.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, randy.li@rock-chips.com, Randy Li <ayaka@soulik.info>
List-Id: devicetree@vger.kernel.org

On the rk3288 USB host-only port (the one that's not the OTG-enabled
port) the PHY can get into a bad state when a wakeup is asserted (not
just a wakeup from full system suspend but also a wakeup from
autosuspend).

We can get the PHY out of its bad state by asserting its "port reset",
but unfortunately that seems to assert a reset onto the USB bus so it
could confuse things if we don't actually deenumerate / reenumerate the
device.

We can also get the PHY out of its bad state by fully resetting it using
the reset from the CRU (clock reset unit) in chip, which does a more full
reset.  The CRU-based reset appears to actually cause devices on the bus
to be removed and reinserted, which fixes the problem (albeit in a hacky
way).

It's unfortunate that we need to do a full re-enumeration of devices at
wakeup time, but this is better than alternative of letting the bus get
wedged.

Signed-off-by: Randy Li <ayaka@soulik.info>
Acked-by: John Youn <johnyoun@synopsys.com>
---
 drivers/usb/dwc2/core.h      |  1 +
 drivers/usb/dwc2/core_intr.c | 11 +++++++++++
 drivers/usb/dwc2/platform.c  |  9 +++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 9548d3e..0cd5896 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -919,6 +919,7 @@ struct dwc2_hsotg {
 	unsigned int ll_hw_enabled:1;
 
 	struct phy *phy;
+	struct work_struct phy_rst_work;
 	struct usb_phy *uphy;
 	struct dwc2_hsotg_plat *plat;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(dwc2_hsotg_supply_names)];
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 5b228ba..bf1c029 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -345,6 +345,7 @@ static void dwc2_handle_session_req_intr(struct dwc2_hsotg *hsotg)
 static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
 {
 	int ret;
+	struct device_node *np = hsotg->dev->of_node;
 
 	/* Clear interrupt */
 	dwc2_writel(GINTSTS_WKUPINT, hsotg->regs + GINTSTS);
@@ -379,6 +380,16 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
 			/* Restart the Phy Clock */
 			pcgcctl &= ~PCGCTL_STOPPCLK;
 			dwc2_writel(pcgcctl, hsotg->regs + PCGCTL);
+
+			/*
+			 * It is a quirk in Rockchip RK3288, causing by
+			 * a hardware bug. This will propagate out and
+			 * eventually we'll re-enumerate the device.
+			 * Not great but the best we can do.
+			 */
+			if (of_device_is_compatible(np, "rockchip,rk3288-usb"))
+				schedule_work(&hsotg->phy_rst_work);
+
 			mod_timer(&hsotg->wkp_timer,
 				  jiffies + msecs_to_jiffies(71));
 		} else {
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 4fc8c60..8ef278e 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -207,6 +207,14 @@ int dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg)
 	return ret;
 }
 
+/* Only used to reset usb phy at interrupter runtime */
+static void dwc2_reset_phy_work(struct work_struct *data)
+{
+	struct dwc2_hsotg *hsotg = container_of(data, struct dwc2_hsotg,
+			phy_rst_work);
+	phy_reset(hsotg->phy);
+}
+
 static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
 {
 	int i, ret;
@@ -251,6 +259,7 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
 			return ret;
 		}
 	}
+	INIT_WORK(&hsotg->phy_rst_work, dwc2_reset_phy_work);
 
 	if (!hsotg->phy) {
 		hsotg->uphy = devm_usb_get_phy(hsotg->dev, USB_PHY_TYPE_USB2);
-- 
2.7.4
