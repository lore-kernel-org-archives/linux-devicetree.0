From: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
Subject: [PATCH v2 2/4] gpio - Add EXAR XRA1403 SPI GPIO expander driver
Date: Thu, 13 Apr 2017 13:27:49 +0300
Message-ID: <f28eef264102786357ac5ed7205813619c508fb4.1492077070.git.nandor.han@ge.com>
References: <cover.1492077070.git.nandor.han@ge.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1492077070.git.nandor.han-JJi787mZWgc@public.gmane.org>
In-Reply-To: <cover.1492077070.git.nandor.han-JJi787mZWgc@public.gmane.org>
References: <cover.1492077070.git.nandor.han-JJi787mZWgc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>, Semi Malinen <semi.malinen-JJi787mZWgc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a simple driver that provides a /sys/class/gpio
interface for controlling and configuring the GPIO lines.
It does not provide support for chip select or interrupts.

Signed-off-by: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
Signed-off-by: Semi Malinen <semi.malinen-JJi787mZWgc@public.gmane.org>
---
 drivers/gpio/Kconfig        |   5 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-xra1403.c | 236 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 242 insertions(+)
 create mode 100644 drivers/gpio/gpio-xra1403.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 63ceed2..53cbe9b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1214,6 +1214,11 @@ config GPIO_PISOSR
 	  GPIO driver for SPI compatible parallel-in/serial-out shift
 	  registers. These are input only devices.
 
+config GPIO_XRA1403
+	tristate "EXAR XRA1403 16-bit GPIO expander"
+	help
+	  GPIO driver for EXAR XRA1403 16-bit SPI-based GPIO expander.
+
 endmenu
 
 menu "SPI or I2C GPIO expanders"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 095598e..76dc3d7 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -140,6 +140,7 @@ obj-$(CONFIG_GPIO_XGENE)	+= gpio-xgene.o
 obj-$(CONFIG_GPIO_XGENE_SB)	+= gpio-xgene-sb.o
 obj-$(CONFIG_GPIO_XILINX)	+= gpio-xilinx.o
 obj-$(CONFIG_GPIO_XLP)		+= gpio-xlp.o
