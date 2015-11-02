From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH 12/16] backlight: ti-lmu-backlight: add LM3695 driver
Date: Mon, 2 Nov 2015 14:01:19 +0900
Message-ID: <1446440483-6948-13-git-send-email-milo.kim@ti.com>
References: <1446440483-6948-1-git-send-email-milo.kim@ti.com>
 <1446440483-6948-2-git-send-email-milo.kim@ti.com>
 <1446440483-6948-3-git-send-email-milo.kim@ti.com>
 <1446440483-6948-4-git-send-email-milo.kim@ti.com>
 <1446440483-6948-5-git-send-email-milo.kim@ti.com>
 <1446440483-6948-6-git-send-email-milo.kim@ti.com>
 <1446440483-6948-7-git-send-email-milo.kim@ti.com>
 <1446440483-6948-8-git-send-email-milo.kim@ti.com>
 <1446440483-6948-9-git-send-email-milo.kim@ti.com>
 <1446440483-6948-10-git-send-email-milo.kim@ti.com>
 <1446440483-6948-11-git-send-email-milo.kim@ti.com>
 <1446440483-6948-12-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446440483-6948-12-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org
Cc: Milo Kim <milo.kim@ti.com>, Jingoo Han <jingoohan1@gmail.com>
List-Id: devicetree@vger.kernel.org

LM3695 has 2 backlight strings and 11 bit dimming is supported.

Common backlight driver is controlled by TI LMU backlight driver.
Only LM3695 specific code is implemented here.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 drivers/video/backlight/Kconfig     |  8 ++++
 drivers/video/backlight/Makefile    |  1 +
 drivers/video/backlight/lm3695_bl.c | 91 +++++++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+)
 create mode 100644 drivers/video/backlight/lm3695_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index e3c4adb..c1dc908 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -426,6 +426,14 @@ config BACKLIGHT_LM3633
 	  Up to 3 backlight strings and 11 bit dimming is supported.
 	  PWM brightness control is also supported.
 
+config BACKLIGHT_LM3695
+	tristate "Backlight driver for TI LM3695"
+	depends on BACKLIGHT_CLASS_DEVICE && MFD_TI_LMU
+	select TI_LMU_BACKLIGHT
+	help
+	  Say Y to enable the backlight driver for TI LM3695.
+	  Up to 2 backlight strings and 11 bit dimming is supported.
+
 config TI_LMU_BACKLIGHT
 	tristate "Backlight driver for TI LMU"
 	depends on BACKLIGHT_LM3532 || BACKLIGHT_LM3631 || \
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 364b854..af20285 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_BACKLIGHT_LM3631)		+= lm3631_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3632)		+= lm3632_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3633)		+= lm3633_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3639)		+= lm3639_bl.o
+obj-$(CONFIG_BACKLIGHT_LM3695)		+= lm3695_bl.o
 obj-$(CONFIG_BACKLIGHT_LOCOMO)		+= locomolcd.o
 obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
 obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
diff --git a/drivers/video/backlight/lm3695_bl.c b/drivers/video/backlight/lm3695_bl.c
new file mode 100644
index 0000000..fe47d00
--- /dev/null
+++ b/drivers/video/backlight/lm3695_bl.c
@@ -0,0 +1,91 @@
+/*
+ * TI LM3695 Backlight Driver
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
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/mfd/ti-lmu.h>
+#include <linux/mfd/ti-lmu-register.h>
+#include <linux/module.h>
+
+#include "ti-lmu-backlight.h"
+
+#define LM3695_FULL_STRINGS		(LMU_HVLED1 | LMU_HVLED2)
+#define LM3695_MAX_BRIGHTNESS		2047
+
+static int lm3695_bl_enable(struct ti_lmu_bl *lmu_bl, int enable)
+{
+	int ret;
+
+	ret = ti_lmu_update_bits(lmu_bl->chip->lmu, LM3695_REG_GP,
+				 LM3695_BL_EN_MASK, enable);
+	if (ret)
+		return ret;
+
+	/* Wait time for brightness register wake up */
+	usleep_range(600, 700);
+
+	return 0;
+}
+
+static int lm3695_bl_set_brightness(struct ti_lmu_bl *lmu_bl, int brightness)
+{
+	u8 data;
+	int ret;
+
+	data = brightness & LM3695_BRT_LSB_MASK;
+	ret = ti_lmu_update_bits(lmu_bl->chip->lmu, LM3695_REG_BRT_LSB,
+				 LM3695_BRT_LSB_MASK, data);
+	if (ret)
+		return ret;
+
+	data = (brightness >> LM3695_BRT_MSB_SHIFT) & 0xFF;
+	return ti_lmu_write_byte(lmu_bl->chip->lmu, LM3695_REG_BRT_MSB,
+				 data);
+}
+
+static int lm3695_bl_init(struct ti_lmu_bl_chip *chip)
+{
+	return ti_lmu_update_bits(chip->lmu, LM3695_REG_GP,
+				  LM3695_BRT_RW_MASK, LM3695_BRT_RW_MASK);
+}
+
+static int lm3695_bl_configure(struct ti_lmu_bl *lmu_bl)
+{
+	u8 val;
+
+	if (lmu_bl->bl_string == LM3695_FULL_STRINGS)
+		val = LM3695_BL_TWO_STRINGS;
+	else
+		val = LM3695_BL_ONE_STRING;
+
+	return ti_lmu_update_bits(lmu_bl->chip->lmu, LM3695_REG_GP,
+				  LM3695_BL_STRING_MASK, val);
+}
+
+static const struct ti_lmu_bl_ops lm3695_lmu_ops = {
+	.init			= lm3695_bl_init,
+	.configure		= lm3695_bl_configure,
+	.update_brightness	= lm3695_bl_set_brightness,
+	.bl_enable		= lm3695_bl_enable,
+	.max_brightness		= LM3695_MAX_BRIGHTNESS,
+};
+
+/* LM3695 backlight of_device_id */
+TI_LMU_BL_OF_DEVICE(lm3695, "ti,lm3695-backlight");
+
+/* LM3695 backlight platform driver */
+TI_LMU_BL_PLATFORM_DRIVER(lm3695, "lm3695-backlight");
+
+MODULE_DESCRIPTION("TI LM3695 Backlight Driver");
+MODULE_AUTHOR("Milo Kim");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:lm3695-backlight");
-- 
1.9.1
