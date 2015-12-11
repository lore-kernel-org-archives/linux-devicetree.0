From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 2/2] gpio: Add driver for SPI serializers
Date: Fri, 11 Dec 2015 13:46:24 -0600
Message-ID: <1449863184-29668-3-git-send-email-afd@ti.com>
References: <1449863184-29668-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449863184-29668-1-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

Add generic parallel-in/serial-out shift register GPIO driver.

This includes SPI compatible devices like SN74165 serial-out shift
registers and the SN65HVS88x series of industrial serializers that can
be read over the SPI bus and used for GPI (General Purpose Input).

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/gpio/Kconfig       |   6 ++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-pisosr.c | 182 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+)
 create mode 100644 drivers/gpio/gpio-pisosr.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 30d8bd3..95615b1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1021,6 +1021,12 @@ config GPIO_MC33880
 	  SPI driver for Freescale MC33880 high-side/low-side switch.
 	  This provides GPIO interface supporting inputs and outputs.
 
+config GPIO_PISOSR
+	tristate "Generic parallel-in/serial-out shift register"
+	help
+	  GPIO driver for SPI compatible parallel-in/serial-out shift
+	  registers. These are input only devices.
+
 endmenu
 
 menu "SPI or I2C GPIO expanders"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 548e9b5..ee26102 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_GPIO_OMAP)		+= gpio-omap.o
 obj-$(CONFIG_GPIO_PCA953X)	+= gpio-pca953x.o
 obj-$(CONFIG_GPIO_PCF857X)	+= gpio-pcf857x.o
 obj-$(CONFIG_GPIO_PCH)		+= gpio-pch.o
+obj-$(CONFIG_GPIO_PISOSR)	+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)	+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PXA)		+= gpio-pxa.o
 obj-$(CONFIG_GPIO_RC5T583)	+= gpio-rc5t583.o
diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
new file mode 100644
index 0000000..e89cd59
--- /dev/null
+++ b/drivers/gpio/gpio-pisosr.c
@@ -0,0 +1,182 @@
+/*
+ * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ *	Andrew F. Davis <afd@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether expressed or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License version 2 for more details.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/spi/spi.h>
+
+#define DEFAULT_NGPIO 8
+
+struct pisosr_gpio {
+	struct gpio_chip chip;
+	struct spi_device *spi;
+	u8 *buffer;
+	size_t buffer_size;
+	struct gpio_desc *load_gpio;
+	struct mutex lock;
+};
+
+static inline struct pisosr_gpio *to_pisosr_gpio(struct gpio_chip *chip)
+{
+	return container_of(chip, struct pisosr_gpio, chip);
+}
+
+static int pisosr_gpio_refresh(struct pisosr_gpio *gpio)
+{
+	int ret;
+
+	mutex_lock(&gpio->lock);
+
+	if (gpio->load_gpio) {
+		gpiod_set_value(gpio->load_gpio, 1);
+		udelay(1); /* registers load time (~10ns) */
+		gpiod_set_value(gpio->load_gpio, 0);
+		udelay(1); /* registers recovery time (~5ns) */
+	}
+
+	ret = spi_read(gpio->spi, gpio->buffer, gpio->buffer_size);
+	if (ret)
+		return ret;
+
+	mutex_unlock(&gpio->lock);
+
+	return 0;
+}
+
+static int pisosr_gpio_get_direction(struct gpio_chip *chip,
+				     unsigned offset)
+{
+	return GPIOF_DIR_IN;
+}
+
+static int pisosr_gpio_direction_input(struct gpio_chip *chip,
+				       unsigned offset)
+{
+	/* This device always input */
+	return 0;
+}
+
+static int pisosr_gpio_direction_output(struct gpio_chip *chip,
+					unsigned offset, int value)
+{
+	/* This device is input only */
+	return -EINVAL;
+}
+
+static int pisosr_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct pisosr_gpio *gpio = to_pisosr_gpio(chip);
+
+	/* Refresh may not always be needed */
+	pisosr_gpio_refresh(gpio);
+
+	return (gpio->buffer[offset / 8] >> (offset % 8)) & 0x1;
+}
+
+static struct gpio_chip template_chip = {
+	.label			= "pisosr-gpio",
+	.owner			= THIS_MODULE,
+	.get_direction		= pisosr_gpio_get_direction,
+	.direction_input	= pisosr_gpio_direction_input,
+	.direction_output	= pisosr_gpio_direction_output,
+	.get			= pisosr_gpio_get,
+	.base			= -1,
+	.ngpio			= DEFAULT_NGPIO,
+	.can_sleep		= true,
+};
+
+static int pisosr_gpio_probe(struct spi_device *spi)
+{
+	struct pisosr_gpio *gpio;
+	struct device_node *np = spi->dev.of_node;
+	int ret;
+
+	gpio = devm_kzalloc(&spi->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	spi_set_drvdata(spi, gpio);
+
+	gpio->chip = template_chip;
+	gpio->chip.parent = &spi->dev;
+	of_property_read_u16(np, "ngpios", &gpio->chip.ngpio);
+
+	gpio->spi = spi;
+
+	gpio->buffer_size = DIV_ROUND_UP(gpio->chip.ngpio, 8);
+	gpio->buffer = devm_kzalloc(&spi->dev, gpio->buffer_size, GFP_KERNEL);
+	if (!gpio->buffer)
+		return -ENOMEM;
+
+	gpio->load_gpio = devm_gpiod_get(&spi->dev, "load", GPIOD_OUT_LOW);
+	if (IS_ERR(gpio->load_gpio)) {
+		ret = PTR_ERR(gpio->load_gpio);
+		if (ret != -ENOENT && ret != -ENOSYS) {
+			if (ret != -EPROBE_DEFER)
+				dev_err(&spi->dev, "Unable to allocate reset gpio\n");
+			return ret;
+		}
+		gpio->load_gpio = NULL;
+	}
+
+	mutex_init(&gpio->lock);
+
+	ret = gpiochip_add(&gpio->chip);
+	if (ret < 0) {
+		dev_err(&spi->dev, "Unable to register gpiochip\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int pisosr_gpio_remove(struct spi_device *spi)
+{
+	struct pisosr_gpio *gpio = spi_get_drvdata(spi);
+
+	gpiochip_remove(&gpio->chip);
+
+	mutex_destroy(&gpio->lock);
+
+	return 0;
+}
+
+static const struct spi_device_id pisosr_gpio_id_table[] = {
+	{ "pisosr-gpio", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, pisosr_gpio_id_table);
+
+static const struct of_device_id pisosr_gpio_of_match_table[] = {
+	{ .compatible = "pisosr-gpio", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, pisosr_gpio_of_match_table);
+
+static struct spi_driver pisosr_gpio_driver = {
+	.driver = {
+		.name = "pisosr-gpio",
+		.of_match_table = pisosr_gpio_of_match_table,
+	},
+	.probe = pisosr_gpio_probe,
+	.remove = pisosr_gpio_remove,
+	.id_table = pisosr_gpio_id_table,
+};
+module_spi_driver(pisosr_gpio_driver);
+
+MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
+MODULE_DESCRIPTION("SPI Compatible PISO Shift Register GPIO Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.6.4
