From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH] gpio: sn54hc595: new driver for GPIO shift registers chipsets
Date: Mon,  8 Dec 2014 15:27:13 +0100
Message-ID: <1418048833-27658-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, devicetree@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: devicetree@vger.kernel.org

SN54HC595 and SN74HC595 are devices based on shift registers controlled
with 5 input signals (serial-in) and providing 8 outputs (parallel-out)=
=2E

They are present on some Broadcom home router boards where manufacturer
needed few extra GPIOs.

This driver simply uses specified GPIOs to control shift registers and
registers another GPIO chip. So you can call it a GPIO extender.

Due to the hardware design only output direction is supported. Reading
values is handled using tiny internal cache.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
---
 .../devicetree/bindings/gpio/gpio-sn54hc595.txt    |  35 ++++
 drivers/gpio/Kconfig                               |  11 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-sn54hc595.c                      | 219 +++++++++++++=
++++++++
 4 files changed, 266 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sn54hc5=
95.txt
 create mode 100644 drivers/gpio/gpio-sn54hc595.c

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sn54hc595.txt =
b/Documentation/devicetree/bindings/gpio/gpio-sn54hc595.txt
new file mode 100644
index 0000000..034e490
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-sn54hc595.txt
@@ -0,0 +1,35 @@
+GPIO controller based on SN54HC595 / SN74HC595 shift registers
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Required properties:
+
+- compatible : ti,sn54hc595
+
+- ser-gpios : GPIO connected to the serial (SER) input
+
+- srclk-gpios : GPIO connected to the shift register clock (SRCLK) inp=
ut
+
+- srclr-gpios : GPIO connected to the overriding clear (SRCLR) input
+
+- rclk-gpios : GPIO connected to the register clock (RCLK) input
+
+- oe-gpios : GPIO connected to the output-enable (OE) input
+
+- gpio-controller: Marks the device node as a GPIO controller.
+
+- #gpio-cells : Should be two. Pin number and the optional parameters.
+
+Example:
+
+	sn54hc595 {
+		compatible =3D "ti,sn54hc595";
+
+		ser-gpios =3D <&gpio0 3 0>;
+		srclk-gpios =3D <&gpio0 4 0>;
+		srclr-gpios =3D <&gpio0 5 0>;
+		rclk-gpios =3D <&gpio0 6 0>;
+		oe-gpios =3D <&gpio0 7 0>;
+
+		gpio-controller;
+		#gpio-cells =3D <2>;
+	};
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0959ca9..3250870 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -457,6 +457,17 @@ config GPIO_TB10X
 	select GENERIC_IRQ_CHIP
 	select OF_GPIO
=20
+comment "GPIO to GPIO expanders:"
+
+config GPIO_SN54HC595
+	tristate "SN54HC595 / SN74HC595 SIPO shift register"
+	depends on OF
+	help
+	  The 'HC595 devices contain 8 shift registers and are controlled usi=
ng
+	  5 input signals.
+	  This driver controls inputs with 5 GPIOs and registers GPIO chip wi=
th
+	  8 outputs.
+
 comment "I2C GPIO expanders:"
=20
 config GPIO_ARIZONA
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index e5d346c..37be84d 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -74,6 +74,7 @@ obj-$(CONFIG_GPIO_SAMSUNG)	+=3D gpio-samsung.o
 obj-$(CONFIG_ARCH_SA1100)	+=3D gpio-sa1100.o
 obj-$(CONFIG_GPIO_SCH)		+=3D gpio-sch.o
 obj-$(CONFIG_GPIO_SCH311X)	+=3D gpio-sch311x.o
+obj-$(CONFIG_GPIO_SN54HC595)	+=3D gpio-sn54hc595.o
 obj-$(CONFIG_GPIO_SODAVILLE)	+=3D gpio-sodaville.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)	+=3D gpio-spear-spics.o
 obj-$(CONFIG_GPIO_STA2X11)	+=3D gpio-sta2x11.o
