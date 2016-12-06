From: Eric Jeong <eric.jeong.opensource@diasemi.com>
Subject: [RESEND PATCH V3 4/4] gpio: pv88080: Add GPIO function support
Date: Tue, 6 Dec 2016 14:33:13 +0900
Message-ID: <3e5d9f938494bf7420577ca2f55fd243705d9415.1481002393.git.eric.jeong@diasemi.com>
References: <cover.1481002393.git.eric.jeong@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1481002393.git.eric.jeong@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, LINUX-GPIO <linux-gpio@vger.kernel.org>, LINUX-KERNEL <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: DEVICETREE <devicetree@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org


From: Eric Jeong <eric.jeong.opensource@diasemi.com>

This patch adds support for PV88080 PMIC GPIOs.
PV88080 has two configurable GPIOs.

Kconfig and Makefile are updated to reflect support
for PV88080 PMIC GPIO. 

Signed-off-by: Eric Jeong <eric.jeong.opensource@diasemi.com>

---
This patch applies against linux-next and next-20161117

Hi,

Change since PATCH V2
 - Add the set_single_ended function
 - Add property reading function
 - Simplify and clarfy the funcion of gpio_chip

Change since PATCH V1
 - Patch separated from PATCH V1

Regards,
Eric Jeong, Dialog Semiconductor Ltd.


 drivers/gpio/Kconfig        |   11 +++
 drivers/gpio/Makefile       |    1 +
 drivers/gpio/gpio-pv88080.c |  213 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 225 insertions(+)
 create mode 100644 drivers/gpio/gpio-pv88080.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a9a1c8a..cb11686 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -949,6 +949,17 @@ config GPIO_PALMAS
 	  Select this option to enable GPIO driver for the TI PALMAS
 	  series chip family.
 
+config GPIO_PV88080
+	tristate "Powerventure Semiconductor PV88080 GPIO"
+	depends on MFD_PV88080
+	help
+	  Support for GPIO pins on PV88080 PMIC.
+
+	  Say yes here to enable the GPIO driver for the PV88080 chip.
+
+	  The Powerventure PMIC chip has 2 GPIO pins that can be
+	  controlled by this driver.
+
 config GPIO_RC5T583
 	bool "RICOH RC5T583 GPIO"
 	depends on MFD_RC5T583
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 8043a95..2a2311e 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_GPIO_PCF857X)	+= gpio-pcf857x.o
 obj-$(CONFIG_GPIO_PCH)		+= gpio-pch.o
 obj-$(CONFIG_GPIO_PISOSR)	+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)	+= gpio-pl061.o
+obj-$(CONFIG_GPIO_PV88080)	+= gpio-pv88080.o
 obj-$(CONFIG_GPIO_PXA)		+= gpio-pxa.o
 obj-$(CONFIG_GPIO_RC5T583)	+= gpio-rc5t583.o
 obj-$(CONFIG_GPIO_RDC321X)	+= gpio-rdc321x.o
