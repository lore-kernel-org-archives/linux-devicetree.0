From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH 1/2] usb: phy: msm: Use extcon framework for VBUS and ID detection
Date: Thu,  9 Apr 2015 11:34:22 +0300
Message-ID: <1428568462-20193-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On recent Qualcomm platforms VBUS and ID lines are not routed to
USB PHY LINK controller. Use extcon framework to receive connect
and disconnect ID and VBUS notification.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 .../devicetree/bindings/usb/msm-hsusb.txt          |  7 ++
 drivers/usb/phy/Kconfig                            |  1 +
 drivers/usb/phy/phy-msm-usb.c                      | 84 ++++++++++++++++++++++
 include/linux/usb/msm_hsusb.h                      | 17 +++++
 4 files changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/msm-hsusb.txt b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
index 2826f2a..f26bcfa 100644
--- a/Documentation/devicetree/bindings/usb/msm-hsusb.txt
+++ b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
@@ -69,6 +69,13 @@ Optional properties:
                 (no, min, max) where each value represents either a voltage
                 in microvolts or a value corresponding to voltage corner.

+- extcon:       phandles to external connector devices. First phandle
+                should point to external connector, which provide "USB"
+                cable events, the second should point to external connector
+                device, which provide "USB-HOST" cable events. If one of
+                the external connector devices is not required empty <0>
+                phandle should be specified.
+
 Example HSUSB OTG controller device node:

     usb@f9a55000 {
diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 52d3d58..ca584ef 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -141,6 +141,7 @@ config USB_MSM_OTG
 	tristate "Qualcomm on-chip USB OTG controller support"
 	depends on (USB || USB_GADGET) && (ARCH_MSM || ARCH_QCOM || COMPILE_TEST)
 	depends on RESET_CONTROLLER
+	depends on EXTCON
 	select USB_PHY
 	help
 	  Enable this to support the USB OTG transceiver on Qualcomm chips. It
diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
index 000fd89..d47c3eb 100644
--- a/drivers/usb/phy/phy-msm-usb.c
+++ b/drivers/usb/phy/phy-msm-usb.c
@@ -1445,9 +1445,42 @@ static const struct of_device_id msm_otg_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, msm_otg_dt_match);

+static int msm_otg_vbus_notifier(struct notifier_block *nb, unsigned long event,
+				void *ptr)
+{
+	struct msm_usb_cable *vbus = container_of(nb, struct msm_usb_cable, nb);
+	struct msm_otg *motg = container_of(vbus, struct msm_otg, vbus);
+
+	if (event)
+		set_bit(B_SESS_VLD, &motg->inputs);
+	else
+		clear_bit(B_SESS_VLD, &motg->inputs);
+
+	schedule_work(&motg->sm_work);
+
+	return NOTIFY_DONE;
+}
+
+static int msm_otg_id_notifier(struct notifier_block *nb, unsigned long event,
+				void *ptr)
+{
+	struct msm_usb_cable *id = container_of(nb, struct msm_usb_cable, nb);
+	struct msm_otg *motg = container_of(id, struct msm_otg, id);
+
+	if (event)
+		clear_bit(ID, &motg->inputs);
+	else
+		set_bit(ID, &motg->inputs);
+
+	schedule_work(&motg->sm_work);
+
+	return NOTIFY_DONE;
+}
+
 static int msm_otg_read_dt(struct platform_device *pdev, struct msm_otg *motg)
 {
 	struct msm_otg_platform_data *pdata;
+	struct extcon_dev *ext_id, *ext_vbus;
 	const struct of_device_id *id;
 	struct device_node *node = pdev->dev.of_node;
 	struct property *prop;
@@ -1496,6 +1529,52 @@ static int msm_otg_read_dt(struct platform_device *pdev, struct msm_otg *motg)
 		motg->vdd_levels[VDD_LEVEL_MAX] = tmp[VDD_LEVEL_MAX];
 	}

