From: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: [PATCH v2] gpio: Driver for SYSCON-based GPIOs
Date: Tue, 17 Dec 2013 23:19:44 +0400
Message-ID: <1387307984-7693-1-git-send-email-shc_work@mail.ru>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SYSCON driver was designed for using memory areas (registers)
that are used in several subsystems. There are systems (CPUs)
which use bits in one register for various purposes and thus
should be handled by various kernel subsystems. This driver
allows you to use the individual SYSCON bits as GPIOs.
ARM CLPS711X SYSFLG1 input lines has been added as first user
of this driver.

Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio-syscon.txt       |  19 +++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-syscon.c                         | 151 +++++++++++++++++++++
 4 files changed, 177 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-syscon.txt
 create mode 100644 drivers/gpio/gpio-syscon.c

diff --git a/Documentation/devicetree/bindings/gpio/gpio-syscon.txt b/Documentation/devicetree/bindings/gpio/gpio-syscon.txt
new file mode 100644
index 0000000..47c4fda
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-syscon.txt
@@ -0,0 +1,19 @@
+* SYSCON-based GPIO driver
+
+Required properties:
+- compatible: Should contain one of the following:
+  - "clps711x,syscon-gpio-mctrl": For ARM CLPS711X SYSFLG1 MCTRL GPIOs.
+- syscon: Phandle to syscon device node.
+- gpio-controller: Marks the device node as a gpio controller.
+- #gpio-cells: Should be two. The first cell is the pin number and
+  the second cell is used to specify the gpio polarity:
+    0 = Active high,
+    1 = Active low.
+
+Example:
+	sysgpio: sysgpio {
+		compatible = "clps711x,syscon-gpio-mctrl";
+		syscon = <&syscon1>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index dfe1704..652a688 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -259,6 +259,12 @@ config GPIO_STA2X11
 	  Say yes here to support the STA2x11/ConneXt GPIO device.
 	  The GPIO module has 128 GPIO pins with alternate functions.
 
+config GPIO_SYSCON
+	tristate "GPIO based on SYSCON"
+	depends on MFD_SYSCON && OF
+	help
+	  Say yes here to support GPIO functionality though SYSCON driver.
+
 config GPIO_TS5500
 	tristate "TS-5500 DIO blocks and compatibles"
 	help
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 6ae8402..bf2cef4 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_GPIO_STA2X11)	+= gpio-sta2x11.o
 obj-$(CONFIG_GPIO_STMPE)	+= gpio-stmpe.o
 obj-$(CONFIG_GPIO_STP_XWAY)	+= gpio-stp-xway.o
 obj-$(CONFIG_GPIO_SX150X)	+= gpio-sx150x.o
+obj-$(CONFIG_GPIO_SYSCON)	+= gpio-syscon.o
 obj-$(CONFIG_GPIO_TB10X)	+= gpio-tb10x.o
 obj-$(CONFIG_GPIO_TC3589X)	+= gpio-tc3589x.o
 obj-$(CONFIG_ARCH_TEGRA)	+= gpio-tegra.o
diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
new file mode 100644
index 0000000..645a284
--- /dev/null
+++ b/drivers/gpio/gpio-syscon.c
@@ -0,0 +1,151 @@
+/*
+ *  SYSCON GPIO driver
+ *
+ *  Copyright (C) 2013 Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/err.h>
+#include <linux/gpio.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#define GPIO_SYSCON_INPUT	(1 << 0)
+#define GPIO_SYSCON_OUTPUT	(1 << 1)
+
+/* SYSCON driver is designed to use 32-bit wide registers */
+#define SYSCON_REG_SIZE		(4)
+#define SYSCON_REG_BITS		(SYSCON_REG_SIZE * 8)
+
+struct syscon_gpio_data {
+	unsigned int	flags;
+	unsigned int	bit_offset;
+	unsigned int	bit_count;
+};
+
+struct syscon_gpio_priv {
+	struct gpio_chip		chip;
+	struct regmap			*syscon;
+	const struct syscon_gpio_data	*data;
+};
+
+static inline struct syscon_gpio_priv *to_syscon_gpio(struct gpio_chip *chip)
+{
+	return container_of(chip, struct syscon_gpio_priv, chip);
+}
+
+static int syscon_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct syscon_gpio_priv *priv = to_syscon_gpio(chip);
+	unsigned int val, offs = priv->data->bit_offset + offset;
+	int ret;
+
+	ret = regmap_read(priv->syscon,
+			  (offs / SYSCON_REG_BITS) * SYSCON_REG_SIZE, &val);
+	if (ret < 0)
+		return ret;
+
+	return !!(val & (offs % SYSCON_REG_BITS));
+}
+
+static void syscon_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+{
+	struct syscon_gpio_priv *priv = to_syscon_gpio(chip);
+	unsigned int offs = priv->data->bit_offset + offset;
+
+	regmap_update_bits(priv->syscon,
+			   (offs / SYSCON_REG_BITS) * SYSCON_REG_SIZE,
+			   offs % SYSCON_REG_BITS,
+			   val ? (offs % SYSCON_REG_BITS) : 0);
+}
+
+static int syscon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
+{
+	return 0;
+}
+
+static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int val)
+{
+	syscon_gpio_set(chip, offset, val);
+
+	return 0;
+}
+
+static const struct syscon_gpio_data clps711x_mctrl_gpio = {
+	/* ARM CLPS711X SYSFLG1 Bits 8-10 */
+	.flags		= GPIO_SYSCON_INPUT,
+	.bit_offset	= 0x40 * 8 + 8,
+	.bit_count	= 3,
+};
+
+static const struct of_device_id syscon_gpio_ids[] = {
+	{
+		.compatible	= "clps711x,syscon-gpio-mctrl",
+		.data		= &clps711x_mctrl_gpio,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, syscon_gpio_ids);
+
+static int syscon_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct of_device_id *of_id = of_match_device(syscon_gpio_ids, dev);
+	struct syscon_gpio_priv *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->syscon = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
+	if (IS_ERR(priv->syscon))
+		return PTR_ERR(priv->syscon);
+
+	priv->data = of_id->data;
+
+	priv->chip.owner = THIS_MODULE;
+	priv->chip.label = dev_name(dev);
+	priv->chip.base = -1;
+	priv->chip.ngpio = priv->data->bit_count;
+	priv->chip.get = syscon_gpio_get;
+	if (priv->data->flags & GPIO_SYSCON_INPUT)
+		priv->chip.direction_input = syscon_gpio_dir_in;
+	if (priv->data->flags & GPIO_SYSCON_OUTPUT) {
+		priv->chip.set = syscon_gpio_set;
+		priv->chip.direction_output = syscon_gpio_dir_out;
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	return gpiochip_add(&priv->chip);
+}
+
+static int syscon_gpio_remove(struct platform_device *pdev)
+{
+	struct syscon_gpio_priv *priv = platform_get_drvdata(pdev);
+
+	return gpiochip_remove(&priv->chip);
+}
+
+static struct platform_driver syscon_gpio_driver = {
+	.driver	= {
+		.name		= "gpio-syscon",
+		.owner		= THIS_MODULE,
+		.of_match_table	= syscon_gpio_ids,
+	},
+	.probe	= syscon_gpio_probe,
+	.remove	= syscon_gpio_remove,
+};
+module_platform_driver(syscon_gpio_driver);
+
+MODULE_AUTHOR("Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>");
+MODULE_DESCRIPTION("SYSCON GPIO driver");
+MODULE_LICENSE("GPL");
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