+obj-$(CONFIG_GPIO_XRA1403)	+= gpio-xra1403.o
 obj-$(CONFIG_GPIO_XTENSA)	+= gpio-xtensa.o
 obj-$(CONFIG_GPIO_ZEVIO)	+= gpio-zevio.o
 obj-$(CONFIG_GPIO_ZYNQ)		+= gpio-zynq.o
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
new file mode 100644
index 0000000..e6966d9
--- /dev/null
+++ b/drivers/gpio/gpio-xra1403.c
@@ -0,0 +1,236 @@
+/*
+ * GPIO driver for EXAR XRA1403 16-bit GPIO expander
+ *
+ * Copyright (c) 2017, General Electric Company
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+#include <linux/spi/spi.h>
+#include <linux/regmap.h>
+
+/* XRA1403 registers */
+#define XRA_GSR   0x00 /* GPIO State */
+#define XRA_OCR   0x02 /* Output Control */
+#define XRA_PIR   0x04 /* Input Polarity Inversion */
+#define XRA_GCR   0x06 /* GPIO Configuration */
+#define XRA_PUR   0x08 /* Input Internal Pull-up Resistor Enable/Disable */
+#define XRA_IER   0x0A /* Input Interrupt Enable */
+#define XRA_TSCR  0x0C /* Output Three-State Control */
+#define XRA_ISR   0x0E /* Input Interrupt Status */
+#define XRA_REIR  0x10 /* Input Rising Edge Interrupt Enable */
+#define XRA_FEIR  0x12 /* Input Falling Edge Interrupt Enable */
+#define XRA_IFR   0x14 /* Input Filter Enable/Disable */
+
+struct xra1403 {
+	struct gpio_chip  chip;
+	struct regmap     *regmap;
+};
+
+static const struct regmap_config xra1403_regmap_cfg = {
+		.reg_bits = 7,
+		.pad_bits = 1,
+		.val_bits = 8,
+
+		.max_register = XRA_IFR | 0x01,
+};
+
+static unsigned int to_reg(unsigned int reg, unsigned int offset)
+{
+	return reg + (offset > 7);
+}
+
+static int xra1403_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	struct xra1403 *xra = gpiochip_get_data(chip);
+
+	return regmap_update_bits(xra->regmap, to_reg(XRA_GCR, offset),
+			BIT(offset % 8), BIT(offset % 8));
+}
+
+static int xra1403_direction_output(struct gpio_chip *chip, unsigned int offset,
+				    int value)
+{
+	int ret;
+	struct xra1403 *xra = gpiochip_get_data(chip);
+
+	ret = regmap_update_bits(xra->regmap, to_reg(XRA_GCR, offset),
+			BIT(offset % 8), 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(xra->regmap, to_reg(XRA_OCR, offset),
+			BIT(offset % 8), value ? BIT(offset % 8) : 0);
+
+	return ret;
+}
+
+static int xra1403_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	int ret;
+	unsigned int val;
+	struct xra1403 *xra = gpiochip_get_data(chip);
+
+	ret = regmap_read(xra->regmap, to_reg(XRA_GCR, offset), &val);
+	if (ret)
+		return ret;
+
+	return !!(val & BIT(offset % 8));
+}
+
+static int xra1403_get(struct gpio_chip *chip, unsigned int offset)
+{
+	int ret;
+	unsigned int val;
+	struct xra1403 *xra = gpiochip_get_data(chip);
+
+	ret = regmap_read(xra->regmap, to_reg(XRA_GSR, offset), &val);
+	if (ret)
+		return ret;
+
+	return !!(val & BIT(offset % 8));
+}
+
+static void xra1403_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	int ret;
+	struct xra1403 *xra = gpiochip_get_data(chip);
+
+	ret = regmap_update_bits(xra->regmap, to_reg(XRA_OCR, offset),
+			BIT(offset % 8), value ? BIT(offset % 8) : 0);
+	if (ret)
+		dev_err(chip->parent, "Failed to set pin: %d, ret: %d\n",
+				offset, ret);
+}
+
+#ifdef CONFIG_DEBUG_FS
+static void xra1403_dbg_show(struct seq_file *s, struct gpio_chip *chip)
+{
+	int reg;
+	struct xra1403 *xra = gpiochip_get_data(chip);
+	int value[xra1403_regmap_cfg.max_register];
+	int i;
+	unsigned int gcr;
+	unsigned int gsr;
+
+	seq_puts(s, "xra reg:");
+	for (reg = 0; reg <= xra1403_regmap_cfg.max_register; reg++)
+		seq_printf(s, " %2.2x", reg);
+	seq_puts(s, "\n  value:");
+	for (reg = 0; reg < xra1403_regmap_cfg.max_register; reg++) {
+		regmap_read(xra->regmap, reg, &value[reg]);
+		seq_printf(s, " %2.2x", value[reg]);
+	}
+	seq_puts(s, "\n");
+
+	gcr = value[XRA_GCR + 1] << 8 | value[XRA_GCR];
+	gsr = value[XRA_GSR + 1] << 8 | value[XRA_GSR];
+	for (i = 0; i < chip->ngpio; i++) {
+		const char *label = gpiochip_is_requested(chip, i);
+
+		if (!label)
+			continue;
+
+		seq_printf(s, " gpio-%-3d (%-12s) %s %s\n",
+			   chip->base + i, label,
+			   (gcr & BIT(i)) ? "in" : "out",
+			   (gsr & BIT(i)) ? "hi" : "lo");
+	}
+}
+#else
+#define xra1403_dbg_show NULL
+#endif
+
+static int xra1403_probe(struct spi_device *spi)
+{
+	struct xra1403 *xra;
+	struct gpio_desc *reset_gpio;
+	int ret;
+
+	xra = devm_kzalloc(&spi->dev, sizeof(*xra), GFP_KERNEL);
+	if (!xra)
+		return -ENOMEM;
+
+	/* bring the chip out of reset if reset pin is provided*/
+	reset_gpio = devm_gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(reset_gpio))
+		dev_warn(&spi->dev, "Could not get reset-gpios\n");
+
+	xra->chip.direction_input = xra1403_direction_input;
+	xra->chip.direction_output = xra1403_direction_output;
+	xra->chip.get_direction = xra1403_get_direction;
+	xra->chip.get = xra1403_get;
+	xra->chip.set = xra1403_set;
+
+	xra->chip.dbg_show = xra1403_dbg_show;
+
+	xra->chip.ngpio = 16;
+	xra->chip.label = "xra1403";
+
+	xra->chip.base = -1;
+	xra->chip.can_sleep = true;
+	xra->chip.parent = &spi->dev;
+	xra->chip.owner = THIS_MODULE;
+
+	xra->regmap = devm_regmap_init_spi(spi, &xra1403_regmap_cfg);
+	if (IS_ERR(xra->regmap)) {
+		ret = PTR_ERR(xra->regmap);
+		dev_err(&spi->dev, "Failed to allocate regmap: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_gpiochip_add_data(&spi->dev, &xra->chip, xra);
+	if (ret < 0) {
+		dev_err(&spi->dev, "Unable to register gpiochip\n");
+		return ret;
+	}
+
+	spi_set_drvdata(spi, xra);
+
+	return 0;
+}
+
+static const struct spi_device_id xra1403_ids[] = {
+	{ "xra1403" },
+	{},
+};
+MODULE_DEVICE_TABLE(spi, xra1403_ids);
+
+static const struct of_device_id xra1403_spi_of_match[] = {
+	{ .compatible = "exar,xra1403" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, xra1403_spi_of_match);
+
+static struct spi_driver xra1403_driver = {
+	.probe    = xra1403_probe,
+	.id_table = xra1403_ids,
+	.driver   = {
+		.name           = "xra1403",
+		.of_match_table = of_match_ptr(xra1403_spi_of_match),
+	},
+};
+
+module_spi_driver(xra1403_driver);
+
+MODULE_AUTHOR("Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>");
+MODULE_AUTHOR("Semi Malinen <semi.malinen-JJi787mZWgc@public.gmane.org>");
+MODULE_DESCRIPTION("GPIO expander driver for EXAR XRA1403");
+MODULE_LICENSE("GPL v2");
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