+	ext_id = ERR_PTR(-ENODEV);
+	ext_vbus = ERR_PTR(-ENODEV);
+	if (of_property_read_bool(node, "extcon")) {
+
+		/* Each one of them is not mandatory */
+		ext_vbus = extcon_get_edev_by_phandle(&pdev->dev, 0);
+		if (IS_ERR(ext_vbus) && PTR_ERR(ext_vbus) != -ENODEV)
+			return PTR_ERR(ext_vbus);
+
+		ext_id = extcon_get_edev_by_phandle(&pdev->dev, 1);
+		if (IS_ERR(ext_id) && PTR_ERR(ext_id) != -ENODEV)
+			return PTR_ERR(ext_id);
+	}
+
+	if (!IS_ERR(ext_vbus)) {
+		motg->vbus.nb.notifier_call = msm_otg_vbus_notifier;
+		ret = extcon_register_interest(&motg->vbus.conn, ext_vbus->name,
+					       "USB", &motg->vbus.nb);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "register VBUS notifier failed\n");
+			return ret;
+		}
+
+		ret = extcon_get_cable_state(ext_vbus, "USB");
+		if (ret)
+			set_bit(B_SESS_VLD, &motg->inputs);
+		else
+			clear_bit(B_SESS_VLD, &motg->inputs);
+	}
+
+	if (!IS_ERR(ext_id)) {
+		motg->id.nb.notifier_call = msm_otg_id_notifier;
+		ret = extcon_register_interest(&motg->id.conn, ext_id->name,
+					       "USB-HOST", &motg->id.nb);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "register ID notifier failed\n");
+			return ret;
+		}
+
+		ret = extcon_get_cable_state(ext_id, "USB-HOST");
+		if (ret)
+			clear_bit(ID, &motg->inputs);
+		else
+			set_bit(ID, &motg->inputs);
+	}
+
 	prop = of_find_property(node, "qcom,phy-init-sequence", &len);
 	if (!prop || !len)
 		return 0;
@@ -1719,6 +1798,11 @@ static int msm_otg_remove(struct platform_device *pdev)
 	if (phy->otg->host || phy->otg->gadget)
 		return -EBUSY;

+	if (motg->id.conn.edev)
+		extcon_unregister_interest(&motg->id.conn);
+	if (motg->vbus.conn.edev)
+		extcon_unregister_interest(&motg->vbus.conn);
+
 	msm_otg_debugfs_cleanup();
 	cancel_delayed_work_sync(&motg->chg_work);
 	cancel_work_sync(&motg->sm_work);
diff --git a/include/linux/usb/msm_hsusb.h b/include/linux/usb/msm_hsusb.h
index b0a3924..9a38e77 100644
--- a/include/linux/usb/msm_hsusb.h
+++ b/include/linux/usb/msm_hsusb.h
@@ -18,6 +18,7 @@
 #ifndef __ASM_ARCH_MSM_HSUSB_H
 #define __ASM_ARCH_MSM_HSUSB_H

+#include <linux/extcon.h>
 #include <linux/types.h>
 #include <linux/usb/otg.h>
 #include <linux/clk.h>
@@ -122,6 +123,17 @@ struct msm_otg_platform_data {
 };

 /**
+ * struct msm_usb_cable - structure for exteternal connector cable
+ *			  state tracking
+ * @nb: hold event notification callback
+ * @conn: used for notification registration
+ */
+struct msm_usb_cable {
+	struct notifier_block		nb;
+	struct extcon_specific_cable_nb conn;
+};
+
+/**
  * struct msm_otg: OTG driver data. Shared by HCD and DCD.
  * @otg: USB OTG Transceiver structure.
  * @pdata: otg device platform data.
@@ -141,6 +153,8 @@ struct msm_otg_platform_data {
  * @chg_type: The type of charger attached.
  * @dcd_retires: The retry count used to track Data contact
  *               detection process.
+ * @vbus: VBUS signal state trakining, using extcon framework
+ * @id: ID signal state trakining, using extcon framework
  */
 struct msm_otg {
 	struct usb_phy phy;
@@ -170,6 +184,9 @@ struct msm_otg {
 	struct reset_control *phy_rst;
 	struct reset_control *link_rst;
 	int vdd_levels[3];
+
+	struct msm_usb_cable vbus;
+	struct msm_usb_cable id;
 };

 #endif
--
1.9.1
