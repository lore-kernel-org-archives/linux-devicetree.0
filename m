From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 1/3 RESEND] power: reset: Add support for NI Ettus Research USRP E3x0 soft-poweroff.
Date: Wed,  4 Mar 2015 14:25:47 -0800
Message-ID: <1425507949-30499-2-git-send-email-moritz.fischer@ettus.com>
References: <1425507949-30499-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425507949-30499-1-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
---
 drivers/power/reset/Kconfig         | 10 +++++
 drivers/power/reset/Makefile        |  1 +
 drivers/power/reset/e3x0-poweroff.c | 79 +++++++++++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 27f6646..7e81c93 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -48,6 +48,16 @@ config POWER_RESET_BRCMSTB
 	  Say Y here if you have a Broadcom STB board and you wish
 	  to have restart support.
 
+config POWER_RESET_E3X0
+	tristate "NI Ettus Research USRP E3x0 soft poweroff driver."
+	default n
+	help
+	  Say Y here to enable support for the NI Ettus Research
+	  USRP E3x0 soft poweroff.
+
+	  To compile this driver as a module, chose M here: the
+	  module will be called e3x0-poweroff.
+
 config POWER_RESET_GPIO
 	bool "GPIO power-off driver"
 	depends on OF_GPIO
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index 11de15b..eef50e9a 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_POWER_RESET_AT91_POWEROFF) += at91-poweroff.o
 obj-$(CONFIG_POWER_RESET_AT91_RESET) += at91-reset.o
 obj-$(CONFIG_POWER_RESET_AXXIA) += axxia-reset.o
 obj-$(CONFIG_POWER_RESET_BRCMSTB) += brcmstb-reboot.o
+obj-$(CONFIG_POWER_RESET_E3X0) += e3x0-poweroff.o
 obj-$(CONFIG_POWER_RESET_GPIO) += gpio-poweroff.o
 obj-$(CONFIG_POWER_RESET_GPIO_RESTART) += gpio-restart.o
 obj-$(CONFIG_POWER_RESET_HISI) += hisi-reboot.o
diff --git a/drivers/power/reset/e3x0-poweroff.c b/drivers/power/reset/e3x0-poweroff.c
new file mode 100644
index 0000000..767fa19
--- /dev/null
+++ b/drivers/power/reset/e3x0-poweroff.c
@@ -0,0 +1,79 @@
+/*
+ * Copyright (c) 2015, National Instruments Corp. All rights reserved.
+ *
+ * Driver for NI Ettus Research USRP E3x0 soft power off.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+static const u32 SC_POWEROFF = 0x0;
+static const u32 SC_POWEROFF_MAGIC = 0x7a;
+
+static struct regmap *syscon;
+
+static void e3x0_pm_power_off(void)
+{
+	regmap_write(syscon, SC_POWEROFF, SC_POWEROFF_MAGIC);
+}
+
+static int e3x0_poweroff_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	syscon = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
+	if (IS_ERR(syscon)) {
+		dev_err(dev, "Failed to get syscon");
+		return PTR_ERR(syscon);
+	}
+
+	if (!pm_power_off)
+		pm_power_off = e3x0_pm_power_off;
+
+	return 0;
+}
+
+static int e3x0_poweroff_remove(struct platform_device *pdev)
+{
+	if (pm_power_off == e3x0_pm_power_off)
+		pm_power_off = NULL;
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id e3x0_poweroff_match[] = {
+	{ .compatible = "ettus,e3x0-poweroff", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, e3x0_poweroff_match);
+#endif
+
+static struct platform_driver e3x0_poweroff_driver = {
+	.driver	=	{
+		.name	=	"e3x0-poweroff",
+		.of_match_table	=	of_match_ptr(e3x0_poweroff_match),
+	},
+	.probe	=	e3x0_poweroff_probe,
+	.remove	=	e3x0_poweroff_remove,
+};
+module_platform_driver(e3x0_poweroff_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>");
+MODULE_DESCRIPTION("NI Ettus Research USRP E3x0 soft-poweroff driver");
+MODULE_ALIAS("platform:e3x0-poweroff");
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
