From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH RESEND 09/16] backlight: ti-lmu-backlight: add LM3631 driver
Date: Mon, 2 Nov 2015 14:24:28 +0900
Message-ID: <1446441875-1256-10-git-send-email-milo.kim@ti.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org
Cc: Milo Kim <milo.kim@ti.com>, Jingoo Han <jingoohan1@gmail.com>
List-Id: devicetree@vger.kernel.org

LM3631 has 2 backlight strings and 11 bit dimming is supported.
PWM brightness control is also supported.

Common backlight driver is controlled by TI LMU backlight driver.
Only LM3631 specific code is implemented here.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 drivers/video/backlight/Kconfig     |   9 +++
 drivers/video/backlight/Makefile    |   1 +
 drivers/video/backlight/lm3631_bl.c | 129 ++++++++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 drivers/video/backlight/lm3631_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 86d7946..986842e 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -399,6 +399,15 @@ config BACKLIGHT_LM3532
 	  Up to 3 backlight strings and 8 bit dimming is supported.
 	  PWM brightness control is also supported.
 
+config BACKLIGHT_LM3631
+	tristate "Backlight driver for TI LM3631"
+	depends on BACKLIGHT_CLASS_DEVICE && MFD_TI_LMU
+	select TI_LMU_BACKLIGHT
+	help
+	  Say Y to enable the backlight driver for TI LM3631.
+	  Up to 2 backlight strings and 11 bit dimming is supported.
+	  PWM brightness control is also supported.
+
 config TI_LMU_BACKLIGHT
 	tristate "Backlight driver for TI LMU"
 	depends on BACKLIGHT_LM3532 || BACKLIGHT_LM3631 || \
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index e037f57..e8891e8 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_BACKLIGHT_IPAQ_MICRO)	+= ipaq_micro_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3532)		+= lm3532_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3533)		+= lm3533_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3630A)		+= lm3630a_bl.o
+obj-$(CONFIG_BACKLIGHT_LM3631)		+= lm3631_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3639)		+= lm3639_bl.o
 obj-$(CONFIG_BACKLIGHT_LOCOMO)		+= locomolcd.o
 obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
diff --git a/drivers/video/backlight/lm3631_bl.c b/drivers/video/backlight/lm3631_bl.c
new file mode 100644
index 0000000..1a914e5
--- /dev/null
+++ b/drivers/video/backlight/lm3631_bl.c
@@ -0,0 +1,129 @@
+/*
+ * TI LM3631 Backlight Driver
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
+#include <linux/kernel.h>
+#include <linux/mfd/ti-lmu.h>
+#include <linux/mfd/ti-lmu-register.h>
+#include <linux/module.h>
+
+#include "ti-lmu-backlight.h"
+
+/* Default backlight mode: PWM x I2C before sloping */
+#define LM3631_DEFAULT_MODE		LM3631_MODE_COMB1
+#define LM3631_FULL_STRINGS		(LMU_HVLED1 | LMU_HVLED2)
+#define LM3631_MAX_BRIGHTNESS		2047
+
+static int lm3631_bl_init(struct ti_lmu_bl_chip *chip)
+{
+	/* Set the brightness mode to 'comb1' by default */
+	return ti_lmu_update_bits(chip->lmu, LM3631_REG_BRT_MODE,
+				  LM3631_MODE_MASK, LM3631_DEFAULT_MODE);
+}
+
+static int lm3631_bl_enable(struct ti_lmu_bl *lmu_bl, int enable)
+{
+	return ti_lmu_update_bits(lmu_bl->chip->lmu, LM3631_REG_DEVCTRL,
+				  LM3631_BL_EN_MASK, enable);
+}
+
+static int lm3631_bl_set_brightness(struct ti_lmu_bl *lmu_bl, int brightness)
+{
+	u8 data;
+	int ret;
+
+	if (lmu_bl->mode == BL_PWM_BASED)
+		return 0;
+
+	data = brightness & LM3631_BRT_LSB_MASK;
+	ret = ti_lmu_update_bits(lmu_bl->chip->lmu, LM3631_REG_BRT_LSB,
+				 LM3631_BRT_LSB_MASK, data);
+	if (ret)
+		return ret;
+
+	data = (brightness >> LM3631_BRT_MSB_SHIFT) & 0xFF;
+	return ti_lmu_write_byte(lmu_bl->chip->lmu, LM3631_REG_BRT_MSB,
+				 data);
+}
+
+static int lm3631_bl_string_configure(struct ti_lmu_bl *lmu_bl)
+{
+	u8 val;
+
+	if (lmu_bl->bl_string == LM3631_FULL_STRINGS)
+		val = LM3631_BL_TWO_STRINGS;
+	else
+		val = LM3631_BL_ONE_STRING;
+
+	return ti_lmu_update_bits(lmu_bl->chip->lmu, LM3631_REG_BL_CFG,
+				  LM3631_BL_STRING_MASK, val);
+}
+
+static int lm3631_bl_configure(struct ti_lmu_bl *lmu_bl)
+{
+	int ret;
+	int index;
+
+	ret = lm3631_bl_string_configure(lmu_bl);
+	if (ret)
+		return ret;
+
+	/* Set exponential mapping */
+	ret = ti_lmu_update_bits(lmu_bl->chip->lmu, LM3631_REG_BL_CFG,
+				 LM3631_MAP_MASK, LM3631_EXPONENTIAL_MAP);
+	if (ret)
+		return ret;
+
+	/* Enable slope bit before updating slope time value */
+	ret = ti_lmu_update_bits(lmu_bl->chip->lmu, LM3631_REG_BRT_MODE,
+				 LM3631_EN_SLOPE_MASK, LM3631_EN_SLOPE_MASK);
+	if (ret)
+		return ret;
+
+	/* Slope time configuration */
+	index = ti_lmu_backlight_get_ramp_index(lmu_bl, BL_RAMP_UP);
+	if (index > 0) {
+		ret = ti_lmu_update_bits(lmu_bl->chip->lmu, LM3631_REG_SLOPE,
+					 LM3631_SLOPE_MASK,
+					 index << LM3631_SLOPE_SHIFT);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/* Backlight ramp up time. Unit is msec. */
+static const int lm3631_ramp_table[] = {
+	   0,   1,   2,    5,   10,   20,   50,  100,
+	 250, 500, 750, 1000, 1500, 2000, 3000, 4000,
+};
+
+static const struct ti_lmu_bl_ops lm3631_lmu_ops = {
+	.init			= lm3631_bl_init,
+	.configure		= lm3631_bl_configure,
+	.update_brightness	= lm3631_bl_set_brightness,
+	.bl_enable		= lm3631_bl_enable,
+	.max_brightness		= LM3631_MAX_BRIGHTNESS,
+	.ramp_table		= lm3631_ramp_table,
+	.size_ramp		= ARRAY_SIZE(lm3631_ramp_table),
+};
+
+/* LM3631 backlight of_device_id */
+TI_LMU_BL_OF_DEVICE(lm3631, "ti,lm3631-backlight");
+
+/* LM3631 backlight platform driver */
+TI_LMU_BL_PLATFORM_DRIVER(lm3631, "lm3631-backlight");
+
+MODULE_DESCRIPTION("TI LM3631 Backlight Driver");
+MODULE_AUTHOR("Milo Kim");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:lm3631-backlight");
-- 
1.9.1
