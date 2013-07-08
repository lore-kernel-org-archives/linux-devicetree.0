From: thloh.linux@gmail.com
Subject: [PATCH 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Mon,  8 Jul 2013 15:04:39 +0800
Message-ID: <1373267079-15843-1-git-send-email-thloh@altera.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linus.walleij@linaro.org, rob.herring@calxeda.com, rob@landley.net
Cc: linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, thloh85@gmail.com, thloh@altera.com
List-Id: devicetree@vger.kernel.org

From: Tien Hock Loh <thloh@altera.com>

Add driver support for Altera GPIO soft IP, including interrupts and I/O.
Tested on Altera CV SoC board using dipsw and LED using LED framework.

Signed-off-by: Tien Hock Loh <thloh@altera.com>
---
 .../devicetree/bindings/gpio/gpio-altera.txt       |  36 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/gpio/Kconfig                               |   7 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-altera.c                         | 405 +++++++++++++++++++++
 5 files changed, 450 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera.txt
 create mode 100644 drivers/gpio/gpio-altera.c

diff --git a/Documentation/devicetree/bindings/gpio/gpio-altera.txt b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
new file mode 100644
index 0000000..402c99e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
@@ -0,0 +1,36 @@
+Altera GPIO controller bindings
+
+Required properties:
+- compatible:
+  - "altr,pio-1.0"
+- reg: Physical base address and length of the controller's registers.
+- #gpio-cells : Should be 1
+  - first cell is the gpio offset number
+- gpio-controller : Marks the device node as a GPIO controller.
+- #interrupt-cells : Should be 1.
+- interrupts: Specify the interrupt.
+- interrupt-controller: Mark the device node as an interrupt controller
+  The first cell is the local interrupt offset number to the GPIO controller.
+
+Altera GPIO specific properties:
+- width: Width of the GPIO bank, range from 1-32
+- level_trigger: Specifies whether the GPIO interrupt is level trigger (high).
+  This field is required if the Altera GPIO controller used has IRQ enabled.
+- edge_type: Specifies edge type if the GPIO interrupt is edge trigger:
+	0 = Rising edge
+	1 = Falling edge
+	2 = Both edge
+
+Example:
+
+gpio_altr: gpio_altr {
+    compatible = "altr,pio-1.0";
+    reg = <0xff200000 0x10>;
+    interrupts = <0 45 4>;
+    width = <32>;
+    level_trigger = <0>;
+    #gpio-cells = <1>;
+    gpio-controller;
+    #interrupt-cells = <1>;
+    interrupt-controller;
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index db0457d..21a4dc3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -7,6 +7,7 @@ ad	Avionic Design GmbH
 adi	Analog Devices, Inc.
 aeroflexgaisler	Aeroflex Gaisler AB
 ak	Asahi Kasei Corp.
+altr	Altera Corp.
 amcc	Applied Micro Circuits Corporation (APM, formally AMCC)
 apm	Applied Micro Circuits Corporation (APM)
 arm	ARM Ltd.
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b2450ba..3d46d10 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -121,6 +121,13 @@ config GPIO_GENERIC_PLATFORM
 	help
 	  Say yes here to support basic platform_device memory-mapped GPIO controllers.
 
+config GPIO_ALTERA
+       tristate "Altera GPIO"
+       select IRQ_DOMAIN
+       depends on OF_GPIO
+       help
+         Say yes here to support the Altera PIO device.
+
 config GPIO_IT8761E
 	tristate "IT8761E GPIO support"
 	depends on X86  # unconditional access to IO space.
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index ef3e983..bb96ce5 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_GPIO_74X164)	+= gpio-74x164.o
 obj-$(CONFIG_GPIO_ADNP)		+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)	+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5588)	+= gpio-adp5588.o
+obj-$(CONFIG_GPIO_ALTERA)  	+= gpio-altera.o
 obj-$(CONFIG_GPIO_AMD8111)	+= gpio-amd8111.o
 obj-$(CONFIG_GPIO_ARIZONA)	+= gpio-arizona.o
 obj-$(CONFIG_GPIO_BT8XX)	+= gpio-bt8xx.o
diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
new file mode 100644
index 0000000..75eebed
--- /dev/null
+++ b/drivers/gpio/gpio-altera.c
@@ -0,0 +1,405 @@
+/*
+ * Copyright (C) 2013 Altera Corporation
+ * Based on gpio-mpc8xxx.c
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+#include <linux/gpio.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/of_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/interrupt.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+
+#define ALTERA_GPIO_DATA		0x0
+#define ALTERA_GPIO_DIR			0x4
+#define ALTERA_GPIO_IRQ_MASK		0x8
+#define ALTERA_GPIO_EDGE_CAP		0xc
+#define ALTERA_GPIO_OUTSET		0x10
+#define ALTERA_GPIO_OUTCLEAR		0x14
+#define ALTERA_IRQ_RISING		0
+#define ALTERA_IRQ_FALLING		1
+#define ALTERA_IRQ_BOTH			2
+
+/**
+* struct altera_gpio_chip
+* @mmchip		: memory mapped chip structure.
+* @irq			: irq domain that this driver is registered to.
+* @gpio_lock		: synchronization lock so that new irq/set/get requests
+			  will be blocked until the current one completes.
+* @level_trigger	: specifies if the controller is level triggered
+			  (high).
+* @edge_type		: specify the edge type of the controller (rising,
+			  falling, both). Only used for !level_trigger.
+* @mapped_irq		: kernel mapped irq number.
+*/
+struct altera_gpio_chip {
+	struct of_mm_gpio_chip mmchip;
+	struct irq_domain *irq;
+	spinlock_t gpio_lock;
+	int level_trigger;
+	int edge_type;
+	int mapped_irq;
+};
+
+static void altera_gpio_irq_unmask(struct irq_data *d)
+{
+	struct altera_gpio_chip *altera_gc = irq_data_get_irq_chip_data(d);
+	struct of_mm_gpio_chip *mm_gc = &altera_gc->mmchip;
+	unsigned long flags;
+	unsigned int intmask;
+
+	spin_lock_irqsave(&altera_gc->gpio_lock, flags);
+	intmask = readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
+	/* Set ALTERA_GPIO_IRQ_MASK bit to unmask */
+	intmask |= BIT(irqd_to_hwirq(d));
+	writel(intmask, mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
+	spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
+}
+
+static void altera_gpio_irq_mask(struct irq_data *d)
+{
+	struct altera_gpio_chip *altera_gc = irq_data_get_irq_chip_data(d);
+	struct of_mm_gpio_chip *mm_gc = &altera_gc->mmchip;
+	unsigned long flags;
+	unsigned int intmask;
+
+	spin_lock_irqsave(&altera_gc->gpio_lock, flags);
+	intmask = readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
+	/* Clear ALTERA_GPIO_IRQ_MASK bit to mask */
+	intmask &= BIT(irqd_to_hwirq(d));
+	writel(intmask, mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
+	spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
+}
+
+static int altera_gpio_irq_set_type(struct irq_data *d,
+				unsigned int type)
+{
+	struct altera_gpio_chip *altera_gc = irq_data_get_irq_chip_data(d);
+
+	if (type == IRQ_TYPE_NONE)
+		return 0;
+
+	if (altera_gc->level_trigger) {
+		if (type == IRQ_TYPE_LEVEL_HIGH)
+			return 0;
+	} else {
+		if (type == IRQ_TYPE_EDGE_RISING &&
+			altera_gc->edge_type == ALTERA_IRQ_RISING)
+			return 0;
+		else if (type == IRQ_TYPE_EDGE_FALLING &&
+			altera_gc->edge_type == ALTERA_IRQ_FALLING)
+			return 0;
+		else if (type == IRQ_TYPE_EDGE_BOTH &&
+			altera_gc->edge_type == ALTERA_IRQ_BOTH)
+			return 0;
+	}
+
+	return -EINVAL;
+}
+
+static struct irq_chip altera_irq_chip = {
+	.name		= "altera-gpio",
+	.irq_mask	= altera_gpio_irq_mask,
+	.irq_unmask	= altera_gpio_irq_unmask,
+	.irq_set_type	= altera_gpio_irq_set_type,
+};
+
+static int altera_gpio_get(struct gpio_chip *gc, unsigned offset)
+{
+	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
+
+	return (readl(mm_gc->regs + ALTERA_GPIO_DATA) >> offset) & 1;
+}
+
+static void altera_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+{
+	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
+	struct altera_gpio_chip *chip = container_of(mm_gc,
+				struct altera_gpio_chip, mmchip);
+	unsigned long flags;
+	unsigned int data_reg;
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+	data_reg = readl(mm_gc->regs + ALTERA_GPIO_DATA);
+	data_reg = (data_reg & ~BIT(offset)) | (value << offset);
+	writel(data_reg, mm_gc->regs + ALTERA_GPIO_DATA);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+}
+
+static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
+{
+	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
+	struct altera_gpio_chip *chip = container_of(mm_gc,
+				struct altera_gpio_chip, mmchip);
+	unsigned long flags;
+	unsigned int gpio_ddr;
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+	/* Set pin as input, assumes software controlled IP */
+	gpio_ddr = readl(mm_gc->regs + ALTERA_GPIO_DIR);
+	gpio_ddr &= ~BIT(offset);
+	writel(gpio_ddr, mm_gc->regs + ALTERA_GPIO_DIR);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+
+	return 0;
+}
+
+static int altera_gpio_direction_output(struct gpio_chip *gc,
+		unsigned offset, int value)
+{
+	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
+	struct altera_gpio_chip *chip = container_of(mm_gc,
+				struct altera_gpio_chip, mmchip);
+	unsigned long flags;
+	unsigned int data_reg, gpio_ddr;
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+	/* Sets the GPIO value */
+	data_reg = readl(mm_gc->regs + ALTERA_GPIO_DATA);
+	data_reg = (data_reg & ~BIT(offset)) | (value << offset);
+	writel(data_reg, mm_gc->regs + ALTERA_GPIO_DATA);
+
+	/* Set pin as output, assumes software controlled IP */
+	gpio_ddr = readl(mm_gc->regs + ALTERA_GPIO_DIR);
+	gpio_ddr |= BIT(offset);
+	writel(gpio_ddr, mm_gc->regs + ALTERA_GPIO_DIR);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+
+	return 0;
+}
+
+static int altera_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
+{
+	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
+	struct altera_gpio_chip *altera_gc = container_of(mm_gc,
+				struct altera_gpio_chip, mmchip);
+
+	if (altera_gc->irq == 0)
+		return -ENXIO;
+	if ((altera_gc->irq && offset) < altera_gc->mmchip.gc.ngpio)
+		return irq_create_mapping(altera_gc->irq, offset);
+	else
+		return -ENXIO;
+}
+
+static void altera_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
+{
+	struct altera_gpio_chip *altera_gc = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct of_mm_gpio_chip *mm_gc = &altera_gc->mmchip;
+	unsigned long status;
+
+	int base;
+	chip->irq_mask(&desc->irq_data);
+
+	if (altera_gc->level_trigger) {
+		status = readl_relaxed(mm_gc->regs + ALTERA_GPIO_DATA);
+		status &= readl_relaxed(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
+
+		for (base = 0; base < mm_gc->gc.ngpio; base++) {
+			if (BIT(base) & status) {
+				generic_handle_irq(irq_linear_revmap(
+					altera_gc->irq,	base));
+			}
+		}
+	} else {
+		while ((status =
+			(readl_relaxed(mm_gc->regs + ALTERA_GPIO_EDGE_CAP) &
+			readl_relaxed(mm_gc->regs + ALTERA_GPIO_IRQ_MASK)))) {
+			writel_relaxed(status,
+				mm_gc->regs + ALTERA_GPIO_EDGE_CAP);
+			for (base = 0; base < mm_gc->gc.ngpio; base++) {
+				if (BIT(base) & status) {
+					generic_handle_irq(irq_linear_revmap(
+						altera_gc->irq,	base));
+				}
+			}
+		}
+	}
+
+	chip->irq_eoi(irq_desc_get_irq_data(desc));
+	chip->irq_unmask(&desc->irq_data);
+}
+
+static int altera_gpio_irq_map(struct irq_domain *h, unsigned int virq,
+				irq_hw_number_t hw_irq_num)
+{
+	irq_set_chip_data(virq, h->host_data);
+	irq_set_chip_and_handler(virq, &altera_irq_chip, handle_level_irq);
+	irq_set_irq_type(virq, IRQ_TYPE_NONE);
+
+	return 0;
+}
+
+static struct irq_domain_ops altera_gpio_irq_ops = {
+	.map	= altera_gpio_irq_map,
+	.xlate = irq_domain_xlate_onecell,
+};
+
+int altera_gpio_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	int id, reg, ret;
+	struct altera_gpio_chip *altera_gc = devm_kzalloc(&pdev->dev,
+				sizeof(*altera_gc), GFP_KERNEL);
+	if (altera_gc == NULL) {
+		pr_err("%s: out of memory\n", node->full_name);
+		return -ENOMEM;
+	}
+	altera_gc->irq = 0;
+
+	spin_lock_init(&altera_gc->gpio_lock);
+
+	id = pdev->id;
+
+	if (of_property_read_u32(node, "width", &reg))
+		/*By default assume full GPIO controller*/
+		altera_gc->mmchip.gc.ngpio = 32;
+	else
+		altera_gc->mmchip.gc.ngpio = reg;
+
+	if (altera_gc->mmchip.gc.ngpio > 32) {
+		pr_warn("%s: ngpio is greater than 32, defaulting to 32\n",
+			node->full_name);
+		altera_gc->mmchip.gc.ngpio = 32;
+	}
+
+	altera_gc->mmchip.gc.direction_input	= altera_gpio_direction_input;
+	altera_gc->mmchip.gc.direction_output	= altera_gpio_direction_output;
+	altera_gc->mmchip.gc.get		= altera_gpio_get;
+	altera_gc->mmchip.gc.set		= altera_gpio_set;
+	altera_gc->mmchip.gc.to_irq		= altera_gpio_to_irq;
+	altera_gc->mmchip.gc.owner		= THIS_MODULE;
+
+	ret = of_mm_gpiochip_add(node, &altera_gc->mmchip);
+	if (ret) {
+		pr_err("%s: Failed adding memory mapped gpiochip\n",
+			node->full_name);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, altera_gc);
+
+	if (of_get_property(node, "interrupts", &reg) == NULL)
+		goto skip_irq;
+	altera_gc->mapped_irq = irq_of_parse_and_map(node, 0);
+
+	if (altera_gc->mapped_irq == NO_IRQ)
+		goto skip_irq;
+
+	altera_gc->irq = irq_domain_add_linear(node, altera_gc->mmchip.gc.ngpio,
+				&altera_gpio_irq_ops, altera_gc);
+
+	if (!altera_gc->irq) {
+		ret = -ENODEV;
+		goto dispose_irq;
+	}
+
+	if (of_property_read_u32(node, "level_trigger", &reg)) {
+		ret = -EINVAL;
+		pr_err("%s: level_trigger value not set in device tree\n",
+			node->full_name);
+		goto teardown;
+	}
+	altera_gc->level_trigger = reg;
+
+	/*
+	 * If it is not level triggered PIO
+	 * Check what edge type it is
+	 */
+	if (!altera_gc->level_trigger) {
+		if (of_property_read_u32(node, "edge_type", &reg)) {
+			ret = -EINVAL;
+			pr_err("%s: edge_type value not set in device tree\n"
+				, node->full_name);
+			goto teardown;
+		}
+	}
+	altera_gc->edge_type = reg;
+
+	irq_set_handler_data(altera_gc->mapped_irq, altera_gc);
+	irq_set_chained_handler(altera_gc->mapped_irq, altera_gpio_irq_handler);
+
+	return 0;
+
+teardown:
+	irq_domain_remove(altera_gc->irq);
+dispose_irq:
+	irq_dispose_mapping(altera_gc->mapped_irq);
+	WARN_ON(gpiochip_remove(&altera_gc->mmchip.gc) < 0);
+
+	pr_err("%s: registration failed with status %d\n",
+		node->full_name, ret);
+
+	return ret;
+skip_irq:
+	return 0;
+}
+
+static int altera_gpio_remove(struct platform_device *pdev)
+{
+	unsigned int irq, i;
+	int status;
+	struct altera_gpio_chip *altera_gc = platform_get_drvdata(pdev);
+
+	status = gpiochip_remove(&altera_gc->mmchip.gc);
+
+	if (status < 0)
+		return status;
+
+	if (altera_gc->irq) {
+		irq_dispose_mapping(altera_gc->mapped_irq);
+
+		for (i = 0; i < altera_gc->mmchip.gc.ngpio; i++) {
+			irq = irq_find_mapping(altera_gc->irq, i);
+			if (irq > 0)
+				irq_dispose_mapping(irq);
+		}
+
+		irq_domain_remove(altera_gc->irq);
+	}
+
+	irq_set_handler_data(altera_gc->mapped_irq, NULL);
+	irq_set_chained_handler(altera_gc->mapped_irq, NULL);
+	return -EIO;
+}
+
+static struct of_device_id altera_gpio_of_match[] = {
+	{ .compatible = "altr,pio-1.0", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, altera_gpio_of_match);
+
+static struct platform_driver altera_gpio_driver = {
+	.driver = {
+		.name	= "altera_gpio",
+		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(altera_gpio_of_match),
+	},
+	.probe		= altera_gpio_probe,
+	.remove		= altera_gpio_remove,
+};
+
+static int __init altera_gpio_init(void)
+{
+	return platform_driver_register(&altera_gpio_driver);
+}
+subsys_initcall(altera_gpio_init);
+
+static void __exit altera_gpio_exit(void)
+{
+	platform_driver_unregister(&altera_gpio_driver);
+}
+module_exit(altera_gpio_exit);
+
+MODULE_DESCRIPTION("Altera GPIO driver");
+MODULE_LICENSE("GPL");
-- 
1.7.11.GIT