diff --git a/drivers/gpio/gpio-pv88080.c b/drivers/gpio/gpio-pv88080.c
new file mode 100644
index 0000000..6f4734f
--- /dev/null
+++ b/drivers/gpio/gpio-pv88080.c
@@ -0,0 +1,213 @@
+/*
+ * gpio-pv88080.c - GPIO device driver for PV88080
+ * Copyright (C) 2016  Powerventure Semiconductor Ltd.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/gpio.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/bitops.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <linux/mfd/pv88080.h>
+
+#define PV88080_PORT_DIRECTION_INPUT	0
+#define PV88080_PORT_DIRECTION_OUTPUT	1
+
+struct pv88080_gpio {
+	struct pv88080 *chip;
+	struct gpio_chip gpio_chip;
+	unsigned int input_reg;
+	unsigned int output_reg;
+	unsigned int gpio_base_reg;
+};
+
+static int pv88080_gpio_get_direction(struct gpio_chip *gc,
+				unsigned int offset)
+{
+	struct pv88080_gpio *priv = gpiochip_get_data(gc);
+	struct pv88080 *chip = priv->chip;
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(chip->regmap, priv->gpio_base_reg + offset, &value);
+	if (ret)
+		return ret;
+
+	value = !(value & PV88080_GPIO_DIRECTION_MASK);
+
+	return value;
+}
+
+static int pv88080_gpio_direction_input(struct gpio_chip *gc,
+				unsigned int offset)
+{
+	struct pv88080_gpio *priv = gpiochip_get_data(gc);
+	struct pv88080 *chip = priv->chip;
+
+	return regmap_update_bits(chip->regmap, priv->gpio_base_reg + offset,
+			PV88080_GPIO_DIRECTION_MASK, 0);
+}
+
+static int pv88080_gpio_direction_output(struct gpio_chip *gc,
+				unsigned int offset, int value)
+{
+	struct pv88080_gpio *priv = gpiochip_get_data(gc);
+	struct pv88080 *chip = priv->chip;
+
+	return regmap_update_bits(chip->regmap, priv->gpio_base_reg + offset,
+			PV88080_GPIO_DIRECTION_MASK, 1);
+}
+
+static int pv88080_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct pv88080_gpio *priv = gpiochip_get_data(gc);
+	struct pv88080 *chip = priv->chip;
+	unsigned int reg, value;
+	int ret;
+
+	ret = regmap_read(chip->regmap, priv->gpio_base_reg + offset, &value);
+	if (ret < 0)
+		return ret;
+
+	if (value & PV88080_GPIO_DIRECTION_MASK)
+		reg = priv->output_reg;
+	else
+		reg = priv->input_reg;
+
+	ret = regmap_read(chip->regmap, reg, &value);
+	if (ret < 0)
+		return ret;
+
+	value = !!(value & BIT(offset));
+
+	return value;
+}
+
+static void pv88080_gpio_set(struct gpio_chip *gc, unsigned int offset,
+				int value)
+{
+	struct pv88080_gpio *priv = gpiochip_get_data(gc);
+	struct pv88080 *chip = priv->chip;
+	int ret;
+
+	ret = regmap_update_bits(chip->regmap, priv->output_reg,
+			BIT(offset), (value << offset));
+	if (ret < 0)
+		dev_err(chip->dev, "Failed to update gpio\n");
+}
+
+static int pv88080_set_single_ended(struct gpio_chip *gc,
+				unsigned int offset,
+				enum single_ended_mode mode)
+{
+	struct pv88080_gpio *priv = gpiochip_get_data(gc);
+	struct pv88080 *chip = priv->chip;
+	int ret;
+
+	switch (mode) {
+	case LINE_MODE_OPEN_DRAIN:
+		ret = regmap_update_bits(chip->regmap,
+					priv->gpio_base_reg + offset,
+					PV88080_GPIO_SINGLE_ENDED_MASK, 0);
+		break;
+	case LINE_MODE_PUSH_PULL:
+		ret = regmap_update_bits(chip->regmap,
+					priv->gpio_base_reg + offset,
+					PV88080_GPIO_SINGLE_ENDED_MASK, 1 << 1);
+		break;
+	default:
+		ret = -ENOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct gpio_chip template_gpio = {
+	.label = "pv88080-gpio",
+	.owner = THIS_MODULE,
+	.get_direction = pv88080_gpio_get_direction,
+	.direction_input = pv88080_gpio_direction_input,
+	.direction_output = pv88080_gpio_direction_output,
+	.get = pv88080_gpio_get,
+	.set = pv88080_gpio_set,
+	.set_single_ended = pv88080_set_single_ended,
+	.base = -1,
+	.ngpio = 2,
+};
+
+static const struct of_device_id pv88080_gpio_of_match[] = {
+	{ .compatible = "pvs,pv88080-gpio", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, pv88080_gpio_of_match);
+
+static int pv88080_gpio_probe(struct platform_device *pdev)
+{
+	struct pv88080 *chip = dev_get_drvdata(pdev->dev.parent);
+	struct pv88080_gpio *priv;
+	struct device_node *np = pdev->dev.of_node;
+	u32 ngpios;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev,
+			sizeof(struct pv88080_gpio), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->chip = chip;
+	priv->gpio_chip = template_gpio;
+	priv->gpio_chip.parent = &pdev->dev;
+
+	switch (chip->type) {
+	case TYPE_PV88080_AA:
+		priv->input_reg = PV88080AA_REG_GPIO_INPUT;
+		priv->output_reg = PV88080AA_REG_GPIO_OUTPUT;
+		priv->gpio_base_reg = PV88080AA_REG_GPIO_GPIO0;
+		break;
+	case TYPE_PV88080_BA:
+		priv->input_reg = PV88080BA_REG_GPIO_INPUT;
+		priv->output_reg = PV88080BA_REG_GPIO_OUTPUT;
+		priv->gpio_base_reg = PV88080BA_REG_GPIO_GPIO0;
+		break;
+	}
+
+	if (!of_property_read_u32(np, "ngpios", &ngpios))
+		priv->gpio_chip.ngpio = ngpios;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, &priv->gpio_chip, priv);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Unable to register gpiochip\n");
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static struct platform_driver pv88080_gpio_driver = {
+	.driver = {
+		.name = "pv88080-gpio",
+		.of_match_table = of_match_ptr(pv88080_gpio_of_match),
+	},
+	.probe = pv88080_gpio_probe,
+};
+module_platform_driver(pv88080_gpio_driver);
+
+MODULE_AUTHOR("Eric Jeong <eric.jeong.opensource@diasemi.com>");
+MODULE_DESCRIPTION("GPIO device driver for Powerventure PV88080");
+MODULE_LICENSE("GPL");
+
-- 
end-of-patch for RESEND PATCH V3
