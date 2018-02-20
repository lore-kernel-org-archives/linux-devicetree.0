Return-Path: <SRS0=8NQX=FO=gmail.com=keepcalm444@kernel.org>
From: Simon Shields <simon@lineageos.org>
Subject: [PATCH 2/2] leds: add Panasonic AN30259A support
Date: Tue, 20 Feb 2018 11:54:46 +1100
Message-Id: <20180220005446.8577-3-simon@lineageos.org>
In-Reply-To: <20180220005446.8577-1-simon@lineageos.org>
References: <20180220005446.8577-1-simon@lineageos.org>
To: linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Simon Shields <simon@lineageos.org>
List-ID: <devicetree@vger.kernel.org>

AN30259A is a 3-channel LED driver which uses I2C. It supports timed
operation via an internal PWM clock, and variable brightness. This
driver offers support for basic hardware-based blinking and brightness
control.

The datasheet is freely available:
https://www.alliedelec.com/m/d/a9d2b3ee87c2d1a535a41dd747b1c247.pdf

Signed-off-by: Simon Shields <simon@lineageos.org>
---
 drivers/leds/Kconfig         |  10 ++
 drivers/leds/Makefile        |   1 +
 drivers/leds/leds-an30259a.c | 338 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 349 insertions(+)
 create mode 100644 drivers/leds/leds-an30259a.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 3e763d2a0cb3..80bed557cc6b 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -57,6 +57,16 @@ config LEDS_AAT1290
 	depends on PINCTRL
 	help
 	 This option enables support for the LEDs on the AAT1290.
+
+config LEDS_AN30259A
+    tristate "LED support for Panasonic AN30259A"
+    depends on OF
+    depends on I2C
+    depends on LEDS_CLASS
+    help
+     This option enables support for the AN30259A 3-channel
+     LED driver.
+
 config LEDS_APU
 	tristate "Front panel LED support for PC Engines APU/APU2 boards"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 987884a5b9a5..44f9b42d1600 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_LEDS_88PM860X)		+= leds-88pm860x.o
 obj-$(CONFIG_LEDS_AAT1290)		+= leds-aat1290.o
 obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
 obj-$(CONFIG_LEDS_AS3645A)		+= leds-as3645a.o
+obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
 obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
 obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
