From: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3] usb: chipidea: Use extcon framework for VBUS and ID detect
Date: Tue,  2 Jun 2015 16:14:33 +0300
Message-ID: <1433250873-20780-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On recent Qualcomm platforms VBUS and ID lines are not routed to
USB PHY LINK controller. Use extcon framework to receive connect
and disconnect ID and VBUS notification.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
Changes sice v2 [1].

* Simulate IRQ on extcon event - used to trigger OTG state machine.

I have to admit that I couldn't test complete Chipidea OTG state machine,
because my setup is little weird. I am using "qcom,usb-otg-ci" as PHY/OTG
provider, "qcom,ehci-host" as host controller driver and "qcom,ci-hdrc" for
device role.

There could be patch conflict regarding ci-hdrc-qcom.txt, because Rob Herring
is consolidating DT binding for all vendors which integrate this device [2]

[1] https://lkml.org/lkml/2015/4/15/283
[2] http://www.spinics.net/lists/linux-usb/msg125453.html

 .../devicetree/bindings/usb/ci-hdrc-qcom.txt       |   9 ++
 drivers/usb/chipidea/Kconfig                       |   1 +
 drivers/usb/chipidea/core.c                        | 125 +++++++++++++++++++++
 drivers/usb/chipidea/otg.c                         |  55 ++++++++-
 include/linux/usb/chipidea.h                       |  24 ++++
 5 files changed, 212 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
index f2899b5..c635aca 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
@@ -7,6 +7,14 @@ Required properties:
 - usb-phy:      phandle for the PHY device
 - dr_mode:      Should be "peripheral"

+Optional properties:
+- extcon:       phandles to external connector devices. First phandle
+                should point to external connector, which provide "USB"
+                cable events, the second should point to external connector
+                device, which provide "USB-HOST" cable events. If one of
+                the external connector devices is not required, empty <0>
+                phandle should be specified.
+
 Examples:
 	gadget@f9a55000 {
 		compatible = "qcom,ci-hdrc";
@@ -14,4 +22,5 @@ Examples:
 		dr_mode = "peripheral";
 		interrupts = <0 134 0>;
 		usb-phy = <&usbphy0>;
+		extcon = <0>, <&usb_id>;
 	};
diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
index 5ce3f1d..5619b8c 100644
--- a/drivers/usb/chipidea/Kconfig
+++ b/drivers/usb/chipidea/Kconfig
@@ -1,6 +1,7 @@
 config USB_CHIPIDEA
 	tristate "ChipIdea Highspeed Dual Role Controller"
 	depends on ((USB_EHCI_HCD && USB_GADGET) || (USB_EHCI_HCD && !USB_GADGET) || (!USB_EHCI_HCD && USB_GADGET)) && HAS_DMA
+	select EXTCON
 	help
 	  Say Y here if your system has a dual role high speed USB
 	  controller based on ChipIdea silicon IP. Currently, only the
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 74fea4f..2ae2c09 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -47,6 +47,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/extcon.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
@@ -557,9 +558,47 @@ static irqreturn_t ci_irq(int irq, void *data)
 	return ret;
 }

