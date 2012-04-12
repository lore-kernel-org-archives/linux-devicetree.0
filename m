From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 2/2] gpio: Add Avionic Design N-bit GPIO expander support
Date: Thu, 12 Apr 2012 13:24:18 +0200
Message-ID: <1334229858-1665-2-git-send-email-thierry.reding@avionic-design.de>
References: <1334229858-1665-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1334229858-1665-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds a driver for the Avionic Design N-bit GPIO expander.
The expander provides a variable number of GPIO pins with interrupt
support.

Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio-adnp.txt         |   30 +
 drivers/gpio/Kconfig                               |   19 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-adnp.c                           |  643 ++++++++++++++++++++
 include/linux/i2c/gpio-adnp.h                      |   19 +
 5 files changed, 712 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-adnp.txt
 create mode 100644 drivers/gpio/gpio-adnp.c
 create mode 100644 include/linux/i2c/gpio-adnp.h

diff --git a/Documentation/devicetree/bindings/gpio/gpio-adnp.txt b/Documentation/devicetree/bindings/gpio/gpio-adnp.txt
new file mode 100644
index 0000000..8e58497
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-adnp.txt
@@ -0,0 +1,30 @@
+Avionic Design N-bit GPIO expander bindings
+
+Required properties:
+- compatible: should be "ad,gpio-adnp"
+- reg: The I2C slave address for this device.
+- interrupt-parent: phandle of the parent interrupt controller.
+- interrupts: Interrupt specifier for the controllers interrupt.
+- #gpio-cells: Should be 1.
+- gpio-controller: Marks the device as a GPIO controller
+- #interrupt-cells: Should be 1. The cell contains the number
+- interrupt-controller: Marks the device as an interrupt controller.
+- nr-gpios: The number of pins supported by the controller.
+
+Example:
+
+	gpioext: gpio-adnp@41 {
+		compatible = "ad,gpio-adnp";
+		reg = <0x41>;
+
+		interrupt-parent = <&gpio>;
+		interrupts = <160 1>;
+
+		gpio-controller;
+		#gpio-cells = <1>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		nr-gpios = <64>;
+	};
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 7875c3f..d86c3b7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -373,6 +373,25 @@ config GPIO_ADP5588_IRQ
 	  Say yes here to enable the adp5588 to be used as an interrupt
 	  controller. It requires the driver to be built in the kernel.
 
+config GPIO_ADNP
+	tristate "Avionic Design N-bit GPIO expander"
+	depends on I2C
+	help
+	  This option enables support for N GPIOs found on Avionic Design
+	  I2C GPIO expanders. The register space will be extended by powers
+	  of two, so the controller will need to accomodate for that. For
+	  example: if a controller provides 48 pins, 6 registers will be
+	  enough to represent all pins, but the driver will assume a
+	  register layout for 64 pins (8 registers).
+
+config GPIO_ADNP_IRQ
+	bool "Interrupt controller support"
+	depends on GPIO_ADNP
+	help
+	  Say yes here to enable the Avionic Design N-bit GPIO expander to
+	  be used as an interrupt controller. It requires the driver to be
+	  built in the kernel.
+
 comment "PCI GPIO expanders:"
 
 config GPIO_CS5535
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 1c2f6c0..ab674a5 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_GPIO_GENERIC)	+= gpio-generic.o
 
 obj-$(CONFIG_GPIO_74X164)	+= gpio-74x164.o
 obj-$(CONFIG_GPIO_AB8500)	+= gpio-ab8500.o
+obj-$(CONFIG_GPIO_ADNP)		+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)	+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5588)	+= gpio-adp5588.o
 obj-$(CONFIG_GPIO_BT8XX)	+= gpio-bt8xx.o
diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
new file mode 100644
index 0000000..1984c0e
--- /dev/null
+++ b/drivers/gpio/gpio-adnp.c
@@ -0,0 +1,643 @@
+/*
+ * Copyright (C) 2011-2012 Avionic Design GmbH
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+
+#include <linux/i2c/gpio-adnp.h>
+
+#define GPIO_DDR(gpio) (0x00 << (gpio)->reg_shift)
+#define GPIO_PLR(gpio) (0x01 << (gpio)->reg_shift)
+#define GPIO_IER(gpio) (0x02 << (gpio)->reg_shift)
+#define GPIO_ISR(gpio) (0x03 << (gpio)->reg_shift)
+#define GPIO_PTR(gpio) (0x04 << (gpio)->reg_shift)
+
+struct adnp {
+	struct i2c_client *client;
+	struct gpio_chip gpio;
+	unsigned int reg_shift;
+
+	struct mutex i2c_lock;
+
+#ifdef CONFIG_GPIO_ADNP_IRQ
+	struct irq_domain *domain;
+	struct mutex irq_lock;
+
+	unsigned int irq_base;
+	unsigned int nrirq;
+
+	u8 *irq_mask;
+	u8 *irq_mask_cur;
+	u8 *irq_rising;
+	u8 *irq_falling;
+#endif
+};
+
+static int adnp_read(struct adnp *gpio, unsigned offset, uint8_t *value)
+{
+	int err;
+
+	err = i2c_smbus_read_byte_data(gpio->client, offset);
+	if (err < 0) {
+		dev_err(gpio->gpio.dev, "%s failed: %d\n",
+				"i2c_smbus_read_byte_data()", err);
+		return err;
+	}
+
+	*value = err;
+	return 0;
+}
+
+static int adnp_write(struct adnp *gpio, unsigned offset, uint8_t value)
+{
+	int err;
+
+	err = i2c_smbus_write_byte_data(gpio->client, offset, value);
+	if (err < 0) {
+		dev_err(gpio->gpio.dev, "%s failed: %d\n",
+				"i2c_smbus_write_byte_data()", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int adnp_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct adnp *gpio = container_of(chip, struct adnp, gpio);
+	unsigned int reg = offset >> gpio->reg_shift;
+	unsigned int pos = offset & 7;
+	u8 value;
+	int err;
+
+	mutex_lock(&gpio->i2c_lock);
+
+	err = adnp_read(gpio, GPIO_PLR(gpio) + reg, &value);
+	if (err < 0)
+		goto out;
+
+	err = (value & BIT(pos)) ? 1 : 0;
+
+out:
+	mutex_unlock(&gpio->i2c_lock);
+	return err;
+}
+
+static void adnp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+{
+	struct adnp *gpio = container_of(chip, struct adnp, gpio);
+	unsigned int reg = offset >> gpio->reg_shift;
+	unsigned int pos = offset & 7;
+	int err;
+	u8 val;
+
+	mutex_lock(&gpio->i2c_lock);
+
+	err = adnp_read(gpio, GPIO_PLR(gpio) + reg, &val);
+	if (err < 0)
+		goto out;
+
+	if (value)
+		val |= BIT(pos);
+	else
+		val &= ~BIT(pos);
+
+	adnp_write(gpio, GPIO_PLR(gpio) + reg, val);
+
+out:
+	mutex_unlock(&gpio->i2c_lock);
+}
+
+static int adnp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+{
+	struct adnp *gpio = container_of(chip, struct adnp, gpio);
+	unsigned int reg = offset >> gpio->reg_shift;
+	unsigned int pos = offset & 7;
+	u8 value;
+	int err;
+
+	mutex_lock(&gpio->i2c_lock);
+
+	err = adnp_read(gpio, GPIO_DDR(gpio) + reg, &value);
+	if (err < 0)
+		goto out;
+
+	value &= ~BIT(pos);
+
+	err = adnp_write(gpio, GPIO_DDR(gpio) + reg, value);
+	if (err < 0)
+		goto out;
+
+	err = adnp_read(gpio, GPIO_DDR(gpio) + reg, &value);
+	if (err < 0)
+		goto out;
+
+	if (err & BIT(pos))
+		err = -EACCES;
+
+	err = 0;
+
+out:
+	mutex_unlock(&gpio->i2c_lock);
+	return err;
+}
+
+static int adnp_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
+		int value)
+{
+	struct adnp *gpio = container_of(chip, struct adnp, gpio);
+	unsigned int reg = offset >> gpio->reg_shift;
+	unsigned int pos = offset & 7;
+	int err;
+	u8 val;
+
+	mutex_lock(&gpio->i2c_lock);
+
+	err = adnp_read(gpio, GPIO_DDR(gpio) + reg, &val);
+	if (err < 0)
+		goto out;
+
+	val |= BIT(pos);
+
+	err = adnp_write(gpio, GPIO_DDR(gpio) + reg, val);
+	if (err < 0)
+		goto out;
+
+	err = adnp_read(gpio, GPIO_DDR(gpio) + reg, &val);
+	if (err < 0)
+		goto out;
+
+	if (!(val & BIT(pos))) {
+		err = -EPERM;
+		goto out;
+	}
+
+	adnp_gpio_set(chip, offset, value);
+	err = 0;
+
+out:
+	mutex_unlock(&gpio->i2c_lock);
+	return err;
+}
+
+#ifdef CONFIG_DEBUG_FS
+static void adnp_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
+{
+	struct adnp *gpio = container_of(chip, struct adnp, gpio);
+	unsigned int regs;
+	unsigned int i, j;
+	u8 *base;
+	u8 *ddr;
+	u8 *plr;
+	u8 *ier;
+	u8 *isr;
+	u8 *ptr;
+	int err;
+
+	regs = 1 << gpio->reg_shift;
+
+	base = kzalloc(regs * 5, GFP_KERNEL);
+	if (!base)
+		return;
+
+	ddr = base + (regs * 0);
+	plr = base + (regs * 1);
+	ier = base + (regs * 2);
+	isr = base + (regs * 3);
+	ptr = base + (regs * 4);
+
+	for (i = 0; i < regs; i++) {
+		err = adnp_read(gpio, GPIO_DDR(gpio) + i, &ddr[i]);
+		if (err < 0)
+			goto out;
+
+		err = adnp_read(gpio, GPIO_PLR(gpio) + i, &plr[i]);
+		if (err < 0)
+			goto out;
+
+		err = adnp_read(gpio, GPIO_IER(gpio) + i, &ier[i]);
+		if (err < 0)
+			goto out;
+
+		err = adnp_read(gpio, GPIO_ISR(gpio) + i, &isr[i]);
+		if (err < 0)
+			goto out;
+
+		err = adnp_read(gpio, GPIO_PTR(gpio) + i, &ptr[i]);
+		if (err < 0)
+			goto out;
+	}
+
+	for (i = 0; i < regs; i++) {
+		for (j = 0; j < 8; j++) {
+			unsigned int bit = (i << gpio->reg_shift) + j;
+			const char *direction = "input ";
+			const char *level = "low ";
+			const char *interrupt = "disabled";
+			const char *pending = "";
+
+			if (ddr[i] & BIT(j))
+				direction = "output";
+
+			if (plr[i] & BIT(j))
+				level = "high";
+
+			if (ier[i] & BIT(j))
+				interrupt = "enabled ";
+
+			if (isr[i] & BIT(j))
+				pending = "pending";
+
+			seq_printf(s, "%2u: %s %s IRQ %s %s\n", bit,
+					direction, level, interrupt, pending);
+		}
+	}
+
+out:
+	kfree(base);
+}
+#else
+#define adnp_gpio_dbg_show NULL
+#endif
+
+static int adnp_gpio_setup(struct adnp *gpio, struct adnp_platform_data *pdata)
+{
+	struct gpio_chip *chip = &gpio->gpio;
+
+	gpio->reg_shift = get_count_order(pdata->nr_gpios) - 3;
+
+	chip->direction_input = adnp_gpio_direction_input;
+	chip->direction_output = adnp_gpio_direction_output;
+	chip->get = adnp_gpio_get;
+	chip->set = adnp_gpio_set;
+	chip->dbg_show = adnp_gpio_dbg_show;
+	chip->can_sleep = 1;
+
+	chip->base = pdata->gpio_base;
+	chip->ngpio = pdata->nr_gpios;
+	chip->label = gpio->client->name;
+	chip->dev = &gpio->client->dev;
+	chip->owner = THIS_MODULE;
+	chip->names = pdata->names;
+
+#ifdef CONFIG_OF_GPIO
+	chip->of_node = chip->dev->of_node;
+#endif
+
+	return 0;
+}
+
+static unsigned long __adnp_irq_pending(struct adnp *gpio, unsigned int reg)
+{
+	u8 status = 0;
+	int err;
+
+	err = adnp_read(gpio, GPIO_ISR(gpio) + reg, &status);
+	if (err < 0)
+		status = 0;
+
+	return status;
+}
+
+static irqreturn_t adnp_irq(int irq, void *data)
+{
+	struct adnp *gpio = data;
+	unsigned int regs;
+	unsigned int reg;
+
+	regs = 1 << gpio->reg_shift;
+
+	for (reg = 0; reg < regs; reg++) {
+		unsigned int base = reg << gpio->reg_shift;
+		unsigned long pending;
+		u8 level = 0;
+		int bit;
+		int err;
+
+		mutex_lock(&gpio->i2c_lock);
+
+		pending = __adnp_irq_pending(gpio, reg);
+		if (!pending) {
+			mutex_unlock(&gpio->i2c_lock);
+			continue;
+		}
+
+		err = adnp_read(gpio, GPIO_PLR(gpio) + reg, &level);
+		if (err < 0) {
+			mutex_unlock(&gpio->i2c_lock);
+			continue;
+		}
+
+		mutex_unlock(&gpio->i2c_lock);
+
+		pending &= (gpio->irq_falling[reg] & ~level) |
+			   (gpio->irq_rising[reg] & level);
+
+		for_each_set_bit(bit, &pending, 8) {
+			unsigned int hwirq;
+			hwirq = irq_find_mapping(gpio->domain, base + bit);
+			handle_nested_irq(hwirq);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void adnp_irq_update_mask(struct adnp *gpio)
+{
+	unsigned int regs = 1 << gpio->reg_shift;
+	bool equal = true;
+	unsigned int i;
+
+	for (i = 0; i < regs; i++) {
+		if (gpio->irq_mask[i] != gpio->irq_mask_cur[i]) {
+			equal = false;
+			break;
+		}
+	}
+
+	if (equal)
+		return;
+
+	memcpy(gpio->irq_mask, gpio->irq_mask_cur, regs);
+
+	mutex_lock(&gpio->i2c_lock);
+
+	for (i = 0; i < regs; i++)
+		adnp_write(gpio, GPIO_IER(gpio) + i, gpio->irq_mask[i]);
+
+	mutex_unlock(&gpio->i2c_lock);
+}
+
+static int adnp_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+{
+	struct adnp *gpio = container_of(chip, struct adnp, gpio);
+	return irq_find_mapping(gpio->domain, offset);
+}
+
+static void adnp_irq_mask(struct irq_data *data)
+{
+	struct adnp *gpio = irq_data_get_irq_chip_data(data);
+	unsigned int reg = data->hwirq >> gpio->reg_shift;
+	unsigned int pos = data->hwirq & 7;
+
+	gpio->irq_mask_cur[reg] &= ~BIT(pos);
+}
+
+static void adnp_irq_unmask(struct irq_data *data)
+{
+	struct adnp *gpio = irq_data_get_irq_chip_data(data);
+	unsigned int reg = data->hwirq >> gpio->reg_shift;
+	unsigned int pos = data->hwirq & 7;
+
+	gpio->irq_mask_cur[reg] |= BIT(pos);
+}
+
+static int adnp_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct adnp *gpio = irq_data_get_irq_chip_data(data);
+	unsigned int reg = data->hwirq >> gpio->reg_shift;
+	unsigned int pos = data->hwirq & 7;
+
+	if ((type & IRQ_TYPE_EDGE_BOTH) == 0)
+		return -EINVAL;
+
+	if (type & IRQ_TYPE_EDGE_RISING)
+		gpio->irq_rising[reg] |= BIT(pos);
+	else
+		gpio->irq_rising[reg] &= ~BIT(pos);
+
+	if (type & IRQ_TYPE_EDGE_FALLING)
+		gpio->irq_falling[reg] |= BIT(pos);
+	else
+		gpio->irq_falling[reg] &= ~BIT(pos);
+
+	return 0;
+}
+
+static void adnp_irq_bus_lock(struct irq_data *data)
+{
+	struct adnp *gpio = irq_data_get_irq_chip_data(data);
+	unsigned int regs = 1 << gpio->reg_shift;
+
+	mutex_lock(&gpio->irq_lock);
+	memcpy(gpio->irq_mask_cur, gpio->irq_mask, regs);
+}
+
+static void adnp_irq_bus_unlock(struct irq_data *data)
+{
+	struct adnp *gpio = irq_data_get_irq_chip_data(data);
+
+	adnp_irq_update_mask(gpio);
+	mutex_unlock(&gpio->irq_lock);
+}
+
+static struct irq_chip adnp_irq_chip = {
+	.name = "gpio-adnp",
+	.irq_mask = adnp_irq_mask,
+	.irq_unmask = adnp_irq_unmask,
+	.irq_set_type = adnp_irq_set_type,
+	.irq_bus_lock = adnp_irq_bus_lock,
+	.irq_bus_sync_unlock = adnp_irq_bus_unlock,
+};
+
+static int adnp_irq_setup(struct adnp *gpio, struct adnp_platform_data *pdata)
+{
+	unsigned int regs = 1 << gpio->reg_shift;
+	struct gpio_chip *chip = &gpio->gpio;
+	int pin;
+	int err;
+
+	mutex_init(&gpio->irq_lock);
+
+	gpio->irq_mask = devm_kzalloc(gpio->gpio.dev, regs * 4, GFP_KERNEL);
+	if (!gpio->irq_mask)
+		return -ENOMEM;
+
+	gpio->irq_mask_cur = gpio->irq_mask + (regs * 1);
+	gpio->irq_rising = gpio->irq_mask + (regs * 2);
+	gpio->irq_falling = gpio->irq_mask + (regs * 3);
+
+	err = irq_alloc_descs(-1, pdata->irq_base, gpio->gpio.ngpio, -1);
+	if (err < 0) {
+		dev_err(gpio->gpio.dev, "%s failed: %d\n",
+				"irq_alloc_descs()", err);
+		return err;
+	}
+
+	gpio->nrirq = gpio->gpio.ngpio;
+	gpio->irq_base = err;
+
+	gpio->domain = irq_domain_add_legacy(chip->dev->of_node, gpio->nrirq,
+			gpio->irq_base, 0, &irq_domain_simple_ops, NULL);
+
+	for (pin = 0; pin < gpio->nrirq; pin++) {
+		int irq = irq_find_mapping(gpio->domain, pin);
+
+		irq_clear_status_flags(irq, IRQ_NOREQUEST);
+		irq_set_chip_data(irq, gpio);
+		irq_set_chip(irq, &adnp_irq_chip);
+		irq_set_nested_thread(irq, true);
+#ifdef CONFIG_ARM
+		set_irq_flags(irq, IRQF_VALID);
+#else
+		irq_set_noprobe(irq);
+#endif
+	}
+
+	err = request_threaded_irq(gpio->client->irq, NULL, adnp_irq,
+			IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+			dev_name(&gpio->client->dev), gpio);
+	if (err != 0) {
+		dev_err(gpio->gpio.dev, "can't request IRQ#%d: %d\n",
+				gpio->client->irq, err);
+		goto error;
+	}
+
+	gpio->gpio.to_irq = adnp_gpio_to_irq;
+	return 0;
+
+error:
+	irq_free_descs(gpio->irq_base, gpio->nrirq);
+	return err;
+}
+
+static void adnp_irq_teardown(struct adnp *gpio)
+{
+	irq_free_descs(gpio->irq_base, gpio->nrirq);
+	free_irq(gpio->client->irq, gpio);
+	kfree(gpio->domain);
+}
+
+static int adnp_parse_dt(struct device *dev, struct adnp_platform_data *pdata)
+{
+	struct device_node *node = dev->of_node;
+	u32 value;
+	int err;
+
+	if (!node)
+		return -ENODEV;
+
+	memset(pdata, 0, sizeof(*pdata));
+
+	pdata->irq_base = INT_BOARD_BASE;
+	pdata->gpio_base = -1;
+	pdata->names = NULL;
+
+	err = of_property_read_u32(node, "nr-gpios", &value);
+	if (err < 0)
+		return err;
+
+	pdata->nr_gpios = value;
+
+	return 0;
+}
+
+static __devinit int adnp_i2c_probe(struct i2c_client *client,
+		const struct i2c_device_id *id)
+{
+	struct adnp_platform_data *pdata = client->dev.platform_data;
+	struct device_node *node = client->dev.of_node;
+	struct adnp_platform_data defpdata;
+	struct adnp *gpio;
+	int err;
+
+	if (IS_ENABLED(CONFIG_OF) && node) {
+		client->irq = irq_of_parse_and_map(node, 0);
+		if (client->irq == NO_IRQ)
+			return -EPROBE_DEFER;
+	}
+
+	if (!pdata) {
+		if (!IS_ENABLED(CONFIG_OF))
+			return -ENODEV;
+
+		err = adnp_parse_dt(&client->dev, &defpdata);
+		if (err < 0)
+			return err;
+
+		pdata = &defpdata;
+	}
+
+	gpio = kzalloc(sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	mutex_init(&gpio->i2c_lock);
+	gpio->client = client;
+
+	err = adnp_gpio_setup(gpio, pdata);
+	if (err < 0)
+		goto free;
+
+	if (IS_ENABLED(CONFIG_GPIO_ADNP_IRQ)) {
+		err = adnp_irq_setup(gpio, pdata);
+		if (err < 0)
+			goto teardown;
+	}
+
+	err = gpiochip_add(&gpio->gpio);
+	if (err < 0)
+		goto teardown;
+
+	i2c_set_clientdata(client, gpio);
+	return 0;
+
+teardown:
+	if (IS_ENABLED(CONFIG_GPIO_ADNP_IRQ))
+		adnp_irq_teardown(gpio);
+free:
+	kfree(gpio);
+	return err;
+}
+
+static __devexit int adnp_i2c_remove(struct i2c_client *client)
+{
+	struct adnp *gpio = i2c_get_clientdata(client);
+	int err;
+
+	err = gpiochip_remove(&gpio->gpio);
+	if (err < 0) {
+		dev_err(&client->dev, "%s failed: %d\n", "gpiochip_remove()",
+				err);
+		return err;
+	}
+
+	if (IS_ENABLED(CONFIG_GPIO_ADNP_IRQ))
+		adnp_irq_teardown(gpio);
+
+	kfree(gpio);
+	return 0;
+}
+
+static const struct i2c_device_id adnp_i2c_id[] = {
+	{ "gpio-adnp" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, adnp_i2c_id);
+
+static struct i2c_driver adnp_i2c_driver = {
+	.driver = {
+		.name = "gpio-adnp",
+		.owner = THIS_MODULE,
+	},
+	.probe = adnp_i2c_probe,
+	.remove = __devexit_p(adnp_i2c_remove),
+	.id_table = adnp_i2c_id,
+};
+module_i2c_driver(adnp_i2c_driver);
+
+MODULE_DESCRIPTION("Avionic Design N-bit GPIO expander");
+MODULE_AUTHOR("Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/i2c/gpio-adnp.h b/include/linux/i2c/gpio-adnp.h
new file mode 100644
index 0000000..6e077a3
--- /dev/null
+++ b/include/linux/i2c/gpio-adnp.h
@@ -0,0 +1,19 @@
+/*
+ * Copyright (C) 2011-2012 Avionic Design GmbH
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _LINUX_I2C_ADNP_H
+#define _LINUX_I2C_ADNP_H 1
+
+struct adnp_platform_data {
+	unsigned gpio_base;
+	unsigned nr_gpios;
+	int irq_base;
+	const char *const *names;
+};
+
+#endif /* _LINUX_I2C_ADNP_H */
-- 
1.7.10
