From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v8 5/5] gpio: tps65912: Add GPIO driver for the TPS65912 PMIC
Date: Mon, 25 Jan 2016 09:43:47 -0600
Message-ID: <1453736627-2634-6-git-send-email-afd@ti.com>
References: <1453736627-2634-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453736627-2634-1-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for the TPS65912 PMIC GPIOs.

TPS65912 has five configurable GPIOs that can be used for several
purposes.

Signed-off-by: Andrew F. Davis <afd@ti.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig         |   6 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-tps65912.c | 158 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 drivers/gpio/gpio-tps65912.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 98eaedd..3d60b74 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -858,6 +858,12 @@ config GPIO_TPS65910
 	  Select this option to enable GPIO driver for the TPS65910
 	  chip family.
 
+config GPIO_TPS65912
+	tristate "TI TPS65912 GPIO"
+	depends on MFD_TPS65912
+	help
+	  This driver supports TPS65912 gpio chip
+
 config GPIO_TWL4030
 	tristate "TWL4030, TWL5030, and TPS659x0 GPIOs"
 	depends on TWL4030_CORE
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index edc33f0..ece7d7c 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -97,6 +97,7 @@ obj-$(CONFIG_GPIO_TIMBERDALE)	+= gpio-timberdale.o
 obj-$(CONFIG_GPIO_PALMAS)	+= gpio-palmas.o
 obj-$(CONFIG_GPIO_TPS6586X)	+= gpio-tps6586x.o
 obj-$(CONFIG_GPIO_TPS65910)	+= gpio-tps65910.o
+obj-$(CONFIG_GPIO_TPS65912)	+= gpio-tps65912.o
 obj-$(CONFIG_GPIO_TS5500)	+= gpio-ts5500.o
 obj-$(CONFIG_GPIO_TWL4030)	+= gpio-twl4030.o
 obj-$(CONFIG_GPIO_TWL6040)	+= gpio-twl6040.o
diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
new file mode 100644
index 0000000..3da3840
--- /dev/null
+++ b/drivers/gpio/gpio-tps65912.c
@@ -0,0 +1,158 @@
+/*
+ * GPIO driver for TI TPS65912x PMICs
+ *
+ * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ *	Andrew F. Davis <afd@ti.com>
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
+ * Based on the Arizona GPIO driver and the previous TPS65912 driver by
+ * Margarita Olaya Cabrera <magi@slimlogic.co.uk>
+ */
+
+#include <linux/gpio.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <linux/mfd/tps65912.h>
+
+struct tps65912_gpio {
+	struct gpio_chip gpio_chip;
+	struct tps65912 *tps;
+};
+
+static int tps65912_gpio_get_direction(struct gpio_chip *gc,
+				       unsigned offset)
+{
+	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
+
+	int ret, val;
+
+	ret = regmap_read(gpio->tps->regmap, TPS65912_GPIO1 + offset, &val);
+	if (ret)
+		return ret;
+
+	if (val & GPIO_CFG_MASK)
+		return GPIOF_DIR_OUT;
+	else
+		return GPIOF_DIR_IN;
+}
+
+static int tps65912_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
+{
+	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
+
+	return regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
+				  GPIO_CFG_MASK, 0);
+}
+
+static int tps65912_gpio_direction_output(struct gpio_chip *gc,
+					  unsigned offset, int value)
+{
+	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
+
+	/* Set the initial value */
+	regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
+			   GPIO_SET_MASK, value ? GPIO_SET_MASK : 0);
+
+	return regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
+				  GPIO_CFG_MASK, GPIO_CFG_MASK);
+}
+
+static int tps65912_gpio_get(struct gpio_chip *gc, unsigned offset)
+{
+	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
+	int ret, val;
+
+	ret = regmap_read(gpio->tps->regmap, TPS65912_GPIO1 + offset, &val);
+	if (ret)
+		return ret;
+
+	if (val & GPIO_STS_MASK)
+		return 1;
+
+	return 0;
+}
+
+static void tps65912_gpio_set(struct gpio_chip *gc, unsigned offset,
+			      int value)
+{
+	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
+
+	regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
+			   GPIO_SET_MASK, value ? GPIO_SET_MASK : 0);
+}
+
+static struct gpio_chip template_chip = {
+	.label			= "tps65912-gpio",
+	.owner			= THIS_MODULE,
+	.get_direction		= tps65912_gpio_get_direction,
+	.direction_input	= tps65912_gpio_direction_input,
+	.direction_output	= tps65912_gpio_direction_output,
+	.get			= tps65912_gpio_get,
+	.set			= tps65912_gpio_set,
+	.base			= -1,
+	.ngpio			= 5,
+	.can_sleep		= true,
+};
+
+static int tps65912_gpio_probe(struct platform_device *pdev)
+{
+	struct tps65912 *tps = dev_get_drvdata(pdev->dev.parent);
+	struct tps65912_gpio *gpio;
+	int ret;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->tps = dev_get_drvdata(pdev->dev.parent);
+	gpio->gpio_chip = template_chip;
+	gpio->gpio_chip.parent = tps->dev;
+
+	ret = gpiochip_add_data(&gpio->gpio_chip, gpio);
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
+static int tps65912_gpio_remove(struct platform_device *pdev)
+{
+	struct tps65912_gpio *gpio = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&gpio->gpio_chip);
+
+	return 0;
+}
+
+static const struct platform_device_id tps65912_gpio_id_table[] = {
+	{ "tps65912-gpio", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, tps65912_gpio_id_table);
+
+static struct platform_driver tps65912_gpio_driver = {
+	.driver = {
+		.name = "tps65912-gpio",
+	},
+	.probe = tps65912_gpio_probe,
+	.remove = tps65912_gpio_remove,
+	.id_table = tps65912_gpio_id_table,
+};
+module_platform_driver(tps65912_gpio_driver);
+
+MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
+MODULE_DESCRIPTION("TPS65912 GPIO driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.0
