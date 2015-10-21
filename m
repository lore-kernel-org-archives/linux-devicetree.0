From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3] extcon: gpio: Add the support for Device tree bindings
Date: Wed, 21 Oct 2015 13:37:06 +0900
Message-ID: <1445402226-3912-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the support for Device tree bindings of extcon-gpio driver.
The extcon-gpio device tree node must include the both 'extcon-id' and
'extcon-gpio' property.

For exmaple:
	usb_cable: extcon-gpio-0 {
		compatible = "extcon-gpio";
		extcon-id = <EXTCON_USB>;
		extcon-gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
	}

	ta_cable: extcon-gpio-1 {
		compatible = "extcon-gpio";
		extcon-id = <EXTCON_CHG_USB_DCP>;
		extcon-gpio = <&gpio3 2 GPIO_ACTIVE_LOW>;
		debounce-ms = <50>;	/* 50 millisecond */
		wakeup-source;
	}

	&dwc3_usb {
		extcon = <&usb_cable>;
	};

	&charger {
		extcon = <&ta_cable>;
	};

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
---
Changes from v2:
- Add the more description for 'extcon-id' property in documentation

Changes from v1:
- Create the include/dt-bindings/extcon/extcon.h including the identification
of external connector. These definitions are used in dts file.
- Fix error if CONFIG_OF is disabled.
- Add signed-off tag by Myungjoo Ham

 .../devicetree/bindings/extcon/extcon-gpio.txt     |  43 ++++++++
 drivers/extcon/extcon-gpio.c                       | 116 ++++++++++++++++-----
 include/dt-bindings/extcon/extcon.h                |  47 +++++++++
 include/linux/extcon/extcon-gpio.h                 |   8 +-
 4 files changed, 184 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-gpio.txt
 create mode 100644 include/dt-bindings/extcon/extcon.h

diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
new file mode 100644
index 000000000000..1e011f9c8536
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
@@ -0,0 +1,43 @@
+GPIO Extcon device
+
+This is a virtual device used to generate the specific cable states from the
+GPIO pin.
+
+Required properties:
+- compatible: Must be "extcon-gpio".
+- extcon-id: The extcon support the various type of external connector to check
+  whether connector is attached or detached. The each external connector has
+  the unique number to identify it. So this property includes the unique number
+  which indicates the specific external connector. When external connector is
+  attached or detached, GPIO pin detect the changed state. See include/
+  dt-bindings/extcon/extcon.h which defines the unique number for supported
+  external connector from extcon framework.
+- extcon-gpio: GPIO pin to detect the external connector. See gpio binding.
+
+Optional properties:
+- debounce-ms: the debounce dealy for GPIO pin in millisecond.
+- wakeup-source: Boolean, extcon can wake-up the system.
+
+Example: Examples of extcon-gpio node as listed below:
+
+	usb_cable: extcon-gpio-0 {
+		compatible = "extcon-gpio";
+		extcon-id = <EXTCON_USB>;
+		extcon-gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
+	}
+
+	ta_cable: extcon-gpio-1 {
+		compatible = "extcon-gpio";
+		extcon-id = <EXTCON_CHG_USB_DCP>;
+		extcon-gpio = <&gpio3 2 GPIO_ACTIVE_LOW>;
+		debounce-ms = <50>;	/* 50 millisecond */
+		wakeup-source;
+	}
+
+	&dwc3_usb {
+		extcon = <&usb_cable>;
+	};
+
+	&charger {
+		extcon = <&ta_cable>;
+	};
diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index 279ff8f6637d..69b560d136cd 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -1,11 +1,9 @@
 /*
  * extcon_gpio.c - Single-state GPIO extcon driver based on extcon class
  *
- * Copyright (C) 2008 Google, Inc.
- * Author: Mike Lockwood <lockwood@android.com>
- *
- * Modified by MyungJoo Ham <myungjoo.ham@samsung.com> to support extcon
- * (originally switch class is supported)
+ * Copyright (C) 2015 Chanwoo Choi <cw00.choi@samsung.com>, Samsung Electronics
+ * Copyright (C) 2012 MyungJoo Ham <myungjoo.ham@samsung.com>, Samsung Electronics
+ * Copyright (C) 2008 Mike Lockwood <lockwood@android.com>, Google, Inc.
  *
  * This software is licensed under the terms of the GNU General Public
  * License version 2, as published by the Free Software Foundation, and
@@ -26,12 +24,14 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
 struct gpio_extcon_data {
 	struct extcon_dev *edev;
 	int irq;
+	bool irq_wakeup;
 	struct delayed_work work;
 	unsigned long debounce_jiffies;
 
@@ -49,7 +49,7 @@ static void gpio_extcon_work(struct work_struct *work)
 	state = gpiod_get_value_cansleep(data->id_gpiod);
 	if (data->pdata->gpio_active_low)
 		state = !state;
-	extcon_set_state(data->edev, state);
+	extcon_set_cable_state_(data->edev, data->pdata->extcon_id, state);
 }
 
 static irqreturn_t gpio_irq_handler(int irq, void *dev_id)
@@ -61,19 +61,50 @@ static irqreturn_t gpio_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int gpio_extcon_init(struct device *dev, struct gpio_extcon_data *data)
+static int gpio_extcon_parse_of(struct device *dev,
+				struct gpio_extcon_data *data)
 {
-	struct gpio_extcon_pdata *pdata = data->pdata;
+	struct gpio_extcon_pdata *pdata;
 	int ret;
 
-	ret = devm_gpio_request_one(dev, pdata->gpio, GPIOF_DIR_IN,
-				dev_name(dev));
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	ret = device_property_read_u32(dev, "extcon-id", &pdata->extcon_id);
+	if (ret < 0)
+		return -EINVAL;
+
+	data->id_gpiod = devm_gpiod_get(dev, "extcon", GPIOD_IN);
 	if (ret < 0)
 		return ret;
 
-	data->id_gpiod = gpio_to_desc(pdata->gpio);
-	if (!data->id_gpiod)
-		return -EINVAL;
+	data->irq_wakeup = device_property_read_bool(dev, "wakeup-source");
+
+	device_property_read_u32(dev, "debounce-ms", &pdata->debounce);
+
+	pdata->irq_flags = (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
+				| IRQF_ONESHOT);
+
+	data->pdata = pdata;
+	return 0;
+}
+
+static int gpio_extcon_init(struct device *dev, struct gpio_extcon_data *data)
+{
+	struct gpio_extcon_pdata *pdata = data->pdata;
+	int ret;
+
+	if (!data->id_gpiod) {
+		ret = devm_gpio_request_one(dev, pdata->gpio, GPIOF_DIR_IN,
+					dev_name(dev));
+		if (ret < 0)
+			return ret;
+
+		data->id_gpiod = gpio_to_desc(pdata->gpio);
+		if (!data->id_gpiod)
+			return -EINVAL;
+	}
 
 	if (pdata->debounce) {
 		ret = gpiod_set_debounce(data->id_gpiod,
@@ -96,16 +127,20 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	struct gpio_extcon_data *data;
 	int ret;
 
-	if (!pdata)
-		return -EBUSY;
-	if (!pdata->irq_flags || pdata->extcon_id > EXTCON_NONE)
-		return -EINVAL;
-
-	data = devm_kzalloc(&pdev->dev, sizeof(struct gpio_extcon_data),
-				   GFP_KERNEL);
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
-	data->pdata = pdata;
+
+	if (!pdata) {
+		ret = gpio_extcon_parse_of(&pdev->dev, data);
+		if (ret < 0)
+			return ret;
+	} else {
+		data->pdata = pdata;
+	}
+
+	if (!data->pdata->irq_flags || data->pdata->extcon_id == EXTCON_NONE)
+		return -EINVAL;
 
 	/* Initialize the gpio */
 	ret = gpio_extcon_init(&pdev->dev, data);
