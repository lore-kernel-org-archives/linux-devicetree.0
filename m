Return-Path: <SRS0=dmff=LT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from bastet.se.axis.com ([195.60.68.11]:49716 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727616AbeIER4t (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Sep 2018 13:56:49 -0400
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH 1/2] gpio: mockup: Allow probing from device tree
Date: Wed,  5 Sep 2018 15:26:17 +0200
Message-Id: <20180905132618.31274-1-vincent.whitchurch@axis.com>
Sender: devicetree-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Vincent Whitchurch <rabinv@axis.com>
List-ID: <devicetree@vger.kernel.org>

Allow the mockup driver to be probed via the device tree, allowing it to
be used to configure and test higher level drivers like the leds-gpio
driver and corresponding userspace before actual hardware is available.

The mockup debugfs interface can be used to inject events, and actions
on the GPIO can be traced with ftrace.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/gpio/gpio-mockup.c | 87 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 63 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index d66b7a768ecd..abe9059f116b 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/of.h>
 #include <linux/irq_sim.h>
 #include <linux/debugfs.h>
 #include <linux/uaccess.h>
@@ -255,27 +256,42 @@ static int gpio_mockup_name_lines(struct device *dev,
 
 static int gpio_mockup_probe(struct platform_device *pdev)
 {
-	struct gpio_mockup_platform_data *pdata;
+	struct device_node *node = pdev->dev.of_node;
+	struct gpio_mockup_platform_data *pdata = NULL;
 	struct gpio_mockup_chip *chip;
 	struct gpio_chip *gc;
 	int rv, base, ngpio;
 	struct device *dev;
-	char *name;
+	const char *name;
 
 	dev = &pdev->dev;
-	pdata = dev_get_platdata(dev);
-	base = pdata->base;
-	ngpio = pdata->ngpio;
+
+	if (node) {
+		u32 nr_gpios;
+		int ret;
+
+		ret = of_property_read_u32(node, "nr-gpios", &nr_gpios);
+		if (ret)
+			return ret;
+
+		base = -1;
+		ngpio = nr_gpios;
+		name = pdev->name;
+	} else {
+		pdata = dev_get_platdata(dev);
+		base = pdata->base;
+		ngpio = pdata->ngpio;
+
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s-%c",
+				      pdev->name, pdata->index);
+		if (!name)
+			return -ENOMEM;
+	}
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%s-%c",
-			      pdev->name, pdata->index);
-	if (!name)
-		return -ENOMEM;
-
 	gc = &chip->gc;
 	gc->base = base;
 	gc->ngpio = ngpio;
@@ -295,7 +311,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	if (!chip->lines)
 		return -ENOMEM;
 
-	if (pdata->named_lines) {
+	if (pdata && pdata->named_lines) {
 		rv = gpio_mockup_name_lines(dev, chip);
 		if (rv)
 			return rv;
@@ -315,9 +331,18 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id gpio_mockup_of_match[] = {
+	{ .compatible = "gpio-mockup", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, gpio_mockup_of_match);
+#endif
+
 static struct platform_driver gpio_mockup_driver = {
 	.driver = {
 		.name = GPIO_MOCKUP_NAME,
+		.of_match_table = of_match_ptr(gpio_mockup_of_match),
 	},
 	.probe = gpio_mockup_probe,
 };
@@ -337,12 +362,15 @@ static void gpio_mockup_unregister_pdevs(void)
 	}
 }
 
-static int __init gpio_mockup_init(void)
+static int __init gpio_mockup_init_pdevs(void)
 {
-	int i, num_chips, err = 0, index = 'A';
+	int i, num_chips, index = 'A';
 	struct gpio_mockup_platform_data pdata;
 	struct platform_device *pdev;
 
+	if (IS_ENABLED(CONFIG_OF) && !gpio_mockup_num_ranges)
+		return 0;
+
 	if ((gpio_mockup_num_ranges < 2) ||
 	    (gpio_mockup_num_ranges % 2) ||
 	    (gpio_mockup_num_ranges > GPIO_MOCKUP_MAX_RANGES))
@@ -360,16 +388,6 @@ static int __init gpio_mockup_init(void)
 			return -EINVAL;
 	}
 
-	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup-event", NULL);
-	if (IS_ERR_OR_NULL(gpio_mockup_dbg_dir))
-		gpio_mockup_err("error creating debugfs directory\n");
-
-	err = platform_driver_register(&gpio_mockup_driver);
-	if (err) {
-		gpio_mockup_err("error registering platform driver\n");
-		return err;
-	}
-
 	for (i = 0; i < num_chips; i++) {
 		pdata.index = index++;
 		pdata.base = gpio_mockup_range_base(i);
@@ -384,7 +402,6 @@ static int __init gpio_mockup_init(void)
 							 sizeof(pdata));
 		if (IS_ERR(pdev)) {
 			gpio_mockup_err("error registering device");
-			platform_driver_unregister(&gpio_mockup_driver);
 			gpio_mockup_unregister_pdevs();
 			return PTR_ERR(pdev);
 		}
@@ -395,6 +412,28 @@ static int __init gpio_mockup_init(void)
 	return 0;
 }
 
+static int __init gpio_mockup_init(void)
+{
+	int err;
+
+	err = gpio_mockup_init_pdevs();
+	if (err)
+		return err;
+
+	err = platform_driver_register(&gpio_mockup_driver);
+	if (err) {
+		gpio_mockup_err("error registering platform driver\n");
+		gpio_mockup_unregister_pdevs();
+		return err;
+	}
+
+	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup-event", NULL);
+	if (IS_ERR_OR_NULL(gpio_mockup_dbg_dir))
+		gpio_mockup_err("error creating debugfs directory\n");
+
+	return 0;
+}
+
 static void __exit gpio_mockup_exit(void)
 {
 	debugfs_remove_recursive(gpio_mockup_dbg_dir);
-- 
2.11.0