new file mode 100644
index 000000000000..b51faf67e7de
--- /dev/null
+++ b/drivers/leds/leds-an30259a.c
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#define MAX_LEDS 3
+
+#define REG_SRESET 0x00
+#define LED_SRESET (1 << 0)
+
+/* LED power registers */
+#define REG_LEDON 0x01
+#define LED_EN(x) (1 << (x))
+#define LED_SLOPE(x) (1 << ((x) + 4))
+
+#define REG_LEDCC(x) (0x03 + (x))
+
+/* slope control registers */
+#define REG_SLOPE(x) (0x06 + (x))
+#define LED_SLOPETIME1(x) (x)
+#define LED_SLOPETIME2(x) ((x) << 4)
+
+#define REG_LEDCNT1(x) (0x09 + (4 * (x)))
+#define LED_DUTYMAX(x) ((x) << 4)
+#define LED_DUTYMID(x) (x)
+
+#define REG_LEDCNT2(x) (0x0A + (4 * (x)))
+#define LED_DELAY(x) ((x) << 4)
+#define LED_DUTYMIN(x) (x)
+
+/* detention time control (length of each slope step) */
+#define REG_LEDCNT3(x) (0x0B + (4 * (x)))
+#define LED_DT1(x) (x)
+#define LED_DT2(x) ((x) << 4)
+
+#define REG_LEDCNT4(x) (0x0C + (4 * (x)))
+#define LED_DT3(x) (x)
+#define LED_DT4(x) ((x) << 4)
+
+#define REG_MAX 0x14
+
+#define BLINK_MAX_TIME 7500 /* ms */
+
+struct an30259a;
+
+struct an30259a_led {
+	struct an30259a *chip;
+	struct led_classdev cdev;
+	int num;
+	char name[32];
+};
+
+struct an30259a {
+	struct mutex mutex;
+	struct i2c_client *client;
+	struct an30259a_led leds[MAX_LEDS];
+	struct regmap *regmap;
+};
+
+static u8 an30259a_get_duty_max(u8 brightness)
+{
+	u8 duty_max, floor, ceil;
+
+	/* squash 8 bit number into 7-bit PWM range */
+	duty_max = brightness >> 1;
+
+	/* bottom 3 bits are always set for DUTYMAX
+	 * figure out the closest value
+	 */
+	ceil = duty_max | 0x7;
+	floor = ceil - 0x8;
+
+	if ((duty_max - floor) < (ceil - duty_max))
+		duty_max = floor >> 3;
+	else
+		duty_max = ceil >> 3;
+
+	return duty_max;
+}
+
+static int an30259a_brightness(struct an30259a_led *led,
+		enum led_brightness brightness)
+{
+	int ret;
+	unsigned int ledon;
+	u8 duty_max;
+
+	ret = regmap_read(led->chip->regmap, REG_LEDON, &ledon);
+	switch (brightness) {
+	case LED_OFF:
+		ledon &= ~LED_EN(led->num);
+		ledon &= ~LED_SLOPE(led->num);
+		break;
+	default:
+		ledon |= LED_EN(led->num);
+		duty_max = an30259a_get_duty_max(brightness & 0xff);
+		ret = regmap_write(led->chip->regmap,
+				REG_LEDCNT1(led->num),
+				LED_DUTYMAX(duty_max) | LED_DUTYMID(duty_max));
+		if (ret)
+			return ret;
+		break;
+	}
+	ret = regmap_write(led->chip->regmap, REG_LEDON,
+				ledon);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(led->chip->regmap, REG_LEDCC(led->num),
+			brightness & 0xff);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+static int an30259a_blink(struct an30259a_led *led,
+		unsigned long *poff, unsigned long *pon)
+{
+	int ret, num = led->num;
+	unsigned int ledon;
+	unsigned long off = *poff, on = *pon;
+
+	/* slope time - multiples of 500ms only */
+	off -= off % 500;
+	if (!off)
+		off += 500;
+	else if (off > BLINK_MAX_TIME)
+		off = BLINK_MAX_TIME;
+	*poff = off;
+	off /= 500;
+
+	on -= on % 500;
+	if (!on)
+		on += 500;
+	else if (on > BLINK_MAX_TIME)
+		on = BLINK_MAX_TIME;
+	*pon = on;
+	on /= 500;
+
+	/* duty min should be zero (=off), delay should be zero */
+	ret = regmap_write(led->chip->regmap, REG_LEDCNT2(num),
+			LED_DELAY(0) | LED_DUTYMIN(0));
+	if (ret)
+		return ret;
+
+	/* reset detention time (no "breathing" effect) */
+	ret = regmap_write(led->chip->regmap, REG_LEDCNT3(num),
+			LED_DT1(0) | LED_DT2(0));
+	if (ret)
+		return ret;
+	ret = regmap_write(led->chip->regmap, REG_LEDCNT4(num),
+			LED_DT3(0) | LED_DT4(0));
+	if (ret)
+		return ret;
+
+	/* slope time controls on/off cycle length */
+	ret = regmap_write(led->chip->regmap, REG_SLOPE(num),
+			LED_SLOPETIME1(off) | LED_SLOPETIME2(on));
+	if (ret)
+		return ret;
+
+	/* Finally, enable slope mode. */
+	ret = regmap_read(led->chip->regmap, REG_LEDON, &ledon);
+	if (ret)
+		return ret;
+	ledon |= LED_SLOPE(num);
+	return regmap_write(led->chip->regmap, REG_LEDON,
+			ledon);
+}
+
+static int an30259a_led_set(struct led_classdev *cdev,
+		enum led_brightness value)
+{
+	struct an30259a_led *led;
+	int ret;
+
+	led = container_of(cdev, struct an30259a_led, cdev);
+
+	mutex_lock(&led->chip->mutex);
+
+	ret = an30259a_brightness(led, value);
+
+	mutex_unlock(&led->chip->mutex);
+	return ret;
+}
+
+static int an30259a_blink_set(struct led_classdev *cdev,
+		unsigned long *delay_off, unsigned long *delay_on)
+{
+	struct an30259a_led *led;
+	int ret;
+
+	led = container_of(cdev, struct an30259a_led, cdev);
+
+	mutex_lock(&led->chip->mutex);
+
+	ret = an30259a_blink(led, delay_off, delay_on);
+
+	mutex_unlock(&led->chip->mutex);
+	return ret;
+}
+
+static struct led_platform_data *
+an30259a_dt_init(struct i2c_client *client)
+{
+	struct led_platform_data *pdata;
+	struct device_node *np = client->dev.of_node, *child;
+	struct led_info *leds;
+	int count;
+	int res;
+
+	count = of_get_child_count(np);
+	if (!count || count > MAX_LEDS)
+		return ERR_PTR(-EINVAL);
+
+	leds = devm_kzalloc(&client->dev, sizeof(*leds) * count, GFP_KERNEL);
+	if (!leds)
+		return ERR_PTR(-ENOMEM);
+
+	for_each_child_of_node(np, child) {
+		u32 source;
+
+		res = of_property_read_u32(child, "led-sources", &source);
+		if ((res != 0) || source >= MAX_LEDS)
+			continue;
+
+		leds[source].name = of_get_property(child, "label", NULL);
+		leds[source].default_trigger =
+			of_get_property(child, "linux,default-trigger", NULL);
+	}
+
+	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	pdata->leds = leds;
+	pdata->num_leds = MAX_LEDS;
+
+	return pdata;
+}
+
+static const struct regmap_config an30259a_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = REG_MAX,
+};
+
+static int an30259a_probe(struct i2c_client *client)
+{
+	struct led_platform_data *pdata;
+	struct an30259a *chip;
+	int i, err;
+
+	pdata = an30259a_dt_init(client);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	mutex_init(&chip->mutex);
+	chip->client = client;
+	chip->regmap = devm_regmap_init_i2c(client, &an30259a_regmap_config);
+
+	i2c_set_clientdata(client, chip);
+
+	/* Reset the IC */
+	regmap_write(chip->regmap, REG_SRESET, LED_SRESET);
+
+	for (i = 0; i < pdata->num_leds; i++) {
+		chip->leds[i].num = i;
+		chip->leds[i].chip = chip;
+
+		if (pdata->leds[i].name)
+			snprintf(chip->leds[i].name, sizeof(chip->leds[i].name),
+					"an30259a:%s", pdata->leds[i].name);
+		else
+			snprintf(chip->leds[i].name, sizeof(chip->leds[i].name),
+					"an30259a:%d:%.2x:%d",
+					client->adapter->nr, client->addr, i);
+		if (pdata->leds[i].default_trigger)
+			chip->leds[i].cdev.default_trigger =
+				pdata->leds[i].default_trigger;
+
+		chip->leds[i].cdev.name = chip->leds[i].name;
+
+		chip->leds[i].cdev.brightness_set_blocking = an30259a_led_set;
+		chip->leds[i].cdev.blink_set = an30259a_blink_set;
+
+		err = led_classdev_register(&client->dev, &chip->leds[i].cdev);
+		if (err < 0)
+			goto exit;
+	}
+	return 0;
+
+exit:
+	while (i--)
+		led_classdev_unregister(&chip->leds[i].cdev);
+	return err;
+}
+
+static int an30259a_remove(struct i2c_client *client)
+{
+	struct an30259a *chip = i2c_get_clientdata(client);
+	int i;
+
+	for (i = 0; i < MAX_LEDS; i++)
+		led_classdev_unregister(&chip->leds[i].cdev);
+
+	return 0;
+}
+
+static const struct of_device_id an30259a_match_table[] = {
+	{ .compatible = "panasonic,an30259a", },
+	{ /* sentinel */ },
+};
+
+MODULE_DEVICE_TABLE(of, an30259a_match_table);
+
+static struct i2c_driver an30259a_driver = {
+	.driver = {
+		.name = "leds-an32059a",
+		.of_match_table = of_match_ptr(an30259a_match_table),
+	},
+	.probe_new = an30259a_probe,
+	.remove = an30259a_remove,
+};
+
+module_i2c_driver(an30259a_driver);
+
+MODULE_AUTHOR("Simon Shields <simon@lineageos.org>");
+MODULE_DESCRIPTION("AN32059A LED driver");
+MODULE_LICENSE("GPL v2");
-- 
2.16.2
