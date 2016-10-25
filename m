From: Eric Jeong <eric.jeong.opensource@diasemi.com>
Subject: [PATCH V1] mfd: pv88080: Expand driver for GPIO function support.
Date: Tue, 25 Oct 2016 10:37:41 +0900
Message-ID: <20161025014148.7DF655FA17@krsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-GPIO <linux-gpio@vger.kernel.org>, LINUX-KERNEL <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org


From: Eric Jeong <eric.jeong.opensource@diasemi.com>

This patch adds support for the PV88080 PMIC.

This pathch is done as part of the existing PV88080 regulator driver
by expanding the driver for GPIO function support.

The MFD core driver provides communication through the I2C interface.
and contains the following components:

    - Regulators
    - Configurable GPIOs

Kconfig and Makefile are updated to reflect support for PV88080 PMIC.

Signed-off-by: Eric Jeong <eric.jeong.opensource@diasemi.com>

---
This patch applies against linux-next and next-20161024

Hi,

This change is made as a single patch. Because, to ensure that
kernel builds and runs properly after this patch.

The regulator device driver for PV88080 IC is submitted to Linux kernel.
And now, GPIO function is required. In order to add GPIO driver,
MFD driver is also required.

Changes
 - Add MFD driver.
 - Add GPIO driver.
 - Update regulator driver to reflect the support.
 - Delete pv88080-regulator.h file.
 - Move binding document to mfd directory.
 
Regards,
Eric Jeong, Dialog Semiconductor Ltd.


 Documentation/devicetree/bindings/mfd/pv88080.txt  |   63 +++++
 .../devicetree/bindings/regulator/pv88080.txt      |   62 -----
 drivers/gpio/Kconfig                               |   11 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-pv88080.c                        |  195 ++++++++++++++
 drivers/mfd/Kconfig                                |   12 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/pv88080-core.c                         |  270 ++++++++++++++++++++
 drivers/mfd/pv88080-i2c.c                          |   99 +++++++
 drivers/regulator/Kconfig                          |    5 +-
 drivers/regulator/pv88080-regulator.c              |  202 ++++++---------
 drivers/regulator/pv88080-regulator.h              |  118 ---------
 include/linux/mfd/pv88080.h                        |  236 +++++++++++++++++
 13 files changed, 970 insertions(+), 306 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/pv88080.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/pv88080.txt
 create mode 100644 drivers/gpio/gpio-pv88080.c
 create mode 100644 drivers/mfd/pv88080-core.c
 create mode 100644 drivers/mfd/pv88080-i2c.c
 delete mode 100644 drivers/regulator/pv88080-regulator.h
 create mode 100644 include/linux/mfd/pv88080.h

diff --git a/Documentation/devicetree/bindings/mfd/pv88080.txt b/Documentation/devicetree/bindings/mfd/pv88080.txt
new file mode 100644
index 0000000..7b556b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/pv88080.txt
@@ -0,0 +1,63 @@
+* Powerventure Semiconductor PV88080 PMIC
+
+Required properties:
+- compatible: Must be one of the following, depending on the
+  silicon version:
+	- "pvs,pv88080" (DEPRECATED)
+
+	- "pvs,pv88080-aa" for PV88080 AA or AB silicon
+	- "pvs,pv88080-ba" for PV88080 BA or BB silicon
+  NOTE: The use of the compatibles with no silicon version is deprecated.
+- reg: I2C slave address, usually 0x49
+- interrupts: the interrupt outputs of the controller
+- regulators: A node that houses a sub-node for each regulator within the
+  device. Each sub-node is identified using the node's name, with valid
+  values listed below. The content of each sub-node is defined by the
+  standard binding for regulators; see regulator.txt.
+  BUCK1, BUCK2, BUCK3 and HVBUCK.
+
+Optional properties:
+- Any optional property defined in regulator.txt
+  and gpio.txt for more information.
+
+Example:
+
+	pmic: pv88080@49 {
+		compatible = "pvs,pv88080-ba";
+		reg = <0x49>;
+		interrupt-parent = <&gpio>;
+		interrupts = <24 24>;
+
+		regulators {
+			BUCK1 {
+				regulator-name = "buck1";
+				regulator-min-microvolt = < 600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-min-microamp 	= < 220000>;
+				regulator-max-microamp 	= <7040000>;
+			};
+
+			BUCK2 {
+				regulator-name = "buck2";
+				regulator-min-microvolt = < 600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-min-microamp 	= <1496000>;
+				regulator-max-microamp 	= <4189000>;
+			};
+
+			BUCK3 {
+				regulator-name = "buck3";
+				regulator-min-microvolt = <1400000>;
+				regulator-max-microvolt = <2193750>;
+				regulator-min-microamp 	= <1496000>;
+				regulator-max-microamp 	= <4189000>;
+			};
+
+			HVBUCK {
+				regulator-name = "hvbuck";
+				regulator-min-microvolt = <   5000>;
+				regulator-max-microvolt = <1275000>;
+ 			};
+		};
+	};
+
diff --git a/Documentation/devicetree/bindings/regulator/pv88080.txt b/Documentation/devicetree/bindings/regulator/pv88080.txt
deleted file mode 100644
index e6e4b9c8..0000000
--- a/Documentation/devicetree/bindings/regulator/pv88080.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-* Powerventure Semiconductor PV88080 Voltage Regulator
-
-Required properties:
-- compatible: Must be one of the following, depending on the
-  silicon version:
-	- "pvs,pv88080" (DEPRECATED)
-
-	- "pvs,pv88080-aa" for PV88080 AA or AB silicon
-	- "pvs,pv88080-ba" for PV88080 BA or BB silicon
-  NOTE: The use of the compatibles with no silicon version is deprecated.
-- reg: I2C slave address, usually 0x49
-- interrupts: the interrupt outputs of the controller
-- regulators: A node that houses a sub-node for each regulator within the
-  device. Each sub-node is identified using the node's name, with valid
-  values listed below. The content of each sub-node is defined by the
-  standard binding for regulators; see regulator.txt.
-  BUCK1, BUCK2, BUCK3 and HVBUCK.
-
-Optional properties:
-- Any optional property defined in regulator.txt
-
-Example:
-
-	pmic: pv88080@49 {
-		compatible = "pvs,pv88080-ba";
-		reg = <0x49>;
-		interrupt-parent = <&gpio>;
-		interrupts = <24 24>;
-
-		regulators {
-			BUCK1 {
-				regulator-name = "buck1";
-				regulator-min-microvolt = < 600000>;
-				regulator-max-microvolt = <1393750>;
-				regulator-min-microamp 	= < 220000>;
-				regulator-max-microamp 	= <7040000>;
-			};
-
-			BUCK2 {
-				regulator-name = "buck2";
-				regulator-min-microvolt = < 600000>;
-				regulator-max-microvolt = <1393750>;
-				regulator-min-microamp 	= <1496000>;
-				regulator-max-microamp 	= <4189000>;
-			};
-
-			BUCK3 {
-				regulator-name = "buck3";
-				regulator-min-microvolt = <1400000>;
-				regulator-max-microvolt = <2193750>;
-				regulator-min-microamp 	= <1496000>;
-				regulator-max-microamp 	= <4189000>;
-			};
-
-			HVBUCK {
-				regulator-name = "hvbuck";
-				regulator-min-microvolt = <   5000>;
-				regulator-max-microvolt = <1275000>;
- 			};
-		};
-	};
-
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 9f0f4b6..0381ffd 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -952,6 +952,17 @@ config GPIO_PALMAS
 	  Select this option to enable GPIO driver for the TI PALMAS
 	  series chip family.
 
