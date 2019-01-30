From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 3/3] hwmon: pwm-fan: Add RPM support via external interrupt
Date: Wed, 30 Jan 2019 16:07:07 +0100
Message-ID: <1548860827-29796-4-git-send-email-stefan.wahren@i2se.com>
References: <1548860827-29796-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548860827-29796-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This adds RPM support to the pwm-fan driver in order to use with
fancontrol/pwmconfig. This feature is intended for 2 pulse-per-revolution
fans which provides a tachometer output signal.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/hwmon/pwm-fan.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 9e0591e..731fdc6 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -18,6 +18,7 @@
 
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
+#include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -26,13 +27,22 @@
 #include <linux/regulator/consumer.h>
 #include <linux/sysfs.h>
 #include <linux/thermal.h>
+#include <linux/timer.h>
 
 #define MAX_PWM 255
+#define SAMPLE_TIME		1 /* seconds */
+#define PULSE_PER_REVOLUTION	2
 
 struct pwm_fan_ctx {
 	struct mutex lock;
 	struct pwm_device *pwm;
 	struct regulator *reg_en;
+
+	int irq;
+	unsigned int pulses;
+	unsigned int rpm;
+	struct timer_list sample_timer;
+
 	unsigned int pwm_value;
 	unsigned int pwm_fan_state;
 	unsigned int pwm_fan_max_state;
@@ -40,6 +50,27 @@ struct pwm_fan_ctx {
 	struct thermal_cooling_device *cdev;
 };
 
+static irqreturn_t pulse_handler(int irq, void *dev_id)
+{
+	struct pwm_fan_ctx *ctx = dev_id;
+
+	if (ctx->pulses < INT_MAX / 2)
+		ctx->pulses++;
+
+	return IRQ_HANDLED;
+}
+
+static void sample_timer(struct timer_list *t)
+{
+	struct pwm_fan_ctx *ctx = from_timer(ctx, t, sample_timer);
+	unsigned int pulses;
+
+	pulses = ctx->pulses;
+	ctx->pulses -= pulses;
+	ctx->rpm = pulses * 60 / SAMPLE_TIME / PULSE_PER_REVOLUTION;
+	mod_timer(&ctx->sample_timer, jiffies + (HZ * SAMPLE_TIME));
+}
+
 static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
 {
 	unsigned long period;
@@ -100,11 +131,20 @@ static ssize_t pwm_show(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%u\n", ctx->pwm_value);
 }
 
+static ssize_t rpm_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
+{
+	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", ctx->rpm);
+}
 
 static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, rpm, 0);
 
 static struct attribute *pwm_fan_attrs[] = {
 	&sensor_dev_attr_pwm1.dev_attr.attr,
+	&sensor_dev_attr_fan1_input.dev_attr.attr,
 	NULL,
 };
 
@@ -263,6 +303,19 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		}
 	}
 
+	timer_setup(&ctx->sample_timer, sample_timer, 0);
+
+	ctx->irq = platform_get_irq(pdev, 0);
+	if (ctx->irq >= 0) {
+		ret = devm_request_irq(&pdev->dev, ctx->irq, pulse_handler, 0,
+				       pdev->name, ctx);
+		if (ret) {
+			dev_err(&pdev->dev, "Can't get interrupt working.\n");
+			return ret;
+		}
+		mod_timer(&ctx->sample_timer, jiffies + (HZ * SAMPLE_TIME));
+	}
+
 	hwmon = devm_hwmon_device_register_with_groups(&pdev->dev, "pwmfan",
 						       ctx, pwm_fan_groups);
 	if (IS_ERR(hwmon)) {
@@ -304,6 +357,8 @@ static int pwm_fan_remove(struct platform_device *pdev)
 	struct pwm_fan_ctx *ctx = platform_get_drvdata(pdev);
 
 	thermal_cooling_device_unregister(ctx->cdev);
+	del_timer_sync(&ctx->sample_timer);
+
 	if (ctx->pwm_value)
 		pwm_disable(ctx->pwm);
 
-- 
2.7.4
