From: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Subject: [PATCH] gpio: Add Altera GPIO driver
Date: Mon,  6 Feb 2012 18:59:02 +0100
Message-ID: <1328551142-8439-1-git-send-email-tklauser@distanz.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
List-Id: devicetree@vger.kernel.org

This driver supports the Altera PIO core.

Signed-off-by: Thomas Chou <thomas-SDxUXYEhEBiCuPEqFHbRBg@public.gmane.org>
Signed-off-by: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
---
This driver was submitted already about a year ago by Thomas, was
adjusted by him according to some remarks made by Grant and was then
included in the -mm tree [1] for some time but dropped again
(couldn't find out when and why exactly).

[0] http://article.gmane.org/gmane.linux.drivers.devicetree/4231
[1] http://article.gmane.org/gmane.linux.kernel.commits.mm/65119

So this is a new attempt towards getting this driver into mainline
from the nios2 tree. The following changes have been made atop the
version submitted by Thomas:

- Changed driver name to new naming convention
- Usage of of_property_read_u32 in the probe function

 .../devicetree/bindings/gpio/altera_gpio.txt       |    7 +
 drivers/gpio/Kconfig                               |    6 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-altera.c                         |  256 ++++++++++++++++++++
 4 files changed, 270 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/altera_gpio.txt
 create mode 100644 drivers/gpio/gpio-altera.c

diff --git a/Documentation/devicetree/bindings/gpio/altera_gpio.txt b/Documentation/devicetree/bindings/gpio/altera_gpio.txt
new file mode 100644
index 0000000..5ab751a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/altera_gpio.txt
@@ -0,0 +1,7 @@
+Altera GPIO
+
+Required properties:
+- compatible : should be "ALTR,pio-1.0".
+Optional properties:
+- resetvalue : the reset value of the output port.
+- width : the width of the port in number of bits.
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index eaa7d38..3ba4526 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -85,6 +85,12 @@ config GPIO_GENERIC_PLATFORM
 	help
 	  Say yes here to support basic platform_device memory-mapped GPIO controllers.
 
+config GPIO_ALTERA
+	bool "Altera GPIO"
+	depends on OF
+	help
+	  Say yes here to support the Altera PIO device
+
 config GPIO_IT8761E
 	tristate "IT8761E GPIO support"
 	depends on X86  # unconditional access to IO space.
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 8863a7f..973c066 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_GPIO_74X164)	+= gpio-74x164.o
 obj-$(CONFIG_GPIO_AB8500)	+= gpio-ab8500.o
 obj-$(CONFIG_GPIO_ADP5520)	+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5588)	+= gpio-adp5588.o
+obj-$(CONFIG_GPIO_ALTERA)	+= gpio-altera.o
 obj-$(CONFIG_GPIO_BT8XX)	+= gpio-bt8xx.o
 obj-$(CONFIG_GPIO_CS5535)	+= gpio-cs5535.o
 obj-$(CONFIG_GPIO_DA9052)	+= gpio-da9052.o
diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
new file mode 100644
index 0000000..bfbcb6b
--- /dev/null
+++ b/drivers/gpio/gpio-altera.c
@@ -0,0 +1,256 @@
+/*
+ * Altera GPIO driver
+ *
+ * Copyright (C) 2012 Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
+ * Copyright (C) 2011 Thomas Chou <thomas-SDxUXYEhEBiCuPEqFHbRBg@public.gmane.org>
+ *
+ * Based on Xilinx gpio driver, which is
+ * Copyright 2008 Xilinx, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2
+ * as published by the Free Software Foundation.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/errno.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/of_gpio.h>
+#include <linux/of_irq.h>
+#include <linux/io.h>
+#include <linux/gpio.h>
+#include <linux/slab.h>
+
+#define DRV_NAME "altera_gpio"
+
+/* Register Offset Definitions */
+#define ALTERA_GPIO_DATA_OFFSET	0x0	/* Data register */
+#define ALTERA_GPIO_DIR_OFFSET	0x4	/* I/O direction register */
+#define ALTERA_GPIO_IRQ_MASK	0x8
+#define ALTERA_GPIO_EDGE_CAP	0xc
+
+struct altera_gpio_instance {
+	struct of_mm_gpio_chip mmchip;
+	u32 gpio_state;		/* GPIO state shadow register */
+	u32 gpio_dir;		/* GPIO direction shadow register */
+	int irq;		/* GPIO irq number */
+	spinlock_t gpio_lock;	/* Lock used for synchronization */
+};
+
+static inline struct altera_gpio_instance *to_altera_gpio(
+	struct of_mm_gpio_chip *mm_gc)
+{
+	return container_of(mm_gc, struct altera_gpio_instance, mmchip);
+}
+
+/*
+ * altera_gpio_get - Read the specified signal of the GPIO device.
+ * @gc:     Pointer to gpio_chip device structure.
+ * @gpio:   GPIO signal number.
+ *
+ * This function reads the specified signal of the GPIO device. It returns 0 if
+ * the signal clear, 1 if signal is set or negative value on error.
+ */
+static int altera_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
+	struct altera_gpio_instance *chip = to_altera_gpio(mm_gc);
+
+	if (chip->irq >= 0) {
+		if (readl(mm_gc->regs + ALTERA_GPIO_EDGE_CAP) & (1 << gpio))
+			writel(1 << gpio, mm_gc->regs + ALTERA_GPIO_EDGE_CAP);
+	}
+	return (readl(mm_gc->regs + ALTERA_GPIO_DATA_OFFSET) >> gpio) & 1;
+}
+
+/*
+ * altera_gpio_set - Write the specified signal of the GPIO device.
+ * @gc:     Pointer to gpio_chip device structure.
+ * @gpio:   GPIO signal number.
+ * @val:    Value to be written to specified signal.
+ *
+ * This function writes the specified value in to the specified signal of the
+ * GPIO device.
+ */
+static void altera_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	unsigned long flags;
+	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
+	struct altera_gpio_instance *chip = to_altera_gpio(mm_gc);
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+
+	/* Write to shadow register and output */
+	if (val)
+		chip->gpio_state |= 1 << gpio;
+	else
+		chip->gpio_state &= ~(1 << gpio);
+	writel(chip->gpio_state, mm_gc->regs + ALTERA_GPIO_DATA_OFFSET);
+
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+}
+
+/*
+ * altera_gpio_dir_in - Set the direction of the specified GPIO signal as input.
+ * @gc:     Pointer to gpio_chip device structure.
+ * @gpio:   GPIO signal number.
+ *
+ * This function sets the direction of specified GPIO signal as input.
+ * It returns 0 if direction of GPIO signals is set as input otherwise it
+ * returns negative error value.
+ */
+static int altera_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
+{
+	unsigned long flags;
+	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
+	struct altera_gpio_instance *chip = to_altera_gpio(mm_gc);
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+
+	/* Clear the GPIO bit in shadow register and set direction as input */
+	chip->gpio_dir &= ~(1 << gpio);
+	writel(chip->gpio_dir, mm_gc->regs + ALTERA_GPIO_DIR_OFFSET);
+
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+
+	return 0;
+}
+
+/*
+ * altera_gpio_dir_out - Set the direction of the specified GPIO as output.
+ * @gc:     Pointer to gpio_chip device structure.
+ * @gpio:   GPIO signal number.
+ * @val:    Value to be written to specified signal.
+ *
+ * This function sets the direction of specified GPIO signal as output. If all
+ * GPIO signals of GPIO chip is configured as input then it returns
+ * error otherwise it returns 0.
+ */
+static int altera_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	unsigned long flags;
+	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
+	struct altera_gpio_instance *chip = to_altera_gpio(mm_gc);
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+
+	/* Write state of GPIO signal */
+	if (val)
+		chip->gpio_state |= 1 << gpio;
+	else
+		chip->gpio_state &= ~(1 << gpio);
+	writel(chip->gpio_state, mm_gc->regs + ALTERA_GPIO_DATA_OFFSET);
+
+	/* Set the GPIO bit in shadow register and set direction as output */
+	chip->gpio_dir |= (1 << gpio);
+	writel(chip->gpio_dir, mm_gc->regs + ALTERA_GPIO_DIR_OFFSET);
+
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+
+	return 0;
+}
+
+/*
+ * altera_gpio_save_regs - Set initial values of GPIO pins
+ * @mm_gc: pointer to memory mapped GPIO chip structure
+ */
+static void altera_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
+{
+	struct altera_gpio_instance *chip = to_altera_gpio(mm_gc);
+
+	writel(chip->gpio_state, mm_gc->regs + ALTERA_GPIO_DATA_OFFSET);
+	writel(chip->gpio_dir, mm_gc->regs + ALTERA_GPIO_DIR_OFFSET);
+}
+
+static int altera_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
+	struct altera_gpio_instance *chip = to_altera_gpio(mm_gc);
+
+	return chip->irq;
+}
+
+/*
+ * altera_gpio_of_probe - Probe method for the GPIO device.
+ * @np: pointer to device tree node
+ *
+ * This function probes the GPIO device in the device tree. It initializes the
+ * driver data structure. It returns 0, if the driver is bound to the GPIO
+ * device, or a negative value if there is an error.
+ */
+static int __devinit altera_gpio_of_probe(struct device_node *np)
+{
+	struct altera_gpio_instance *chip;
+	int status = 0;
+	u32 reg;
+
+	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	/* Update GPIO state shadow register with default value */
+	if (of_property_read_u32(np, "resetvalue", &reg) == 0)
+		chip->gpio_state = reg;
+
+	/* Update GPIO direction shadow register with default value */
+	chip->gpio_dir = 0; /* By default, all pins are inputs */
+
+	/* Check device node for device width */
+	if (of_property_read_u32(np, "width", &reg) == 0)
+		chip->mmchip.gc.ngpio = reg;
+	else
+		chip->mmchip.gc.ngpio = 32; /* By default assume full GPIO controller */
+
+	/* Check device node for interrupt */
+	chip->irq = of_irq_count(np) ? of_irq_to_resource(np, 0, NULL) : -ENXIO;
+
+	spin_lock_init(&chip->gpio_lock);
+
+	chip->mmchip.gc.direction_input = altera_gpio_dir_in;
+	chip->mmchip.gc.direction_output = altera_gpio_dir_out;
+	chip->mmchip.gc.get = altera_gpio_get;
+	chip->mmchip.gc.set = altera_gpio_set;
+	chip->mmchip.gc.to_irq = altera_gpio_to_irq;
+
+	chip->mmchip.save_regs = altera_gpio_save_regs;
+
+	/* Call the OF gpio helper to setup and register the GPIO device */
+	status = of_mm_gpiochip_add(np, &chip->mmchip);
+	if (status) {
+		kfree(chip);
+		pr_err("%s: error in probe function with status %d\n",
+		       np->full_name, status);
+		return status;
+	}
+	if (chip->irq >= 0) {
+		/* clear edge and enable irq */
+		writel(UINT_MAX, chip->mmchip.regs + ALTERA_GPIO_EDGE_CAP);
+		writel(UINT_MAX, chip->mmchip.regs + ALTERA_GPIO_IRQ_MASK);
+	}
+	return 0;
+}
+
+static struct of_device_id altera_gpio_of_match[] __devinitdata = {
+	{ .compatible = "ALTR,pio-1.0", },
+	{},
+};
+
+/* Make sure we get initialized before anyone else tries to use us */
+void __init altera_gpio_init(void)
+{
+	struct device_node *np;
+
+	for_each_matching_node(np, altera_gpio_of_match)
+		altera_gpio_of_probe(np);
+}
+
+MODULE_DESCRIPTION("Altera GPIO driver");
+MODULE_AUTHOR("Thomas Chou <thomas-SDxUXYEhEBiCuPEqFHbRBg@public.gmane.org>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
1.7.5.4
