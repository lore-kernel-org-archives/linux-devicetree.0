From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH 07/16] backlight: add TI LMU backlight common driver
Date: Mon, 2 Nov 2015 14:01:14 +0900
Message-ID: <1446440483-6948-8-git-send-email-milo.kim@ti.com>
References: <1446440483-6948-1-git-send-email-milo.kim@ti.com>
 <1446440483-6948-2-git-send-email-milo.kim@ti.com>
 <1446440483-6948-3-git-send-email-milo.kim@ti.com>
 <1446440483-6948-4-git-send-email-milo.kim@ti.com>
 <1446440483-6948-5-git-send-email-milo.kim@ti.com>
 <1446440483-6948-6-git-send-email-milo.kim@ti.com>
 <1446440483-6948-7-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446440483-6948-7-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org
Cc: Milo Kim <milo.kim@ti.com>, Jingoo Han <jingoohan1@gmail.com>
List-Id: devicetree@vger.kernel.org

TI LMU backlight driver provides common driver features.
Chip specific configuration is handled by each backlight driver such like
LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697.

It supports common features as below.
  - Backlight subsystem control
  - Consistent device control flow
  - Control bank assignment
  - HWMON notifier handling
  - PWM brightness control
  - Shared device tree node

Operation
---------
  Each LMU backlight driver uses two macros for device registration.
  TI_LMU_BL_OF_DEVICE() and TI_LMU_BL_PLATFORM_DRIVER().

  (Common driver code)		(Chip dependent code)

				Define device operations, 'ti_lmu_bl_ops'
				: init, configure, update brightness,
				  enable, max brightness, light effect
				  and LMU HWMON event option

  _probe()
    register backlight
      parsing the device tree
      create data from the DT
      init			-> init()
      configure			-> configure()
      add backlight device

  Helper
    convert ramp time value to
    register index

  Update brightness
    pwm mode
    I2C mode			-> enable(), update_brightness()

  LMU HWMON event handling	-> check 'hwmon_notifier_used'
    reinitialize device		-> init(), configure()

  _remove()
    unregister notifier if used
    turn off the backlight

Data structure
--------------
  ti_lmu_bl_ops:	Configure device specific operation and option.
  ti_lmu_bl_chip: 	Backlight device data.
  ti_lmu_bl:		Backlight output channel data.
			One backlight device can have multiple backlight
			channels.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 drivers/video/backlight/Kconfig            |   9 +
 drivers/video/backlight/Makefile           |   1 +
 drivers/video/backlight/ti-lmu-backlight.c | 429 +++++++++++++++++++++++++++++
 drivers/video/backlight/ti-lmu-backlight.h | 152 ++++++++++
 4 files changed, 591 insertions(+)
 create mode 100644 drivers/video/backlight/ti-lmu-backlight.c
 create mode 100644 drivers/video/backlight/ti-lmu-backlight.h

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 5ffa4b4..f26eb1c 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -390,6 +390,15 @@ config BACKLIGHT_LM3639
 	help
 	  This supports TI LM3639 Backlight + 1.5A Flash LED Driver
 
+config TI_LMU_BACKLIGHT
+	tristate "Backlight driver for TI LMU"
+	depends on BACKLIGHT_LM3532 || BACKLIGHT_LM3631 || \
+		   BACKLIGHT_LM3632 || BACKLIGHT_LM3633 || \
+		   BACKLIGHT_LM3695 || BACKLIGHT_LM3697
+	help
+	  TI LMU backlight driver provides common driver features.
+	  Chip specific configuration is handled by each backlight driver.
+
 config BACKLIGHT_LP855X
 	tristate "Backlight driver for TI LP855X"
 	depends on BACKLIGHT_CLASS_DEVICE && I2C && PWM
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 16ec534..9e475dc 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -55,3 +55,4 @@ obj-$(CONFIG_BACKLIGHT_SKY81452)	+= sky81452-backlight.o
 obj-$(CONFIG_BACKLIGHT_TOSA)		+= tosa_bl.o
 obj-$(CONFIG_BACKLIGHT_TPS65217)	+= tps65217_bl.o
 obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
