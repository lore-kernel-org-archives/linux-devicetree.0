From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v3 2/3] leds: Add control of the voltage/current regulator to the LED core
Date: Wed, 17 Jul 2019 15:59:47 +0200
Message-ID: <20190717135948.19340-3-jjhiblot@ti.com>
References: <20190717135948.19340-1-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190717135948.19340-1-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, daniel.thompson@linaro.org
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@ti.com>
List-Id: devicetree@vger.kernel.org

Sometimes LEDs are powered by an external voltage/current regulator. Let
the LED core know about it. This allows the LED core to turn on or off
managed power supplies.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
Reviewed-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/led-class.c | 15 +++++++++++++
 drivers/leds/led-core.c  | 47 +++++++++++++++++++++++++++++++++++++---
 drivers/leds/leds.h      |  1 +
 include/linux/leds.h     |  4 ++++
 4 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 4793e77808e2..cadd43c30d50 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -253,6 +253,7 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
 {
 	char name[LED_MAX_NAME_SIZE];
 	int ret;
+	struct regulator *regulator;
 
 	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
 	if (ret < 0)
@@ -272,6 +273,20 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
 				led_cdev->name, dev_name(led_cdev->dev));
 
+	regulator = devm_regulator_get_optional(led_cdev->dev, "power");
+	if (IS_ERR(regulator)) {
+		if (PTR_ERR(regulator) != -ENODEV) {
+			dev_err(led_cdev->dev, "Cannot get the power supply for %s\n",
+				led_cdev->name);
+			device_unregister(led_cdev->dev);
+			mutex_unlock(&led_cdev->led_access);
+			return PTR_ERR(regulator);
+		}
+		led_cdev->regulator = NULL;
+	} else {
+		led_cdev->regulator = regulator;
+	}
+
 	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
 		ret = led_add_brightness_hw_changed(led_cdev);
 		if (ret) {
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 7107cd7e87cf..dab32cf778f2 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -23,6 +23,33 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
 LIST_HEAD(leds_list);
 EXPORT_SYMBOL_GPL(leds_list);
 
+static bool __led_need_regulator_update(struct led_classdev *led_cdev,
+					int brightness)
+{
+	bool new_state = (brightness != LED_OFF);
+
+	return led_cdev->regulator && led_cdev->regulator_state != new_state;
+}
+
+static int __led_handle_regulator(struct led_classdev *led_cdev,
+				int brightness)
+{
+	int rc;
+
+	if (__led_need_regulator_update(led_cdev, brightness)) {
+
+		if (brightness != LED_OFF)
+			rc = regulator_enable(led_cdev->regulator);
+		else
+			rc = regulator_disable(led_cdev->regulator);
+		if (rc)
+			return rc;
+
+		led_cdev->regulator_state = (brightness != LED_OFF);
+	}
+	return 0;
+}
+
 static int __led_set_brightness(struct led_classdev *led_cdev,
 				enum led_brightness value)
 {
@@ -115,6 +142,8 @@ static void set_brightness_delayed(struct work_struct *ws)
 	if (ret == -ENOTSUPP)
 		ret = __led_set_brightness_blocking(led_cdev,
 					led_cdev->delayed_set_value);
+	__led_handle_regulator(led_cdev, led_cdev->delayed_set_value);
+
 	if (ret < 0 &&
 	    /* LED HW might have been unplugged, therefore don't warn */
 	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
@@ -256,8 +285,14 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
 			      enum led_brightness value)
 {
 	/* Use brightness_set op if available, it is guaranteed not to sleep */
-	if (!__led_set_brightness(led_cdev, value))
-		return;
+	if (!__led_set_brightness(led_cdev, value)) {
+		/*
+		 * if regulator state doesn't need to be changed, that is all/
+		 * Otherwise delegate the change to a work queue
+		 */
+		if (!__led_need_regulator_update(led_cdev, value))
+			return;
+	}
 
 	/* If brightness setting can sleep, delegate it to a work queue task */
 	led_cdev->delayed_set_value = value;
@@ -280,6 +315,8 @@ EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
 int led_set_brightness_sync(struct led_classdev *led_cdev,
 			    enum led_brightness value)
 {
+	int ret;
+
 	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
 		return -EBUSY;
 
@@ -288,7 +325,11 @@ int led_set_brightness_sync(struct led_classdev *led_cdev,
 	if (led_cdev->flags & LED_SUSPENDED)
 		return 0;
 
-	return __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
+	ret = __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
+	if (ret)
+		return ret;
+
+	return __led_handle_regulator(led_cdev, led_cdev->brightness);
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_sync);
 
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 47b229469069..5aa5c038bd38 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -11,6 +11,7 @@
 
 #include <linux/rwsem.h>
 #include <linux/leds.h>
+#include <linux/regulator/consumer.h>
 
 static inline int led_get_brightness(struct led_classdev *led_cdev)
 {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 9b2bf574a17a..bee8e3f8dddd 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -123,6 +123,10 @@ struct led_classdev {
 
 	/* Ensures consistent access to the LED Flash Class device */
 	struct mutex		led_access;
+
+	/* regulator */
+	struct regulator	*regulator;
+	bool			regulator_state;
 };
 
 extern int of_led_classdev_register(struct device *parent,
-- 
2.17.1
