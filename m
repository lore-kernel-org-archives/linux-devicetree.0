From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH 2/2] pinctrl: driver for Conexant Digicolor CX92755 pin mapping
Date: Mon, 16 Mar 2015 17:21:45 +0200
Message-ID: <2c75fb4c925dc318fd7c5db73315a7ac5822c8ce.1426519305.git.baruch@tkos.co.il>
References: <1e256c7c4e35bb5bed79a2d2f1c8497b3b73ab74.1426519305.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1e256c7c4e35bb5bed79a2d2f1c8497b3b73ab74.1426519305.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jonathan Ben Avraham <yba@tkos.co.il>, Mike Green <Mike.Green@conexant.com>, Baruch Siach <baruch@tkos.co.il>
List-Id: devicetree@vger.kernel.org

This adds pinctrl and gpio driver to the CX92755 SoC "General Purpose Pin
Mapping" hardware block. The CX92755 is one SoC from the Conexant Digicolor
series. Pin mapping hardware supports configuring pins as either GPIO, or up to
3 other "client select" functions. This driver adds support for pin muxing
using the generic device tree binding, and a basic gpiolib driver for the GPIO
functionality.

This driver does not currently support GPIO interrupts, and pad configuration.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/pinctrl/Kconfig             |   6 +
 drivers/pinctrl/Makefile            |   1 +
 drivers/pinctrl/pinctrl-digicolor.c | 374 ++++++++++++++++++++++++++++++++++++
 3 files changed, 381 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-digicolor.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 3d44b6cfffbf..b0b887fb780f 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -67,6 +67,12 @@ config PINCTRL_AT91
 	help
 	  Say Y here to enable the at91 pinctrl driver
 
+config PINCTRL_DIGICOLOR
+	bool
+	depends on OF && (ARCH_DIGICOLOR || COMPILE_TEST)
+	select PINMUX
+	select GENERIC_PINCONF
+
 config PINCTRL_LANTIQ
 	bool
 	depends on LANTIQ
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index e54d2166bd09..81efd0ad714a 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_PINCTRL_AS3722)	+= pinctrl-as3722.o
 obj-$(CONFIG_PINCTRL_BF54x)	+= pinctrl-adi2-bf54x.o
 obj-$(CONFIG_PINCTRL_BF60x)	+= pinctrl-adi2-bf60x.o
 obj-$(CONFIG_PINCTRL_AT91)	+= pinctrl-at91.o
+obj-$(CONFIG_PINCTRL_DIGICOLOR)	+= pinctrl-digicolor.o
 obj-$(CONFIG_PINCTRL_FALCON)	+= pinctrl-falcon.o
 obj-$(CONFIG_PINCTRL_MESON)	+= meson/
 obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
