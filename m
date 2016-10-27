From: Eric Jeong <eric.jeong.opensource@diasemi.com>
Subject: [PATCH V2 2/4] mfd: pv88080: MFD core support
Date: Thu, 27 Oct 2016 10:03:14 +0900
Message-ID: <6dcaf788e4ebffd5c753e5fc5ae67668f74f7c32.1477530195.git.eric.jeong@diasemi.com>
References: <cover.1477530195.git.eric.jeong@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1477530195.git.eric.jeong@diasemi.com>
Sender: linux-gpio-owner@vger.kernel.org
To: LINUX-KERNEL <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-GPIO <linux-gpio@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org


From: Eric Jeong <eric.jeong.opensource@diasemi.com> 
 
This patch adds supports for PV88080 MFD core device.

It provides communication through the I2C interface.
It contains the following components:
    - Regulators
    - Configurable GPIOs
 
Kconfig and Makefile are updated to reflect support for PV88080 PMIC. 

Signed-off-by: Eric Jeong <eric.jeong.opensource@diasemi.com> 

---
This patch applies against linux-next and next-20161026 
 
Hi, 

This patch adds MFD core driver for PV88080 PMIC.
This is done as part of the existing PV88080 regulator driver by expending
the driver for GPIO function support.

Change since PATCH V1
 - Patch separated from PATCH V1

Regards,
Eric Jeong, Dialog Semiconductor Ltd.


 drivers/mfd/Kconfig         |   12 ++
 drivers/mfd/Makefile        |    2 +
 drivers/mfd/pv88080-core.c  |  270 +++++++++++++++++++++++++++++++++++++++++++
 drivers/mfd/pv88080-i2c.c   |   99 ++++++++++++++++
 include/linux/mfd/pv88080.h |  236 +++++++++++++++++++++++++++++++++++++
 5 files changed, 619 insertions(+)
 create mode 100644 drivers/mfd/pv88080-core.c
 create mode 100644 drivers/mfd/pv88080-i2c.c
 create mode 100644 include/linux/mfd/pv88080.h

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
diff --git a/include/linux/mfd/pv88080.h b/include/linux/mfd/pv88080.h
new file mode 100644
index 0000000..505ce63
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
+/* GPIO Registers - rev. BA */
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
end-of-patch for PATCH V2

