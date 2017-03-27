From: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
Subject: [PATCH 1/3] gpio - Add EXAR XRA1403 SPI GPIO expander driver
Date: Mon, 27 Mar 2017 09:23:00 +0300
Message-ID: <6bf04ba1761f0692cb461558f0c8836f0d1f7ad8.1490595641.git.nandor.han@ge.com>
References: <cover.1490595641.git.nandor.han@ge.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1490595641.git.nandor.han-JJi787mZWgc@public.gmane.org>
In-Reply-To: <cover.1490595641.git.nandor.han-JJi787mZWgc@public.gmane.org>
References: <cover.1490595641.git.nandor.han-JJi787mZWgc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>, Semi Malinen <semi.malinen-JJi787mZWgc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a simple driver that provides a /sys/class/gpio
interface for controlling and configuring the GPIO lines.
It does not provide support for chip select or interrupts.

Signed-off-by: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
Signed-off-by: Semi Malinen <semi.malinen-JJi787mZWgc@public.gmane.org>
---
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/gpio/Kconfig                               |   5 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-xra1403.c                        | 252 +++++++++++++++++++++
 4 files changed, 259 insertions(+)
 create mode 100644 drivers/gpio/gpio-xra1403.c

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 0ad67d5..7ca9d41 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -103,6 +103,7 @@ ettus	NI Ettus Research
 eukrea  Eukréa Electromatique
 everest	Everest Semiconductor Co. Ltd.
 everspin	Everspin Technologies, Inc.
+exar	Exar Corporation
 excito	Excito
 ezchip	EZchip Semiconductor
 faraday	Faraday Technology Corporation
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d6e3cfd..3a6c9a3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1208,6 +1208,11 @@ config GPIO_PISOSR
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
index bd995dc..8f50844 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -139,6 +139,7 @@ obj-$(CONFIG_GPIO_XGENE)	+= gpio-xgene.o
 obj-$(CONFIG_GPIO_XGENE_SB)	+= gpio-xgene-sb.o
 obj-$(CONFIG_GPIO_XILINX)	+= gpio-xilinx.o
 obj-$(CONFIG_GPIO_XLP)		+= gpio-xlp.o