@@ -113,7 +148,8 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Allocate the memory of extcon devie and register extcon device */
-	data->edev = devm_extcon_dev_allocate(&pdev->dev, &pdata->extcon_id);
+	data->edev = devm_extcon_dev_allocate(&pdev->dev,
+						&data->pdata->extcon_id);
 	if (IS_ERR(data->edev)) {
 		dev_err(&pdev->dev, "failed to allocate extcon device\n");
 		return -ENOMEM;
@@ -130,7 +166,8 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	 * is attached or detached.
 	 */
 	ret = devm_request_any_context_irq(&pdev->dev, data->irq,
-					gpio_irq_handler, pdata->irq_flags,
+					gpio_irq_handler,
+					data->pdata->irq_flags,
 					pdev->name, data);
 	if (ret < 0)
 		return ret;
@@ -139,6 +176,8 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	/* Perform initial detection */
 	gpio_extcon_work(&data->work.work);
 
+	device_init_wakeup(&pdev->dev, data->irq_wakeup);
+
 	return 0;
 }
 
@@ -152,11 +191,23 @@ static int gpio_extcon_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM_SLEEP
+static int gpio_extcon_suspend(struct device *dev)
+{
+	struct gpio_extcon_data *data = dev_get_drvdata(dev);
+
+	if (data->irq_wakeup)
+		enable_irq_wake(data->irq);
+
+	return 0;
+}
+
 static int gpio_extcon_resume(struct device *dev)
 {
-	struct gpio_extcon_data *data;
+	struct gpio_extcon_data *data = dev_get_drvdata(dev);
+
+	if (data->irq_wakeup)
+		disable_irq_wake(data->irq);
 
-	data = dev_get_drvdata(dev);
 	if (data->pdata->check_on_resume)
 		queue_delayed_work(system_power_efficient_wq,
 			&data->work, data->debounce_jiffies);
@@ -165,7 +216,18 @@ static int gpio_extcon_resume(struct device *dev)
 }
 #endif
 