+static int ci_vbus_notifier(struct notifier_block *nb, unsigned long event,
+			    void *ptr)
+{
+	struct ci_hdrc_cable *vbus = container_of(nb, struct ci_hdrc_cable, nb);
+	struct ci_hdrc *ci = vbus->ci;
+
+	if (event)
+		vbus->state = true;
+	else
+		vbus->state = false;
+
+	vbus->changed = true;
+
+	ci_irq(ci->irq, ci);
+	return NOTIFY_DONE;
+}
+
+static int ci_id_notifier(struct notifier_block *nb, unsigned long event,
+			  void *ptr)
+{
+	struct ci_hdrc_cable *id = container_of(nb, struct ci_hdrc_cable, nb);
+	struct ci_hdrc *ci = id->ci;
+
+	if (event)
+		id->state = false;
+	else
+		id->state = true;
+
+	id->changed = true;
+
+	ci_irq(ci->irq, ci);
+	return NOTIFY_DONE;
+}
+
 static int ci_get_platdata(struct device *dev,
 		struct ci_hdrc_platform_data *platdata)
 {
+	struct extcon_dev *ext_vbus, *ext_id;
+	struct ci_hdrc_cable *cable;
+	int ret;
+
 	if (!platdata->phy_mode)
 		platdata->phy_mode = of_usb_get_phy_mode(dev->of_node);

@@ -591,9 +630,89 @@ static int ci_get_platdata(struct device *dev,
 	if (of_usb_get_maximum_speed(dev->of_node) == USB_SPEED_FULL)
 		platdata->flags |= CI_HDRC_FORCE_FULLSPEED;

+	ext_id = ERR_PTR(-ENODEV);
+	ext_vbus = ERR_PTR(-ENODEV);
+	if (of_property_read_bool(dev->of_node, "extcon")) {
+		/* Each one of them is not mandatory */
+		ext_vbus = extcon_get_edev_by_phandle(dev, 0);
+		if (IS_ERR(ext_vbus) && PTR_ERR(ext_vbus) != -ENODEV)
+			return PTR_ERR(ext_vbus);
+
+		ext_id = extcon_get_edev_by_phandle(dev, 1);
+		if (IS_ERR(ext_id) && PTR_ERR(ext_id) != -ENODEV)
+			return PTR_ERR(ext_id);
+	}
+
+	cable = &platdata->vbus_extcon;
+	cable->nb.notifier_call = ci_vbus_notifier;
+	cable->edev = ext_vbus;
+
+	if (!IS_ERR(ext_vbus)) {
+		ret = extcon_get_cable_state(cable->edev, "USB");
+		if (ret)
+			cable->state = true;
+		else
+			cable->state = false;
+	}
+
+	cable = &platdata->id_extcon;
+	cable->nb.notifier_call = ci_id_notifier;
+	cable->edev = ext_id;
+
+	if (!IS_ERR(ext_id)) {
+		ret = extcon_get_cable_state(cable->edev, "USB-HOST");
+		if (ret)
+			cable->state = false;
+		else
+			cable->state = true;
+	}
+	return 0;
+}
+
+static int ci_extcon_register(struct ci_hdrc *ci)
+{
+	struct ci_hdrc_cable *id, *vbus;
+	int ret;
+
+	id = &ci->platdata->id_extcon;
+	id->ci = ci;
+	if (!IS_ERR(id->edev)) {
+		ret = extcon_register_interest(&id->conn, id->edev->name,
+					       "USB-HOST", &id->nb);
+		if (ret < 0) {
+			dev_err(ci->dev, "register ID failed\n");
+			return ret;
+		}
+	}
+
+	vbus = &ci->platdata->vbus_extcon;
+	vbus->ci = ci;
+	if (!IS_ERR(vbus->edev)) {
+		ret = extcon_register_interest(&vbus->conn, vbus->edev->name,
+					       "USB", &vbus->nb);
+		if (ret < 0) {
+			extcon_unregister_interest(&id->conn);
+			dev_err(ci->dev, "register VBUS failed\n");
+			return ret;
+		}
+	}
+
 	return 0;
 }

+static void ci_extcon_unregister(struct ci_hdrc *ci)
+{
+	struct ci_hdrc_cable *cable;
+
+	cable = &ci->platdata->id_extcon;
+	if (!IS_ERR(cable->edev))
+		extcon_unregister_interest(&cable->conn);
+
+	cable = &ci->platdata->vbus_extcon;
+	if (!IS_ERR(cable->edev))
+		extcon_unregister_interest(&cable->conn);
+}
+
 static DEFINE_IDA(ci_ida);

 struct platform_device *ci_hdrc_add_device(struct device *dev,
@@ -817,6 +936,10 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 	if (ret)
 		goto stop;

+	ret = ci_extcon_register(ci);
+	if (ret)
+		goto stop;
+
 	if (ci->supports_runtime_pm) {
 		pm_runtime_set_active(&pdev->dev);
 		pm_runtime_enable(&pdev->dev);
@@ -834,6 +957,7 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 	if (!ret)
 		return 0;

+	ci_extcon_unregister(ci);
 stop:
 	ci_role_destroy(ci);
 deinit_phy:
@@ -853,6 +977,7 @@ static int ci_hdrc_remove(struct platform_device *pdev)
 	}

 	dbg_remove_files(ci);
+	ci_extcon_unregister(ci);
 	ci_role_destroy(ci);
 	ci_hdrc_enter_lpm(ci, true);
 	ci_usb_phy_exit(ci);
diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index ad6c87a..77fe2df 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -30,7 +30,41 @@
  */
 u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
 {
-	return hw_read(ci, OP_OTGSC, mask);
+	struct ci_hdrc_cable *cable;
+	u32 val = hw_read(ci, OP_OTGSC, mask);
+
+	/*
+	 * If using extcon framework for VBUS and/or ID signal
+	 * detection overwrite OTGSC resiter value
+	 */
+	cable = &ci->platdata->vbus_extcon;
+	if (!IS_ERR(cable->edev)) {
+		if (cable->changed)
+			val |= OTGSC_BSVIS;
+		else
+			val &= ~OTGSC_BSVIS;
+
+		if (cable->state)
+			val |= OTGSC_BSV;
+		else
+			val &= ~OTGSC_BSV;
+	}
+
+	cable = &ci->platdata->id_extcon;
+	if (!IS_ERR(cable->edev)) {
+		if (cable->changed)
+			val |= OTGSC_IDIS;
+		else
+			val &= ~OTGSC_IDIS;
+
+		if (cable->state)
+			val |= OTGSC_ID;
+		else
+			val &= ~OTGSC_ID;
+	}
+
+	val &= mask;
+	return val;
 }

 /**
@@ -40,7 +74,24 @@ u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
  */
 void hw_write_otgsc(struct ci_hdrc *ci, u32 mask, u32 data)
 {
-	hw_write(ci, OP_OTGSC, mask | OTGSC_INT_STATUS_BITS, data);
+	struct ci_hdrc_cable *cable;
+
+	mask |= OTGSC_INT_STATUS_BITS;
+
+	/* clear artificial bits */
+	cable = &ci->platdata->vbus_extcon;
+	if (!IS_ERR(cable->edev)) {
+		if (data & OTGSC_BSVIS)
+			cable->changed = false;
+	}
+
+	cable = &ci->platdata->id_extcon;
+	if (!IS_ERR(cable->edev)) {
+		if (data & OTGSC_IDIS)
+			cable->changed = false;
+	}
+
+	hw_write(ci, OP_OTGSC, mask, data);
 }

 /**
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index ab94f78..05915cb1 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -5,9 +5,29 @@
 #ifndef __LINUX_USB_CHIPIDEA_H
 #define __LINUX_USB_CHIPIDEA_H

+#include <linux/extcon.h>
 #include <linux/usb/otg.h>

 struct ci_hdrc;
+
+/**
+ * struct ci_hdrc_cable - structure for external connector cable state tracking
+ * @state: current state of the line
+ * @changed: set to true when extcon event happen
+ * @edev: device which generate events
+ * @ci: driver state of the chipidea device
+ * @nb: hold event notification callback
+ * @conn: used for notification registration
+ */
+struct ci_hdrc_cable {
+	bool				state;
+	bool				changed;
+	struct extcon_dev		*edev;
+	struct ci_hdrc			*ci;
+	struct notifier_block		nb;
+	struct extcon_specific_cable_nb conn;
+};
+
 struct ci_hdrc_platform_data {
 	const char	*name;
 	/* offset of the capability registers */
@@ -35,6 +55,10 @@ struct ci_hdrc_platform_data {
 	void	(*notify_event) (struct ci_hdrc *ci, unsigned event);
 	struct regulator	*reg_vbus;
 	bool			tpl_support;
+
+	/* VBUS and ID signal state tracking, using extcon framework */
+	struct ci_hdrc_cable		vbus_extcon;
+	struct ci_hdrc_cable		id_extcon;
 };

 /* Default offset of capability registers */
--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