+obj-$(CONFIG_GPIO_XRA1403)	+= gpio-xra1403.o
 obj-$(CONFIG_GPIO_XTENSA)	+= gpio-xtensa.o
 obj-$(CONFIG_GPIO_ZEVIO)	+= gpio-zevio.o
 obj-$(CONFIG_GPIO_ZYNQ)		+= gpio-zynq.o
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
new file mode 100644
index 0000000..1b7138a8
--- /dev/null
+++ b/drivers/gpio/gpio-xra1403.c
@@ -0,0 +1,252 @@
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
+
+/* XRA1403 registers */
+#define XRA_GSR  0x00 /* GPIO State */
+#define XRA_OCR  0x02 /* Output Control */
+#define XRA_GCR  0x06 /* GPIO Configuration */
+
+/* SPI headers */
+#define XRA_READ 0x80 /* read bit of the SPI command byte */
+
+struct xra1403 {
+	struct mutex      lock;
+	struct gpio_chip  chip;
+	struct spi_device *spi;
+};
+
+static int xra1403_get_byte(struct xra1403 *xra, unsigned int addr)
+{
+	return spi_w8r8(xra->spi, XRA_READ | (addr << 1));
+}
+
+static int xra1403_get_bit(struct xra1403 *xra, unsigned int addr,
+			   unsigned int bit)
+{
+	int ret;
+
+	ret = xra1403_get_byte(xra, addr + (bit > 7));
+	if (ret < 0)
+		return ret;
+
+	return !!(ret & BIT(bit % 8));
+}
+
+static int xra1403_set_bit(struct xra1403 *xra, unsigned int addr,
+			   unsigned int bit, int value)
+{
+	int ret;
+	u8 mask;
+	u8 tx[2];
+
+	addr += bit > 7;
+
+	mutex_lock(&xra->lock);
+
+	ret = xra1403_get_byte(xra, addr);
+	if (ret < 0)
+		goto out_unlock;
+
+	mask = BIT(bit % 8);
+	if (value)
+		value = ret | mask;
+	else
+		value = ret & ~mask;
+
+	if (value != ret) {
+		tx[0] = addr << 1;
+		tx[1] = value;
+		ret = spi_write(xra->spi, tx, sizeof(tx));
+	} else {
+		ret = 0;
+	}
+
+out_unlock:
+	mutex_unlock(&xra->lock);
+
+	return ret;
+}
+
+static int xra1403_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	return xra1403_set_bit(gpiochip_get_data(chip), XRA_GCR, offset, 1);
+}
+
+static int xra1403_direction_output(struct gpio_chip *chip, unsigned int offset,
+				    int value)
+{
+	int ret;
+	struct xra1403 *xra = gpiochip_get_data(chip);
+
+	ret = xra1403_set_bit(xra, XRA_OCR, offset, value);
+	if (ret)
+		return ret;
+
+	ret = xra1403_set_bit(xra, XRA_GCR, offset, 0);
+
+	return ret;
+}
+
+static int xra1403_get(struct gpio_chip *chip, unsigned int offset)
+{
+	return xra1403_get_bit(gpiochip_get_data(chip), XRA_GSR, offset);
+}
+
+static void xra1403_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	xra1403_set_bit(gpiochip_get_data(chip), XRA_OCR, offset, value);
+}
+
+#ifdef CONFIG_DEBUG_FS
+#define XRA_REGS 0x16
+static void xra1403_dbg_show(struct seq_file *s, struct gpio_chip *chip)
+{
+	int reg;
+	struct xra1403 *xra = gpiochip_get_data(chip);
+	int value[XRA_REGS];
+	int i;
+	unsigned int gcr;
+	unsigned int gsr;
+
+	seq_puts(s, "xra reg:");
+	for (reg = 0; reg < XRA_REGS; reg++)
+		seq_printf(s, " %2.2x", reg);
+	seq_puts(s, "\n  value:");
+	for (reg = 0; reg < XRA_REGS; reg++) {
+		value[reg] = xra1403_get_byte(xra, reg);
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
+
+	xra = devm_kzalloc(&spi->dev, sizeof(*xra), GFP_KERNEL);
+	if (!xra)
+		return -ENOMEM;
+
+	/* bring the chip out of reset */
+	reset_gpio = gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(reset_gpio))
+		dev_warn(&spi->dev, "could not get reset-gpios\n");
+	else if (reset_gpio)
+		gpiod_put(reset_gpio);
+
+	mutex_init(&xra->lock);
+
+	xra->chip.direction_input = xra1403_direction_input;
+	xra->chip.direction_output = xra1403_direction_output;
+	xra->chip.get = xra1403_get;
+	xra->chip.set = xra1403_set;
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
+	xra->spi = spi;
+	spi_set_drvdata(spi, xra);
+
+	return gpiochip_add_data(&xra->chip, xra);
+}
+
+static int xra1403_remove(struct spi_device *spi)
+{
+	struct xra1403 *xra = spi_get_drvdata(spi);
+
+	gpiochip_remove(&xra->chip);
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
+	.remove   = xra1403_remove,
+	.id_table = xra1403_ids,
+	.driver   = {
+		.name           = "xra1403",
+		.of_match_table = of_match_ptr(xra1403_spi_of_match),
+	},
+};
+
+static int __init xra1403_init(void)
+{
+	return spi_register_driver(&xra1403_driver);
+}
+
+/*
+ * register after spi postcore initcall and before
+ * subsys initcalls that may rely on these GPIOs
+ */
+subsys_initcall(xra1403_init);
+
+static void __exit xra1403_exit(void)
+{
+	spi_unregister_driver(&xra1403_driver);
+}
+module_exit(xra1403_exit);
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