-static SIMPLE_DEV_PM_OPS(gpio_extcon_pm_ops, NULL, gpio_extcon_resume);
+#if defined(CONFIG_OF)
+static const struct of_device_id gpio_extcon_of_match[] = {
+	{ .compatible = "extcon-gpio", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, gpio_extcon_of_match);
+#else
+#define gpio_extcon_of_match	NULL
+#endif
+
+static SIMPLE_DEV_PM_OPS(gpio_extcon_pm_ops,
+			gpio_extcon_suspend, gpio_extcon_resume);
 
 static struct platform_driver gpio_extcon_driver = {
 	.probe		= gpio_extcon_probe,
@@ -173,11 +235,13 @@ static struct platform_driver gpio_extcon_driver = {
 	.driver		= {
 		.name	= "extcon-gpio",
 		.pm	= &gpio_extcon_pm_ops,
+		.of_match_table = gpio_extcon_of_match,
 	},
 };
 
 module_platform_driver(gpio_extcon_driver);
 
+MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
 MODULE_AUTHOR("Mike Lockwood <lockwood@android.com>");
 MODULE_DESCRIPTION("GPIO extcon driver");
 MODULE_LICENSE("GPL");
diff --git a/include/dt-bindings/extcon/extcon.h b/include/dt-bindings/extcon/extcon.h
new file mode 100644
index 000000000000..dbba5886cc8c
--- /dev/null
+++ b/include/dt-bindings/extcon/extcon.h
@@ -0,0 +1,47 @@
+/*
+ * This header provides constants for most extcon bindings.
+ *
+ * Most extcon bindings include the unique identification format.
+ * In most cases, the unique id format uses the standard values/macro
+ * defined in this header.
+ */
+
+#ifndef _DT_BINDINGS_EXTCON_EXTCON_H
+#define _DT_BINDINGS_EXTCON_EXTCON_H
+
+/* USB external connector */
+#define EXTCON_USB		1
+#define EXTCON_USB_HOST		2
+
+/* Charging external connector */
+#define EXTCON_CHG_USB_SDP	5	/* Standard Downstream Port */
+#define EXTCON_CHG_USB_DCP	6	/* Dedicated Charging Port */
+#define EXTCON_CHG_USB_CDP	7	/* Charging Downstream Port */
+#define EXTCON_CHG_USB_ACA	8	/* Accessory Charger Adapter */
+#define EXTCON_CHG_USB_FAST	9
+#define EXTCON_CHG_USB_SLOW	10
+
+/* Jack external connector */
+#define EXTCON_JACK_MICROPHONE	20
+#define EXTCON_JACK_HEADPHONE	21
+#define EXTCON_JACK_LINE_IN	22
+#define EXTCON_JACK_LINE_OUT	23
+#define EXTCON_JACK_VIDEO_IN	24
+#define EXTCON_JACK_VIDEO_OUT	25
+#define EXTCON_JACK_SPDIF_IN	26	/* Sony Philips Digital InterFace */
+#define EXTCON_JACK_SPDIF_OUT	27
+
+/* Display external connector */
+#define EXTCON_DISP_HDMI	40	/* High-Definition Multimedia Interface */
+#define EXTCON_DISP_MHL		41	/* Mobile High-Definition Link */
+#define EXTCON_DISP_DVI		42	/* Digital Visual Interface */
+#define EXTCON_DISP_VGA		43	/* Video Graphics Array */
+
+/* Miscellaneous external connector */
+#define EXTCON_DOCK		60
+#define EXTCON_JIG		61
+#define EXTCON_MECHANICAL	62
+
+#define EXTCON_NUM		63
+
+#endif /* _DT_BINDINGS_EXTCON_EXTCON_H */
diff --git a/include/linux/extcon/extcon-gpio.h b/include/linux/extcon/extcon-gpio.h
index 7cacafb78b09..416c2adad7fb 100644
--- a/include/linux/extcon/extcon-gpio.h
+++ b/include/linux/extcon/extcon-gpio.h
@@ -1,8 +1,8 @@
 /*
  * Single-state GPIO extcon driver based on extcon class
  *
- * Copyright (C) 2012 Samsung Electronics
- * Author: MyungJoo Ham <myungjoo.ham@samsung.com>
+ * Copyright (C) 2015 Chanwoo Choi <cw00.choi@samsung.com>, Samsung Electronics
+ * Copyright (C) 2012 MyungJoo Ham <myungjoo.ham@samsung.com>, Samsung Electronics
  *
  * based on switch class driver
  * Copyright (C) 2008 Google, Inc.
@@ -35,10 +35,10 @@
  *			while resuming from sleep.
  */
 struct gpio_extcon_pdata {
-	unsigned int extcon_id;
+	u32 extcon_id;
 	unsigned gpio;
 	bool gpio_active_low;
-	unsigned long debounce;
+	u32 debounce;
 	unsigned long irq_flags;
 
 	bool check_on_resume;
-- 
1.9.1
