From: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: [PATCH RESEND 13/16] backlight: ti-lmu-backlight: add LM3697 driver
Date: Mon, 2 Nov 2015 14:24:32 +0900
Message-ID: <1446441875-1256-14-git-send-email-milo.kim@ti.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446441875-1256-1-git-send-email-milo.kim-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

LM3697 has 3 backlight strings and 11 bit dimming is supported.
PWM brightness control is also supported.

LM3697 MFD has HWMON driver which monitors hardware fault detection.
After this monitoring is done, LM3697 backlight device should be
reinitialized. To enable this, 'hwmon_notifier_used' is set to true.
Then, TI LMU backlight handles LMU HWMON event in
ti_lmu_backlight_hwmon_notifier().

Common backlight driver is controlled by TI LMU backlight driver.
Only LM3697 specific code is implemented here.

Cc: Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
---
 drivers/video/backlight/Kconfig     |   9 ++
 drivers/video/backlight/Makefile    |   1 +
 drivers/video/backlight/lm3697_bl.c | 187 ++++++++++++++++++++++++++++++++++++
 3 files changed, 197 insertions(+)
 create mode 100644 drivers/video/backlight/lm3697_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index c1dc908..c672073 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -434,6 +434,15 @@ config BACKLIGHT_LM3695
 	  Say Y to enable the backlight driver for TI LM3695.
 	  Up to 2 backlight strings and 11 bit dimming is supported.
 
+config BACKLIGHT_LM3697
+	tristate "Backlight driver for TI LM3697"
+	depends on BACKLIGHT_CLASS_DEVICE && MFD_TI_LMU
+	select TI_LMU_BACKLIGHT
+	help
+	  Say Y to enable the backlight driver for TI LM3697.
+	  Up to 3 backlight strings and 11 bit dimming is supported.
+	  PWM brightness control is also supported.
+
 config TI_LMU_BACKLIGHT
 	tristate "Backlight driver for TI LMU"
 	depends on BACKLIGHT_LM3532 || BACKLIGHT_LM3631 || \
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index af20285..abb7fe0 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_BACKLIGHT_LM3632)		+= lm3632_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3633)		+= lm3633_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3639)		+= lm3639_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3695)		+= lm3695_bl.o
+obj-$(CONFIG_BACKLIGHT_LM3697)		+= lm3697_bl.o
 obj-$(CONFIG_BACKLIGHT_LOCOMO)		+= locomolcd.o
 obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
 obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
