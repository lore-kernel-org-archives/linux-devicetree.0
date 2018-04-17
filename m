From: Yossi Mansharoff <yossim@codeaurora.org>
Subject: [PATCH v2] usb: chipidea: Hook into mux framework to toggle usb switch
Date: Tue, 17 Apr 2018 16:52:28 +0300
Message-ID: <1523973148-2094-1-git-send-email-yossim@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <Peter.Chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:CHIPIDEA USB HIGH SPEED DUAL ROLE
        CONTROLLER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: robh@kernel.org, swboyd@chromium.org, Yossi Mansharoff <yossim@codeaurora.org>, Peter Rosin <peda@axentia.se>, Peter Chen <peter.chen@nxp.com>, devicetree@vger.kernel.org, Stephen Boyd <stephen.boyd@linaro.org>
List-Id: devicetree@vger.kernel.org

On the db410c 96boards platform we have a TC7USB40MU on the board
to mux the D+/D- lines coming from the controller between a micro
usb "device" port and a USB hub for "host" roles[1]. During a
role switch, we need to toggle this mux to forward the D+/D-
lines to either the port or the hub. Add the necessary code to do
the role switch in chipidea core via the generic mux framework.
Board configurations like on db410c are expected to change roles
via the sysfs API described in
Documentation/ABI/testing/sysfs-platform-chipidea-usb2.

[1] https://github.com/96boards/documentation/raw/master/ConsumerEdition/DragonBoard-410c/HardwareDocs/Schematics_DragonBoard.pdf

Cc: Peter Rosin <peda@axentia.se>
Cc: Peter Chen <peter.chen@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: <devicetree@vger.kernel.org>
Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>

Signed-off-by: Yossi Mansharoff <yossim@codeaurora.org>
---
 drivers/usb/chipidea/Kconfig |  2 ++
 drivers/usb/chipidea/core.c  |  5 +++++
 drivers/usb/chipidea/host.c  |  7 +++++++
 drivers/usb/chipidea/udc.c   | 13 ++++++++++++-
 include/linux/usb/chipidea.h |  2 ++
 5 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
index 785f0ed..6a8e635 100644
--- a/drivers/usb/chipidea/Kconfig
+++ b/drivers/usb/chipidea/Kconfig
@@ -3,6 +3,8 @@ config USB_CHIPIDEA
 	depends on ((USB_EHCI_HCD && USB_GADGET) || (USB_EHCI_HCD && !USB_GADGET) || (!USB_EHCI_HCD && USB_GADGET)) && HAS_DMA
 	select EXTCON
 	select RESET_CONTROLLER
+	select MULTIPLEXER
+	select MUX_GPIO
 	help
 	  Say Y here if your system has a dual role high speed USB
 	  controller based on ChipIdea silicon IP. It supports:
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 33ae87f..8fa0991 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -61,6 +61,7 @@
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/ehci_def.h>
+#include <linux/mux/consumer.h>
 
 #include "ci.h"
 #include "udc.h"
@@ -687,6 +688,10 @@ static int ci_get_platdata(struct device *dev,
 	if (of_find_property(dev->of_node, "non-zero-ttctrl-ttha", NULL))
 		platdata->flags |= CI_HDRC_SET_NON_ZERO_TTHA;
 
+	platdata->usb_switch = devm_mux_control_get_optional(dev, "usb_switch");
+	if (IS_ERR(platdata->usb_switch))
+		return PTR_ERR(platdata->usb_switch);
+
 	ext_id = ERR_PTR(-ENODEV);
 	ext_vbus = ERR_PTR(-ENODEV);
 	if (of_property_read_bool(dev->of_node, "extcon")) {
diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index af45aa32..d9d2d00 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -13,6 +13,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/usb/chipidea.h>
 #include <linux/regulator/consumer.h>
+#include <linux/mux/consumer.h>
 
 #include "../host/ehci.h"
 
@@ -161,6 +162,10 @@ static int host_start(struct ci_hdrc *ci)
 		if (ci_otg_is_fsm_mode(ci)) {
 			otg->host = &hcd->self;
 			hcd->self.otg_port = 1;
+		} else {
+			ret = mux_control_select(ci->platdata->usb_switch, 1);
+			if (ret)
+				goto disable_reg;
 		}
 	}
 
@@ -181,6 +186,8 @@ static void host_stop(struct ci_hdrc *ci)
 	struct usb_hcd *hcd = ci->hcd;
 
 	if (hcd) {
+		if (!ci_otg_is_fsm_mode(ci))
+			mux_control_deselect(ci->platdata->usb_switch);
 		if (ci->platdata->notify_event)
 			ci->platdata->notify_event(ci,
 				CI_HDRC_CONTROLLER_STOPPED_EVENT);
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 9852ec5..209d3f6 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -19,6 +19,7 @@
 #include <linux/usb/gadget.h>
 #include <linux/usb/otg-fsm.h>
 #include <linux/usb/chipidea.h>
+#include <linux/mux/consumer.h>
 
 #include "ci.h"
 #include "udc.h"
@@ -1965,16 +1966,26 @@ void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
 
 static int udc_id_switch_for_device(struct ci_hdrc *ci)
 {
+	int ret = 0;
+
 	if (ci->is_otg)
 		/* Clear and enable BSV irq */
 		hw_write_otgsc(ci, OTGSC_BSVIS | OTGSC_BSVIE,
 					OTGSC_BSVIS | OTGSC_BSVIE);
 
-	return 0;
+	if (!ci_otg_is_fsm_mode(ci))
+		ret = mux_control_select(ci->platdata->usb_switch, 0);
+
+	if (ci->is_otg && ret)
+		hw_write_otgsc(ci, OTGSC_BSVIE | OTGSC_BSVIS, OTGSC_BSVIS);
+
+	return ret;
 }
 
 static void udc_id_switch_for_host(struct ci_hdrc *ci)
 {
+	mux_control_deselect(ci->platdata->usb_switch);
+
 	/*
 	 * host doesn't care B_SESSION_VALID event
 	 * so clear and disbale BSV irq
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index 07f9936..9ea55a1 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -10,6 +10,7 @@
 #include <linux/usb/otg.h>
 
 struct ci_hdrc;
+struct mux_control;
 
 /**
  * struct ci_hdrc_cable - structure for external connector cable state tracking
@@ -76,6 +77,7 @@ struct ci_hdrc_platform_data {
 	/* VBUS and ID signal state tracking, using extcon framework */
 	struct ci_hdrc_cable		vbus_extcon;
 	struct ci_hdrc_cable		id_extcon;
+	struct mux_control		*usb_switch;
 	u32			phy_clkgate_delay_us;
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