+obj-$(CONFIG_TI_LMU_BACKLIGHT)		+= ti-lmu-backlight.o
diff --git a/drivers/video/backlight/ti-lmu-backlight.c b/drivers/video/backlight/ti-lmu-backlight.c
new file mode 100644
index 0000000..ca59c07
--- /dev/null
+++ b/drivers/video/backlight/ti-lmu-backlight.c
@@ -0,0 +1,429 @@
+/*
+ * TI LMU(Lighting Management Unit) Backlight Common Driver
+ *
+ * Copyright 2015 Texas Instruments
+ *
+ * Author: Milo Kim <milo.kim@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/backlight.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/mfd/ti-lmu.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/slab.h>
+
+#include "ti-lmu-backlight.h"
+
+#define DEFAULT_BL_NAME			"lcd-backlight"
+#define DEFAULT_PWM_NAME		"lmu-backlight"
+
+static int ti_lmu_backlight_enable(struct ti_lmu_bl *lmu_bl, int enable)
+{
+	const struct ti_lmu_bl_ops *ops = lmu_bl->chip->ops;
+
+	if (ops->bl_enable)
+		return ops->bl_enable(lmu_bl, enable);
+
+	return 0;
+}
+
+static void ti_lmu_backlight_pwm_ctrl(struct ti_lmu_bl *lmu_bl, int br,
+				      int max_br)
+{
+	struct pwm_device *pwm;
+	unsigned int duty, period;
+
+	/* Request a PWM device with the consumer name */
+	if (!lmu_bl->pwm) {
+		pwm = devm_pwm_get(lmu_bl->chip->dev, DEFAULT_PWM_NAME);
+		if (IS_ERR(pwm)) {
+			dev_err(lmu_bl->chip->dev,
+				"Can not get PWM device, err: %ld\n",
+				PTR_ERR(pwm));
+			return;
+		}
+
+		lmu_bl->pwm = pwm;
+	}
+
+	period = lmu_bl->pwm_period;
+	duty = br * period / max_br;
+
+	pwm_config(lmu_bl->pwm, duty, period);
+	if (duty)
+		pwm_enable(lmu_bl->pwm);
+	else
+		pwm_disable(lmu_bl->pwm);
+}
+
+static int ti_lmu_backlight_update_status(struct backlight_device *bl_dev)
+{
+	struct ti_lmu_bl *lmu_bl = bl_get_data(bl_dev);
+	const struct ti_lmu_bl_ops *ops = lmu_bl->chip->ops;
+	int brightness = bl_dev->props.brightness;
+	int ret;
+
+	if (bl_dev->props.state & BL_CORE_SUSPENDED)
+		brightness = 0;
+
+	if (brightness > 0)
+		ret = ti_lmu_backlight_enable(lmu_bl, 1);
+	else
+		ret = ti_lmu_backlight_enable(lmu_bl, 0);
+	if (ret)
+		return ret;
+
+	if (lmu_bl->mode == BL_PWM_BASED)
+		ti_lmu_backlight_pwm_ctrl(lmu_bl, brightness,
+					  bl_dev->props.max_brightness);
+
+	/*
+	 * In some devices, additional handling is required after PWM control.
+	 * So, just call device-specific brightness function.
+	 */
+	if (ops->update_brightness)
+		return ops->update_brightness(lmu_bl, brightness);
+
+	return 0;
+}
+
+static const struct backlight_ops lmu_bl_common_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = ti_lmu_backlight_update_status,
+};
+
+static int ti_lmu_backlight_of_create(struct ti_lmu_bl_chip *chip,
+				      struct device_node *np)
+{
+	struct device_node *child;
+	struct ti_lmu_bl *lmu_bl, *each;
+	int num_backlights;
+	int i = 0;
+	u32 imax;
+
+	num_backlights = of_get_child_count(np);
+	if (num_backlights == 0) {
+		dev_err(chip->dev, "No backlight strings\n");
+		return -EINVAL;
+	}
+
+	/* One chip can have mulitple backlight strings */
+	lmu_bl = devm_kzalloc(chip->dev, sizeof(*lmu_bl) * num_backlights,
+			      GFP_KERNEL);
+	if (!lmu_bl)
+		return -ENOMEM;
+
+	for_each_child_of_node(np, child) {
+		each = lmu_bl + i;
+		each->bank_id = i;
+		each->chip = chip;
+
+		of_property_read_string(child, "backlight-name",
+					&each->name);
+
+		/* Backlight string configuration */
+		each->bl_string = 0;
+		if (of_property_read_bool(child, "hvled1-used"))
+			each->bl_string |= LMU_HVLED1;
+		if (of_property_read_bool(child, "hvled2-used"))
+			each->bl_string |= LMU_HVLED2;
+		if (of_property_read_bool(child, "hvled3-used"))
+			each->bl_string |= LMU_HVLED3;
+
+		imax = 0;
+		of_property_read_u32(child, "backlight-max-microamp", &imax);
+		each->imax = ti_lmu_get_current_code(imax);
+
+		of_property_read_u32(child, "initial-brightness",
+				     &each->init_brightness);
+
+		/* Lighting effect properties */
+		of_property_read_u32(child, "ramp-up-msec",
+				     &each->ramp_up_msec);
+		of_property_read_u32(child, "ramp-down-msec",
+				     &each->ramp_down_msec);
+
+		/* PWM mode */
+		of_property_read_u32(child, "pwm-period", &each->pwm_period);
+		if (each->pwm_period > 0)
+			each->mode = BL_PWM_BASED;
+		else
+			each->mode = BL_REGISTER_BASED;
+
+		each->chip = chip;
+		i++;
+	}
+
+	chip->lmu_bl = lmu_bl;
+	chip->num_backlights = num_backlights;
+
+	return 0;
+}
+
+static int ti_lmu_backlight_configure(struct ti_lmu_bl *lmu_bl)
+{
+	const struct ti_lmu_bl_ops *ops = lmu_bl->chip->ops;
+
+	if (ops->configure)
+		return ops->configure(lmu_bl);
+
+	return 0;
+}
+
+static int ti_lmu_backlight_reload(struct ti_lmu_bl_chip *chip)
+{
+	struct ti_lmu_bl *each;
+	int i, ret;
+
+	if (chip->ops->init) {
+		ret = chip->ops->init(chip);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < chip->num_backlights; i++) {
+		each = chip->lmu_bl + i;
+		ret = ti_lmu_backlight_configure(each);
+		if (ret)
+			return ret;
+
+		backlight_update_status(each->bl_dev);
+	}
+
+	return 0;
+}
+
+static int ti_lmu_backlight_hwmon_notifier(struct notifier_block *nb,
+					   unsigned long action, void *unused)
+{
+	struct ti_lmu_bl_chip *chip = container_of(nb, struct ti_lmu_bl_chip,
+						   nb);
+	int ret;
+
+	/*
+	 * LMU HWMON driver reset the device, so backlight should be
+	 * re-initialized after hwmon detection procedure is done.
+	 */
+	if (action == LMU_EVENT_HWMON_DONE) {
+		ret = ti_lmu_backlight_reload(chip);
+		if (ret)
+			return NOTIFY_STOP;
+	}
+
+	return NOTIFY_OK;
+}
+
+static int ti_lmu_backlight_init(struct ti_lmu_bl_chip *chip,
+				 struct device_node *np)
+{
+	int ret;
+
+	ret = ti_lmu_backlight_of_create(chip, np);
+	if (ret)
+		return ret;
+
+	if (chip->ops->init) {
+		ret = chip->ops->init(chip);
+		if (ret)
+			return ret;
+	}
+
+	/* Register notifier for LMU HWMON event */
+	if (chip->ops->hwmon_notifier_used) {
+		chip->nb.notifier_call = ti_lmu_backlight_hwmon_notifier;
+		ret = blocking_notifier_chain_register(&chip->lmu->notifier,
+						       &chip->nb);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ti_lmu_backlight_add_device(struct device *dev,
+				       struct ti_lmu_bl *lmu_bl)
+{
+	struct backlight_device *bl_dev;
+	struct backlight_properties props;
+	int max_brightness = lmu_bl->chip->ops->max_brightness;
+	char name[20];
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_PLATFORM;
+	props.brightness = lmu_bl->init_brightness;
+	props.max_brightness = max_brightness;
+
+	/* Backlight device name */
+	if (!lmu_bl->name)
+		snprintf(name, sizeof(name), "%s:%d", DEFAULT_BL_NAME,
+			 lmu_bl->bank_id);
+	else
+		snprintf(name, sizeof(name), "%s", lmu_bl->name);
+
+	bl_dev = devm_backlight_device_register(dev, name, lmu_bl->chip->dev,
+						lmu_bl, &lmu_bl_common_ops,
+						&props);
+	if (IS_ERR(bl_dev))
+		return PTR_ERR(bl_dev);
+
+	lmu_bl->bl_dev = bl_dev;
+
+	return 0;
+}
+
+static struct ti_lmu_bl_chip *
+ti_lmu_backlight_register(struct device *dev, struct ti_lmu *lmu,
+			  const struct ti_lmu_bl_ops *ops)
+{
+	struct device_node *np = dev->of_node;
+	struct ti_lmu_bl_chip *chip;
+	struct ti_lmu_bl *each;
+	int i, ret;
+
+	if (!ops) {
+		dev_err(dev, "Operation is not configured\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return ERR_PTR(-ENOMEM);
+
+	chip->dev = dev;
+	chip->lmu = lmu;
+	chip->ops = ops;
+
+	ret = ti_lmu_backlight_init(chip, np);
+	if (ret) {
+		dev_err(dev, "Backlight init err: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	/* Add backlight strings */
+	for (i = 0; i < chip->num_backlights; i++) {
+		each = chip->lmu_bl + i;
+
+		ret = ti_lmu_backlight_configure(each);
+		if (ret) {
+			dev_err(dev, "Backlight config err: %d\n", ret);
+			return ERR_PTR(ret);
+		}
+
+		ret = ti_lmu_backlight_add_device(dev, each);
+		if (ret) {
+			dev_err(dev, "Backlight device err: %d\n", ret);
+			return ERR_PTR(ret);
+		}
+
+		backlight_update_status(each->bl_dev);
+	}
+
+	return chip;
+}
+
+static void ti_lmu_backlight_unregister(struct ti_lmu_bl_chip *chip)
+{
+	struct ti_lmu_bl *each;
+	int i;
+
+	for (i = 0; i < chip->num_backlights; i++) {
+		each = chip->lmu_bl + i;
+		each->bl_dev->props.brightness = 0;
+		backlight_update_status(each->bl_dev);
+	}
+}
+
+/* Common probe() function for LMU backlight drivers */
+int ti_lmu_backlight_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ti_lmu *lmu = dev_get_drvdata(dev->parent);
+	struct ti_lmu_bl_chip *chip;
+	const struct of_device_id *match;
+	const struct ti_lmu_bl_ops *ops;
+
+	match = of_match_device(dev->driver->of_match_table, dev);
+	if (!match) {
+		dev_err(dev, "No matched device is found\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * Get device specific data(ti_lmu_bl_ops) from of_match table.
+	 * This data is defined by TI_LMU_BL_OF_DEVICE() of each device.
+	 */
+	ops = (struct ti_lmu_bl_ops *)match->data;
+	chip = ti_lmu_backlight_register(&pdev->dev, lmu, ops);
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	platform_set_drvdata(pdev, chip);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ti_lmu_backlight_probe);
+
+/* Common remove() function for LMU backlight drivers */
+int ti_lmu_backlight_remove(struct platform_device *pdev)
+{
+	struct ti_lmu_bl_chip *chip = platform_get_drvdata(pdev);
+
+	if (chip->ops->hwmon_notifier_used)
+		blocking_notifier_chain_unregister(&chip->lmu->notifier,
+						   &chip->nb);
+
+	ti_lmu_backlight_unregister(chip);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ti_lmu_backlight_remove);
+
+/*
+ * Convert ramp up/down time into register index value.
+ * Get appropriate index by comparing ramp time table.
+ */
+int ti_lmu_backlight_get_ramp_index(struct ti_lmu_bl *lmu_bl,
+				    enum ti_lmu_bl_ramp_mode mode)
+{
+	const int *table = lmu_bl->chip->ops->ramp_table;
+	const int size = lmu_bl->chip->ops->size_ramp;
+	unsigned int ramp_time;
+	int i;
+
+	if (!table)
+		return -EINVAL;
+
+	if (mode == BL_RAMP_UP)
+		ramp_time = lmu_bl->ramp_up_msec;
+	else if (mode == BL_RAMP_DOWN)
+		ramp_time = lmu_bl->ramp_down_msec;
+	else
+		return -EINVAL;
+
+	if (ramp_time <= table[0])
+		return 0;
+
+	if (ramp_time >= table[size - 1])
+		return size - 1;
+
+	for (i = 1; i < size; i++)
+		if (ramp_time >= table[i - 1] && ramp_time < table[i])
+			return i - 1;
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(ti_lmu_backlight_get_ramp_index);
+
+MODULE_DESCRIPTION("TI LMU Backlight Common Driver");
+MODULE_AUTHOR("Milo Kim");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/video/backlight/ti-lmu-backlight.h b/drivers/video/backlight/ti-lmu-backlight.h
new file mode 100644
index 0000000..f3f3784
--- /dev/null
+++ b/drivers/video/backlight/ti-lmu-backlight.h
@@ -0,0 +1,152 @@
+/*
+ * TI LMU(Lighting Management Unit) Backlight Common Driver
+ *
+ * Copyright 2015 Texas Instruments
+ *
+ * Author: Milo Kim <milo.kim@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __TI_LMU_BACKLIGHT_H__
+#define __TI_LMU_BACKLIGHT_H__
+
+#include <linux/mfd/ti-lmu.h>
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+
+/* Macro for LMU backlight of_device_id */
+#define TI_LMU_BL_OF_DEVICE(chip, compat)				\
+static const struct of_device_id chip##_bl_of_match[] = {		\
+	{ .compatible = compat, .data = &chip##_lmu_ops },		\
+	{ }								\
+};									\
+MODULE_DEVICE_TABLE(of, chip##_bl_of_match)				\
+
+/* Macro for LMU backlight platform driver */
+#define TI_LMU_BL_PLATFORM_DRIVER(chip, _name)				\
+static struct platform_driver chip##_bl_driver = {			\
+	.probe  = ti_lmu_backlight_probe,				\
+	.remove = ti_lmu_backlight_remove,				\
+	.driver = {							\
+		.name = _name,						\
+		.of_match_table = chip##_bl_of_match,			\
+	},								\
+};									\
+									\
+module_platform_driver(chip##_bl_driver)
+
+enum ti_lmu_bl_ctrl_mode {
+	BL_REGISTER_BASED,
+	BL_PWM_BASED,
+};
+
+enum ti_lmu_bl_ramp_mode {
+	BL_RAMP_UP,
+	BL_RAMP_DOWN,
+};
+
+struct ti_lmu_bl;
+struct ti_lmu_bl_chip;
+
+/**
+ * struct ti_lmu_bl_ops
+ *
+ * @init:		Device initialization function
+ * @configure:		Device string configuration function
+ * @update_brightness:	Device brightness control function
+ * @bl_enable:		Device backlight enable/disable control function
+ * @hwmon_notifier_used:Set true if the device needs to handle LMU HWMON event
+ * @max_brightness:	Max brightness value of backlight device
+ * @ramp_table:		Ramp time table for lighting effect.
+ *			It's used for searching appropriate register index.
+ *			Please refer to ti_lmu_backlight_get_ramp_index().
+ * @size_ramp:		Size of ramp table
+ *
+ * TI LMU backlight device should call ti_lmu_backlight_register() with
+ * each device operation.
+ */
+struct ti_lmu_bl_ops {
+	int (*init)(struct ti_lmu_bl_chip *lmu_chip);
+	int (*configure)(struct ti_lmu_bl *lmu_bl);
+	int (*update_brightness)(struct ti_lmu_bl *lmu_bl, int brightness);
+	int (*bl_enable)(struct ti_lmu_bl *lmu_bl, int enable);
+	bool hwmon_notifier_used;
+	const int max_brightness;
+	const int *ramp_table;
+	const int size_ramp;
+};
+
+/**
+ * struct ti_lmu_bl_chip
+ *
+ * @dev:		Parent device pointer
+ * @lmu:		LMU structure. Used for register R/W access.
+ * @ops:		Device specific operation
+ * @lmu_bl:		Multiple backlight strings
+ * @num_backlights:	Number of backlight strings
+ * @nb:			Notifier block for handling hwmon event
+ *
+ * One backlight chip can have multiple backlight strings, 'ti_lmu_bl'.
+ */
+struct ti_lmu_bl_chip {
+	struct device *dev;
+	struct ti_lmu *lmu;
+	const struct ti_lmu_bl_ops *ops;
+	struct ti_lmu_bl *lmu_bl;
+	int num_backlights;
+	struct notifier_block nb;
+};
+
+/**
+ * struct ti_lmu_bl
+ *
+ * @chip:		Pointer to parent backlight device
+ * @bl_dev:		Backlight subsystem device structure
+ * @bank_id:		Backlight bank ID
+ * @name:		Backlight channel name
+ * @mode:		Backlight control mode
+ * @bl_string:		Backlight string configuration.
+ *			Bit mask is set on parsing DT.
+ * @imax:		[Optional] Max current index.
+ *			It's result of ti_lmu_get_current_code().
+ * @init_brightness:	[Optional] Initial brightness value
+ * @ramp_up_msec:	[Optional] Ramp up time
+ * @ramp_down_msec:	[Optional] Ramp down time
+ * @pwm_period:		[Optional] PWM period
+ * @pwm:		[Optional] PWM subsystem structure
+ *
+ * Each backlight device has its own channel configuration.
+ * For chip control, parent chip data structure is used.
+ */
+struct ti_lmu_bl {
+	struct ti_lmu_bl_chip *chip;
+	struct backlight_device *bl_dev;
+
+	int bank_id;
+	const char *name;
+	enum ti_lmu_bl_ctrl_mode mode;
+	unsigned long bl_string;	/* bit OR mask of LMU_HVLEDx */
+	#define LMU_HVLED1	BIT(0)
+	#define LMU_HVLED2	BIT(1)
+	#define LMU_HVLED3	BIT(2)
+
+	enum ti_lmu_max_current imax;
+	unsigned int init_brightness;
+
+	/* Used for lighting effect */
+	unsigned int ramp_up_msec;
+	unsigned int ramp_down_msec;
+
+	/* Only valid in case of PWM mode */
+	unsigned int pwm_period;
+	struct pwm_device *pwm;
+};
+
+int ti_lmu_backlight_probe(struct platform_device *pdev);
+int ti_lmu_backlight_remove(struct platform_device *pdev);
+int ti_lmu_backlight_get_ramp_index(struct ti_lmu_bl *lmu_bl,
+				    enum ti_lmu_bl_ramp_mode mode);
+#endif
-- 
1.9.1