diff --git a/drivers/video/backlight/lm3697_bl.c b/drivers/video/backlight/lm3697_bl.c
new file mode 100644
index 0000000..bb0c2bf
--- /dev/null
+++ b/drivers/video/backlight/lm3697_bl.c
@@ -0,0 +1,187 @@
+/*
+ * TI LM3697 Backlight Driver
+ *
+ * Copyright 2015 Texas Instruments
+ *
+ * Author: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
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
+#define LM3697_BL_MAX_STRINGS		3
+#define LM3697_MAX_BRIGHTNESS		2047
+
+static int lm3697_bl_init(struct ti_lmu_bl_chip *chip)
+{
+	/* Configure ramp selection for each bank */
+	return ti_lmu_update_bits(chip->lmu, LM3697_REG_RAMP_CONF,
+				  LM3697_RAMP_MASK, LM3697_RAMP_EACH);
+}
+
+static int lm3697_bl_enable(struct ti_lmu_bl *lmu_bl, int enable)
+{
+	return ti_lmu_update_bits(lmu_bl->chip->lmu, LM3697_REG_ENABLE,
+				  BIT(lmu_bl->bank_id),
+				  enable << lmu_bl->bank_id);
+}
+
+static int lm3697_bl_set_brightness(struct ti_lmu_bl *lmu_bl, int brightness)
+{
+	int ret;
+	u8 data;
+	u8 reg_lsb[] = { LM3697_REG_BRT_A_LSB, LM3697_REG_BRT_B_LSB, };
+	u8 reg_msb[] = { LM3697_REG_BRT_A_MSB, LM3697_REG_BRT_B_MSB, };
+
+	data = brightness & LM3697_BRT_LSB_MASK;
+	ret = ti_lmu_update_bits(lmu_bl->chip->lmu, reg_lsb[lmu_bl->bank_id],
+				 LM3697_BRT_LSB_MASK, data);
+	if (ret)
+		return ret;
+
+	data = (brightness >> LM3697_BRT_MSB_SHIFT) & 0xFF;
+	return ti_lmu_write_byte(lmu_bl->chip->lmu, reg_msb[lmu_bl->bank_id],
+				 data);
+}
+
+static int lm3697_bl_set_ctrl_mode(struct ti_lmu_bl *lmu_bl)
+{
+	int bank_id = lmu_bl->bank_id;
+
+	if (lmu_bl->mode == BL_PWM_BASED)
+		return ti_lmu_update_bits(lmu_bl->chip->lmu,
+					  LM3697_REG_PWM_CFG,
+					  BIT(bank_id), 1 << bank_id);
+
+	return 0;
+}
+
+static int lm3697_bl_string_configure(struct ti_lmu_bl *lmu_bl)
+{
+	struct ti_lmu *lmu = lmu_bl->chip->lmu;
+	int bank_id = lmu_bl->bank_id;
+	int is_detected = 0;
+	int i, ret;
+
+	/* Assign control bank from backlight string configuration */
+	for (i = 0; i < LM3697_BL_MAX_STRINGS; i++) {
+		if (test_bit(i, &lmu_bl->bl_string)) {
+			ret = ti_lmu_update_bits(lmu,
+						 LM3697_REG_HVLED_OUTPUT_CFG,
+						 BIT(i), bank_id << i);
+			if (ret)
+				return ret;
+
+			is_detected = 1;
+		}
+	}
+
+	if (!is_detected) {
+		dev_err(lmu_bl->chip->dev, "No backlight string found\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int lm3697_bl_set_current_limit(struct ti_lmu_bl *lmu_bl)
+{
+	u8 reg[] = { LM3697_REG_IMAX_A, LM3697_REG_IMAX_B, };
+
+	return ti_lmu_write_byte(lmu_bl->chip->lmu, reg[lmu_bl->bank_id],
+				 lmu_bl->imax);
+}
+
+static int lm3697_bl_set_ramp(struct ti_lmu_bl *lmu_bl)
+{
+	int ret, index;
+	u8 reg;
+
+	index = ti_lmu_backlight_get_ramp_index(lmu_bl, BL_RAMP_UP);
+	if (index > 0) {
+		if (lmu_bl->bank_id == 0)
+			reg = LM3697_REG_BL0_RAMPUP;
+		else
+			reg = LM3697_REG_BL1_RAMPUP;
+
+		ret = ti_lmu_update_bits(lmu_bl->chip->lmu, reg,
+					 LM3697_BL_RAMPUP_MASK,
+					 index << LM3697_BL_RAMPUP_SHIFT);
+		if (ret)
+			return ret;
+	}
+
+	index = ti_lmu_backlight_get_ramp_index(lmu_bl, BL_RAMP_DOWN);
+	if (index > 0) {
+		if (lmu_bl->bank_id == 0)
+			reg = LM3697_REG_BL0_RAMPDN;
+		else
+			reg = LM3697_REG_BL1_RAMPDN;
+
+		ret = ti_lmu_update_bits(lmu_bl->chip->lmu, reg,
+					 LM3697_BL_RAMPDN_MASK,
+					 index << LM3697_BL_RAMPDN_SHIFT);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int lm3697_bl_configure(struct ti_lmu_bl *lmu_bl)
+{
+	int ret;
+
+	ret = lm3697_bl_set_ctrl_mode(lmu_bl);
+	if (ret)
+		return ret;
+
+	ret = lm3697_bl_string_configure(lmu_bl);
+	if (ret)
+		return ret;
+
+	ret = lm3697_bl_set_current_limit(lmu_bl);
+	if (ret)
+		return ret;
+
+	ret = lm3697_bl_set_ramp(lmu_bl);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/* Backlight ramp up/down time. Unit is msec. */
+static const int lm3697_ramp_table[] = {
+	   2, 250, 500, 1000, 2000, 4000, 8000, 16000,
+};
+
+static const struct ti_lmu_bl_ops lm3697_lmu_ops = {
+	.init			= lm3697_bl_init,
+	.configure		= lm3697_bl_configure,
+	.update_brightness	= lm3697_bl_set_brightness,
+	.bl_enable		= lm3697_bl_enable,
+	.hwmon_notifier_used	= true,
+	.max_brightness		= LM3697_MAX_BRIGHTNESS,
+	.ramp_table		= lm3697_ramp_table,
+	.size_ramp		= ARRAY_SIZE(lm3697_ramp_table),
+};
+
+/* LM3697 backlight of_device_id */
+TI_LMU_BL_OF_DEVICE(lm3697, "ti,lm3697-backlight");
+
+/* LM3697 backlight platform driver */
+TI_LMU_BL_PLATFORM_DRIVER(lm3697, "lm3697-backlight");
+
+MODULE_DESCRIPTION("TI LM3697 Backlight Driver");
+MODULE_AUTHOR("Milo Kim");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:lm3697-backlight");
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
