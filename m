Return-Path: <SRS0=YCj9=JH=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v4 2/5] leds: lt3593: merge functions and clean up code
Date: Thu, 21 Jun 2018 22:23:19 +0200
Message-Id: <20180621202322.11581-3-daniel@zonque.org>
In-Reply-To: <20180621202322.11581-1-daniel@zonque.org>
References: <20180621202322.11581-1-daniel@zonque.org>
To: jacek.anaszewski@gmail.com, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

In preparation to DT probe functionality, merge create_lt3593_led() into
its only call-site. The DT based setup code will be quite different, so this
internal helper function is of no help.

This also changes the way the driver works by only handling one entry inside
'struct gpio_led_platform_data'. If multiple devices of the same type are
found in a design, there should be a platform device for each of them. The
only mainline user of this driver is not affected by this change.

Last, use devm_led_classdev_register() instead of
led_classdev_register(), so the driver's remove callback can go away.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/leds/leds-lt3593.c | 103 +++++++++++++------------------------
 1 file changed, 35 insertions(+), 68 deletions(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 5ec730a31b65..1a3dc347db21 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -71,104 +71,71 @@ static int lt3593_led_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
-static int create_lt3593_led(const struct gpio_led *template,
-	struct lt3593_led_data *led_dat, struct device *parent)
+static struct lt3593_led_data *lt3593_led_probe_pdata(struct device *dev)
 {
+	struct gpio_led_platform_data *pdata = dev_get_platdata(dev);
+	const struct gpio_led *template = &pdata->leds[0];
+	struct lt3593_led_data *led_data;
 	int ret, state;
 
-	/* skip leds on GPIOs that aren't available */
+	if (pdata->num_leds != 1)
+		return ERR_PTR(-EINVAL);
+
+	led_data = devm_kzalloc(dev, sizeof(*led_data), GFP_KERNEL);
+	if (!led_data)
+		return ERR_PTR(-ENOMEM);
+
 	if (!gpio_is_valid(template->gpio)) {
-		dev_info(parent, "%s: skipping unavailable LT3593 LED at gpio %d (%s)\n",
-				KBUILD_MODNAME, template->gpio, template->name);
-		return 0;
+		dev_info(dev, "skipping unavailable LT3593 LED at gpio "
+			 "%d (%s)\n", template->gpio, template->name);
+		return ERR_PTR(-EINVAL);
 	}
 
-	led_dat->cdev.name = template->name;
-	led_dat->cdev.default_trigger = template->default_trigger;
-	led_dat->gpio = template->gpio;
-
-	led_dat->cdev.brightness_set_blocking = lt3593_led_set;
+	led_data->cdev.name = template->name;
+	led_data->cdev.default_trigger = template->default_trigger;
+	led_data->gpio = template->gpio;
+	led_data->cdev.brightness_set_blocking = lt3593_led_set;
 
 	state = (template->default_state == LEDS_GPIO_DEFSTATE_ON);
-	led_dat->cdev.brightness = state ? LED_FULL : LED_OFF;
+	led_data->cdev.brightness = state ? LED_FULL : LED_OFF;
 
 	if (!template->retain_state_suspended)
-		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
+		led_data->cdev.flags |= LED_CORE_SUSPENDRESUME;
 
-	ret = devm_gpio_request_one(parent, template->gpio, state ?
+	ret = devm_gpio_request_one(dev, template->gpio, state ?
 				    GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW,
 				    template->name);
 	if (ret < 0)
-		return ret;
+		return ERR_PTR(ret);
 
-	ret = led_classdev_register(parent, &led_dat->cdev);
+	ret = devm_led_classdev_register(dev, &led_data->cdev);
 	if (ret < 0)
-		return ret;
-
-	dev_info(parent, "%s: registered LT3593 LED '%s' at GPIO %d\n",
-		KBUILD_MODNAME, template->name, template->gpio);
+		return ERR_PTR(ret);
 
-	return 0;
-}
+	dev_info(dev, "registered LT3593 LED '%s' at GPIO %d\n",
+		 template->name, template->gpio);
 
-static void delete_lt3593_led(struct lt3593_led_data *led)
-{
-	if (!gpio_is_valid(led->gpio))
-		return;
-
-	led_classdev_unregister(&led->cdev);
+	return led_data;
 }
 
 static int lt3593_led_probe(struct platform_device *pdev)
 {
-	struct gpio_led_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct lt3593_led_data *leds_data;
-	int i, ret = 0;
-
-	if (!pdata)
-		return -EBUSY;
-
-	leds_data = devm_kcalloc(&pdev->dev,
-			pdata->num_leds, sizeof(struct lt3593_led_data),
-			GFP_KERNEL);
-	if (!leds_data)
-		return -ENOMEM;
-
-	for (i = 0; i < pdata->num_leds; i++) {
-		ret = create_lt3593_led(&pdata->leds[i], &leds_data[i],
-				      &pdev->dev);
-		if (ret < 0)
-			goto err;
-	}
+	struct device *dev = &pdev->dev;
+	struct lt3593_led_data *led_data;
 
-	platform_set_drvdata(pdev, leds_data);
-
-	return 0;
-
-err:
-	for (i = i - 1; i >= 0; i--)
-		delete_lt3593_led(&leds_data[i]);
-
-	return ret;
-}
-
-static int lt3593_led_remove(struct platform_device *pdev)
-{
-	int i;
-	struct gpio_led_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct lt3593_led_data *leds_data;
-
-	leds_data = platform_get_drvdata(pdev);
+	if (dev_get_platdata(dev)) {
+		led_data = lt3593_led_probe_pdata(dev);
+		if (IS_ERR(led_data))
+			return PTR_ERR(led_data);
+	}
 
-	for (i = 0; i < pdata->num_leds; i++)
-		delete_lt3593_led(&leds_data[i]);
+	platform_set_drvdata(pdev, led_data);
 
 	return 0;
 }
 
 static struct platform_driver lt3593_led_driver = {
 	.probe		= lt3593_led_probe,
-	.remove		= lt3593_led_remove,
 	.driver		= {
 		.name	= "leds-lt3593",
 	},
-- 
2.17.1
