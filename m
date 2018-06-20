Return-Path: <SRS0=5+Be=JG=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 4/5] leds: lt3593: Add device tree probing glue
Date: Wed, 20 Jun 2018 22:13:02 +0200
Message-Id: <20180620201303.6272-5-daniel@zonque.org>
In-Reply-To: <20180620201303.6272-1-daniel@zonque.org>
References: <20180620201303.6272-1-daniel@zonque.org>
To: jacek.anaszewski@gmail.com, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

The binding details are described in an earlier commit that adds the
documentation.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/leds/leds-lt3593.c | 74 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index a7bc1fab6584..e45c26588799 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -24,8 +24,11 @@
 #include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <uapi/linux/uleds.h>
 
 struct lt3593_led_data {
+	char name[LED_MAX_NAME_SIZE];
 	struct led_classdev cdev;
 	struct gpio_desc *gpiod;
 };
@@ -120,22 +123,93 @@ static int lt3593_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct lt3593_led_data *led_data;
+	struct fwnode_handle *child;
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
+	if (device_get_child_node_count(dev) != 1) {
+		dev_err(dev, "Device must have exactly one LED sub-node.");
+		return -EINVAL;
 	}
 
+	child = device_get_next_child_node(dev, NULL);
+
+	ret = fwnode_property_read_string(child, "label", &tmp);
+	if (ret < 0)
+		snprintf(led_data->name, sizeof(led_data->name),
+			 "lt3593::");
+	else
+		snprintf(led_data->name, sizeof(led_data->name),
+			 "lt3593:%s", tmp);
+
+	fwnode_property_read_string(child, "linux,default-trigger",
+				    &led_data->cdev.default_trigger);
+
+	if (!fwnode_property_read_string(child, "default-state", &tmp)) {
+		if (!strcmp(tmp, "keep")) {
+			state = LEDS_GPIO_DEFSTATE_KEEP;
+			flags = GPIOD_ASIS;
+		} else if (!strcmp(tmp, "on")) {
+			state = LEDS_GPIO_DEFSTATE_ON;
+			flags = GPIOD_OUT_HIGH;
+		}
+	}
+
+	led_data->gpiod = devm_fwnode_get_gpiod_from_child(dev, NULL, child,
+							   flags,
+							   led_data->name);
+	if (IS_ERR(led_data->gpiod)) {
+		fwnode_handle_put(child);
+		return PTR_ERR(led_data->gpiod);
+	}
+
+	led_data->cdev.name = led_data->name;
+	led_data->cdev.brightness_set_blocking = lt3593_led_set;
+	led_data->cdev.brightness = state ? LED_FULL : LED_OFF;
+
+	ret = devm_led_classdev_register(dev, &led_data->cdev);
+	if (ret < 0) {
+		fwnode_handle_put(child);
+		return ret;
+	}
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
