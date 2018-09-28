From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v4 1/2] GPIO: add single-register GPIO via CREG driver
Date: Fri, 28 Sep 2018 16:15:30 +0300
Message-ID: <20180928131531.4598-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <vineet.gupta1@synopsys.com>, Alexey Brodkin <alexey.brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

Add single-register MMIO GPIO driver for complex cases where
only several fields in register belong to GPIO lines and each GPIO
line owns a field with different length and on/off value.

Such CREG GPIOs are used in Synopsys AXS10x and HSDK boards.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Changes v3->v4:
 * Cleanup 'include' section.
 * Get rid of 'of_mm_gpio_chip' using.
 * Get rid of custom 'creg_gpio_xlate' function.
 * Get rid of dummy 'creg_gpio_get_direction' function.
 * Small fixies.

Changes v2->v3:
 * Move parameters into a lookup table instead of device tree.
 * Use the ngpios attribute for instead of snps,ngpios.

 MAINTAINERS                   |   6 ++
 drivers/gpio/Kconfig          |  10 +++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-creg-snps.c | 191 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 208 insertions(+)
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
index 71c0ab46f216..78155ac22b0c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -430,6 +430,16 @@ config GPIO_REG
 	  A 32-bit single register GPIO fixed in/out implementation.  This
 	  can be used to represent any register as a set of GPIO signals.
 
+config GPIO_SNPS_CREG
+	bool "Synopsys GPIO via CREG (Control REGisters) driver"
+	depends on ARC || COMPILE_TEST
+	select OF_GPIO
+	help
+	  This driver supports GPIOs via CREG on various Synopsys SoCs.
+	  This is a single-register MMIO GPIO driver for complex cases
+	  where only several fields in register belong to GPIO lines and
+	  each GPIO line owns a field with different length and on/off value.
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
index 000000000000..8cbc94d0d424
--- /dev/null
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Synopsys CREG (Control REGisters) GPIO driver
+//
+// Copyright (C) 2018 Synopsys
+// Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
+
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+
+#define MAX_GPIO	32
+
+struct creg_layout {
+	u8 ngpio;
+	u8 shift[MAX_GPIO];
+	u8 on[MAX_GPIO];
+	u8 off[MAX_GPIO];
+	u8 bit_per_gpio[MAX_GPIO];
+};
+
+struct creg_gpio {
+	struct gpio_chip gc;
+	void __iomem *regs;
+	spinlock_t lock;
+	const struct creg_layout *layout;
+};
+
+static void creg_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	struct creg_gpio *hcg = gpiochip_get_data(gc);
+	const struct creg_layout *layout = hcg->layout;
+	u32 reg, reg_shift, value;
+	unsigned long flags;
+	int i;
+
+	value = val ? hcg->layout->on[offset] : hcg->layout->off[offset];
+
+	reg_shift = layout->shift[offset];
+	for (i = 0; i < offset; i++)
+		reg_shift += layout->bit_per_gpio[i] + layout->shift[i];
+
+	spin_lock_irqsave(&hcg->lock, flags);
+	reg = readl(hcg->regs);
+	reg &= ~(GENMASK(layout->bit_per_gpio[i] - 1, 0) << reg_shift);
+	reg |=  (value << reg_shift);
+	writel(reg, hcg->regs);
+	spin_unlock_irqrestore(&hcg->lock, flags);
+}
+
+static int creg_gpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	creg_gpio_set(gc, offset, val);
+
+	return 0;
+}
+
+static int creg_gpio_validate_pg(struct device *dev, struct creg_gpio *hcg,
+				 int i)
+{
+	const struct creg_layout *layout = hcg->layout;
+
+	if (layout->bit_per_gpio[i] < 1 || layout->bit_per_gpio[i] > 8)
+		return -EINVAL;
+
+	/* Check that on valiue fits it's placeholder */
+	if (GENMASK(31, layout->bit_per_gpio[i]) & layout->on[i])
+		return -EINVAL;
+
+	/* Check that off valiue fits it's placeholder */
+	if (GENMASK(31, layout->bit_per_gpio[i]) & layout->off[i])
+		return -EINVAL;
+
+	if (layout->on[i] == layout->off[i])
+		return -EINVAL;
+
+	return 0;
+}
+
+static int creg_gpio_validate(struct device *dev, struct creg_gpio *hcg,
+			      u32 ngpios)
+{
+	u32 reg_len = 0;
+	int i;
+
+	if (hcg->layout->ngpio < 1 || hcg->layout->ngpio > MAX_GPIO)
+		return -EINVAL;
+
+	if (ngpios < 1 || ngpios > hcg->layout->ngpio) {
+		dev_err(dev, "ngpios must be in [1:%u]\n", hcg->layout->ngpio);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < hcg->layout->ngpio; i++) {
+		if (creg_gpio_validate_pg(dev, hcg, i))
+			return -EINVAL;
+
+		reg_len += hcg->layout->shift[i] + hcg->layout->bit_per_gpio[i];
+	}
+
+	/* Check that we fit in 32 bit register */
+	if (reg_len > 32)
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct creg_layout hsdk_cs_ctl = {
+	.ngpio		= 10,
+	.shift		= { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
+	.off		= { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 },
+	.on		= { 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 },
+	.bit_per_gpio	= { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 }
+};
+
+static const struct creg_layout axs10x_flsh_cs_ctl = {
+	.ngpio		= 1,
+	.shift		= { 0 },
+	.off		= { 1 },
+	.on		= { 3 },
+	.bit_per_gpio	= { 2 }
+};
+
+static const struct of_device_id creg_gpio_ids[] = {
+	{
+		.compatible = "snps,creg-gpio-axs10x",
+		.data = &axs10x_flsh_cs_ctl
+	}, {
+		.compatible = "snps,creg-gpio-hsdk",
+		.data = &hsdk_cs_ctl
+	}, { /* sentinel */ }
+};
+
+static int creg_gpio_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *match;
+	struct device *dev = &pdev->dev;
+	struct creg_gpio *hcg;
+	struct resource *mem;
+	u32 ngpios;
+	int ret;
+
+	hcg = devm_kzalloc(dev, sizeof(struct creg_gpio), GFP_KERNEL);
+	if (!hcg)
+		return -ENOMEM;
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	hcg->regs = devm_ioremap_resource(dev, mem);
+	if (IS_ERR(hcg->regs))
+		return PTR_ERR(hcg->regs);
+
+	match = of_match_node(creg_gpio_ids, pdev->dev.of_node);
+	hcg->layout = match->data;
+	if (!hcg->layout)
+		return -EINVAL;
+
+	ret = of_property_read_u32(dev->of_node, "ngpios", &ngpios);
+	if (ret)
+		return ret;
+
+	ret = creg_gpio_validate(dev, hcg, ngpios);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&hcg->lock);
+
+	hcg->gc.label = dev_name(dev);
+	hcg->gc.base = -1;
+	hcg->gc.ngpio = ngpios;
+	hcg->gc.set = creg_gpio_set;
+	hcg->gc.direction_output = creg_gpio_dir_out;
+	hcg->gc.of_node = dev->of_node;
+
+	ret = devm_gpiochip_add_data(dev, &hcg->gc, hcg);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "GPIO controller with %d gpios probed\n", ngpios);
+
+	return 0;
+}
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
