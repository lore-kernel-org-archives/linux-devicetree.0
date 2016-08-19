From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 8/8] gpio: Add Aspeed driver
Date: Fri, 19 Aug 2016 22:14:14 +0930
Message-ID: <20160819124414.24242-9-andrew@aj.id.au>
References: <20160819124414.24242-1-andrew@aj.id.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160819124414.24242-1-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alistair Popple <alistair@popple.id.au>, Andrew Jeffery <andrew@aj.id.au>
List-Id: devicetree@vger.kernel.org

From: Joel Stanley <joel@jms.id.au>

The Aspeed SoCs contain GPIOs banked by letter, where each bank contains
8 pins. The GPIO banks are then grouped in sets of four in the register
layout.

The implementation exposes multiple banks through the one driver and
requests and releases pins via the pinctrl subsystem. The hardware
supports generation of interrupts from all GPIO-capable pins.

A number of hardware features are not yet supported: Configuration of
interrupt direction (ARM or LPC), debouncing, and WDT reset tolerance
for output ports.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

Since v1:

* Switch implementation to GPIOLIB_IRQCHIP
* Switch to gpiochip_get_data() for chip-specific struct
* Fix aspeed_gpio_dir_out() to write provided value
* Add __iomem attributes as necessary
* Implement aspeed_gpio_ge_direction()

 drivers/gpio/Kconfig       |   7 +
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-aspeed.c | 457 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 465 insertions(+)
 create mode 100644 drivers/gpio/gpio-aspeed.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 98dd47a30fc7..479077e56767 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -127,6 +127,13 @@ config GPIO_AMDPT
 	  driver for GPIO functionality on Promontory IOHub
 	  Require ACPI ASL code to enumerate as a platform device.
 
+config GPIO_ASPEED
+	tristate "Aspeed GPIO support"
+	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y here to support Aspeed AST2400 and AST2500 GPIO controllers.
+
 config GPIO_ATH79
 	tristate "Atheros AR71XX/AR724X/AR913X GPIO support"
 	default y if ATH79
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 2a035ed8f168..79eaffd0b157 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_GPIO_AMD8111)	+= gpio-amd8111.o
 obj-$(CONFIG_GPIO_AMDPT)	+= gpio-amdpt.o
 obj-$(CONFIG_GPIO_ARIZONA)	+= gpio-arizona.o
 obj-$(CONFIG_GPIO_ATH79)	+= gpio-ath79.o
+obj-$(CONFIG_GPIO_ASPEED)	+= gpio-aspeed.o
 obj-$(CONFIG_GPIO_BCM_KONA)	+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BRCMSTB)	+= gpio-brcmstb.o
 obj-$(CONFIG_GPIO_BT8XX)	+= gpio-bt8xx.o
diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
new file mode 100644
index 000000000000..64348a6fb60f
--- /dev/null
+++ b/drivers/gpio/gpio-aspeed.c
@@ -0,0 +1,457 @@
+/*
+ * Copyright 2015 IBM Corp.
+ *
+ * Joel Stanley <joel@jms.id.au>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/spinlock.h>
+#include <linux/platform_device.h>
+#include <linux/gpio/driver.h>
+#include <linux/pinctrl/consumer.h>
+
+struct aspeed_gpio {
+	struct gpio_chip chip;
+	spinlock_t lock;
+	void __iomem *base;
+	int irq;
+};
+
+struct aspeed_gpio_bank {
+	uint16_t	val_regs;
+	uint16_t	irq_regs;
+	const char	names[4];
+};
+
+static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
+	{
+		.val_regs = 0x0000,
+		.irq_regs = 0x0008,
+		.names = { 'A', 'B', 'C', 'D' },
+	},
+	{
+		.val_regs = 0x0020,
+		.irq_regs = 0x0028,
+		.names = { 'E', 'F', 'G', 'H' },
+	},
+	{
+		.val_regs = 0x0070,
+		.irq_regs = 0x0098,
+		.names = { 'I', 'J', 'K', 'L' },
+	},
+	{
+		.val_regs = 0x0078,
+		.irq_regs = 0x00e8,
+		.names = { 'M', 'N', 'O', 'P' },
+	},
+	{
+		.val_regs = 0x0080,
+		.irq_regs = 0x0118,
+		.names = { 'Q', 'R', 'S', 'T' },
+	},
+	{
+		.val_regs = 0x0088,
+		.irq_regs = 0x0148,
+		.names = { 'U', 'V', 'W', 'X' },
+	},
+	/*
+	 * A bank exists for { 'Y', 'Z', "AA", "AB" }, but is not implemented.
+	 * Only half of GPIOs Y support interrupt configuration, and none of Z,
+	 * AA or AB do as they are output only.
+	 */
+};
+
+#define GPIO_BANK(x)	((x) >> 5)
+#define GPIO_OFFSET(x)	((x) & 0x1f)
+#define GPIO_BIT(x)	BIT(GPIO_OFFSET(x))
+
+#define GPIO_DATA	0x00
+#define GPIO_DIR	0x04
+
+#define GPIO_IRQ_ENABLE	0x00
+#define GPIO_IRQ_TYPE0	0x04
+#define GPIO_IRQ_TYPE1	0x08
+#define GPIO_IRQ_TYPE2	0x0c
+#define GPIO_IRQ_STATUS	0x10
+
+static const struct aspeed_gpio_bank *to_bank(unsigned int offset)
+{
+	unsigned int bank = GPIO_BANK(offset);
+
+	WARN_ON(bank > ARRAY_SIZE(aspeed_gpio_banks));
+	return &aspeed_gpio_banks[bank];
+}
+
+static void __iomem *bank_val_reg(struct aspeed_gpio *gpio,
+		const struct aspeed_gpio_bank *bank,
+		unsigned int reg)
+{
+	return gpio->base + bank->val_regs + reg;
+}
+
+static void __iomem *bank_irq_reg(struct aspeed_gpio *gpio,
+		const struct aspeed_gpio_bank *bank,
+		unsigned int reg)
+{
+	return gpio->base + bank->irq_regs + reg;
+}
+
+static int aspeed_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
+	const struct aspeed_gpio_bank *bank = to_bank(offset);
+
+	return !!(ioread32(bank_val_reg(gpio, bank, GPIO_DATA))
+			& GPIO_BIT(offset));
+}
+
+static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			      int val)
+{
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
+	const struct aspeed_gpio_bank *bank = to_bank(offset);
+	void __iomem *addr;
+	u32 reg;
+
+	addr = bank_val_reg(gpio, bank, GPIO_DATA);
+	reg = ioread32(addr);
+
+	if (val)
+		reg |= GPIO_BIT(offset);
+	else
+		reg &= ~GPIO_BIT(offset);
+
+	iowrite32(reg, addr);
+}
+
+static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int val)
+{
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	__aspeed_gpio_set(gc, offset, val);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
+	const struct aspeed_gpio_bank *bank = to_bank(offset);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
+	iowrite32(reg & ~GPIO_BIT(offset), bank_val_reg(gpio, bank, GPIO_DIR));
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return 0;
+}
+
+static int aspeed_gpio_dir_out(struct gpio_chip *gc,
+			       unsigned int offset, int val)
+{
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
+	const struct aspeed_gpio_bank *bank = to_bank(offset);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
+	iowrite32(reg | GPIO_BIT(offset), bank_val_reg(gpio, bank, GPIO_DIR));
+
+	__aspeed_gpio_set(gc, offset, val);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return 0;
+}
+
+static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
+	const struct aspeed_gpio_bank *bank = to_bank(offset);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	val = ioread32(bank_val_reg(gpio, bank, GPIO_DIR)) & GPIO_BIT(offset);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return !val;
+
+}
+
+static inline int irqd_to_aspeed_gpio_data(struct irq_data *d,
+		struct aspeed_gpio **gpio,
+		const struct aspeed_gpio_bank **bank,
+		u32 *bit)
+{
+	int offset;
+
+	offset = irqd_to_hwirq(d);
+
+	*gpio = irq_data_get_irq_chip_data(d);
+	*bank = to_bank(offset);
+	*bit = GPIO_BIT(offset);
+
+	return 0;
+}
+
+static void aspeed_gpio_irq_ack(struct irq_data *d)
+{
+	const struct aspeed_gpio_bank *bank;
+	struct aspeed_gpio *gpio;
+	unsigned long flags;
+	void __iomem *status_addr;
+	u32 bit;
+	int rc;
+
+	rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit);
+	if (rc)
+		return;
+
+	status_addr = bank_irq_reg(gpio, bank, GPIO_IRQ_STATUS);
+
+	spin_lock_irqsave(&gpio->lock, flags);
+	iowrite32(bit, status_addr);
+	spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
+{
+	const struct aspeed_gpio_bank *bank;
+	struct aspeed_gpio *gpio;
+	unsigned long flags;
+	u32 reg, bit;
+	void __iomem *addr;
+	int rc;
+
+	rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit);
+	if (rc)
+		return;
+
+	addr = bank_irq_reg(gpio, bank, GPIO_IRQ_ENABLE);
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	reg = ioread32(addr);
+	if (set)
+		reg |= bit;
+	else
+		reg &= bit;
+	iowrite32(reg, addr);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static void aspeed_gpio_irq_mask(struct irq_data *d)
+{
+	aspeed_gpio_irq_set_mask(d, false);
+}
+
+static void aspeed_gpio_irq_unmask(struct irq_data *d)
+{
+	aspeed_gpio_irq_set_mask(d, true);
+}
+
+static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
+{
+	u32 type0 = 0;
+	u32 type1 = 0;
+	u32 type2 = 0;
+	u32 bit, reg;
+	const struct aspeed_gpio_bank *bank;
+	irq_flow_handler_t handler;
+	struct aspeed_gpio *gpio;
+	unsigned long flags;
+	void __iomem *addr;
+	int rc;
+
+	rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit);
+	if (rc)
+		return -EINVAL;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_BOTH:
+		type2 |= bit;
+	case IRQ_TYPE_EDGE_RISING:
+		type0 |= bit;
+	case IRQ_TYPE_EDGE_FALLING:
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		type0 |= bit;
+	case IRQ_TYPE_LEVEL_LOW:
+		type1 |= bit;
+		handler = handle_level_irq;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	addr = bank_irq_reg(gpio, bank, GPIO_IRQ_TYPE0);
+	reg = ioread32(addr);
+	reg = (reg & ~bit) | type0;
+	iowrite32(reg, addr);
+
+	addr = bank_irq_reg(gpio, bank, GPIO_IRQ_TYPE1);
+	reg = ioread32(addr);
+	reg = (reg & ~bit) | type1;
+	iowrite32(reg, addr);
+
+	addr = bank_irq_reg(gpio, bank, GPIO_IRQ_TYPE2);
+	reg = ioread32(addr);
+	reg = (reg & ~bit) | type2;
+	iowrite32(reg, addr);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+
+	irq_set_handler_locked(d, handler);
+
+	return 0;
+}
+
+static void aspeed_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct irq_chip *ic = irq_desc_get_chip(desc);
+	struct aspeed_gpio *data = gpiochip_get_data(gc);
+	unsigned int i, p, girq;
+	unsigned long reg;
+
+	chained_irq_enter(ic, desc);
+
+	for (i = 0; i < ARRAY_SIZE(aspeed_gpio_banks); i++) {
+		const struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
+
+		reg = ioread32(bank_irq_reg(data, bank, GPIO_IRQ_STATUS));
+
+		for_each_set_bit(p, &reg, 32) {
+			girq = irq_find_mapping(gc->irqdomain, i * 32 + p);
+			generic_handle_irq(girq);
+		}
+
+	}
+
+	chained_irq_exit(ic, desc);
+}
+
+static struct irq_chip aspeed_gpio_irqchip = {
+	.name		= "aspeed-gpio",
+	.irq_ack	= aspeed_gpio_irq_ack,
+	.irq_mask	= aspeed_gpio_irq_mask,
+	.irq_unmask	= aspeed_gpio_irq_unmask,
+	.irq_set_type	= aspeed_gpio_set_type,
+};
+
+static int aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
+		struct platform_device *pdev)
+{
+	int rc;
+
+	rc = platform_get_irq(pdev, 0);
+	if (rc < 0)
+		return rc;
+
+	gpio->irq = rc;
+
+	rc = gpiochip_irqchip_add(&gpio->chip, &aspeed_gpio_irqchip,
+			0, handle_bad_irq, IRQ_TYPE_NONE);
+	if (rc) {
+		dev_info(&pdev->dev, "Could not add irqchip\n");
+		return rc;
+	}
+
+	gpiochip_set_chained_irqchip(&gpio->chip, &aspeed_gpio_irqchip,
+				     gpio->irq, aspeed_gpio_irq_handler);
+
+	return 0;
+}
+
+static int aspeed_gpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	return pinctrl_request_gpio(chip->base + offset);
+}
+
+static void aspeed_gpio_free(struct gpio_chip *chip, unsigned int offset)
+{
+	pinctrl_free_gpio(chip->base + offset);
+}
+
+static int __init aspeed_gpio_probe(struct platform_device *pdev)
+{
+	struct aspeed_gpio *gpio;
+	struct resource *res;
+	int rc;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENXIO;
+
+	gpio->base = devm_ioremap_resource(&pdev->dev, res);
+	if (!gpio->base)
+		return -ENOMEM;
+
+	spin_lock_init(&gpio->lock);
+
+	gpio->chip.ngpio = ARRAY_SIZE(aspeed_gpio_banks) * 32;
+
+	gpio->chip.parent = &pdev->dev;
+	gpio->chip.direction_input = aspeed_gpio_dir_in;
+	gpio->chip.direction_output = aspeed_gpio_dir_out;
+	gpio->chip.get_direction = aspeed_gpio_get_direction;
+	gpio->chip.request = aspeed_gpio_request;
+	gpio->chip.free = aspeed_gpio_free;
+	gpio->chip.get = aspeed_gpio_get;
+	gpio->chip.set = aspeed_gpio_set;
+	gpio->chip.label = dev_name(&pdev->dev);
+	gpio->chip.base = -1;
+
+	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
+	if (rc < 0)
+		return rc;
+
+	return aspeed_gpio_setup_irqs(gpio, pdev);
+}
+
+static const struct of_device_id aspeed_gpio_of_table[] = {
+	{ .compatible = "aspeed,ast2400-gpio" },
+	{ .compatible = "aspeed,ast2500-gpio" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
+
+static struct platform_driver aspeed_gpio_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = aspeed_gpio_of_table,
+	},
+};
+
+module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
+
+MODULE_DESCRIPTION("Aspeed GPIO Driver");
-- 
2.9.3