diff --git a/drivers/gpio/gpio-sn54hc595.c b/drivers/gpio/gpio-sn54hc59=
5.c
new file mode 100644
index 0000000..9ff4c3b
--- /dev/null
+++ b/drivers/gpio/gpio-sn54hc595.c
@@ -0,0 +1,219 @@
+/*
+ * Driver for SN54HC595 / SN74HC595 devices.
+ *
+ * Copyright (C) 2014 Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
+ *
+ * Licensed under the GNU/GPL. See COPYING for details.
+ */
+
+#include <linux/gpio.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define SN54HC595_NUM_GPIOS		8
+
+struct sn54hc595 {
+	struct gpio_chip	gpio_chip;
+
+	int			values[SN54HC595_NUM_GPIOS];
+
+	unsigned		ser;
+	unsigned		srclk;
+	unsigned		srclr;
+	unsigned		rclk;
+	unsigned		oe;
+};
+
+static inline struct sn54hc595 *gpio_chip_to_sn54hc595(struct gpio_chi=
p *chip)
+{
+	return container_of(chip, struct sn54hc595, gpio_chip);
+}
+
+static void sn54hc595_update_values(struct sn54hc595 *sn54hc595)
+{
+	int i;
+
+	for (i =3D 0; i < SN54HC595_NUM_GPIOS; i++) {
+		gpio_set_value(sn54hc595->ser, sn54hc595->values[i]);
+
+		gpio_set_value(sn54hc595->srclk, 1);
+		gpio_set_value(sn54hc595->srclk, 0);
+	}
+
+	gpio_set_value(sn54hc595->rclk, 1);
+	gpio_set_value(sn54hc595->rclk, 0);
+}
+
+static int sn54hc595_direction_input(struct gpio_chip *chip, unsigned =
gpio)
+{
+	return -ENOTSUPP;
+}
+
+static int sn54hc595_direction_output(struct gpio_chip *chip, unsigned=
 gpio,
+				      int value)
+{
+	struct sn54hc595 *sn54hc595 =3D gpio_chip_to_sn54hc595(chip);
+
+	sn54hc595->values[gpio] =3D value;
+	sn54hc595_update_values(sn54hc595);
+
+	return 0;
+}
+
+static int sn54hc595_get_value(struct gpio_chip *chip, unsigned gpio)
+{
+	struct sn54hc595 *sn54hc595 =3D gpio_chip_to_sn54hc595(chip);
+
+	return sn54hc595->values[gpio];
+}
+
+static void sn54hc595_set_value(struct gpio_chip *chip, unsigned gpio,
+				int value)
+{
+	struct sn54hc595 *sn54hc595 =3D gpio_chip_to_sn54hc595(chip);
+
+	sn54hc595->values[gpio] =3D value;
+	sn54hc595_update_values(sn54hc595);
+}
+
+static int sn54hc595_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct device_node *np =3D dev->of_node;
+	struct sn54hc595 *sn54hc595;
+	int err;
+
+	sn54hc595 =3D devm_kzalloc(dev, sizeof(*sn54hc595), GFP_KERNEL);
+	if (!sn54hc595)
+		return -ENOMEM;
+
+	sn54hc595->ser =3D of_get_named_gpio_flags(np, "ser-gpios", 0, NULL);
+	if (sn54hc595->ser < 0) {
+		dev_err(dev, "Couldn't read \"src\" property from the DT\n");
+		return -EINVAL;
+	}
+
+	sn54hc595->srclk =3D of_get_named_gpio_flags(np, "srclk-gpios", 0, NU=
LL);
+	if (sn54hc595->srclk < 0) {
+		dev_err(dev, "Couldn't read \"srclk\" property from the DT\n");
+		return -EINVAL;
+	}
+
+	sn54hc595->srclr =3D of_get_named_gpio_flags(np, "srclr-gpios", 0, NU=
LL);
+	if (sn54hc595->srclr < 0) {
+		dev_err(dev, "Couldn't read \"srclr\" property from the DT\n");
+		return -EINVAL;
+	}
+
+	sn54hc595->rclk =3D of_get_named_gpio_flags(np, "rclk-gpios", 0, NULL=
);
+	if (sn54hc595->rclk < 0) {
+		dev_err(dev, "Couldn't read \"rclk\" property from the DT\n");
+		return -EINVAL;
+	}
+
+	sn54hc595->oe =3D of_get_named_gpio_flags(np, "oe-gpios", 0, NULL);
+	if (sn54hc595->oe < 0) {
+		dev_err(dev, "Couldn't read \"oe\" property from the DT\n");
+		return -EINVAL;
+	}
+
+	if (devm_gpio_request(dev, sn54hc595->ser, dev_name(dev))) {
+		dev_err(dev, "Couldn't request GPIO %u\n", sn54hc595->ser);
+		return -EBUSY;
+	}
+
+	if (devm_gpio_request(dev, sn54hc595->srclk, dev_name(dev))) {
+		dev_err(dev, "Couldn't request GPIO %u\n", sn54hc595->srclk);
+		return -EBUSY;
+	}
+
+	if (devm_gpio_request(dev, sn54hc595->srclr, dev_name(dev))) {
+		dev_err(dev, "Couldn't request GPIO %u\n", sn54hc595->srclr);
+		return -EBUSY;
+	}
+
+	if (devm_gpio_request(dev, sn54hc595->rclk, dev_name(dev))) {
+		dev_err(dev, "Couldn't request GPIO %u\n", sn54hc595->rclk);
+		return -EBUSY;
+	}
+
+	if (devm_gpio_request(dev, sn54hc595->oe, dev_name(dev))) {
+		dev_err(dev, "Couldn't request GPIO %u\n", sn54hc595->oe);
+		return -EBUSY;
+	}
+
+	/* Get ready for raising shift clock and shifting values */
+	if (gpio_direction_output(sn54hc595->srclk, 0)) {
+		dev_err(dev, "Couldn't set \"srclk\" GPIO directon\n");
+		return -EIO;
+	}
+
+	/* Get ready for raising storage clock and load (copy) data */
+	if (gpio_direction_output(sn54hc595->rclk, 0)) {
+		dev_err(dev, "Couldn't set \"rclk\" GPIO directon\n");
+		return -EIO;
+	}
+
+	/* Enable outputs */
+	if (gpio_direction_output(sn54hc595->oe, 0)) {
+		dev_err(dev, "Couldn't set \"oe\" GPIO directon\n");
+		return -EIO;
+	}
+
+	/* Don't clear shift register */
+	if (gpio_direction_output(sn54hc595->srclr, 1)) {
+		dev_err(dev, "Couldn't set \"srclr\" GPIO directon\n");
+		return -EIO;
+	}
+
+	sn54hc595->gpio_chip.dev =3D dev;
+	sn54hc595->gpio_chip.label =3D "sn54hc595";
+	sn54hc595->gpio_chip.direction_input =3D sn54hc595_direction_input;
+	sn54hc595->gpio_chip.direction_output =3D sn54hc595_direction_output;
+	sn54hc595->gpio_chip.get =3D sn54hc595_get_value;
+	sn54hc595->gpio_chip.set =3D sn54hc595_set_value;
+	sn54hc595->gpio_chip.base =3D -1;
+	sn54hc595->gpio_chip.ngpio =3D SN54HC595_NUM_GPIOS;
+
+	err =3D gpiochip_add(&sn54hc595->gpio_chip);
+	if (err)
+		return err;
+
+	platform_set_drvdata(pdev, sn54hc595);
+
+	return 0;
+}
+
+static int sn54hc595_remove(struct platform_device *pdev)
+{
+	struct sn54hc595 *sn54hc595 =3D platform_get_drvdata(pdev);
+
+	gpiochip_remove(&sn54hc595->gpio_chip);
+
+	platform_set_drvdata(pdev, NULL);
+
+	return 0;
+}
+
+
+static const struct of_device_id sn54hc595_of_match[] =3D {
+	{ .compatible =3D "ti,sn54hc595", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bcma_host_soc_of_match);
+
+static struct platform_driver sn54hc595_driver =3D {
+	.probe		=3D sn54hc595_probe,
+	.remove		=3D sn54hc595_remove,
+	.driver		=3D {
+		.name	=3D "sn54hc595",
+		.of_match_table =3D sn54hc595_of_match,
+	},
+};
+
+module_platform_driver(sn54hc595_driver);
+
+MODULE_AUTHOR("Rafa=C5=82 Mi=C5=82ecki");
+MODULE_LICENSE("GPL");
--=20
1.8.4.5

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
