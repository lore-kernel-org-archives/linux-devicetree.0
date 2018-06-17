Return-Path: <SRS0=fTn5=JD=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 4/5] leds: lt3593: Add device tree probing glue
Date: Sun, 17 Jun 2018 13:49:28 +0200
Message-Id: <20180617114929.719-4-daniel@zonque.org>
In-Reply-To: <20180617114929.719-1-daniel@zonque.org>
References: <20180617114929.719-1-daniel@zonque.org>
To: jacek.anaszewski@gmail.com, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

The binding details are described in an earlier commit that adds the
documentation.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/leds/leds-lt3593.c | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index a096ee64cbbb..44b57e7059dd 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -24,6 +24,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/of.h>
 
 struct lt3593_led_data {
 	struct led_classdev cdev;
@@ -120,22 +121,77 @@ static int lt3593_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct lt3593_led_data *led_data;
+	int ret, state = LEDS_GPIO_DEFSTATE_OFF;
+	enum gpiod_flags flags = GPIOD_OUT_LOW;
+	const char *tmp;
 
 	if (dev_get_platdata(dev)) {
 		led_data = lt3593_led_probe_pdata(dev);
 		if (IS_ERR(led_data))
 			return PTR_ERR(led_data);
+
+		goto out;
+	}
+
+	if (!dev->of_node)
+		return -ENODEV;
+
+	led_data = devm_kzalloc(dev, sizeof(*led_data), GFP_KERNEL);
+	if (!led_data)
+		return -ENOMEM;
+
+	ret = of_property_read_string(dev->of_node, "label",
+				      &led_data->cdev.name);
+	if (ret < 0) {
+		dev_err(dev, "Unable to read label from child node\n");
+		return -EINVAL;
 	}
 
+	of_property_read_string(dev->of_node, "linux,default-trigger",
+				&led_data->cdev.default_trigger);
+
+	if (!of_property_read_string(dev->of_node, "default-state", &tmp)) {
+		if (!strcmp(tmp, "keep")) {
+			state = LEDS_GPIO_DEFSTATE_KEEP;
+			flags = GPIOD_ASIS;
+		} else if (!strcmp(tmp, "on")) {
+			state = LEDS_GPIO_DEFSTATE_ON;
+			flags = GPIOD_OUT_HIGH;
+		}
+	}
+
+	led_data->gpiod = devm_gpiod_get(dev, NULL, flags);
+	if (IS_ERR(led_data->gpiod))
+		return PTR_ERR(led_data->gpiod);
+
+	led_data->cdev.brightness_set_blocking = lt3593_led_set;
+	led_data->cdev.brightness = state ? LED_FULL : LED_OFF;
+
+	ret = devm_led_classdev_register(dev, &led_data->cdev);
+	if (ret < 0)
+		return ret;
+
+	led_data->cdev.dev->of_node = dev->of_node;
+
+out:
 	platform_set_drvdata(pdev, led_data);
 
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id of_lt3593_leds_match[] = {
+	{ .compatible = "lltc,lt3593", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_lt3593_leds_match);
+#endif
+
 static struct platform_driver lt3593_led_driver = {
 	.probe		= lt3593_led_probe,
 	.driver		= {
 		.name	= "leds-lt3593",
+		.of_match_table = of_match_ptr(of_lt3593_leds_match),
 	},
 };
 
-- 
2.17.1
