From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] extcon: gpio: Add the support for Device tree bindings
Date: Fri, 02 Oct 2015 15:15:15 +0900
Message-ID: <1443766515-18549-1-git-send-email-cw00.choi@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the support for Device tree bindings of extcon-gpio driver.
The extcon-gpio device tree node must include the both 'extcon-id' and
'extcon-gpio' property.

For exmaple:
	usb_cable: extcon-gpio-0 {
		compatible = "extcon-gpio";
		extcon-id = <1>;	/* EXTCON_USB */
		extcon-gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
	}

	ta_cable: extcon-gpio-1 {
		compatible = "extcon-gpio";
		extcon-id = <3>;	/* EXTCON_TA */
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

Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/extcon/extcon-gpio.txt     |  35 +++++++
 drivers/extcon/extcon-gpio.c                       | 108 ++++++++++++++++-----
 include/linux/extcon/extcon-gpio.h                 |   6 +-
 3 files changed, 124 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-gpio.txt

diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
new file mode 100644
index 000000000000..dc99a1d99b63
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
@@ -0,0 +1,35 @@
+GPIO Extcon device
+
+Required properties:
+- compatible: Must be "extcon-gpio".
+- extcon-id: unique id for specific external connector.
+	     See include/linux/extcon.h.
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
+		extcon-id = <1>;	/* EXTCON_USB */
+		extcon-gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
+	}
+
+	ta_cable: extcon-gpio-1 {
+		compatible = "extcon-gpio";
+		extcon-id = <3>;	/* EXTCON_TA */
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
index 279ff8f6637d..611eb69392bb 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -1,8 +1,8 @@
 /*
  * extcon_gpio.c - Single-state GPIO extcon driver based on extcon class
  *
- * Copyright (C) 2008 Google, Inc.
- * Author: Mike Lockwood <lockwood-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
+ * Copyright (C) 2015 Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samsung Electronics
+ * Copyright (C) 2008 Mike Lockwood <lockwood-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Google, Inc.
  *
  * Modified by MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> to support extcon
  * (originally switch class is supported)
@@ -26,12 +26,14 @@
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
 
@@ -61,19 +63,50 @@ static irqreturn_t gpio_irq_handler(int irq, void *dev_id)
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
@@ -96,16 +129,20 @@ static int gpio_extcon_probe(struct platform_device *pdev)
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
@@ -113,7 +150,8 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Allocate the memory of extcon devie and register extcon device */
-	data->edev = devm_extcon_dev_allocate(&pdev->dev, &pdata->extcon_id);
+	data->edev = devm_extcon_dev_allocate(&pdev->dev,
+						&data->pdata->extcon_id);
 	if (IS_ERR(data->edev)) {
 		dev_err(&pdev->dev, "failed to allocate extcon device\n");
 		return -ENOMEM;
@@ -130,7 +168,8 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	 * is attached or detached.
 	 */
 	ret = devm_request_any_context_irq(&pdev->dev, data->irq,
-					gpio_irq_handler, pdata->irq_flags,
+					gpio_irq_handler,
+					data->pdata->irq_flags,
 					pdev->name, data);
 	if (ret < 0)
 		return ret;
@@ -139,6 +178,8 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	/* Perform initial detection */
 	gpio_extcon_work(&data->work.work);
 
+	device_init_wakeup(&pdev->dev, data->irq_wakeup);
+
 	return 0;
 }
 
@@ -152,11 +193,23 @@ static int gpio_extcon_remove(struct platform_device *pdev)
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
@@ -165,7 +218,16 @@ static int gpio_extcon_resume(struct device *dev)
 }
 #endif
 
-static SIMPLE_DEV_PM_OPS(gpio_extcon_pm_ops, NULL, gpio_extcon_resume);
+#if defined(CONFIG_OF)
+static const struct of_device_id gpio_extcon_of_match[] = {
+	{ .compatible = "extcon-gpio", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, gpio_extcon_of_match);
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
 
+MODULE_AUTHOR("Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
 MODULE_AUTHOR("Mike Lockwood <lockwood-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>");
 MODULE_DESCRIPTION("GPIO extcon driver");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/extcon/extcon-gpio.h b/include/linux/extcon/extcon-gpio.h
index 7cacafb78b09..bcc6d7f7116a 100644
--- a/include/linux/extcon/extcon-gpio.h
+++ b/include/linux/extcon/extcon-gpio.h
@@ -1,8 +1,8 @@
 /*
  * Single-state GPIO extcon driver based on extcon class
  *
- * Copyright (C) 2012 Samsung Electronics
- * Author: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
+ * Copyright (C) 2015 Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samsung Electronics
+ * Copyright (C) 2012 MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samsung Electronics
  *
  * based on switch class driver
  * Copyright (C) 2008 Google, Inc.
@@ -38,7 +38,7 @@ struct gpio_extcon_pdata {
 	unsigned int extcon_id;
 	unsigned gpio;
 	bool gpio_active_low;
-	unsigned long debounce;
+	unsigned int debounce;
 	unsigned long irq_flags;
 
 	bool check_on_resume;
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