diff --git a/drivers/pinctrl/pinctrl-digicolor.c b/drivers/pinctrl/pinctrl-digicolor.c
new file mode 100644
index 000000000000..d5eda6bb2a5f
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-digicolor.c
@@ -0,0 +1,374 @@
+/*
+ *  Driver for Conexant Digicolor General Purpose Pin Mapping
+ *
+ * Author: Baruch Siach <baruch@tkos.co.il>
+ *
+ * Copyright (C) 2015 Paradox Innovation Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * TODO:
+ * - GPIO interrupt support
+ * - Pin pad configuration (pull up/down, strength)
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/io.h>
+#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/spinlock.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include "pinctrl-utils.h"
+
+#define DRIVER_NAME	"pinctrl-digicolor"
+
+#define GP_CLIENTSEL(clct)	(clct*8 + 0x20)
+#define GP_DRIVE0(clct)		(GP_CLIENTSEL(clct) + 2)
+#define GP_OUTPUT0(clct)	(GP_CLIENTSEL(clct) + 3)
+#define GP_INPUT(clct)		(GP_CLIENTSEL(clct) + 6)
+
+#define PIN_COLLECTIONS		('R' - 'A' + 1)
+#define PINS_PER_COLLECTION	8
+#define PINS_COUNT		(PIN_COLLECTIONS * PINS_PER_COLLECTION)
+
+struct dc_pinmap {
+	void __iomem		*regs;
+	struct device		*dev;
+	struct pinctrl_dev	*pctl;
+
+	struct pinctrl_pin_desc	*pins;
+	const char		*pin_names[PINS_COUNT];
+
+	struct gpio_chip	chip;
+	spinlock_t		lock;
+};
+
+static int dc_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return PINS_COUNT;
+}
+
+static const char *dc_get_group_name(struct pinctrl_dev *pctldev,
+				     unsigned selector)
+{
+	struct dc_pinmap *pmap = pinctrl_dev_get_drvdata(pctldev);
+
+	return pmap->pin_names[selector];
+}
+
+static int dc_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
+			     const unsigned **pins,
+			     unsigned *num_pins)
+{
+	struct dc_pinmap *pmap = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = &pmap->pins[selector].number;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static struct pinctrl_ops dc_pinctrl_ops = {
+	.get_groups_count	= dc_get_groups_count,
+	.get_group_name		= dc_get_group_name,
+	.get_group_pins		= dc_get_group_pins,
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map		= pinctrl_utils_dt_free_map,
+};
+
+static const char *const dc_functions[] = {
+	"gpio",
+	"client_a",
+	"client_b",
+	"client_c",
+};
+
+static int dc_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(dc_functions);
+}
+
+static const char *dc_get_fname(struct pinctrl_dev *pctldev, unsigned selector)
+{
+	return dc_functions[selector];
+}
+
+static int dc_get_groups(struct pinctrl_dev *pctldev, unsigned selector,
+			 const char * const **groups,
+			 unsigned * const num_groups)
+{
+	struct dc_pinmap *pmap = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = pmap->pin_names;
+	*num_groups = PINS_COUNT;
+
+	return 0;
+}
+
+static void dc_client_sel(int pin_num, int *reg, int *bit)
+{
+	*bit = (pin_num % PINS_PER_COLLECTION) * 2;
+	*reg = GP_CLIENTSEL(pin_num/PINS_PER_COLLECTION);
+
+	if (*bit >= PINS_PER_COLLECTION) {
+		*bit -= PINS_PER_COLLECTION;
+		*reg += 1;
+	}
+}
+
+static int dc_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
+		      unsigned group)
+{
+	struct dc_pinmap *pmap = pinctrl_dev_get_drvdata(pctldev);
+	int bit_off, reg_off;
+	u8 reg;
+
+	dc_client_sel(group, &reg_off, &bit_off);
+
+	reg = readb_relaxed(pmap->regs + reg_off);
+	reg &= ~(3 << bit_off);
+	reg |= (selector << bit_off);
+	writeb_relaxed(reg, pmap->regs + reg_off);
+
+	return 0;
+}
+
+static int dc_pmx_request_gpio(struct pinctrl_dev *pcdev,
+			       struct pinctrl_gpio_range *range,
+			       unsigned offset)
+{
+	struct dc_pinmap *pmap = pinctrl_dev_get_drvdata(pcdev);
+	int bit_off, reg_off;
+	u8 reg;
+
+	dc_client_sel(offset, &reg_off, &bit_off);
+
+	reg = readb_relaxed(pmap->regs + reg_off);
+	if ((reg & (3 << bit_off)) != 0)
+		return -EBUSY;
+
+	return 0;
+}
+
+struct pinmux_ops dc_pmxops = {
+	.get_functions_count	= dc_get_functions_count,
+	.get_function_name	= dc_get_fname,
+	.get_function_groups	= dc_get_groups,
+	.set_mux		= dc_set_mux,
+	.gpio_request_enable	= dc_pmx_request_gpio,
+};
+
+struct pinctrl_desc dc_pinctrl_desc = {
+	.name		= DRIVER_NAME,
+	.owner		= THIS_MODULE,
+	.pctlops	= &dc_pinctrl_ops,
+	.pmxops		= &dc_pmxops,
+};
+
+static int dc_gpio_request(struct gpio_chip *chip, unsigned gpio)
+{
+	return pinctrl_request_gpio(chip->base + gpio);
+}
+
+static void dc_gpio_free(struct gpio_chip *chip, unsigned gpio)
+{
+	pinctrl_free_gpio(chip->base + gpio);
+}
+
+static int dc_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
+{
+	struct dc_pinmap *pmap = container_of(chip, struct dc_pinmap, chip);
+	int reg_off = GP_DRIVE0(gpio/PINS_PER_COLLECTION);
+	int bit_off = gpio % PINS_PER_COLLECTION;
+	u8 drive;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pmap->lock, flags);
+	drive = readb_relaxed(pmap->regs + reg_off);
+	drive &= ~BIT(bit_off);
+	writeb_relaxed(drive, pmap->regs + reg_off);
+	spin_unlock_irqrestore(&pmap->lock, flags);
+
+	return 0;
+}
+
+static void dc_gpio_set(struct gpio_chip *chip, unsigned gpio, int value);
+
+static int dc_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
+				    int value)
+{
+	struct dc_pinmap *pmap = container_of(chip, struct dc_pinmap, chip);
+	int reg_off = GP_DRIVE0(gpio/PINS_PER_COLLECTION);
+	int bit_off = gpio % PINS_PER_COLLECTION;
+	u8 drive;
+	unsigned long flags;
+
+	dc_gpio_set(chip, gpio, value);
+
+	spin_lock_irqsave(&pmap->lock, flags);
+	drive = readb_relaxed(pmap->regs + reg_off);
+	drive |= BIT(bit_off);
+	writeb_relaxed(drive, pmap->regs + reg_off);
+	spin_unlock_irqrestore(&pmap->lock, flags);
+
+	return 0;
+}
+
+static int dc_gpio_get(struct gpio_chip *chip, unsigned gpio)
+{
+	struct dc_pinmap *pmap = container_of(chip, struct dc_pinmap, chip);
+	int reg_off = GP_INPUT(gpio/PINS_PER_COLLECTION);
+	int bit_off = gpio % PINS_PER_COLLECTION;
+	u8 input;
+
+	input = readb_relaxed(pmap->regs + reg_off);
+
+	return !!(input & BIT(bit_off));
+}
+
+static void dc_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
+{
+	struct dc_pinmap *pmap = container_of(chip, struct dc_pinmap, chip);
+	int reg_off = GP_OUTPUT0(gpio/PINS_PER_COLLECTION);
+	int bit_off = gpio % PINS_PER_COLLECTION;
+	u8 output;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pmap->lock, flags);
+	output = readb_relaxed(pmap->regs + reg_off);
+	if (value)
+		output |= BIT(bit_off);
+	else
+		output &= ~BIT(bit_off);
+	writeb_relaxed(output, pmap->regs + reg_off);
+	spin_unlock_irqrestore(&pmap->lock, flags);
+}
+
+static int dc_gpiochip_add(struct dc_pinmap *pmap, struct device_node *np)
+{
+	struct gpio_chip *chip = &pmap->chip;
+	int ret;
+
+	chip->label		= DRIVER_NAME;
+	chip->dev		= pmap->dev;
+	chip->request		= dc_gpio_request;
+	chip->free		= dc_gpio_free;
+	chip->direction_input	= dc_gpio_direction_input;
+	chip->direction_output	= dc_gpio_direction_output;
+	chip->get		= dc_gpio_get;
+	chip->set		= dc_gpio_set;
+	chip->base		= -1;
+	chip->ngpio		= PINS_COUNT;
+	chip->of_node		= np;
+	chip->of_gpio_n_cells	= 2;
+
+	spin_lock_init(&pmap->lock);
+
+	ret = gpiochip_add(chip);
+	if (ret < 0)
+		return ret;
+
+	ret = gpiochip_add_pin_range(chip, dev_name(pmap->dev), 0, 0,
+				     PINS_COUNT);
+	if (ret < 0) {
+		gpiochip_remove(chip);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dc_pinctrl_probe(struct platform_device *pdev)
+{
+	struct dc_pinmap *pmap;
+	struct resource *r;
+	struct pinctrl_pin_desc *pins;
+	char *pin_names;
+	int name_len = strlen("GP_xx") + 1;
+	int i, j, ret;
+
+	pmap = devm_kzalloc(&pdev->dev, sizeof(*pmap), GFP_KERNEL);
+	if (!pmap)
+		return -ENOMEM;
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	pmap->regs = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(pmap->regs))
+		return PTR_ERR(pmap->regs);
+
+	pins = devm_kzalloc(&pdev->dev, sizeof(*pins)*PINS_COUNT, GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+	pin_names = devm_kzalloc(&pdev->dev, name_len * PINS_COUNT,
+				 GFP_KERNEL);
+	if (!pin_names)
+		return -ENOMEM;
+
+	for (i = 0; i < PIN_COLLECTIONS; i++) {
+		for (j = 0; j < PINS_PER_COLLECTION; j++) {
+			int pin_id = i*PINS_PER_COLLECTION + j;
+			char *name = &pin_names[pin_id * name_len];
+
+			snprintf(name, name_len, "GP_%c%c", 'A'+i, '0'+j);
+
+			pins[pin_id].number = pin_id;
+			pins[pin_id].name = name;
+			pmap->pin_names[pin_id] = name;
+		}
+	}
+
+	dc_pinctrl_desc.npins = PINS_COUNT;
+	dc_pinctrl_desc.pins = pins;
+	pmap->pins = pins;
+	pmap->dev = &pdev->dev;
+
+	pmap->pctl = pinctrl_register(&dc_pinctrl_desc, &pdev->dev, pmap);
+	if (!pmap->pctl) {
+		dev_err(&pdev->dev, "pinctrl driver registration failed\n");
+		return -EINVAL;
+	}
+
+	ret = dc_gpiochip_add(pmap, pdev->dev.of_node);
+	if (ret < 0) {
+		pinctrl_unregister(pmap->pctl);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dc_pinctrl_remove(struct platform_device *pdev)
+{
+	struct dc_pinmap *pmap = platform_get_drvdata(pdev);
+
+	pinctrl_unregister(pmap->pctl);
+	gpiochip_remove(&pmap->chip);
+
+	return 0;
+}
+
+static const struct of_device_id dc_pinctrl_ids[] = {
+	{ .compatible = "cnxt,cx92755-pinctrl" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_pinctrl_ids);
+
+static struct platform_driver dc_pinctrl_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = dc_pinctrl_ids,
+	},
+	.probe = dc_pinctrl_probe,
+	.remove = dc_pinctrl_remove,
+};
+module_platform_driver(dc_pinctrl_driver);
-- 
2.1.4

