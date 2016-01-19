From: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Subject: [PATCHv2 1/2] gpio: add TI SN65HVS885 spi industrial input serializer driver
Date: Tue, 19 Jan 2016 10:40:25 +0100
Message-ID: <1453196426-21399-1-git-send-email-sean.nyekjaer@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Sean Nyekjaer <sean.nyekjaer@prevas.dk>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Simple gpiolib driver for TI SN65HVS885 industrial input serializer.
The TI SN65HVS885 only support inputs.

Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Reviewed-by: Martin Hundeb=C3=B8ll <martin.hundeboll@prevas.dk>
---
 drivers/gpio/Kconfig           |   9 ++-
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-sn65hvs885.c | 145 +++++++++++++++++++++++++++++++++=
++++++++
 3 files changed, 153 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpio/gpio-sn65hvs885.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index cb212eb..d320f50 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1018,6 +1018,13 @@ config GPIO_MC33880
 	  SPI driver for Freescale MC33880 high-side/low-side switch.
 	  This provides GPIO interface supporting inputs and outputs.
=20
+config GPIO_SN65HVS885
+        tristate "Texas Instruments sn65hvs885 input serializer 8-bit =
shift register"
+        depends on SPI_MASTER && OF
+        help
+          Driver for Texas Instruments sn65hvs885 input serializer.
+          This provides a GPIO interface supporting inputs.
+
 endmenu
=20
 menu "SPI or I2C GPIO expanders"
@@ -1031,8 +1038,6 @@ config GPIO_MCP23S08
 	  This provides a GPIO interface supporting inputs and outputs.
 	  The I2C versions of the chips can be used as interrupt-controller.
=20
-endmenu
-
 menu "USB GPIO expanders"
 	depends on USB
=20
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 548e9b5..db7d035 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -120,3 +120,4 @@ obj-$(CONFIG_GPIO_XTENSA)	+=3D gpio-xtensa.o
 obj-$(CONFIG_GPIO_ZEVIO)	+=3D gpio-zevio.o
 obj-$(CONFIG_GPIO_ZYNQ)		+=3D gpio-zynq.o
 obj-$(CONFIG_GPIO_ZX)		+=3D gpio-zx.o
+obj-$(CONFIG_GPIO_SN65HVS885)	+=3D gpio-sn65hvs885.o
diff --git a/drivers/gpio/gpio-sn65hvs885.c b/drivers/gpio/gpio-sn65hvs=
885.c
new file mode 100644
index 0000000..47d7f3a
--- /dev/null
+++ b/drivers/gpio/gpio-sn65hvs885.c
@@ -0,0 +1,145 @@
+/*
+ * Copyright (C) 2015 Sean Nyekjaer, Prevas
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+#include <linux/gpio.h>
+#include <linux/of_gpio.h>
+
+#define SN65HVS885_NUMBER_GPIOS	8
+
+struct sn65hvs885_chip {
+	struct gpio_chip gpio_chip;
+	int latch_gpio;
+	struct mutex lock;	/* protect from simultaneous accesses */
+};
+
+static struct sn65hvs885_chip *sn65hvs885_gpio_to_chip(struct gpio_chi=
p *gc)
+{
+	return container_of(gc, struct sn65hvs885_chip, gpio_chip);
+}
+
+static int sn65hvs885_get_value(struct gpio_chip *gc, unsigned offset)
+{
+	struct sn65hvs885_chip *chip =3D sn65hvs885_gpio_to_chip(gc);
+	struct spi_device *spi =3D to_spi_device(chip->gpio_chip.dev);
+	int ret;
+	u8 pin =3D offset % SN65HVS885_NUMBER_GPIOS;
+	u8 d8;
+	struct spi_transfer t =3D {
+		.rx_buf =3D &d8,
+		.len =3D 1,
+	};
+
+	if (gpio_is_valid(chip->latch_gpio)) {
+		gpio_set_value_cansleep(chip->latch_gpio, 0);
+		gpio_set_value_cansleep(chip->latch_gpio, 1);
+	}
+
+	mutex_lock(&chip->lock);
+	spi_sync_transfer(spi, &t, 1);
+	mutex_unlock(&chip->lock);
+	ret =3D (d8 >> pin) & 0x1;
+
+	return ret;
+}
+
+static int sn65hvs885_probe(struct spi_device *spi)
+{
+	struct sn65hvs885_chip *chip;
+	int ret;
+
+	spi->bits_per_word =3D 8;
+	spi->mode =3D SPI_MODE_1;
+
+	ret =3D spi_setup(spi);
+	if (ret < 0)
+		return ret;
+
+	chip =3D devm_kzalloc(&spi->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	spi_set_drvdata(spi, chip);
+
+	chip->gpio_chip.label =3D spi->modalias;
+	chip->gpio_chip.get =3D sn65hvs885_get_value;
+	chip->gpio_chip.base =3D -1;
+	chip->gpio_chip.ngpio =3D SN65HVS885_NUMBER_GPIOS;
+	chip->gpio_chip.can_sleep =3D true;
+	chip->gpio_chip.dev =3D &spi->dev;
+	chip->gpio_chip.owner =3D THIS_MODULE;
+
+	mutex_init(&chip->lock);
+
+	chip->latch_gpio =3D of_get_named_gpio(spi->dev.of_node, "latch-gpio"=
, 0);
+	if (chip->latch_gpio < 0) {
+		dev_err(&spi->dev, "latch-gpio property not found\n");
+		return -ENODEV;
+	}
+
+	if (gpio_is_valid(chip->latch_gpio)) {
+		ret =3D devm_gpio_request_one(&spi->dev,
+					    chip->latch_gpio,
+					    GPIOF_OUT_INIT_HIGH, "gpio-latch");
+		if (ret) {
+			dev_err(&spi->dev, "unable to get latch gpio\n");
+			return -ENODEV;
+		}
+	}
+
+	ret =3D gpiochip_add(&chip->gpio_chip);
+
+	if (ret !=3D 0) {
+		mutex_destroy(&chip->lock);
+		devm_gpio_free(&spi->dev, chip->latch_gpio);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int sn65hvs885_remove(struct spi_device *spi)
+{
+	struct sn65hvs885_chip *chip =3D spi_get_drvdata(spi);
+
+	devm_gpio_free(&spi->dev, chip->latch_gpio);
+
+	gpiochip_remove(&chip->gpio_chip);
+
+	mutex_destroy(&chip->lock);
+
+	return 0;
+}
+
+static const struct spi_device_id sn65hvs885_id[] =3D {
+	{"sn65hvs885", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(spi, sn65hvs885_id);
+
+static struct spi_driver sn65hvs885_driver =3D {
+	.driver =3D {
+		   .name =3D "sn65hvs885",
+		   .owner =3D THIS_MODULE,
+		   },
+	.probe =3D sn65hvs885_probe,
+	.remove =3D sn65hvs885_remove,
+	.id_table =3D sn65hvs885_id,
+};
+
+module_spi_driver(sn65hvs885_driver);
+
+MODULE_AUTHOR("Sean Nyekjaer <sean.nyekjaer@prevas.dk>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("sn65hvs885 Industrial input serializer");
--=20
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
