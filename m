From: <Andrei.Stefanescu@microchip.com>
Subject: [PATCH 3/3] gpio: add driver for sama5d2 PIOBU pins
Date: Wed, 7 Nov 2018 15:12:41 +0000
Message-ID: <1541603580-17448-4-git-send-email-andrei.stefanescu@microchip.com>
References: <1541603580-17448-1-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541603580-17448-1-git-send-email-andrei.stefanescu@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Ludovic.Desroches@microchip.com, Cristian.Birsan@microchip.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrei.Stefanescu@microchip.com
List-Id: devicetree@vger.kernel.org

PIOBU pins do not lose their voltage during Backup/Self-refresh.
This patch adds a simple GPIO controller for them.

This driver adds support for using the pins as GPIO
offering the possibility to read/set the voltage.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@microchip.com>
---
 drivers/gpio/Kconfig              |  10 ++
 drivers/gpio/Makefile             |   1 +
 drivers/gpio/gpio-sama5d2-piobu.c | 254 ++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 265 insertions(+)
 create mode 100644 drivers/gpio/gpio-sama5d2-piobu.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 833a1b5..e562e32 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -429,6 +429,16 @@ config GPIO_REG
 	  A 32-bit single register GPIO fixed in/out implementation.  This
 	  can be used to represent any register as a set of GPIO signals.
=20
+config GPIO_SAMA5D2_PIOBU
+	tristate "SAMA5D2 PIOBU GPIO support"
+	depends on GPIO_SYSCON
+	help
+	  Say yes here to use the PIOBU pins as GPIOs.
+
+	  PIOBU pins on the SAMA5D2 can be used as GPIOs.
+	  The difference from regular GPIOs is that they
+	  maintain their value during backup/self-refresh.
+
 config GPIO_SIOX
 	tristate "SIOX GPIO support"
 	depends on SIOX
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 671c447..f18d345 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -108,6 +108,7 @@ obj-$(CONFIG_GPIO_RDC321X)	+=3D gpio-rdc321x.o
 obj-$(CONFIG_GPIO_RCAR)		+=3D gpio-rcar.o
 obj-$(CONFIG_GPIO_REG)		+=3D gpio-reg.o
 obj-$(CONFIG_ARCH_SA1100)	+=3D gpio-sa1100.o
+obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+=3D gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH)		+=3D gpio-sch.o
 obj-$(CONFIG_GPIO_SCH311X)	+=3D gpio-sch311x.o
 obj-$(CONFIG_GPIO_SNPS_CREG)	+=3D gpio-creg-snps.o
diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-=
piobu.c
new file mode 100644
index 0000000..4ded370
--- /dev/null
+++ b/drivers/gpio/gpio-sama5d2-piobu.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SAMA5D2 PIOBU GPIO controller
+ *
+ * Copyright (C) 2018 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Andrei Stefanescu <andrei.stefanescu@microchip.com>
+ *
+ */
+#include <linux/gpio.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define PIOBU_NUM 8
+#define PIOBU_REG_SIZE 4
+
+/*
+ * backup mode protection register for intrusion detection
+ * normal mode protection register for intrusion detection
+ * wakeup signal generation
+ */
+#define PIOBU_BMPR 0x7C
+#define PIOBU_NMPR 0x80
+#define PIOBU_WKPR 0x90
+
+#define PIOBU_BASE 0x18 /* PIOBU offset from SECUMOD base register address=
. */
+
+#define PIOBU_DET_OFFSET 16
+
+/* In the datasheet this bit is called OUTPUT */
+#define PIOBU_DIRECTION BIT(8)
+#define PIOBU_OUT BIT(8)
+#define PIOBU_IN 0
+
+#define PIOBU_SOD BIT(9)
+#define PIOBU_PDS BIT(10)
+
+#define PIOBU_HIGH BIT(9)
+#define PIOBU_LOW 0
+
+struct sama5d2_piobu {
+	struct gpio_chip chip;
+	struct regmap *regmap;
+};
+
+/*
+ * sama5d2_piobu_setup_pin - prepares a pin for sama5d2_piobu_set_directio=
n call
+ *
+ * Do not consider pin for intrusion detection (normal and backup modes)
+ * Do not consider pin as intrusion wakeup interrupt source
+ */
+static int sama5d2_piobu_setup_pin(struct gpio_chip *chip, unsigned int pi=
n)
+{
+	int ret;
+	struct sama5d2_piobu *piobu =3D container_of(chip, struct sama5d2_piobu,
+						   chip);
+	unsigned int mask =3D BIT(PIOBU_DET_OFFSET + pin);
+
+	ret =3D regmap_update_bits(piobu->regmap, PIOBU_BMPR, mask, 0);
+	if (ret)
+		return ret;
+
+	ret =3D regmap_update_bits(piobu->regmap, PIOBU_NMPR, mask, 0);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(piobu->regmap, PIOBU_WKPR, mask, 0);
+}
+
+/*
+ * sama5d2_piobu_write_value - writes value & mask at the pin's PIOBU regi=
ster
+ */
+static int sama5d2_piobu_write_value(struct gpio_chip *chip, unsigned int =
pin,
+				     unsigned int mask, unsigned int value)
+{
+	int reg, ret;
+	struct sama5d2_piobu *piobu =3D container_of(chip, struct sama5d2_piobu,
+						   chip);
+
+	reg =3D PIOBU_BASE + pin * PIOBU_REG_SIZE;
+	ret =3D regmap_update_bits(piobu->regmap, reg, mask, value);
+	return ret;
+}
+
+/*
+ * sama5d2_piobu_read_value - read the value with masking from the pin's P=
IOBU
+ *			      register
+ */
+static int sama5d2_piobu_read_value(struct gpio_chip *chip, unsigned int p=
in,
+				    unsigned int mask)
+{
+	struct sama5d2_piobu *piobu =3D container_of(chip, struct sama5d2_piobu,
+						   chip);
+	unsigned int val, reg;
+	int ret;
+
+	reg =3D PIOBU_BASE + pin * PIOBU_REG_SIZE;
+	ret =3D regmap_read(piobu->regmap, reg, &val);
+	if (ret < 0)
+		return ret;
+
+	return val & mask;
+}
+
+/*
+ * sama5d2_piobu_set_direction - mark pin as input or output
+ */
+static int sama5d2_piobu_set_direction(struct gpio_chip *chip,
+				       unsigned int direction,
+				       unsigned int pin)
+{
+	return sama5d2_piobu_write_value(chip, pin, PIOBU_DIRECTION, direction);
+}
+
+/*
+ * sama5d2_piobu_get_direction - gpiochip get_direction
+ */
+static int sama5d2_piobu_get_direction(struct gpio_chip *chip,
+				       unsigned int pin)
+{
+	int ret =3D sama5d2_piobu_read_value(chip, pin, PIOBU_DIRECTION);
+
+	if (ret < 0)
+		return ret;
+
+	return (ret =3D=3D PIOBU_IN) ? GPIOF_DIR_IN : GPIOF_DIR_OUT;
+}
+
+/*
+ * sama5d2_piobu_direction_input - gpiochip direction_input
+ */
+static int sama5d2_piobu_direction_input(struct gpio_chip *chip,
+					 unsigned int pin)
+{
+	return sama5d2_piobu_set_direction(chip, PIOBU_IN, pin);
+}
+
+/*
+ * sama5d2_piobu_direction_output - gpiochip direction_output
+ */
+static int sama5d2_piobu_direction_output(struct gpio_chip *chip,
+					  unsigned int pin, int value)
+{
+	return sama5d2_piobu_set_direction(chip, PIOBU_OUT, pin);
+}
+
+/*
+ * sama5d2_piobu_get - gpiochip get
+ */
+static int sama5d2_piobu_get(struct gpio_chip *chip, unsigned int pin)
+{
+	/* if pin is input, read value from PDS else read from SOD */
+	int ret =3D sama5d2_piobu_get_direction(chip, pin);
+
+	if (ret =3D=3D GPIOF_DIR_IN)
+		ret =3D sama5d2_piobu_read_value(chip, pin, PIOBU_PDS);
+	else if (ret =3D=3D GPIOF_DIR_OUT)
+		ret =3D sama5d2_piobu_read_value(chip, pin, PIOBU_SOD);
+
+	if (ret < 0)
+		return ret;
+
+	return !!ret;
+}
+
+/*
+ * sama5d2_piobu_set - gpiochip set
+ */
+static void sama5d2_piobu_set(struct gpio_chip *chip, unsigned int pin,
+			      int value)
+{
+	value =3D (value =3D=3D 0) ? PIOBU_LOW : PIOBU_HIGH;
+	sama5d2_piobu_write_value(chip, pin, PIOBU_SOD, value);
+}
+
+const struct gpio_chip sama5d2_piobu_template_chip =3D {
+	.owner =3D THIS_MODULE,
+	.get_direction =3D sama5d2_piobu_get_direction,
+	.direction_input =3D sama5d2_piobu_direction_input,
+	.direction_output =3D sama5d2_piobu_direction_output,
+	.get =3D sama5d2_piobu_get,
+	.set =3D sama5d2_piobu_set,
+	.base =3D -1,
+	.ngpio =3D PIOBU_NUM,
+	.can_sleep =3D 0,
+
+};
+
+static int sama5d2_piobu_probe(struct platform_device *pdev)
+{
+	struct sama5d2_piobu *piobu;
+	int ret, i;
+
+	piobu =3D devm_kzalloc(&pdev->dev, sizeof(*piobu), GFP_KERNEL);
+	if (!piobu)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, piobu);
+	piobu->chip =3D sama5d2_piobu_template_chip;
+	piobu->chip.label =3D pdev->name;
+	piobu->chip.parent =3D &pdev->dev;
+	piobu->chip.of_node =3D pdev->dev.of_node;
+
+	piobu->regmap =3D
+		syscon_regmap_lookup_by_compatible("microchip,sama5d2-piobu");
+	if (IS_ERR(piobu->regmap)) {
+		dev_err(&pdev->dev, "Failed to get syscon regmap %ld\n",
+			PTR_ERR(piobu->regmap));
+		return PTR_ERR(piobu->regmap);
+	}
+
+	ret =3D devm_gpiochip_add_data(&pdev->dev, &piobu->chip, piobu);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to add gpiochip %d\n", ret);
+		return ret;
+	}
+
+	for (i =3D 0; i < PIOBU_NUM; ++i) {
+		ret =3D sama5d2_piobu_setup_pin(&piobu->chip, i);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to setup pin: %d %d\n",
+				i, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct of_device_id sama5d2_piobu_ids[] =3D {
+	{ .compatible =3D "microchip,sama5d2-piobu" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sama5d2_piobu_ids);
+
+static struct platform_driver sama5d2_piobu_driver =3D {
+	.driver =3D {
+		.name		=3D "sama5d2-piobu",
+		.of_match_table	=3D of_match_ptr(sama5d2_piobu_ids)
+	},
+	.probe =3D sama5d2_piobu_probe,
+};
+
+module_platform_driver(sama5d2_piobu_driver);
+
+MODULE_VERSION("1.0");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("SAMA5D2 PIOBU controller driver");
+MODULE_AUTHOR("Andrei Stefanescu <andrei.stefanescu@microchip.com>");
--=20
2.7.4
