From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH 1/2] GPIO: add single-register gpio via creg driver
Date: Thu, 23 Aug 2018 18:00:12 +0300
Message-ID: <20180823150013.21837-2-Eugeniy.Paltsev@synopsys.com>
References: <20180823150013.21837-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180823150013.21837-1-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

Add single-register MMIO gpio driver for complex cases where
only several fields in register belong to GPIO and each GPIO
owns field with different length and on/off values.

Here is the example:

31            11        8         7        5         0   < bit number
|              |        |         |        |         |
[   not used   | gpio-1 | shift-1 | gpio-0 | shift-0 ]   < 32 bit MMIO
                   ^                  ^
                (3 bit)            (2 bit)
                   |                  |
                   |                  |
                   |           write 0x2 == set output to "1" (on)
                   |           write 0x3 == set output to "0" (off)
                   |
            write 0x1 == set output to "1" (on)
            write 0x4 == set output to "0" (off)

This is different from gpio-reg, gpio-mmio and gpio-74xx-mmio:
* They all don't support cases when GPIO output register have
  more than one bit per GPIO line.
* They don't support holes in MMIO register.
* They don't support cases when GPIO lines have different on/off
  values.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 MAINTAINERS                   |   6 ++
 drivers/gpio/Kconfig          |   9 ++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-creg-snps.c | 242 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 258 insertions(+)
 create mode 100644 drivers/gpio/gpio-creg-snps.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 544cac829cf4..e731f2f9648a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13734,6 +13734,12 @@ S:	Supported
 F:	drivers/reset/reset-axs10x.c
 F:	Documentation/devicetree/bindings/reset/snps,axs10x-reset.txt
 
+SYNOPSYS CREG GPIO DRIVER
+M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
+S:	Maintained
+F:	drivers/gpio/gpio-creg-snps.c
+F:	Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
+
 SYNOPSYS DESIGNWARE 8250 UART DRIVER
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 S:	Maintained
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 71c0ab46f216..0f9cc1582cab 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -430,6 +430,15 @@ config GPIO_REG
 	  A 32-bit single register GPIO fixed in/out implementation.  This
 	  can be used to represent any register as a set of GPIO signals.
 
+config GPIO_SNPS_CREG
+	bool "GPIO via CREG (Control REGisers) driver"
+	select OF_GPIO
+	help
+	  This driver supports GPIOs via CREG on various Synopsys SoCs.
+	  This is is single-register MMIO gpio driver for complex cases
+	  where only several fields in register belong to GPIO and
+	  each GPIO owns field with different length and on/off values.
+
 config GPIO_SPEAR_SPICS
 	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
 	depends on PLAT_SPEAR
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 1324c8f966a7..993f8ad54a19 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -109,6 +109,7 @@ obj-$(CONFIG_GPIO_REG)		+= gpio-reg.o
 obj-$(CONFIG_ARCH_SA1100)	+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SCH)		+= gpio-sch.o
 obj-$(CONFIG_GPIO_SCH311X)	+= gpio-sch311x.o
+obj-$(CONFIG_GPIO_SNPS_CREG)	+= gpio-creg-snps.o
 obj-$(CONFIG_GPIO_SODAVILLE)	+= gpio-sodaville.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)	+= gpio-spear-spics.o
 obj-$(CONFIG_GPIO_SPRD)		+= gpio-sprd.o
diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
new file mode 100644
index 000000000000..b684b7257aae
--- /dev/null
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -0,0 +1,242 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Synopsys CREG (Control REGisers) GPIO driver
+//
+// Copyright (C) 2018 Synopsys
+// Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
+
+#include <linux/of.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/of_gpio.h>
+#include <linux/io.h>
+#include <linux/of_platform.h>
+#include <linux/module.h>
+
+#include "gpiolib.h"
+
+/*
+ * GPIO via CREG (Control REGisers) driver
+ *
+ * 31              11        8         7        5         0   < bit number
+ * |                |        |         |        |         |
+ * [    not used    | gpio-1 | shift-1 | gpio-0 | shift-0 ]   < 32 bit register
+ *                      ^                  ^
+ *                      |                  |
+ *                      |           write 0x2 == set output to "1" (on)
+ *                      |           write 0x3 == set output to "0" (off)
+ *                      |
+ *               write 0x1 == set output to "1" (on)
+ *               write 0x4 == set output to "0" (off)
+ */
+
+#define MAX_GPIO	32
+
+struct creg_gpio {
+	struct of_mm_gpio_chip mmchip;
+	spinlock_t lock;
+
+	u32 shift[MAX_GPIO];
+	u32 on[MAX_GPIO];
+	u32 off[MAX_GPIO];
+	u32 bit_per_gpio[MAX_GPIO];
+};
+
+static void _creg_gpio_set(struct creg_gpio *hcg, unsigned int gpio, u32 val)
+{
+	u32 reg, reg_shift;
+	unsigned long flags;
+	int i;
+
+	reg_shift = hcg->shift[gpio];
+	for (i = 0; i < gpio; i++)
+		reg_shift += hcg->bit_per_gpio[i] + hcg->shift[i];
+
+	spin_lock_irqsave(&hcg->lock, flags);
+	reg = readl(hcg->mmchip.regs);
+	reg &= ~(GENMASK(hcg->bit_per_gpio[i] - 1, 0) << reg_shift);
+	reg |=  (val << reg_shift);
+	writel(reg, hcg->mmchip.regs);
+	spin_unlock_irqrestore(&hcg->lock, flags);
+}
+
+static void creg_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	struct creg_gpio *hcg = gpiochip_get_data(gc);
+	u32 value = val ? hcg->on[gpio] : hcg->off[gpio];
+
+	_creg_gpio_set(hcg, gpio, value);
+}
+
+static int creg_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	creg_gpio_set(gc, gpio, val);
+
+	return 0;
+}
+
+static int creg_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	return 0; /* output */
+}
+
+static int creg_gpio_xlate(struct gpio_chip *gc,
+			   const struct of_phandle_args *gpiospec, u32 *flags)
+{
+	if (gpiospec->args_count != 1) {
+		dev_err(&gc->gpiodev->dev, "invalid args_count: %d\n",
+			gpiospec->args_count);
+		return -EINVAL;
+	}
+
+	if (gpiospec->args[0] >= gc->ngpio) {
+		dev_err(&gc->gpiodev->dev, "gpio number is too big: %d\n",
+			gpiospec->args[0]);
+		return -EINVAL;
+	}
+
+	return gpiospec->args[0];
+}
+
+static int creg_gpio_validate_pgv(struct device *dev, struct creg_gpio *hcg,
+				  int i, u32 *defaults, bool use_defaults)
+{
+	if (hcg->bit_per_gpio[i] < 1 || hcg->bit_per_gpio[i] > 8) {
+		dev_err(dev, "'bit-per-line[%d]' is out of bounds\n", i);
+		return -EINVAL;
+	}
+
+	/* Check that on valiue suits it's placeholder */
+	if (GENMASK(31, hcg->bit_per_gpio[i]) & hcg->on[i]) {
+		dev_err(dev, "'on-val[%d]' can't be more than %lu\n",
+			i, GENMASK(hcg->bit_per_gpio[i] - 1, 0));
+		return -EINVAL;
+	}
+
+	/* Check that off valiue suits it's placeholder */
+	if (GENMASK(31, hcg->bit_per_gpio[i]) & hcg->off[i]) {
+		dev_err(dev, "'off-val[%d]' can't be more than %lu\n",
+			i, GENMASK(hcg->bit_per_gpio[i] - 1, 0));
+		return -EINVAL;
+	}
+
+	/* Check that default valiue suits it's placeholder */
+	if (use_defaults && (GENMASK(31, hcg->bit_per_gpio[i]) & defaults[i])) {
+		dev_err(dev, "'default-val[%d]' can't be more than %lu\n",
+			i, GENMASK(hcg->bit_per_gpio[i] - 1, 0));
+		return -EINVAL;
+	}
+
+	if (hcg->on[i] == hcg->off[i]) {
+		dev_err(dev, "'off-val[%d]' and 'on-val[%d]' can't be equal\n",
+			i, i);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int creg_gpio_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct creg_gpio *hcg;
+
+	u32 defaults[MAX_GPIO];
+	bool use_defaults;
+	u32 ngpio, reg_len = 0;
+	int ret, i;
+
+	hcg = devm_kzalloc(dev, sizeof(struct creg_gpio), GFP_KERNEL);
+	if (!hcg)
+		return -ENOMEM;
+
+	if (of_property_read_u32(np, "snps,ngpios", &ngpio)) {
+		dev_err(dev, "'ngpios' isn't set\n");
+		return -EINVAL;
+	}
+
+	if (ngpio < 1 || ngpio > MAX_GPIO) {
+		dev_err(dev, "'ngpios' is out of bounds\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32_array(np, "snps,shift", hcg->shift, ngpio)) {
+		dev_err(dev, "'shift' is set incorrectly\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32_array(np, "snps,bit-per-line",
+				       hcg->bit_per_gpio, ngpio)) {
+		dev_err(dev, "'bit-per-line' is set incorrectly\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32_array(np, "snps,on-val", hcg->on, ngpio)) {
+		dev_err(dev, "'on-val' is set incorrectly\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32_array(np, "snps,off-val", hcg->off, ngpio)) {
+		dev_err(dev, "'off-val' is set incorrectly\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32_array(np, "snps,default-val", defaults, ngpio);
+	if (ret && ret != -EINVAL) {
+		dev_err(dev, "'default-val' is set incorrectly\n");
+		return ret;
+	}
+	use_defaults = !ret;
+
+	for (i = 0; i < ngpio; i++) {
+		if (creg_gpio_validate_pgv(dev, hcg, i, defaults, use_defaults))
+			return -EINVAL;
+
+		reg_len += hcg->shift[i] + hcg->bit_per_gpio[i];
+	}
+
+	/* Check that we suit in 32 bit register */
+	if (reg_len > 32) {
+		dev_err(dev,
+			"32-bit io register overflow: attempt to use %u bits\n",
+			reg_len);
+		return -EINVAL;
+	}
+
+	spin_lock_init(&hcg->lock);
+
+	hcg->mmchip.gc.ngpio = ngpio;
+	hcg->mmchip.gc.set = creg_gpio_set;
+	hcg->mmchip.gc.get_direction = creg_gpio_get_direction;
+	hcg->mmchip.gc.direction_output = creg_gpio_dir_out;
+	hcg->mmchip.gc.of_xlate = creg_gpio_xlate;
+	hcg->mmchip.gc.of_gpio_n_cells = 1;
+
+	ret = of_mm_gpiochip_add_data(pdev->dev.of_node, &hcg->mmchip, hcg);
+	if (ret)
+		return ret;
+
+	/* Setup default GPIO value if we have "snps,default-val" array */
+	if (use_defaults)
+		for (i = 0; i < ngpio; i++)
+			_creg_gpio_set(hcg, i, defaults[i]);
+
+	dev_info(dev, "GPIO controller with %d gpios probed\n", ngpio);
+
+	return 0;
+}
+
+static const struct of_device_id creg_gpio_ids[] = {
+	{ .compatible = "snps,creg-gpio" },
+	{ }
+};
+
+static struct platform_driver creg_gpio_snps_driver = {
+	.driver = {
+		.name = "snps-creg-gpio",
+		.of_match_table = creg_gpio_ids,
+	},
+	.probe  = creg_gpio_probe,
+};
+builtin_platform_driver(creg_gpio_snps_driver);
-- 
2.14.4
