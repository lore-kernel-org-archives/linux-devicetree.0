From: <thloh@altera.com>
Subject: [PATCH v10 2/2] drivers/gpio: Altera soft IP GPIO driver
Date: Tue, 24 Feb 2015 01:53:03 -0800
Message-ID: <1424771583-4404-3-git-send-email-thloh@altera.com>
References: <1424771583-4404-1-git-send-email-thloh@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1424771583-4404-1-git-send-email-thloh@altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: dinguyen@altera.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, gnurou@gmail.com, grant.likely@linaro.org, akpm@linux-foundation.org, davem@davemloft.net, gregkh@linuxfoundation.org, joe@perches.com, mchehab@osg.samsung.com, crope@iki.fi, linux-gpio@vger.kernel.org
Cc: thloh.linux@gmail.com, thloh@altera.com
List-Id: devicetree@vger.kernel.org

From: Tien Hock Loh <thloh@altera.com>

Adds a new driver for Altera soft GPIO IP. The driver is able to do
read/write and allows GPIO to be a interrupt controller.

Tested on Altera GHRD on interrupt handling and IO.

Signed-off-by: Tien Hock Loh <thloh@altera.com>
---
 MAINTAINERS                |   6 +
 drivers/gpio/Kconfig       |  10 ++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-altera.c | 374 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 391 insertions(+)
 create mode 100644 drivers/gpio/gpio-altera.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5a6cdfb..70292df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -563,6 +563,12 @@ S:	Odd Fixes
 L:	linux-alpha@vger.kernel.org
 F:	arch/alpha/
 
+ALTERA PIO DRIVER
+M:	Tien Hock Loh <thloh@altera.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/gpio/gpio-altera.c
+
 ALTERA TRIPLE SPEED ETHERNET DRIVER
 M:	Vince Bridgers <vbridger@opensource.altera.com>
 L:	netdev@vger.kernel.org
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ae5cb4d..b7c5838 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -156,6 +156,16 @@ config GPIO_DWAPB
 	  Say Y or M here to build support for the Synopsys DesignWare APB
 	  GPIO block.
 
+config GPIO_ALTERA
+	tristate "Altera GPIO"
+	depends on OF_GPIO
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y or M here to build support for the Altera PIO device.
+
+	  If driver is built as a module it will be called gpio-altera.
+
 config GPIO_IT8761E
 	tristate "IT8761E GPIO support"
 	depends on X86  # unconditional access to IO space.
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index bdda6a9..a452b14 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_GPIO_74XX_MMIO)	+= gpio-74xx-mmio.o
 obj-$(CONFIG_GPIO_ADNP)		+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)	+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5588)	+= gpio-adp5588.o
+obj-$(CONFIG_GPIO_ALTERA)  	+= gpio-altera.o
 obj-$(CONFIG_GPIO_AMD8111)	+= gpio-amd8111.o
 obj-$(CONFIG_GPIO_ARIZONA)	+= gpio-arizona.o
 obj-$(CONFIG_GPIO_BCM_KONA)	+= gpio-bcm-kona.o
diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
new file mode 100644
index 0000000..4d41196
--- /dev/null
+++ b/drivers/gpio/gpio-altera.c
@@ -0,0 +1,374 @@
+/*
+ * Copyright (C) 2013 Altera Corporation
+ * Based on gpio-mpc8xxx.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/io.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+
+#define ALTERA_GPIO_MAX_NGPIO		32
+#define ALTERA_GPIO_DATA		0x0
+#define ALTERA_GPIO_DIR			0x4
+#define ALTERA_GPIO_IRQ_MASK		0x8
+#define ALTERA_GPIO_EDGE_CAP		0xc
+
+/**
+* struct altera_gpio_chip
+* @mmchip		: memory mapped chip structure.
+* @gpio_lock		: synchronization lock so that new irq/set/get requests
+			  will be blocked until the current one completes.
+* @interrupt_trigger	: specifies the hardware configured IRQ trigger type
+			  (rising, falling, both, high)
+* @mapped_irq		: kernel mapped irq number.
+*/
+struct altera_gpio_chip {
+	struct of_mm_gpio_chip mmchip;
+	spinlock_t gpio_lock;
+	int interrupt_trigger;
+	int mapped_irq;
+};
+
+static void altera_gpio_irq_unmask(struct irq_data *d)
+{
+	struct altera_gpio_chip *altera_gc;
+	struct of_mm_gpio_chip *mm_gc;
+	unsigned long flags;
+	u32 intmask;
+
+	altera_gc = irq_data_get_irq_chip_data(d);
+	mm_gc = &altera_gc->mmchip;
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
+	struct altera_gpio_chip *altera_gc;
+	struct of_mm_gpio_chip *mm_gc;
+	unsigned long flags;
+	u32 intmask;
+
+	altera_gc = irq_data_get_irq_chip_data(d);
+	mm_gc = &altera_gc->mmchip;
+
+	spin_lock_irqsave(&altera_gc->gpio_lock, flags);
+	intmask = readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
+	/* Clear ALTERA_GPIO_IRQ_MASK bit to mask */
+	intmask &= ~BIT(irqd_to_hwirq(d));
+	writel(intmask, mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
+	spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
+}
+
+/**
+ * This controller's IRQ type is synthesized in hardware, so this function
+ * just checks if the requested set_type matches the synthesized IRQ type
+ */
+static int altera_gpio_irq_set_type(struct irq_data *d,
+				   unsigned int type)
+{
+	struct altera_gpio_chip *altera_gc;
+
+	altera_gc = irq_data_get_irq_chip_data(d);
+
+	if (type == IRQ_TYPE_NONE)
+		return 0;
+	if (type == IRQ_TYPE_LEVEL_HIGH &&
+		altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH)
+		return 0;
+	if (type == IRQ_TYPE_EDGE_RISING &&
+		altera_gc->interrupt_trigger == IRQ_TYPE_EDGE_RISING)
+		return 0;
+	if (type == IRQ_TYPE_EDGE_FALLING &&
+		altera_gc->interrupt_trigger == IRQ_TYPE_EDGE_FALLING)
+		return 0;
+	if (type == IRQ_TYPE_EDGE_BOTH &&
+		altera_gc->interrupt_trigger == IRQ_TYPE_EDGE_BOTH)
+		return 0;
+
+	return -EINVAL;
+}
+
+static unsigned int altera_gpio_irq_startup(struct irq_data *d) {
+	altera_gpio_irq_unmask(d);
+
+	return 0;
+}
+
+static struct irq_chip altera_irq_chip = {
+	.name		= "altera-gpio",
+	.irq_mask	= altera_gpio_irq_mask,
+	.irq_unmask	= altera_gpio_irq_unmask,
+	.irq_set_type	= altera_gpio_irq_set_type,
+	.irq_startup	= altera_gpio_irq_startup,
+	.irq_shutdown	= altera_gpio_irq_mask,
+};
+
+static int altera_gpio_get(struct gpio_chip *gc, unsigned offset)
+{
+	struct of_mm_gpio_chip *mm_gc;
+
+	mm_gc = to_of_mm_gpio_chip(gc);
+
+	return !!(readl(mm_gc->regs + ALTERA_GPIO_DATA) & BIT(offset));
+}
+
+static void altera_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+{
+	struct of_mm_gpio_chip *mm_gc;
+	struct altera_gpio_chip *chip;
+	unsigned long flags;
+	unsigned int data_reg;
+
+	mm_gc = to_of_mm_gpio_chip(gc);
+	chip = container_of(mm_gc, struct altera_gpio_chip, mmchip);
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+	data_reg = readl(mm_gc->regs + ALTERA_GPIO_DATA);
+	if (value)
+		data_reg |= BIT(offset);
+	else
+		data_reg &= ~BIT(offset);
+	writel(data_reg, mm_gc->regs + ALTERA_GPIO_DATA);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+}
+
+static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
+{
+	struct of_mm_gpio_chip *mm_gc;
+	struct altera_gpio_chip *chip;
+	unsigned long flags;
+	unsigned int gpio_ddr;
+
+	mm_gc = to_of_mm_gpio_chip(gc);
+	chip = container_of(mm_gc, struct altera_gpio_chip, mmchip);
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
+	struct of_mm_gpio_chip *mm_gc;
+	struct altera_gpio_chip *chip;
+	unsigned long flags;
+	unsigned int data_reg, gpio_ddr;
+
+	mm_gc = to_of_mm_gpio_chip(gc);
+	chip = container_of(mm_gc, struct altera_gpio_chip, mmchip);
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+	/* Sets the GPIO value */
+	data_reg = readl(mm_gc->regs + ALTERA_GPIO_DATA);
+	if (value)
+		data_reg |= BIT(offset);
+	else
+		data_reg &= ~BIT(offset);
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
+static void altera_gpio_irq_edge_handler(unsigned int irq,
+					struct irq_desc *desc)
+{
+	struct altera_gpio_chip *altera_gc;
+	struct irq_chip *chip;
+	struct of_mm_gpio_chip *mm_gc;
+	struct irq_domain *irqdomain;
+	unsigned long status;
+	int i;
+
+	altera_gc = irq_desc_get_handler_data(desc);
+	chip = irq_desc_get_chip(desc);
+	mm_gc = &altera_gc->mmchip;
+	irqdomain = altera_gc->mmchip.gc.irqdomain;
+
+	chained_irq_enter(chip, desc);
+
+	while ((status =
+	      (readl(mm_gc->regs + ALTERA_GPIO_EDGE_CAP) &
+	      readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK)))) {
+		writel(status, mm_gc->regs + ALTERA_GPIO_EDGE_CAP);
+		for_each_set_bit(i, &status, mm_gc->gc.ngpio) {
+			generic_handle_irq(irq_find_mapping(irqdomain, i));
+		}
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+
+static void altera_gpio_irq_leveL_high_handler(unsigned int irq,
+					      struct irq_desc *desc)
+{
+	struct altera_gpio_chip *altera_gc;
+	struct irq_chip *chip;
+	struct of_mm_gpio_chip *mm_gc;
+	struct irq_domain *irqdomain;
+	unsigned long status;
+	int i;
+
+	altera_gc = irq_desc_get_handler_data(desc);
+	chip = irq_desc_get_chip(desc);
+	mm_gc = &altera_gc->mmchip;
+	irqdomain = altera_gc->mmchip.gc.irqdomain;
+
+	chained_irq_enter(chip, desc);
+
+	status = readl(mm_gc->regs + ALTERA_GPIO_DATA);
+	status &= readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
+
+	for_each_set_bit(i, &status, mm_gc->gc.ngpio) {
+		generic_handle_irq(irq_find_mapping(irqdomain, i));
+	}
+	chained_irq_exit(chip, desc);
+}
+
+int altera_gpio_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	int reg, ret;
+	struct altera_gpio_chip *altera_gc;
+
+	altera_gc = devm_kzalloc(&pdev->dev, sizeof(*altera_gc), GFP_KERNEL);
+	if (!altera_gc)
+		return -ENOMEM;
+
+	spin_lock_init(&altera_gc->gpio_lock);
+
+	if (of_property_read_u32(node, "altr,ngpio", &reg))
+		/* By default assume maximum ngpio */
+		altera_gc->mmchip.gc.ngpio = ALTERA_GPIO_MAX_NGPIO;
+	else
+		altera_gc->mmchip.gc.ngpio = reg;
+
+	if (altera_gc->mmchip.gc.ngpio > ALTERA_GPIO_MAX_NGPIO) {
+		dev_warn(&pdev->dev,
+			"ngpio is greater than %d, defaulting to %d\n",
+			ALTERA_GPIO_MAX_NGPIO, ALTERA_GPIO_MAX_NGPIO);
+		altera_gc->mmchip.gc.ngpio = ALTERA_GPIO_MAX_NGPIO;
+	}
+
+	altera_gc->mmchip.gc.direction_input	= altera_gpio_direction_input;
+	altera_gc->mmchip.gc.direction_output	= altera_gpio_direction_output;
+	altera_gc->mmchip.gc.get		= altera_gpio_get;
+	altera_gc->mmchip.gc.set		= altera_gpio_set;
+	altera_gc->mmchip.gc.owner		= THIS_MODULE;
+	altera_gc->mmchip.gc.dev		= &pdev->dev;
+
+	ret = of_mm_gpiochip_add(node, &altera_gc->mmchip);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed adding memory mapped gpiochip\n");
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, altera_gc);
+
+	altera_gc->mapped_irq = platform_get_irq(pdev, 0);
+
+	if (altera_gc->mapped_irq < 0)
+		goto skip_irq;
+
+	if (of_property_read_u32(node, "altr,interrupt-type", &reg)) {
+		ret = -EINVAL;
+		dev_err(&pdev->dev,
+			"altr,interrupt-type value not set in device tree\n");
+		goto teardown;
+	}
+	altera_gc->interrupt_trigger = reg;
+
+	ret = gpiochip_irqchip_add(&altera_gc->mmchip.gc, &altera_irq_chip, 0,
+		handle_simple_irq, IRQ_TYPE_NONE);
+
+	if (ret) {
+		dev_info(&pdev->dev, "could not add irqchip\n");
+		return ret;
+	}
+
+	gpiochip_set_chained_irqchip(&altera_gc->mmchip.gc,
+		&altera_irq_chip,
+		altera_gc->mapped_irq,
+		altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH ?
+		altera_gpio_irq_leveL_high_handler :
+		altera_gpio_irq_edge_handler);
+
+skip_irq:
+	return 0;
+teardown:
+	pr_err("%s: registration failed with status %d\n",
+		node->full_name, ret);
+
+	return ret;
+}
+
+static int altera_gpio_remove(struct platform_device *pdev)
+{
+	struct altera_gpio_chip *altera_gc = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&altera_gc->mmchip.gc);
+
+	return -EIO;
+}
+
+static const struct of_device_id altera_gpio_of_match[] = {
+	{ .compatible = "altr,pio-1.0", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, altera_gpio_of_match);
+
+static struct platform_driver altera_gpio_driver = {
+	.driver = {
+		.name	= "altera_gpio",
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
+MODULE_AUTHOR("Tien Hock Loh <thloh@altera.com>");
+MODULE_DESCRIPTION("Altera GPIO driver");
+MODULE_LICENSE("GPL");
-- 
1.7.11.GIT

