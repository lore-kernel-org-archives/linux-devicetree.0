From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH v2] usb: phy: msm: Add D+/D- lines route control
Date: Tue, 28 Jul 2015 11:10:22 +0300
Message-ID: <1438071022-17580-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: ": Rob Herring" <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

apq8016-sbc board is using Dual SPDT USB Switch (TC7USB40MU),
witch is controlled by GPIO to de/multiplex D+/D- USB lines to
USB2513B Hub and uB connector. Add support for this.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---

* Rebased on current testing/next.

 .../devicetree/bindings/usb/msm-hsusb.txt          |  4 ++
 drivers/usb/phy/phy-msm-usb.c                      | 47 ++++++++++++++++++++++
 include/linux/usb/msm_hsusb.h                      |  7 ++++
 3 files changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/msm-hsusb.txt b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
index bd8d9e7..8654a3e 100644
--- a/Documentation/devicetree/bindings/usb/msm-hsusb.txt
+++ b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
@@ -52,6 +52,10 @@ Required properties:
 Optional properties:
 - dr_mode:      One of "host", "peripheral" or "otg". Defaults to "otg"

+- switch-gpio:  A phandle + gpio-specifier pair. Some boards are using Dual
+                SPDT USB Switch, witch is cotrolled by GPIO to de/multiplex
+                D+/D- USB lines between connectors.
+
 - qcom,phy-init-sequence: PHY configuration sequence values. This is related to Device
                 Mode Eye Diagram test. Start address at which these values will be
                 written is ULPI_EXT_VENDOR_SPECIFIC. Value of -1 is reserved as
diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
index 61d86d8..c58c3c0 100644
--- a/drivers/usb/phy/phy-msm-usb.c
+++ b/drivers/usb/phy/phy-msm-usb.c
@@ -18,6 +18,7 @@

 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/slab.h>
@@ -32,6 +33,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/reboot.h>
 #include <linux/reset.h>

 #include <linux/usb.h>
@@ -1471,6 +1473,14 @@ static int msm_otg_vbus_notifier(struct notifier_block *nb, unsigned long event,
 	else
 		clear_bit(B_SESS_VLD, &motg->inputs);

+	if (test_bit(B_SESS_VLD, &motg->inputs)) {
+		/* Switch D+/D- lines to Device connector */
+		gpiod_set_value_cansleep(motg->switch_gpio, 0);
+	} else {
+		/* Switch D+/D- lines to Hub */
+		gpiod_set_value_cansleep(motg->switch_gpio, 1);
+	}
+
 	schedule_work(&motg->sm_work);

 	return NOTIFY_DONE;
@@ -1546,6 +1556,11 @@ static int msm_otg_read_dt(struct platform_device *pdev, struct msm_otg *motg)

 	motg->manual_pullup = of_property_read_bool(node, "qcom,manual-pullup");

+	motg->switch_gpio = devm_gpiod_get_optional(&pdev->dev, "switch",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(motg->switch_gpio))
+		return PTR_ERR(motg->switch_gpio);
+
 	ext_id = ERR_PTR(-ENODEV);
 	ext_vbus = ERR_PTR(-ENODEV);
 	if (of_property_read_bool(node, "extcon")) {
@@ -1617,6 +1632,19 @@ static int msm_otg_read_dt(struct platform_device *pdev, struct msm_otg *motg)
 	return 0;
 }

+static int msm_otg_reboot_notify(struct notifier_block *this,
+				 unsigned long code, void *unused)
+{
+	struct msm_otg *motg = container_of(this, struct msm_otg, reboot);
+
+	/*
+	 * Ensure that D+/D- lines are routed to uB connector, so
+	 * we could load bootloader/kernel at next reboot
+	 */
+	gpiod_set_value_cansleep(motg->switch_gpio, 0);
+	return NOTIFY_DONE;
+}
+
 static int msm_otg_probe(struct platform_device *pdev)
 {
 	struct regulator_bulk_data regs[3];
@@ -1781,6 +1809,17 @@ static int msm_otg_probe(struct platform_device *pdev)
 			dev_dbg(&pdev->dev, "Can not create mode change file\n");
 	}

+	if (test_bit(B_SESS_VLD, &motg->inputs)) {
+		/* Switch D+/D- lines to Device connector */
+		gpiod_set_value_cansleep(motg->switch_gpio, 0);
+	} else {
+		/* Switch D+/D- lines to Hub */
+		gpiod_set_value_cansleep(motg->switch_gpio, 1);
+	}
+
+	motg->reboot.notifier_call = msm_otg_reboot_notify;
+	register_reboot_notifier(&motg->reboot);
+
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);

@@ -1807,6 +1846,14 @@ static int msm_otg_remove(struct platform_device *pdev)
 	if (phy->otg->host || phy->otg->gadget)
 		return -EBUSY;

+	unregister_reboot_notifier(&motg->reboot);
+
+	/*
+	 * Ensure that D+/D- lines are routed to uB connector, so
+	 * we could load bootloader/kernel at next reboot
+	 */
+	gpiod_set_value_cansleep(motg->switch_gpio, 0);
+
 	extcon_unregister_notifier(motg->id.extcon, EXTCON_USB_HOST, &motg->id.nb);
 	extcon_unregister_notifier(motg->vbus.extcon, EXTCON_USB, &motg->vbus.nb);

diff --git a/include/linux/usb/msm_hsusb.h b/include/linux/usb/msm_hsusb.h
index 5df2c8f..8c8f685 100644
--- a/include/linux/usb/msm_hsusb.h
+++ b/include/linux/usb/msm_hsusb.h
@@ -155,6 +155,10 @@ struct msm_usb_cable {
  *	starting controller using usbcmd run/stop bit.
  * @vbus: VBUS signal state trakining, using extcon framework
  * @id: ID signal state trakining, using extcon framework
+ * @switch_gpio: Descriptor for GPIO used to control external Dual
+ *               SPDT USB Switch.
+ * @reboot: Used to inform the driver to route USB D+/D- line to Device
+ *	    connector
  */
 struct msm_otg {
 	struct usb_phy phy;
@@ -188,6 +192,9 @@ struct msm_otg {

 	struct msm_usb_cable vbus;
 	struct msm_usb_cable id;
+
+	struct gpio_desc *switch_gpio;
+	struct notifier_block reboot;
 };

 #endif
--
1.9.1
