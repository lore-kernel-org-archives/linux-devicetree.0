From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v2 6/6] gpio: tps65086: Add GPIO driver for the TPS65086 PMIC
Date: Fri, 30 Oct 2015 17:41:44 -0500
Message-ID: <1446244904-29315-7-git-send-email-afd@ti.com>
References: <1446244904-29315-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446244904-29315-1-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

Add support for the TPS65086 PMIC GPOs.

TPS65086 has four configurable GPOs that can be used for several
purposes.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/gpio/Kconfig         |   6 +++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-tps65086.c | 115 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 drivers/gpio/gpio-tps65086.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b4fc9e4..ccb7e0d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -824,6 +824,12 @@ config GPIO_TIMBERDALE
 	---help---
 	Add support for the GPIO IP in the timberdale FPGA.
 
+config GPIO_TPS65086
+	tristate "TI TPS65086 GPO"
+	depends on MFD_TPS65086
+	help
+	  This driver supports the GPO on TI TPS65086x PMICs.
+
 config GPIO_TPS6586X
 	bool "TPS6586X GPIO"
 	depends on MFD_TPS6586X
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index f79a7c4..2611c7e 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -94,6 +94,7 @@ obj-$(CONFIG_GPIO_TC3589X)	+= gpio-tc3589x.o
 obj-$(CONFIG_ARCH_TEGRA)	+= gpio-tegra.o
 obj-$(CONFIG_GPIO_TIMBERDALE)	+= gpio-timberdale.o
 obj-$(CONFIG_GPIO_PALMAS)	+= gpio-palmas.o
+obj-$(CONFIG_GPIO_TPS65086)	+= gpio-tps65086.o
 obj-$(CONFIG_GPIO_TPS6586X)	+= gpio-tps6586x.o
 obj-$(CONFIG_GPIO_TPS65910)	+= gpio-tps65910.o
 obj-$(CONFIG_GPIO_TPS65912)	+= gpio-tps65912.o
diff --git a/drivers/gpio/gpio-tps65086.c b/drivers/gpio/gpio-tps65086.c
new file mode 100644
index 0000000..ef7a418
--- /dev/null
+++ b/drivers/gpio/gpio-tps65086.c
@@ -0,0 +1,115 @@
+/*
+ * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Author: Andrew F. Davis <afd@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether expressed or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License version 2 for more details.
+ *
+ * Based on the TPS65912 driver
+ */
+
+#include <linux/gpio.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include <linux/mfd/tps65086.h>
+
+struct tps65086_gpio {
+	struct gpio_chip gpio_chip;
+	struct tps65086 *tps;
+};
+
+static inline struct tps65086_gpio *to_tps65086_gpio(struct gpio_chip *chip)
+{
+	return container_of(chip, struct tps65086_gpio, gpio_chip);
+}
+
+static int tps65086_gpio_get(struct gpio_chip *gc, unsigned offset)
+{
+	struct tps65086_gpio *gpio = to_tps65086_gpio(gc);
+	int ret, val;
+
+	ret = regmap_read(gpio->tps->regmap, TPS65086_GPOCTRL, &val);
+	if (ret < 0)
+		return ret;
+
+	return val & BIT(4 + offset);
+}
+
+static void tps65086_gpio_set(struct gpio_chip *gc, unsigned offset,
+			      int value)
+{
+	struct tps65086_gpio *gpio = to_tps65086_gpio(gc);
+
+	regmap_update_bits(gpio->tps->regmap, TPS65086_GPOCTRL,
+			   BIT(4 + offset), value ? BIT(4 + offset) : 0);
+}
+
+static struct gpio_chip template_chip = {
+	.label			= "tps65086-gpio",
+	.owner			= THIS_MODULE,
+	.get			= tps65086_gpio_get,
+	.set			= tps65086_gpio_set,
+	.can_sleep		= true,
+	.ngpio			= 4,
+	.base			= -1,
+};
+
+static int tps65086_gpio_probe(struct platform_device *pdev)
+{
+	struct tps65086_gpio *gpio;
+	int ret;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->tps = dev_get_drvdata(pdev->dev.parent);
+	gpio->gpio_chip = template_chip;
+	ret = gpiochip_add(&gpio->gpio_chip);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, gpio);
+
+	return 0;
+}
+
+static int tps65086_gpio_remove(struct platform_device *pdev)
+{
+	struct tps65086_gpio *gpio = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&gpio->gpio_chip);
+
+	return 0;
+}
+
+static const struct platform_device_id tps65086_gpio_id_table[] = {
+	{ "tps65912-regulator", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, tps65086_gpio_id_table);
+
+static struct platform_driver tps65086_gpio_driver = {
+	.driver = {
+		.name = "tps65086-gpio",
+	},
+	.probe = tps65086_gpio_probe,
+	.remove = tps65086_gpio_remove,
+	.id_table = tps65086_gpio_id_table,
+};
+module_platform_driver(tps65086_gpio_driver);
+
+MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
+MODULE_DESCRIPTION("TPS65086 GPIO driver");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1
