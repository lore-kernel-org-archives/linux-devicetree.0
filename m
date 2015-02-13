From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] power: reset: Add support for NI Ettus Research USRP E3x0 soft-poweroff.
Date: Thu, 12 Feb 2015 17:14:39 -0800
Message-ID: <1423790080-8264-2-git-send-email-moritz.fischer@ettus.com>
References: <1423790080-8264-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423790080-8264-1-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
---
 .../bindings/power/reset/e3x0-poweroff.txt         | 16 ++++
 drivers/power/reset/Kconfig                        | 10 +++
 drivers/power/reset/Makefile                       |  1 +
 drivers/power/reset/e3x0-poweroff.c                | 94 ++++++++++++++++++++++
 4 files changed, 121 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/e3x0-poweroff.txt b/Documentation/devicetree/bindings/power/reset/e3x0-poweroff.txt
new file mode 100644
index 0000000..df19998
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/e3x0-poweroff.txt
@@ -0,0 +1,16 @@
+National Instruments Ettus Research USRP E3x0 poweroff driver
+
+This module is part of the NI Ettus Research USRP E3x0 SDR.
+
+Required properties:
+- compatible: should be one of the following
+  - "ettus,e3x0-poweroff": For devices such as the NI Ettus Research USRP E3x0
+- reg: The registers to write to in order to trigger the poweroff.
+
+Note: Addresses may vary depending on the FPGA configuration
+
+Example:
+	poweroff0: poweroff@40300000 {
+		compatible = "ettus,e3x0-poweroff";
+		reg = <0x40300000 0x04>;
+	};
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 27f6646..e45029f 100644
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
+	  module will be called e3x0-reset.
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
index 0000000..3e6778a
--- /dev/null
+++ b/drivers/power/reset/e3x0-poweroff.c
@@ -0,0 +1,94 @@
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
+#include <linux/platform_device.h>
+#include <linux/of.h>
+
+static const u32 E3X0_POWEROFF_REG_OFFSET = 0x0;
+static const u32 E3X0_POWEROFF_MAGIC = 0x7a;
+
+struct e3x0_poweroff {
+	struct device *dev;
+	void * __iomem io_addr;
+};
+
+static struct e3x0_poweroff *e3x0_poweroff;
+
+static void e3x0_pm_power_off(void)
+{
+	writel(E3X0_POWEROFF_MAGIC,
+		e3x0_poweroff->io_addr + E3X0_POWEROFF_REG_OFFSET);
+}
+
+static int e3x0_poweroff_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct device *dev = &pdev->dev;
+
+	e3x0_poweroff = devm_kzalloc(dev, sizeof(*e3x0_poweroff),
+				GFP_KERNEL);
+	if (!e3x0_poweroff)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	e3x0_poweroff->dev = dev;
+	e3x0_poweroff->io_addr = devm_ioremap_resource(dev, res);
+	if (IS_ERR(e3x0_poweroff->io_addr)) {
+		dev_err(dev, "Failed to ioremap registers\n");
+		return PTR_ERR(e3x0_poweroff->io_addr);
+	}
+
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
+	e3x0_poweroff = NULL;
+
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
