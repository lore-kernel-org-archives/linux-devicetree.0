From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V5 3/3] hwmon: pwm-fan: Add RPM support via external interrupt
Date: Thu, 11 Apr 2019 15:30:11 +0200
Message-ID: <1554989411-23666-4-git-send-email-stefan.wahren@i2se.com>
References: <1554989411-23666-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554989411-23666-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This adds RPM support to the pwm-fan driver in order to use with
fancontrol/pwmconfig. This feature is intended for fans with a tachometer
output signal, which generate a defined number of pulses per revolution.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/hwmon/pwm-fan.c | 107 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 103 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index e4c5197..8c4c5ee 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -18,6 +18,7 @@
 
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
+#include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -26,6 +27,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/sysfs.h>
 #include <linux/thermal.h>
+#include <linux/timer.h>
 
 #define MAX_PWM 255
 
@@ -33,6 +35,14 @@ struct pwm_fan_ctx {
 	struct mutex lock;
 	struct pwm_device *pwm;
 	struct regulator *reg_en;
+
+	int irq;
+	atomic_t pulses;
+	unsigned int rpm;
+	u8 pulses_per_revolution;
+	ktime_t sample_start;
+	struct timer_list rpm_timer;
+
 	unsigned int pwm_value;
 	unsigned int pwm_fan_state;
 	unsigned int pwm_fan_max_state;
@@ -40,6 +50,32 @@ struct pwm_fan_ctx {
 	struct thermal_cooling_device *cdev;
 };
 
+/* This handler assumes self resetting edge triggered interrupt. */
+static irqreturn_t pulse_handler(int irq, void *dev_id)
+{
+	struct pwm_fan_ctx *ctx = dev_id;
+
+	atomic_inc(&ctx->pulses);
+
+	return IRQ_HANDLED;
+}
+
+static void sample_timer(struct timer_list *t)
+{
+	struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
+	int pulses;
+	u64 tmp;
+
+	pulses = atomic_read(&ctx->pulses);
+	atomic_sub(pulses, &ctx->pulses);
+	tmp = (u64)pulses * ktime_ms_delta(ktime_get(), ctx->sample_start) * 60;
+	do_div(tmp, ctx->pulses_per_revolution * 1000);
+	ctx->rpm = tmp;
+
+	ctx->sample_start = ktime_get();
+	mod_timer(&ctx->rpm_timer, jiffies + HZ);
+}
+
 static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
 {
 	unsigned long period;
@@ -100,15 +136,47 @@ static ssize_t pwm_show(struct device *dev, struct device_attribute *attr,
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
 
-ATTRIBUTE_GROUPS(pwm_fan);
+static umode_t pwm_fan_attrs_visible(struct kobject *kobj, struct attribute *a,
+				     int n)
+{
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
+	struct device_attribute *devattr;
+
+	/* Hide fan_input in case no interrupt is available  */
+	devattr = container_of(a, struct device_attribute, attr);
+	if (n == 1 && ctx->irq <= 0)
+		return 0;
+
+	return a->mode;
+}
+
+static const struct attribute_group pwm_fan_group = {
+	.attrs = pwm_fan_attrs,
+	.is_visible = pwm_fan_attrs_visible,
+};
+
+static const struct attribute_group *pwm_fan_groups[] = {
+	&pwm_fan_group,
+	NULL,
+};
 
 /* thermal cooling device callbacks */
 static int pwm_fan_get_max_state(struct thermal_cooling_device *cdev,
@@ -214,6 +282,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	struct device *hwmon;
 	int ret;
 	struct pwm_state state = { };
+	u32 ppr = 2;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -233,6 +302,10 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ctx);
 
+	ctx->irq = platform_get_irq(pdev, 0);
+	if (ctx->irq == -EPROBE_DEFER)
+		return ctx->irq;
+
 	ctx->reg_en = devm_regulator_get_optional(&pdev->dev, "fan");
 	if (IS_ERR(ctx->reg_en)) {
 		if (PTR_ERR(ctx->reg_en) != -ENODEV)
@@ -261,17 +334,38 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		goto err_reg_disable;
 	}
 
+	timer_setup(&ctx->rpm_timer, sample_timer, 0);
+
+	of_property_read_u32(pdev->dev.of_node, "pulses-per-revolution", &ppr);
+	ctx->pulses_per_revolution = ppr;
+	if (!ctx->pulses_per_revolution) {
+		dev_err(&pdev->dev, "pulses-per-revolution can't be zero.\n");
+		ret = -EINVAL;
+		goto err_pwm_disable;
+	}
+
+	if (ctx->irq > 0) {
+		ret = devm_request_irq(&pdev->dev, ctx->irq, pulse_handler, 0,
+				       pdev->name, ctx);
+		if (ret) {
+			dev_err(&pdev->dev, "Can't get interrupt working.\n");
+			goto err_pwm_disable;
+		}
+		ctx->sample_start = ktime_get();
+		mod_timer(&ctx->rpm_timer, jiffies + HZ);
+	}
+
 	hwmon = devm_hwmon_device_register_with_groups(&pdev->dev, "pwmfan",
 						       ctx, pwm_fan_groups);
 	if (IS_ERR(hwmon)) {
 		dev_err(&pdev->dev, "Failed to register hwmon device\n");
 		ret = PTR_ERR(hwmon);
-		goto err_pwm_disable;
+		goto err_del_timer;
 	}
 
 	ret = pwm_fan_of_get_cooling_data(&pdev->dev, ctx);
 	if (ret)
-		goto err_pwm_disable;
+		goto err_del_timer;
 
 	ctx->pwm_fan_state = ctx->pwm_fan_max_state;
 	if (IS_ENABLED(CONFIG_THERMAL)) {
@@ -282,7 +376,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"Failed to register pwm-fan as cooling device");
 			ret = PTR_ERR(cdev);
-			goto err_pwm_disable;
+			goto err_del_timer;
 		}
 		ctx->cdev = cdev;
 		thermal_cdev_update(cdev);
@@ -290,6 +384,9 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_del_timer:
+	del_timer_sync(&ctx->rpm_timer);
+
 err_pwm_disable:
 	state.enabled = false;
 	pwm_apply_state(ctx->pwm, &state);
@@ -306,6 +403,8 @@ static int pwm_fan_remove(struct platform_device *pdev)
 	struct pwm_fan_ctx *ctx = platform_get_drvdata(pdev);
 
 	thermal_cooling_device_unregister(ctx->cdev);
+	del_timer_sync(&ctx->rpm_timer);
+
 	if (ctx->pwm_value)
 		pwm_disable(ctx->pwm);
 
-- 
2.7.4