+config GPIO_PV88080
+	bool "Powerventure Semiconductor PV88080 GPIO"
+	depends on MFD_PV88080
+	help
+	  Support for GPIO pins on PV88080 PMIC.
+
+	  Say yes here to enable the GPIO driver for the PV88080 chip.
+
+	  The Powerventure PMIC chip has 2 GPIO pins that can be
+	  controlled by this driver.
+
 config GPIO_RC5T583
 	bool "RICOH RC5T583 GPIO"
 	depends on MFD_RC5T583
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 145847a4d..503aed5 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -91,6 +91,7 @@ obj-$(CONFIG_GPIO_PCF857X)	+= gpio-pcf857x.o
 obj-$(CONFIG_GPIO_PCH)		+= gpio-pch.o
 obj-$(CONFIG_GPIO_PISOSR)	+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)	+= gpio-pl061.o
+obj-$(CONFIG_GPIO_PV88080)	+= gpio-pv88080.o
 obj-$(CONFIG_GPIO_PXA)		+= gpio-pxa.o
 obj-$(CONFIG_GPIO_RC5T583)	+= gpio-rc5t583.o
 obj-$(CONFIG_GPIO_RDC321X)	+= gpio-rdc321x.o
diff --git a/drivers/gpio/gpio-pv88080.c b/drivers/gpio/gpio-pv88080.c
new file mode 100644
index 0000000..0e2eb49
--- /dev/null
+++ b/drivers/gpio/gpio-pv88080.c
@@ -0,0 +1,195 @@
+/*
+ * gpio-pv88080.c - GPIO device driver for PV88080
+ * Copyright (C) 2016  Powerventure Semiconductor Ltd.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/gpio.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/platform_device.h>
+
+#include <linux/mfd/pv88080.h>
+
+#define DEFAULT_PIN_NUMBER		2
+
+#define PV88080_PORT_DIRECTION_INPUT	0
+#define PV88080_PORT_DIRECTION_OUTPUT	1
+
+struct pv88080_gpio {
+	struct pv88080 *chip;
+	struct gpio_chip gpio_chip;
+	unsigned int input_reg;
+	unsigned int gpio_base_reg;
+};
+
+static int pv88080_gpio_get_direction(struct gpio_chip *gc,
+				unsigned int offset)
+{
+	struct pv88080_gpio *priv = gpiochip_get_data(gc);
+	struct pv88080 *chip = priv->chip;
+	unsigned int reg;
+	int ret;
+
+	ret = regmap_read(chip->regmap, priv->gpio_base_reg + offset, &reg);
+	if (ret)
+		return ret;
+
+	reg = reg & PV88080_GPIO_DIRECTION_MASK;
+
+	return !reg;
+}
+
+static int pv88080_gpio_direction_input(struct gpio_chip *gc,
+				unsigned int offset)
+{
+	struct pv88080_gpio *priv = gpiochip_get_data(gc);
+	struct pv88080 *chip = priv->chip;
+	int ret;
+
+	/* Set the initial value */
+	ret = regmap_update_bits(chip->regmap, priv->gpio_base_reg + offset,
+					PV88080_GPIO_OUTPUT_MASK, 0);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(chip->regmap, priv->gpio_base_reg + offset,
+				PV88080_GPIO_DIRECTION_MASK, 0);
+}
+
+static int pv88080_gpio_direction_output(struct gpio_chip *gc,
+				unsigned int offset, int value)
+{
+	struct pv88080_gpio *priv = gpiochip_get_data(gc);
+	struct pv88080 *chip = priv->chip;
+	int ret;
+
+	ret = regmap_update_bits(chip->regmap, priv->gpio_base_reg + offset,
+			PV88080_GPIO_DIRECTION_MASK,
+			PV88080_GPIO_DIRECTION_MASK);
+
+	return ret;
+}
+
+static int pv88080_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct pv88080_gpio *priv = gpiochip_get_data(gc);
+	struct pv88080 *chip = priv->chip;
+	unsigned int reg = 0, direction;
+	int ret;
+
+	ret = regmap_read(chip->regmap, priv->gpio_base_reg + offset, &reg);
+	if (ret)
+		return ret;
+
+	direction = (reg & PV88080_GPIO_DIRECTION_MASK);
+	if (direction == PV88080_PORT_DIRECTION_OUTPUT) {
+		if (reg & PV88080_GPIO_OUTPUT_EN)
+			return 1;
+		ret = 0;
+	} else {
+		ret = regmap_read(chip->regmap, priv->input_reg, &reg);
+		if (ret < 0)
+			return ret;
+		ret = (reg & (PV88080_GPIO_INPUT_MASK << offset)) >> offset;
+	}
+
+	return ret;
+}
+
+static void pv88080_gpio_set(struct gpio_chip *gc, unsigned int offset,
+				int value)
+{
+	struct pv88080_gpio *priv = gpiochip_get_data(gc);
+	struct pv88080 *chip = priv->chip;
+
+	if (value)
+		regmap_update_bits(chip->regmap, priv->gpio_base_reg + offset,
+				PV88080_GPIO_OUTPUT_MASK,
+				PV88080_GPIO_OUTPUT_EN);
+	else
+		regmap_update_bits(chip->regmap, priv->gpio_base_reg + offset,
+				PV88080_GPIO_OUTPUT_MASK,
+				PV88080_GPIO_OUTPUT_DIS);
+}
+
+static const struct gpio_chip template_gpio = {
+	.label = "pv88080-gpio",
+	.owner = THIS_MODULE,
+	.get_direction = pv88080_gpio_get_direction,
+	.direction_input = pv88080_gpio_direction_input,
+	.direction_output = pv88080_gpio_direction_output,
+	.get = pv88080_gpio_get,
+	.set = pv88080_gpio_set,
+	.base = -1,
+	.ngpio = DEFAULT_PIN_NUMBER,
+};
+
+static int pv88080_gpio_probe(struct platform_device *pdev)
+{
+	struct pv88080 *chip = dev_get_drvdata(pdev->dev.parent);
+	struct pv88080_pdata *pdata = dev_get_platdata(chip->dev);
+	struct pv88080_gpio *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev,
+			sizeof(struct pv88080_gpio), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->chip = chip;
+	priv->gpio_chip = template_gpio;
+	priv->gpio_chip.parent = chip->dev;
+	if (pdata && pdata->gpio_base)
+		priv->gpio_chip.base = pdata->gpio_base;
+
+	switch (chip->type) {
+	case TYPE_PV88080_AA:
+		priv->input_reg = PV88080AA_REG_GPIO_INPUT;
+		priv->gpio_base_reg = PV88080AA_REG_GPIO_GPIO0;
+		break;
+	case TYPE_PV88080_BA:
+		priv->input_reg = PV88080BA_REG_GPIO_INPUT;
+		priv->gpio_base_reg = PV88080BA_REG_GPIO_GPIO0;
+		break;
+	}
+
+	ret = devm_gpiochip_add_data(&pdev->dev, &priv->gpio_chip, priv);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Unable to register gpiochip\n");
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static const struct platform_device_id pv88080_gpio_id_table[] = {
+	{ "pv88080-gpio", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, pv88080_gpio_id_table);
+
+static struct platform_driver pv88080_gpio_driver = {
+	.driver = {
+		.name = "pv88080-gpio",
+	},
+	.probe = pv88080_gpio_probe,
+	.id_table = pv88080_gpio_id_table,
+};
+module_platform_driver(pv88080_gpio_driver);
+
+MODULE_AUTHOR("Eric Jeong <eric.jeong.opensource@diasemi.com>");
+MODULE_DESCRIPTION("GPIO device driver for Powerventure PV88080");
+MODULE_LICENSE("GPL");
+
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index c6df644..d69edf4 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -775,6 +775,18 @@ config MFD_PM8921_CORE
 	  Say M here if you want to include support for PM8921 chip as a module.
 	  This will build a module called "pm8921-core".
 
+config MFD_PV88080
+	bool "Powerventure Semiconductor PV88080 PMIC Support"
+	select MFD_CORE
+	select REGMAP_I2C
+	select REGMAP_IRQ
+	depends on I2C
+	help
+	  Say yes here for support for the Powerventure Semiconductor PV88080 PMIC.
+	  This includes the I2C driver and core APIs.
+	  Additional drivers must be enabled in order to use the functionality
+	  of the device.
+
 config MFD_QCOM_RPM
 	tristate "Qualcomm Resource Power Manager (RPM)"
 	depends on ARCH_QCOM && OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 9834e66..6248e0b 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -173,6 +173,8 @@ obj-$(CONFIG_MFD_SI476X_CORE)	+= si476x-core.o
 obj-$(CONFIG_MFD_CS5535)	+= cs5535-mfd.o
 obj-$(CONFIG_MFD_OMAP_USB_HOST)	+= omap-usb-host.o omap-usb-tll.o
 obj-$(CONFIG_MFD_PM8921_CORE) 	+= pm8921-core.o ssbi.o
+pv88080-objs := pv88080-core.o pv88080-i2c.o
+obj-$(CONFIG_MFD_PV88080)	+= pv88080.o
 obj-$(CONFIG_MFD_QCOM_RPM)	+= qcom_rpm.o
 obj-$(CONFIG_MFD_SPMI_PMIC)	+= qcom-spmi-pmic.o
 obj-$(CONFIG_TPS65911_COMPARATOR)	+= tps65911-comparator.o
diff --git a/drivers/mfd/pv88080-core.c b/drivers/mfd/pv88080-core.c
new file mode 100644
index 0000000..b858f06
--- /dev/null
+++ b/drivers/mfd/pv88080-core.c
@@ -0,0 +1,270 @@
+/*
+ * pv88080-core.c - Device access for PV88080
+ *
+ * Copyright (C) 2016  Powerventure Semiconductor Ltd.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+
+#include <linux/mfd/pv88080.h>
+
+#define	PV88080_REG_EVENT_A_OFFSET	0
+#define	PV88080_REG_EVENT_B_OFFSET	1
+#define	PV88080_REG_EVENT_C_OFFSET	2
+
+static const struct resource regulators_aa_resources[] = {
+	{
+		.name	= "regulator-irq",
+		.start  = PV88080_AA_IRQ_VDD_FLT,
+		.end	= PV88080_AA_IRQ_OVER_TEMP,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static const struct resource regulators_ba_resources[] = {
+	{
+		.name	= "regulator-irq",
+		.start  = PV88080_BA_IRQ_VDD_FLT,
+		.end	= PV88080_BA_IRQ_OVER_TEMP,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static struct mfd_cell pv88080_cells[] = {
+	{
+		.name = "pv88080-regulator",
+	},
+	{
+		.name = "pv88080-gpio",
+	},
+};
+
+static const struct regmap_irq pv88080_aa_irqs[] = {
+	/* PV88080 event A register for AA/AB silicon */
+	[PV88080_AA_IRQ_VDD_FLT] = {
+		.reg_offset = PV88080_REG_EVENT_A_OFFSET,
+		.mask = PV88080_M_VDD_FLT,
+	},
+	[PV88080_AA_IRQ_OVER_TEMP] = {
+		.reg_offset = PV88080_REG_EVENT_A_OFFSET,
+		.mask = PV88080_M_OVER_TEMP,
+	},
+	[PV88080_AA_IRQ_SEQ_RDY] = {
+		.reg_offset = PV88080_REG_EVENT_A_OFFSET,
+		.mask = PV88080_M_SEQ_RDY,
+	},
+	/* PV88080 event B register for AA/AB silicon */
+	[PV88080_AA_IRQ_HVBUCK_OV] = {
+		.reg_offset = PV88080_REG_EVENT_B_OFFSET,
+		.mask = PV88080_M_HVBUCK_OV,
+	},
+	[PV88080_AA_IRQ_HVBUCK_UV] = {
+		.reg_offset = PV88080_REG_EVENT_B_OFFSET,
+		.mask = PV88080_M_HVBUCK_UV,
+	},
+	[PV88080_AA_IRQ_HVBUCK_SCP] = {
+		.reg_offset = PV88080_REG_EVENT_B_OFFSET,
+		.mask = PV88080_M_HVBUCK_SCP,
+	},
+	[PV88080_AA_IRQ_BUCK1_SCP] = {
+		.reg_offset = PV88080_REG_EVENT_B_OFFSET,
+		.mask = PV88080_M_BUCK1_SCP,
+	},
+	[PV88080_AA_IRQ_BUCK2_SCP] = {
+		.reg_offset = PV88080_REG_EVENT_B_OFFSET,
+		.mask = PV88080_M_BUCK2_SCP,
+	},
+	[PV88080_AA_IRQ_BUCK3_SCP] = {
+		.reg_offset = PV88080_REG_EVENT_B_OFFSET,
+		.mask = PV88080_M_BUCK3_SCP,
+	},
+	/* PV88080 event C register for AA/AB silicon */
+	[PV88080_AA_IRQ_GPIO_FLAG0] = {
+		.reg_offset = PV88080_REG_EVENT_C_OFFSET,
+		.mask = PV88080_M_GPIO_FLAG0,
+	},
+	[PV88080_AA_IRQ_GPIO_FLAG1] = {
+		.reg_offset = PV88080_REG_EVENT_C_OFFSET,
+		.mask = PV88080_M_GPIO_FLAG1,
+	},
+};
+
+static const struct regmap_irq pv88080_ba_irqs[] = {
+	/* PV88080 event A register for BA/BB silicon */
+	[PV88080_BA_IRQ_VDD_FLT] = {
+		.reg_offset = PV88080_REG_EVENT_A_OFFSET,
+		.mask = PV88080_M_VDD_FLT,
+	},
+	[PV88080_BA_IRQ_OVER_TEMP] = {
+		.reg_offset = PV88080_REG_EVENT_A_OFFSET,
+		.mask = PV88080_M_OVER_TEMP,
+	},
+	[PV88080_BA_IRQ_SEQ_RDY] = {
+		.reg_offset = PV88080_REG_EVENT_A_OFFSET,
+		.mask = PV88080_M_SEQ_RDY,
+	},
+	[PV88080_BA_IRQ_EXT_OT] = {
+		.reg_offset = PV88080_REG_EVENT_A_OFFSET,
+		.mask = PV88080_M_EXT_OT,
+	},
+	/* PV88080 event B register for BA/BB silicon */
+	[PV88080_BA_IRQ_HVBUCK_OV] = {
+		.reg_offset = PV88080_REG_EVENT_B_OFFSET,
+		.mask = PV88080_M_HVBUCK_OV,
+	},
+	[PV88080_BA_IRQ_HVBUCK_UV] = {
+		.reg_offset = PV88080_REG_EVENT_B_OFFSET,
+		.mask = PV88080_M_HVBUCK_UV,
+	},
+	[PV88080_BA_IRQ_HVBUCK_SCP] = {
+		.reg_offset = PV88080_REG_EVENT_B_OFFSET,
+		.mask = PV88080_M_HVBUCK_SCP,
+	},
+	[PV88080_BA_IRQ_BUCK1_SCP] = {
+		.reg_offset = PV88080_REG_EVENT_B_OFFSET,
+		.mask = PV88080_M_BUCK1_SCP,
+	},
+	[PV88080_BA_IRQ_BUCK2_SCP] = {
+		.reg_offset = PV88080_REG_EVENT_B_OFFSET,
+		.mask = PV88080_M_BUCK2_SCP,
+	},
+	[PV88080_BA_IRQ_BUCK3_SCP] = {
+		.reg_offset = PV88080_REG_EVENT_B_OFFSET,
+		.mask = PV88080_M_BUCK3_SCP,
+	},
+	/* PV88080 event C register for BA/BB silicon */
+	[PV88080_BA_IRQ_GPIO_FLAG0] = {
+		.reg_offset = PV88080_REG_EVENT_C_OFFSET,
+		.mask = PV88080_M_GPIO_FLAG0,
+	},
+	[PV88080_BA_IRQ_GPIO_FLAG1] = {
+		.reg_offset = PV88080_REG_EVENT_C_OFFSET,
+		.mask = PV88080_M_GPIO_FLAG1,
+	},
+	[PV88080_BA_IRQ_BUCK1_DROP_TIMEOUT] = {
+		.reg_offset = PV88080_REG_EVENT_C_OFFSET,
+		.mask = PV88080_M_BUCK1_DROP_TIMEOUT,
+	},
+	[PV88080_BA_IRQ_BUCK2_DROP_TIMEOUT] = {
+		.reg_offset = PV88080_REG_EVENT_C_OFFSET,
+		.mask = PV88080_M_BUCK2_DROP_TIMEOUT,
+	},
+	[PB88080_BA_IRQ_BUCK3_DROP_TIMEOUT] = {
+		.reg_offset = PV88080_REG_EVENT_C_OFFSET,
+		.mask = PV88080_M_BUCk3_DROP_TIMEOUT,
+	},
+};
+
+static struct regmap_irq_chip pv88080_irq_chip = {
+	.name = "pv88080-irq",
+	.num_regs = 3,
+	.status_base = PV88080_REG_EVENT_A,
+	.mask_base = PV88080_REG_MASK_A,
+	.ack_base = PV88080_REG_EVENT_A,
+	.init_ack_masked = true,
+};
+
+int pv88080_device_init(struct pv88080 *chip, unsigned int irq)
+{
+	struct pv88080_pdata *pdata = dev_get_platdata(chip->dev);
+	int ret;
+
+	if (pdata)
+		chip->irq_base = pdata->irq_base;
+	else
+		chip->irq_base = 0;
+	chip->irq = irq;
+
+	if (pdata && pdata->init != NULL) {
+		ret = pdata->init(chip);
+		if (ret != 0) {
+			dev_err(chip->dev, "Platform initialization failed\n");
+			return ret;
+		}
+	}
+
+	ret = regmap_write(chip->regmap, PV88080_REG_MASK_A, 0xFF);
+	if (ret < 0) {
+		dev_err(chip->dev,
+			"Failed to mask A reg: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_write(chip->regmap, PV88080_REG_MASK_B, 0xFF);
+	if (ret < 0) {
+		dev_err(chip->dev,
+			"Failed to mask B reg: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_write(chip->regmap, PV88080_REG_MASK_C, 0xFF);
+	if (ret < 0) {
+		dev_err(chip->dev, "Failed to mask C reg: %d\n", ret);
+		return ret;
+	}
+
+	switch (chip->type) {
+	case TYPE_PV88080_AA:
+		pv88080_irq_chip.irqs = pv88080_aa_irqs;
+		pv88080_irq_chip.num_irqs = ARRAY_SIZE(pv88080_aa_irqs);
+
+		pv88080_cells[0].num_resources
+				= ARRAY_SIZE(regulators_aa_resources);
+		pv88080_cells[0].resources = regulators_aa_resources;
+		break;
+	case TYPE_PV88080_BA:
+		pv88080_irq_chip.irqs = pv88080_ba_irqs;
+		pv88080_irq_chip.num_irqs = ARRAY_SIZE(pv88080_ba_irqs);
+
+		pv88080_cells[0].num_resources
+				= ARRAY_SIZE(regulators_ba_resources);
+		pv88080_cells[0].resources = regulators_ba_resources;
+		break;
+	}
+
+	ret = regmap_add_irq_chip(chip->regmap, chip->irq,
+			IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+			chip->irq_base, &pv88080_irq_chip,
+			&chip->irq_data);
+	if (ret) {
+		dev_err(chip->dev, "Failed to reguest IRQ %d: %d\n",
+				chip->irq, ret);
+		return ret;
+	}
+
+	ret = mfd_add_devices(chip->dev, PLATFORM_DEVID_NONE,
+			pv88080_cells, ARRAY_SIZE(pv88080_cells),
+			NULL, chip->irq_base, NULL);
+	if (ret) {
+		dev_err(chip->dev, "Cannot add MFD cells\n");
+		regmap_del_irq_chip(chip->irq, chip->irq_data);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pv88080_device_init);
+
+int pv88080_device_exit(struct pv88080 *chip)
+{
+	mfd_remove_devices(chip->dev);
+	regmap_del_irq_chip(chip->irq, chip->irq_data);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pv88080_device_exit);
+
+MODULE_AUTHOR("Eric Jeong <eric.jeong.opensource@diasemi.com>");
+MODULE_DESCRIPTION("MFD driver for Powerventure PV88080");
+MODULE_LICENSE("GPL");
+
diff --git a/drivers/mfd/pv88080-i2c.c b/drivers/mfd/pv88080-i2c.c
new file mode 100644
index 0000000..a90cd40
--- /dev/null
+++ b/drivers/mfd/pv88080-i2c.c
@@ -0,0 +1,99 @@
+/*
+ * pv88080-i2c.c - I2C access driver for PV88080
+ *
+ * Copyright (C) 2016  Powerventure Semiconductor Ltd.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/pv88080.h>
+
+static const struct regmap_config pv88080_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static const struct of_device_id pv88080_of_match_table[] = {
+	{ .compatible = "pvs,pv88080",    .data = (void *)TYPE_PV88080_AA },
+	{ .compatible = "pvs,pv88080-aa", .data = (void *)TYPE_PV88080_AA },
+	{ .compatible = "pvs,pv88080-ba", .data = (void *)TYPE_PV88080_BA },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, pv88080_of_match_table);
+
+static int pv88080_i2c_probe(struct i2c_client *client,
+				const struct i2c_device_id *ids)
+{
+	struct pv88080 *chip;
+	const struct of_device_id *match;
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	if (client->dev.of_node) {
+		match = of_match_node(pv88080_of_match_table,
+						client->dev.of_node);
+		if (!match) {
+			dev_err(&client->dev, "Failed to get of_match_node\n");
+			return -EINVAL;
+		}
+		chip->type = (unsigned long)match->data;
+	} else {
+		chip->type = ids->driver_data;
+	}
+
+	i2c_set_clientdata(client, chip);
+
+	chip->dev = &client->dev;
+	chip->regmap = devm_regmap_init_i2c(client, &pv88080_regmap_config);
+	if (IS_ERR(chip->regmap)) {
+		dev_err(chip->dev, "Failed to initialize register map\n");
+		return PTR_ERR(chip->regmap);
+	}
+
+	return pv88080_device_init(chip, client->irq);
+}
+
+static int pv88080_i2c_remove(struct i2c_client *client)
+{
+	struct pv88080 *chip = i2c_get_clientdata(client);
+
+	return pv88080_device_exit(chip);
+}
+
+static const struct i2c_device_id pv88080_i2c_id[] = {
+	{ "pv88080",	TYPE_PV88080_AA },
+	{ "pv88080-aa", TYPE_PV88080_AA },
+	{ "pv88080-ba", TYPE_PV88080_BA },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, pv88080_i2c_id);
+
+static struct i2c_driver pv88080_i2c_driver = {
+	.driver	 = {
+		.name	 = "pv88080",
+		.of_match_table = of_match_ptr(pv88080_of_match_table),
+	},
+	.probe	= pv88080_i2c_probe,
+	.remove	= pv88080_i2c_remove,
+	.id_table	 = pv88080_i2c_id,
+};
+module_i2c_driver(pv88080_i2c_driver);
+
+MODULE_AUTHOR("Eric Jeong <eric.jeong.opensource@diasemi.com>");
+MODULE_DESCRIPTION("I2C driver for Powerventure PV88080");
+MODULE_LICENSE("GPL");
+
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 936f7cc..217d568 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -576,9 +576,8 @@ config REGULATOR_PV88060
 	  PV88060
 
 config REGULATOR_PV88080
-	tristate "Powerventure Semiconductor PV88080 regulator"
-	depends on I2C
-	select REGMAP_I2C
+	bool "Powerventure Semiconductor PV88080 regulator"
+	depends on MFD_PV88080
 	help
 	  Say y here to support the buck convertors on PV88080
 
diff --git a/drivers/regulator/pv88080-regulator.c b/drivers/regulator/pv88080-regulator.c
index 954a20e..6dfccee 100644
--- a/drivers/regulator/pv88080-regulator.c
+++ b/drivers/regulator/pv88080-regulator.c
@@ -14,8 +14,8 @@
  */
 
 #include <linux/err.h>
-#include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/init.h>
 #include <linux/slab.h>
@@ -25,9 +25,8 @@
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/regulator/of_regulator.h>
-#include "pv88080-regulator.h"
 
-#define PV88080_MAX_REGULATORS	4
+#include <linux/mfd/pv88080.h>
 
 /* PV88080 REGULATOR IDs */
 enum {
@@ -38,11 +37,6 @@ enum {
 	PV88080_ID_HVBUCK,
 };
 
-enum pv88080_types {
-	TYPE_PV88080_AA,
-	TYPE_PV88080_BA,
-};
-
 struct pv88080_regulator {
 	struct regulator_desc desc;
 	/* Current limiting */
@@ -55,14 +49,6 @@ struct pv88080_regulator {
 	unsigned int conf5;
 };
 
-struct pv88080 {
-	struct device *dev;
-	struct regmap *regmap;
-	struct regulator_dev *rdev[PV88080_MAX_REGULATORS];
-	unsigned long type;
-	const struct pv88080_compatible_regmap *regmap_config;
-};
-
 struct pv88080_buck_voltage {
 	int min_uV;
 	int max_uV;
@@ -93,11 +79,14 @@ struct pv88080_compatible_regmap {
 	int hvbuck_vsel_mask;
 };
 
-static const struct regmap_config pv88080_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
+struct pv88080_regulators {
+	int	virq;
+	struct pv88080 *pv88080;
+	struct regulator_dev *rdev[PV88080_MAX_REGULATORS];
+	const struct pv88080_compatible_regmap *regmap_config;
 };
 
+
 /* Current limits array (in uA) for BUCK1, BUCK2, BUCK3.
  * Entry indexes corresponds to register values.
  */
@@ -211,16 +200,6 @@ struct pv88080_compatible_regmap {
 	.hvbuck_vsel_mask		  = PV88080_VHVBUCK_MASK,
 };
 
-#ifdef CONFIG_OF
-static const struct of_device_id pv88080_dt_ids[] = {
-	{ .compatible = "pvs,pv88080",    .data = (void *)TYPE_PV88080_AA },
-	{ .compatible = "pvs,pv88080-aa", .data = (void *)TYPE_PV88080_AA },
-	{ .compatible = "pvs,pv88080-ba", .data = (void *)TYPE_PV88080_BA },
-	{},
-};
-MODULE_DEVICE_TABLE(of, pv88080_dt_ids);
-#endif
-
 static unsigned int pv88080_buck_get_mode(struct regulator_dev *rdev)
 {
 	struct pv88080_regulator *info = rdev_get_drvdata(rdev);
@@ -374,7 +353,8 @@ static int pv88080_get_current_limit(struct regulator_dev *rdev)
 
 static irqreturn_t pv88080_irq_handler(int irq, void *data)
 {
-	struct pv88080 *chip = data;
+	struct pv88080_regulators *regulators = data;
+	struct pv88080 *chip = regulators->pv88080;
 	int i, reg_val, err, ret = IRQ_NONE;
 
 	err = regmap_read(chip->regmap, PV88080_REG_EVENT_A, &reg_val);
@@ -383,8 +363,9 @@ static irqreturn_t pv88080_irq_handler(int irq, void *data)
 
 	if (reg_val & PV88080_E_VDD_FLT) {
 		for (i = 0; i < PV88080_MAX_REGULATORS; i++) {
-			if (chip->rdev[i] != NULL) {
-				regulator_notifier_call_chain(chip->rdev[i],
+			if (regulators->rdev[i] != NULL) {
+				regulator_notifier_call_chain(
+					regulators->rdev[i],
 					REGULATOR_EVENT_UNDER_VOLTAGE,
 					NULL);
 			}
@@ -400,8 +381,9 @@ static irqreturn_t pv88080_irq_handler(int irq, void *data)
 
 	if (reg_val & PV88080_E_OVER_TEMP) {
 		for (i = 0; i < PV88080_MAX_REGULATORS; i++) {
-			if (chip->rdev[i] != NULL) {
-				regulator_notifier_call_chain(chip->rdev[i],
+			if (regulators->rdev[i] != NULL) {
+				regulator_notifier_call_chain(
+					regulators->rdev[i],
 					REGULATOR_EVENT_OVER_TEMP,
 					NULL);
 			}
@@ -425,101 +407,67 @@ static irqreturn_t pv88080_irq_handler(int irq, void *data)
 /*
  * I2C driver interface functions
  */
-static int pv88080_i2c_probe(struct i2c_client *i2c,
-		const struct i2c_device_id *id)
+static int pv88080_regulator_probe(struct platform_device *pdev)
 {
-	struct regulator_init_data *init_data = dev_get_platdata(&i2c->dev);
-	struct pv88080 *chip;
+	struct pv88080 *chip = dev_get_drvdata(pdev->dev.parent);
+	struct pv88080_pdata *pdata = dev_get_platdata(chip->dev);
+	struct pv88080_regulators *regulators;
 	const struct pv88080_compatible_regmap *regmap_config;
-	const struct of_device_id *match;
 	struct regulator_config config = { };
-	int i, error, ret;
+	int i, ret, irq;
 	unsigned int conf2, conf5;
 
-	chip = devm_kzalloc(&i2c->dev, sizeof(struct pv88080), GFP_KERNEL);
-	if (!chip)
+	regulators = devm_kzalloc(&pdev->dev,
+			sizeof(struct pv88080_regulators), GFP_KERNEL);
+	if (!regulators)
 		return -ENOMEM;
 
-	chip->dev = &i2c->dev;
-	chip->regmap = devm_regmap_init_i2c(i2c, &pv88080_regmap_config);
-	if (IS_ERR(chip->regmap)) {
-		error = PTR_ERR(chip->regmap);
-		dev_err(chip->dev, "Failed to allocate register map: %d\n",
-			error);
-		return error;
-	}
+	platform_set_drvdata(pdev, regulators);
 
-	if (i2c->dev.of_node) {
-		match = of_match_node(pv88080_dt_ids, i2c->dev.of_node);
-		if (!match) {
-			dev_err(chip->dev, "Failed to get of_match_node\n");
-			return -EINVAL;
-		}
-		chip->type = (unsigned long)match->data;
-	} else {
-		chip->type = id->driver_data;
+	irq = platform_get_irq_byname(pdev, "regulator-irq");
+	if (irq < 0) {
+		dev_err(&pdev->dev, "Failed to get IRQ.\n");
+		return irq;
 	}
 
-	i2c_set_clientdata(i2c, chip);
-
-	if (i2c->irq != 0) {
-		ret = regmap_write(chip->regmap, PV88080_REG_MASK_A, 0xFF);
-		if (ret < 0) {
-			dev_err(chip->dev,
-				"Failed to mask A reg: %d\n", ret);
-			return ret;
-		}
-		ret = regmap_write(chip->regmap, PV88080_REG_MASK_B, 0xFF);
-		if (ret < 0) {
-			dev_err(chip->dev,
-				"Failed to mask B reg: %d\n", ret);
-			return ret;
-		}
-		ret = regmap_write(chip->regmap, PV88080_REG_MASK_C, 0xFF);
-		if (ret < 0) {
-			dev_err(chip->dev,
-				"Failed to mask C reg: %d\n", ret);
-			return ret;
-		}
-
-		ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
-					pv88080_irq_handler,
-					IRQF_TRIGGER_LOW|IRQF_ONESHOT,
-					"pv88080", chip);
-		if (ret != 0) {
-			dev_err(chip->dev, "Failed to request IRQ: %d\n",
-				i2c->irq);
+	regulators->virq = regmap_irq_get_virq(chip->irq_data, irq);
+	if (regulators->virq >= 0) {
+		ret = devm_request_threaded_irq(&pdev->dev,
+				regulators->virq, NULL,
+				pv88080_irq_handler,
+				IRQF_TRIGGER_LOW|IRQF_ONESHOT,
+				"regulator-irq", regulators);
+		if (ret) {
+			dev_err(chip->dev, "Failed to request IRQ: %d\n", irq);
 			return ret;
 		}
+	}
 
-		ret = regmap_update_bits(chip->regmap, PV88080_REG_MASK_A,
-			PV88080_M_VDD_FLT | PV88080_M_OVER_TEMP, 0);
-		if (ret < 0) {
-			dev_err(chip->dev,
-				"Failed to update mask reg: %d\n", ret);
-			return ret;
-		}
-	} else {
-		dev_warn(chip->dev, "No IRQ configured\n");
+	ret = regmap_update_bits(chip->regmap, PV88080_REG_MASK_A,
+		PV88080_M_VDD_FLT | PV88080_M_OVER_TEMP, 0);
+	if (ret < 0) {
+		dev_err(chip->dev,
+			"Failed to update mask reg: %d\n", ret);
+		return ret;
 	}
 
 	switch (chip->type) {
 	case TYPE_PV88080_AA:
-		chip->regmap_config = &pv88080_aa_regs;
+		regulators->regmap_config = &pv88080_aa_regs;
 		break;
 	case TYPE_PV88080_BA:
-		chip->regmap_config = &pv88080_ba_regs;
+		regulators->regmap_config = &pv88080_ba_regs;
 		break;
 	}
 
-	regmap_config = chip->regmap_config;
+	regmap_config = regulators->regmap_config;
 	config.dev = chip->dev;
 	config.regmap = chip->regmap;
 
 	/* Registeration for BUCK1, 2, 3 */
 	for (i = 0; i < PV88080_MAX_REGULATORS-1; i++) {
-		if (init_data)
-			config.init_data = &init_data[i];
+		if (pdata && pdata->regulators)
+			config.init_data = pdata->regulators[i];
 
 		pv88080_regulator_info[i].limit_reg
 			= regmap_config->buck_regmap[i].buck_limit_reg;
@@ -564,12 +512,12 @@ static int pv88080_i2c_probe(struct i2c_client *i2c,
 			/(pv88080_regulator_info[i].desc.uV_step) + 1;
 
 		config.driver_data = (void *)&pv88080_regulator_info[i];
-		chip->rdev[i] = devm_regulator_register(chip->dev,
+		regulators->rdev[i] = devm_regulator_register(chip->dev,
 			&pv88080_regulator_info[i].desc, &config);
-		if (IS_ERR(chip->rdev[i])) {
+		if (IS_ERR(regulators->rdev[i])) {
 			dev_err(chip->dev,
 				"Failed to register PV88080 regulator\n");
-			return PTR_ERR(chip->rdev[i]);
+			return PTR_ERR(regulators->rdev[i]);
 		}
 	}
 
@@ -583,39 +531,47 @@ static int pv88080_i2c_probe(struct i2c_client *i2c,
 		= regmap_config->hvbuck_vsel_mask;
 
 	/* Registeration for HVBUCK */
-	if (init_data)
-		config.init_data = &init_data[PV88080_ID_HVBUCK];
+	if (pdata && pdata->regulators)
+		config.init_data = pdata->regulators[PV88080_ID_HVBUCK];
 
 	config.driver_data = (void *)&pv88080_regulator_info[PV88080_ID_HVBUCK];
-	chip->rdev[PV88080_ID_HVBUCK] = devm_regulator_register(chip->dev,
+	regulators->rdev[PV88080_ID_HVBUCK] = devm_regulator_register(chip->dev,
 		&pv88080_regulator_info[PV88080_ID_HVBUCK].desc, &config);
-	if (IS_ERR(chip->rdev[PV88080_ID_HVBUCK])) {
+	if (IS_ERR(regulators->rdev[PV88080_ID_HVBUCK])) {
 		dev_err(chip->dev, "Failed to register PV88080 regulator\n");
-		return PTR_ERR(chip->rdev[PV88080_ID_HVBUCK]);
+		return PTR_ERR(regulators->rdev[PV88080_ID_HVBUCK]);
 	}
 
 	return 0;
 }
 
-static const struct i2c_device_id pv88080_i2c_id[] = {
-	{ "pv88080",    TYPE_PV88080_AA },
-	{ "pv88080-aa", TYPE_PV88080_AA },
-	{ "pv88080-ba", TYPE_PV88080_BA },
-	{},
+static const struct platform_device_id pv88080_regulator_id_table[] = {
+	{ "pv88080-regulator", },
+	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(i2c, pv88080_i2c_id);
+MODULE_DEVICE_TABLE(platform, pv88080_regulator_id_table);
 
-static struct i2c_driver pv88080_regulator_driver = {
+static struct platform_driver pv88080_regulator_driver = {
 	.driver = {
-		.name = "pv88080",
-		.of_match_table = of_match_ptr(pv88080_dt_ids),
+		.name = "pv88080-regulator",
 	},
-	.probe = pv88080_i2c_probe,
-	.id_table = pv88080_i2c_id,
+	.probe = pv88080_regulator_probe,
+	.id_table = pv88080_regulator_id_table,
 };
 
-module_i2c_driver(pv88080_regulator_driver);
+static int __init pv88080_regulator_init(void)
+{
+	return platform_driver_register(&pv88080_regulator_driver);
+}
+subsys_initcall(pv88080_regulator_init);
+
+static void __exit pv88080_regulator_exit(void)
+{
+	platform_driver_unregister(&pv88080_regulator_driver);
+}
+module_exit(pv88080_regulator_exit);
 
-MODULE_AUTHOR("James Ban <James.Ban.opensource@diasemi.com>");
+MODULE_AUTHOR("Eric Jeong <eric.jeong.opensource@diasemi.com>");
 MODULE_DESCRIPTION("Regulator device driver for Powerventure PV88080");
 MODULE_LICENSE("GPL");
+
diff --git a/drivers/regulator/pv88080-regulator.h b/drivers/regulator/pv88080-regulator.h
deleted file mode 100644
index ae25ff3..0000000
--- a/drivers/regulator/pv88080-regulator.h
+++ /dev/null
@@ -1,118 +0,0 @@
-/*
- * pv88080-regulator.h - Regulator definitions for PV88080
- * Copyright (C) 2016 Powerventure Semiconductor Ltd.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; either version 2
- * of the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#ifndef __PV88080_REGISTERS_H__
-#define __PV88080_REGISTERS_H__
-
-/* System Control and Event Registers */
-#define	PV88080_REG_EVENT_A				0x04
-#define	PV88080_REG_MASK_A				0x09
-#define	PV88080_REG_MASK_B				0x0A
-#define	PV88080_REG_MASK_C				0x0B
-
-/* Regulator Registers - rev. AA */
-#define PV88080AA_REG_HVBUCK_CONF1		0x2D
-#define PV88080AA_REG_HVBUCK_CONF2		0x2E
-#define	PV88080AA_REG_BUCK1_CONF0		0x27
-#define	PV88080AA_REG_BUCK1_CONF1		0x28
-#define	PV88080AA_REG_BUCK1_CONF2		0x59
-#define	PV88080AA_REG_BUCK1_CONF5		0x5C
-#define	PV88080AA_REG_BUCK2_CONF0		0x29
-#define	PV88080AA_REG_BUCK2_CONF1		0x2A
-#define	PV88080AA_REG_BUCK2_CONF2		0x61
-#define	PV88080AA_REG_BUCK2_CONF5		0x64
-#define	PV88080AA_REG_BUCK3_CONF0		0x2B
-#define	PV88080AA_REG_BUCK3_CONF1		0x2C
-#define	PV88080AA_REG_BUCK3_CONF2		0x69
-#define	PV88080AA_REG_BUCK3_CONF5		0x6C
-
-/* Regulator Registers - rev. BA */
-#define	PV88080BA_REG_HVBUCK_CONF1		0x33
-#define	PV88080BA_REG_HVBUCK_CONF2		0x34
-#define	PV88080BA_REG_BUCK1_CONF0		0x2A
-#define	PV88080BA_REG_BUCK1_CONF1		0x2C
-#define	PV88080BA_REG_BUCK1_CONF2		0x5A
-#define	PV88080BA_REG_BUCK1_CONF5		0x5D
-#define	PV88080BA_REG_BUCK2_CONF0		0x2D
-#define	PV88080BA_REG_BUCK2_CONF1		0x2F
-#define	PV88080BA_REG_BUCK2_CONF2		0x63
-#define	PV88080BA_REG_BUCK2_CONF5		0x66
-#define	PV88080BA_REG_BUCK3_CONF0		0x30
-#define	PV88080BA_REG_BUCK3_CONF1		0x32
-#define	PV88080BA_REG_BUCK3_CONF2		0x6C
-#define	PV88080BA_REG_BUCK3_CONF5		0x6F
-
-/* PV88080_REG_EVENT_A (addr=0x04) */
-#define	PV88080_E_VDD_FLT				0x01
-#define	PV88080_E_OVER_TEMP				0x02
-
-/* PV88080_REG_MASK_A (addr=0x09) */
-#define	PV88080_M_VDD_FLT				0x01
-#define	PV88080_M_OVER_TEMP				0x02
-
-/* PV88080_REG_BUCK1_CONF0 (addr=0x27|0x2A) */
-#define	PV88080_BUCK1_EN				0x80
-#define PV88080_VBUCK1_MASK				0x7F
-
-/* PV88080_REG_BUCK2_CONF0 (addr=0x29|0x2D) */
-#define	PV88080_BUCK2_EN				0x80
-#define PV88080_VBUCK2_MASK				0x7F
-
-/* PV88080_REG_BUCK3_CONF0 (addr=0x2B|0x30) */
-#define	PV88080_BUCK3_EN				0x80
-#define PV88080_VBUCK3_MASK				0x7F
-
-/* PV88080_REG_BUCK1_CONF1 (addr=0x28|0x2C) */
-#define PV88080_BUCK1_ILIM_SHIFT		2
-#define PV88080_BUCK1_ILIM_MASK			0x0C
-#define PV88080_BUCK1_MODE_MASK			0x03
-
-/* PV88080_REG_BUCK2_CONF1 (addr=0x2A|0x2F) */
-#define PV88080_BUCK2_ILIM_SHIFT		2
-#define PV88080_BUCK2_ILIM_MASK			0x0C
-#define PV88080_BUCK2_MODE_MASK			0x03
-
-/* PV88080_REG_BUCK3_CONF1 (addr=0x2C|0x32) */
-#define PV88080_BUCK3_ILIM_SHIFT		2
-#define PV88080_BUCK3_ILIM_MASK			0x0C
-#define PV88080_BUCK3_MODE_MASK			0x03
-
-#define	PV88080_BUCK_MODE_SLEEP			0x00
-#define	PV88080_BUCK_MODE_AUTO			0x01
-#define	PV88080_BUCK_MODE_SYNC			0x02
-
-/* PV88080_REG_HVBUCK_CONF1 (addr=0x2D|0x33) */
-#define PV88080_VHVBUCK_MASK			0xFF
-
-/* PV88080_REG_HVBUCK_CONF1 (addr=0x2E|0x34) */
-#define PV88080_HVBUCK_EN				0x01
-
-/* PV88080_REG_BUCK2_CONF2 (addr=0x61|0x63) */
-/* PV88080_REG_BUCK3_CONF2 (addr=0x69|0x6C) */
-#define PV88080_BUCK_VDAC_RANGE_SHIFT	7
-#define PV88080_BUCK_VDAC_RANGE_MASK	0x01
-
-#define PV88080_BUCK_VDAC_RANGE_1		0x00
-#define PV88080_BUCK_VDAC_RANGE_2		0x01
-
-/* PV88080_REG_BUCK2_CONF5 (addr=0x64|0x66) */
-/* PV88080_REG_BUCK3_CONF5 (addr=0x6C|0x6F) */
-#define PV88080_BUCK_VRANGE_GAIN_SHIFT	0
-#define PV88080_BUCK_VRANGE_GAIN_MASK	0x01
-
-#define PV88080_BUCK_VRANGE_GAIN_1		0x00
-#define PV88080_BUCK_VRANGE_GAIN_2		0x01
-
-#endif	/* __PV88080_REGISTERS_H__ */
diff --git a/include/linux/mfd/pv88080.h b/include/linux/mfd/pv88080.h
new file mode 100644
index 0000000..479b3eb
--- /dev/null
+++ b/include/linux/mfd/pv88080.h
@@ -0,0 +1,236 @@
+/*
+ * pv88080.h - Declarations for PV88080.
+ * Copyright (C) 2016 Powerventure Semiconductor Ltd.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __PV88080_H__
+#define __PV88080_H__
+
+#include <linux/regulator/machine.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+
+/* System Control and Event Registers */
+#define PV88080_REG_STATUS_A			0x01
+#define PV88080_REG_EVENT_A				0x04
+#define PV88080_REG_MASK_A				0x09
+#define PV88080_REG_MASK_B				0x0A
+#define PV88080_REG_MASK_C				0x0B
+
+/* GPIO Registers - rev. AA */
+#define PV88080AA_REG_GPIO_INPUT		0x18
+#define PV88080AA_REG_GPIO_GPIO0		0x1A
+
+/* Regulator Registers - rev. AA */
+#define PV88080AA_REG_HVBUCK_CONF1		0x2D
+#define PV88080AA_REG_HVBUCK_CONF2		0x2E
+#define PV88080AA_REG_BUCK1_CONF0		0x27
+#define PV88080AA_REG_BUCK1_CONF1		0x28
+#define PV88080AA_REG_BUCK1_CONF2		0x59
+#define PV88080AA_REG_BUCK1_CONF5		0x5C
+#define PV88080AA_REG_BUCK2_CONF0		0x29
+#define PV88080AA_REG_BUCK2_CONF1		0x2A
+#define PV88080AA_REG_BUCK2_CONF2		0x61
+#define PV88080AA_REG_BUCK2_CONF5		0x64
+#define PV88080AA_REG_BUCK3_CONF0		0x2B
+#define PV88080AA_REG_BUCK3_CONF1		0x2C
+#define PV88080AA_REG_BUCK3_CONF2		0x69
+#define PV88080AA_REG_BUCK3_CONF5		0x6C
+
+/* GPIO Registers - rev. AA */
+#define PV88080BA_REG_GPIO_INPUT		0x17
+#define PV88080BA_REG_GPIO_GPIO0		0x19
+
+/* Regulator Registers - rev. BA */
+#define PV88080BA_REG_HVBUCK_CONF1		0x33
+#define PV88080BA_REG_HVBUCK_CONF2		0x34
+#define PV88080BA_REG_BUCK1_CONF0		0x2A
+#define PV88080BA_REG_BUCK1_CONF1		0x2C
+#define PV88080BA_REG_BUCK1_CONF2		0x5A
+#define PV88080BA_REG_BUCK1_CONF5		0x5D
+#define PV88080BA_REG_BUCK2_CONF0		0x2D
+#define PV88080BA_REG_BUCK2_CONF1		0x2F
+#define PV88080BA_REG_BUCK2_CONF2		0x63
+#define PV88080BA_REG_BUCK2_CONF5		0x66
+#define PV88080BA_REG_BUCK3_CONF0		0x30
+#define PV88080BA_REG_BUCK3_CONF1		0x32
+#define PV88080BA_REG_BUCK3_CONF2		0x6C
+#define PV88080BA_REG_BUCK3_CONF5		0x6F
+
+/* PV88080_REG_EVENT_A (addr=0x04) */
+#define PV88080_E_VDD_FLT				0x01
+#define PV88080_E_OVER_TEMP				0x02
+#define PV88080_E_SEQ_RDY				0x04
+#define PV88080_E_EXT_OT				0x08
+
+/* PV88080_REG_MASK_A (addr=0x09) */
+#define PV88080_M_VDD_FLT				0x01
+#define PV88080_M_OVER_TEMP				0x02
+#define PV88080_M_SEQ_RDY				0x04
+#define PV88080_M_EXT_OT				0x08
+
+/* PV88080_REG_EVENT_B (addr=0x05) */
+#define PV88080_E_HVBUCK_OV				0x01
+#define PV88080_E_HVBUCK_UV				0x02
+#define PV88080_E_HVBUCK_SCP			0x04
+#define PV88080_E_BUCK1_SCP				0x08
+#define PV88080_E_BUCK2_SCP				0x10
+#define PV88080_E_BUCK3_SCP				0x20
+
+/* PV88080_REG_MASK_B (addr=0x0A) */
+#define PV88080_M_HVBUCK_OV				0x01
+#define PV88080_M_HVBUCK_UV				0x02
+#define PV88080_M_HVBUCK_SCP			0x04
+#define PV88080_M_BUCK1_SCP				0x08
+#define PV88080_M_BUCK2_SCP				0x10
+#define PV88080_M_BUCK3_SCP				0x20
+
+/* PV88080_REG_EVENT_C (addr=0x06) */
+#define PV88080_E_GPIO_FLAG0			0x01
+#define PV88080_E_GPIO_FLAG1			0x02
+#define PV88080_E_BUCK1_DROP_TIMEOUT	0x08
+#define PV88080_E_BUCK2_DROP_TIMEOUT	0x10
+#define PV88080_E_BUCk3_DROP_TIMEOUT	0x20
+
+/* PV88080_REG_MASK_C (addr=0x0B) */
+#define PV88080_M_GPIO_FLAG0			0x01
+#define PV88080_M_GPIO_FLAG1			0x02
+#define PV88080_M_BUCK1_DROP_TIMEOUT	0x08
+#define PV88080_M_BUCK2_DROP_TIMEOUT	0x10
+#define PV88080_M_BUCk3_DROP_TIMEOUT	0x20
+
+/* PV88080xx_REG_GPIO_INPUT (addr=0x18|0x17) */
+#define PV88080_GPIO_INPUT_MASK			0x01
+
+/* PV88080xx_REG_GPIO_GPIO0 (addr=0x1A|0x19) */
+#define PV88080_GPIO_DIRECTION_MASK		0x01
+#define PV88080_GPIO_OUTPUT_MASK		0x0C
+#define PV88080_GPIO_OUTPUT_EN			0x04
+#define PV88080_GPIO_OUTPUT_DIS			0x08
+
+/* PV88080_REG_BUCK1_CONF0 (addr=0x27|0x2A) */
+#define PV88080_BUCK1_EN				0x80
+#define PV88080_VBUCK1_MASK				0x7F
+
+/* PV88080_REG_BUCK2_CONF0 (addr=0x29|0x2D) */
+#define PV88080_BUCK2_EN				0x80
+#define PV88080_VBUCK2_MASK				0x7F
+
+/* PV88080_REG_BUCK3_CONF0 (addr=0x2B|0x30) */
+#define PV88080_BUCK3_EN				0x80
+#define PV88080_VBUCK3_MASK				0x7F
+
+/* PV88080_REG_BUCK1_CONF1 (addr=0x28|0x2C) */
+#define PV88080_BUCK1_ILIM_SHIFT		2
+#define PV88080_BUCK1_ILIM_MASK			0x0C
+#define PV88080_BUCK1_MODE_MASK			0x03
+
+/* PV88080_REG_BUCK2_CONF1 (addr=0x2A|0x2F) */
+#define PV88080_BUCK2_ILIM_SHIFT		2
+#define PV88080_BUCK2_ILIM_MASK			0x0C
+#define PV88080_BUCK2_MODE_MASK			0x03
+
+/* PV88080_REG_BUCK3_CONF1 (addr=0x2C|0x32) */
+#define PV88080_BUCK3_ILIM_SHIFT		2
+#define PV88080_BUCK3_ILIM_MASK			0x0C
+#define PV88080_BUCK3_MODE_MASK			0x03
+
+#define PV88080_BUCK_MODE_SLEEP			0x00
+#define PV88080_BUCK_MODE_AUTO			0x01
+#define PV88080_BUCK_MODE_SYNC			0x02
+
+/* PV88080_REG_HVBUCK_CONF1 (addr=0x2D|0x33) */
+#define PV88080_VHVBUCK_MASK			0xFF
+
+/* PV88080_REG_HVBUCK_CONF1 (addr=0x2E|0x34) */
+#define PV88080_HVBUCK_EN				0x01
+
+/* PV88080_REG_BUCK2_CONF2 (addr=0x61|0x63) */
+/* PV88080_REG_BUCK3_CONF2 (addr=0x69|0x6C) */
+#define PV88080_BUCK_VDAC_RANGE_SHIFT	7
+#define PV88080_BUCK_VDAC_RANGE_MASK	0x01
+
+#define PV88080_BUCK_VDAC_RANGE_1		0x00
+#define PV88080_BUCK_VDAC_RANGE_2		0x01
+
+/* PV88080_REG_BUCK2_CONF5 (addr=0x64|0x66) */
+/* PV88080_REG_BUCK3_CONF5 (addr=0x6C|0x6F) */
+#define PV88080_BUCK_VRANGE_GAIN_SHIFT	0
+#define PV88080_BUCK_VRANGE_GAIN_MASK	0x01
+
+#define PV88080_BUCK_VRANGE_GAIN_1		0x00
+#define PV88080_BUCK_VRANGE_GAIN_2		0x01
+
+#define PV88080_MAX_REGULATORS			4
+
+enum pv88080_types {
+	TYPE_PV88080_AA,
+	TYPE_PV88080_BA,
+};
+
+/* Interrupts */
+enum pv88080_aa_irqs {
+	PV88080_AA_IRQ_VDD_FLT,
+	PV88080_AA_IRQ_OVER_TEMP,
+	PV88080_AA_IRQ_SEQ_RDY,
+	PV88080_AA_IRQ_HVBUCK_OV,
+	PV88080_AA_IRQ_HVBUCK_UV,
+	PV88080_AA_IRQ_HVBUCK_SCP,
+	PV88080_AA_IRQ_BUCK1_SCP,
+	PV88080_AA_IRQ_BUCK2_SCP,
+	PV88080_AA_IRQ_BUCK3_SCP,
+	PV88080_AA_IRQ_GPIO_FLAG0,
+	PV88080_AA_IRQ_GPIO_FLAG1,
+};
+
+enum pv88080_ba_irqs {
+	PV88080_BA_IRQ_VDD_FLT,
+	PV88080_BA_IRQ_OVER_TEMP,
+	PV88080_BA_IRQ_SEQ_RDY,
+	PV88080_BA_IRQ_EXT_OT,
+	PV88080_BA_IRQ_HVBUCK_OV,
+	PV88080_BA_IRQ_HVBUCK_UV,
+	PV88080_BA_IRQ_HVBUCK_SCP,
+	PV88080_BA_IRQ_BUCK1_SCP,
+	PV88080_BA_IRQ_BUCK2_SCP,
+	PV88080_BA_IRQ_BUCK3_SCP,
+	PV88080_BA_IRQ_GPIO_FLAG0,
+	PV88080_BA_IRQ_GPIO_FLAG1,
+	PV88080_BA_IRQ_BUCK1_DROP_TIMEOUT,
+	PV88080_BA_IRQ_BUCK2_DROP_TIMEOUT,
+	PB88080_BA_IRQ_BUCK3_DROP_TIMEOUT,
+};
+
+struct pv88080 {
+	struct device *dev;
+	struct regmap *regmap;
+	unsigned long type;
+
+	/* IRQ Data */
+	int irq;
+	int irq_base;
+	struct regmap_irq_chip_data *irq_data;
+};
+
+struct pv88080_pdata {
+	int (*init)(struct pv88080 *pv88080);
+	int irq_base;
+	int gpio_base;
+	struct regulator_init_data *regulators[PV88080_MAX_REGULATORS];
+};
+
+int pv88080_device_init(struct pv88080 *chip, unsigned int irq);
+int pv88080_device_exit(struct pv88080 *chip);
+
+#endif	/* __PV88080_H__ */
+
-- 
end-of-patch for PATCH V1
