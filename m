From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v6 3/5] mfd: tps65912: Add driver for the TPS65912 PMIC
Date: Fri, 30 Oct 2015 17:28:06 -0500
Message-ID: <1446244088-28281-4-git-send-email-afd@ti.com>
References: <1446244088-28281-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446244088-28281-1-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for TPS65912 PMIC MFD core. It provides
communication through the I2C and SPI interfaces. It contains
the following components:

 - Regulators
 - GPIO controller

Signed-off-by: Andrew F. Davis <afd@ti.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/Kconfig          |  26 ++++
 drivers/mfd/Makefile         |   3 +
 drivers/mfd/tps65912-core.c  | 122 +++++++++++++++
 drivers/mfd/tps65912-i2c.c   |  81 ++++++++++
 drivers/mfd/tps65912-spi.c   |  80 ++++++++++
 include/linux/mfd/tps65912.h | 345 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 657 insertions(+)
 create mode 100644 drivers/mfd/tps65912-core.c
 create mode 100644 drivers/mfd/tps65912-i2c.c
 create mode 100644 drivers/mfd/tps65912-spi.c
 create mode 100644 include/linux/mfd/tps65912.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 9a8df8e..1398340 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1167,6 +1167,32 @@ config MFD_TPS65910
 	  if you say yes here you get support for the TPS65910 series of
 	  Power Management chips.
 
+config MFD_TPS65912
+	tristate
+	select MFD_CORE
+	select REGMAP
+	select REGMAP_IRQ
+
+config MFD_TPS65912_I2C
+	tristate "TI TPS65912 Power Management chip with I2C"
+	select MFD_TPS65912
+	select REGMAP_I2C
+	depends on I2C
+	depends on OF || COMPILE_TEST
+	help
+	  If you say yes here you get support for the TPS65912 series of
+	  PM chips with I2C interface.
+
+config MFD_TPS65912_SPI
+	tristate "TI TPS65912 Power Management chip with SPI"
+	select MFD_TPS65912
+	select REGMAP_SPI
+	depends on SPI_MASTER
+	depends on OF || COMPILE_TEST
+	help
+	  If you say yes here you get support for the TPS65912 series of
+	  PM chips with SPI interface.
+
 config MFD_TPS80031
 	bool "TI TPS80031/TPS80032 Power Management chips"
 	depends on I2C=y
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 004aa76..49c3530 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -69,6 +69,9 @@ obj-$(CONFIG_TPS6507X)		+= tps6507x.o
 obj-$(CONFIG_MFD_TPS65217)	+= tps65217.o
 obj-$(CONFIG_MFD_TPS65218)	+= tps65218.o
 obj-$(CONFIG_MFD_TPS65910)	+= tps65910.o
+obj-$(CONFIG_MFD_TPS65912)	+= tps65912-core.o
+obj-$(CONFIG_MFD_TPS65912_I2C)	+= tps65912-i2c.o
+obj-$(CONFIG_MFD_TPS65912_SPI)  += tps65912-spi.o
 obj-$(CONFIG_MFD_TPS80031)	+= tps80031.o
 obj-$(CONFIG_MENELAUS)		+= menelaus.o
 
diff --git a/drivers/mfd/tps65912-core.c b/drivers/mfd/tps65912-core.c
new file mode 100644
index 0000000..93a382e
--- /dev/null
+++ b/drivers/mfd/tps65912-core.c
@@ -0,0 +1,122 @@
+/*
+ * Core functions for TI TPS65912x PMIC
+ *
+ * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Author: Andrew F. Davis <afd@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether expressed or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License version 2 for more details.
+ *
+ * Based on the TPS65218 driver and the previous TPS65912 driver by
+ * Margarita Olaya Cabrera <magi@slimlogic.co.uk>
+ */
+
+#include <linux/interrupt.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+
+#include <linux/mfd/tps65912.h>
+
+static const struct mfd_cell tps65912_cells[] = {
+	{
+		.name = "tps65912-regulator",
+		.of_compatible = "ti,tps65912-regulator",
+	},
+	{
+		.name = "tps65912-gpio",
+		.of_compatible = "ti,tps65912-gpio",
+	},
+};
+
+static const struct regmap_irq tps65912_irqs[] = {
+	/* INT_STS IRQs */
+	REGMAP_IRQ_REG(TPS65912_IRQ_PWRHOLD_F, 0, TPS65912_INT_STS_PWRHOLD_F),
+	REGMAP_IRQ_REG(TPS65912_IRQ_VMON, 0, TPS65912_INT_STS_VMON),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PWRON, 0, TPS65912_INT_STS_PWRON),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PWRON_LP, 0, TPS65912_INT_STS_PWRON_LP),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PWRHOLD_R, 0, TPS65912_INT_STS_PWRHOLD_R),
+	REGMAP_IRQ_REG(TPS65912_IRQ_HOTDIE, 0, TPS65912_INT_STS_HOTDIE),
+	REGMAP_IRQ_REG(TPS65912_IRQ_GPIO1_R, 0, TPS65912_INT_STS_GPIO1_R),
+	REGMAP_IRQ_REG(TPS65912_IRQ_GPIO1_F, 0, TPS65912_INT_STS_GPIO1_F),
+	/* INT_STS2 IRQs */
+	REGMAP_IRQ_REG(TPS65912_IRQ_GPIO2_R, 1, TPS65912_INT_STS2_GPIO2_R),
+	REGMAP_IRQ_REG(TPS65912_IRQ_GPIO2_F, 1, TPS65912_INT_STS2_GPIO2_F),
+	REGMAP_IRQ_REG(TPS65912_IRQ_GPIO3_R, 1, TPS65912_INT_STS2_GPIO3_R),
+	REGMAP_IRQ_REG(TPS65912_IRQ_GPIO3_F, 1, TPS65912_INT_STS2_GPIO3_F),
+	REGMAP_IRQ_REG(TPS65912_IRQ_GPIO4_R, 1, TPS65912_INT_STS2_GPIO4_R),
+	REGMAP_IRQ_REG(TPS65912_IRQ_GPIO4_F, 1, TPS65912_INT_STS2_GPIO4_F),
+	REGMAP_IRQ_REG(TPS65912_IRQ_GPIO5_R, 1, TPS65912_INT_STS2_GPIO5_R),
+	REGMAP_IRQ_REG(TPS65912_IRQ_GPIO5_F, 1, TPS65912_INT_STS2_GPIO5_F),
+	/* INT_STS3 IRQs */
+	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_DCDC1, 2, TPS65912_INT_STS3_PGOOD_DCDC1),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_DCDC2, 2, TPS65912_INT_STS3_PGOOD_DCDC2),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_DCDC3, 2, TPS65912_INT_STS3_PGOOD_DCDC3),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_DCDC4, 2, TPS65912_INT_STS3_PGOOD_DCDC4),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_LDO1, 2, TPS65912_INT_STS3_PGOOD_LDO1),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_LDO2, 2, TPS65912_INT_STS3_PGOOD_LDO2),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_LDO3, 2, TPS65912_INT_STS3_PGOOD_LDO3),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_LDO4, 2, TPS65912_INT_STS3_PGOOD_LDO4),
+	/* INT_STS4 IRQs */
+	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_LDO5, 3, TPS65912_INT_STS4_PGOOD_LDO5),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_LDO6, 3, TPS65912_INT_STS4_PGOOD_LDO6),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_LDO7, 3, TPS65912_INT_STS4_PGOOD_LDO7),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_LDO8, 3, TPS65912_INT_STS4_PGOOD_LDO8),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_LDO9, 3, TPS65912_INT_STS4_PGOOD_LDO9),
+	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_LDO10, 3, TPS65912_INT_STS4_PGOOD_LDO10),
+};
+
+static struct regmap_irq_chip tps65912_irq_chip = {
+	.name = "tps65912",
+	.irqs = tps65912_irqs,
+	.num_irqs = ARRAY_SIZE(tps65912_irqs),
+	.num_regs = 4,
+	.irq_reg_stride = 2,
+	.mask_base = TPS65912_INT_MSK,
+	.status_base = TPS65912_INT_STS,
+	.ack_base = TPS65912_INT_STS,
+	.init_ack_masked = true,
+};
+
+int tps65912_device_init(struct tps65912 *tps)
+{
+	int ret;
+
+	ret = regmap_add_irq_chip(tps->regmap, tps->irq, IRQF_ONESHOT, 0,
+				  &tps65912_irq_chip, &tps->irq_data);
+	if (ret < 0)
+		return ret;
+
+	ret = mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO, tps65912_cells,
+			      ARRAY_SIZE(tps65912_cells), NULL, 0,
+			      regmap_irq_get_domain(tps->irq_data));
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	regmap_del_irq_chip(tps->irq, tps->irq_data);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tps65912_device_init);
+
+int tps65912_device_exit(struct tps65912 *tps)
+{
+	regmap_del_irq_chip(tps->irq, tps->irq_data);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tps65912_device_exit);
+
+MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
+MODULE_DESCRIPTION("TPS65912x MFD Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/mfd/tps65912-i2c.c b/drivers/mfd/tps65912-i2c.c
new file mode 100644
index 0000000..5808a44
--- /dev/null
+++ b/drivers/mfd/tps65912-i2c.c
@@ -0,0 +1,81 @@
+/*
+ * I2C access driver for TI TPS65912x PMIC
+ *
+ * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Author: Andrew F. Davis <afd@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether expressed or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License version 2 for more details.
+ *
+ * Based on the TPS65218 driver and the previous TPS65912 driver by
+ * Margarita Olaya Cabrera <magi@slimlogic.co.uk>
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/tps65912.h>
+
+static const struct of_device_id tps65912_i2c_of_match_table[] = {
+	{ .compatible = "ti,tps65912", },
+	{ /* sentinel */ }
+};
+
+static int tps65912_i2c_probe(struct i2c_client *client,
+			      const struct i2c_device_id *ids)
+{
+	struct tps65912 *tps;
+
+	tps = devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
+	if (!tps)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, tps);
+	tps->dev = &client->dev;
+	tps->irq = client->irq;
+
+	tps->regmap = devm_regmap_init_i2c(client, &tps65912_regmap_config);
+	if (IS_ERR(tps->regmap)) {
+		dev_err(tps->dev, "Failed to initialize register map\n");
+		return PTR_ERR(tps->regmap);
+	}
+
+	return tps65912_device_init(tps);
+}
+
+static int tps65912_i2c_remove(struct i2c_client *client)
+{
+	struct tps65912 *tps = i2c_get_clientdata(client);
+
+	return tps65912_device_exit(tps);
+}
+
+static const struct i2c_device_id tps65912_i2c_id_table[] = {
+	{ "tps65912", 0 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, tps65912_i2c_id_table);
+
+static struct i2c_driver tps65912_i2c_driver = {
+	.driver		= {
+		.name	= "tps65912",
+		.of_match_table = tps65912_i2c_of_match_table,
+	},
+	.probe		= tps65912_i2c_probe,
+	.remove		= tps65912_i2c_remove,
+	.id_table       = tps65912_i2c_id_table,
+};
+module_i2c_driver(tps65912_i2c_driver);
+
+MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
+MODULE_DESCRIPTION("TPS65912x I2C Interface Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/mfd/tps65912-spi.c b/drivers/mfd/tps65912-spi.c
new file mode 100644
index 0000000..563cc64
--- /dev/null
+++ b/drivers/mfd/tps65912-spi.c
@@ -0,0 +1,80 @@
+/*
+ * SPI access driver for TI TPS65912x PMIC
+ *
+ * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Author: Andrew F. Davis <afd@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether expressed or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License version 2 for more details.
+ *
+ * Based on the TPS65218 driver and the previous TPS65912 driver by
+ * Margarita Olaya Cabrera <magi@slimlogic.co.uk>
+ */
+
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/spi/spi.h>
+
+#include <linux/mfd/tps65912.h>
+
+static const struct of_device_id tps65912_spi_of_match_table[] = {
+	{ .compatible = "ti,tps65912", },
+	{ /* sentinel */ }
+};
+
+static int tps65912_spi_probe(struct spi_device *spi)
+{
+	struct tps65912 *tps;
+
+	tps = devm_kzalloc(&spi->dev, sizeof(*tps), GFP_KERNEL);
+	if (!tps)
+		return -ENOMEM;
+
+	spi_set_drvdata(spi, tps);
+	tps->dev = &spi->dev;
+	tps->irq = spi->irq;
+
+	tps->regmap = devm_regmap_init_spi(spi, &tps65912_regmap_config);
+	if (IS_ERR(tps->regmap)) {
+		dev_err(tps->dev, "Failed to initialize register map\n");
+		return PTR_ERR(tps->regmap);
+	}
+
+	return tps65912_device_init(tps);
+}
+
+static int tps65912_spi_remove(struct spi_device *client)
+{
+	struct tps65912 *tps = spi_get_drvdata(client);
+
+	return tps65912_device_exit(tps);
+}
+
+static const struct spi_device_id tps65912_spi_id_table[] = {
+	{ "tps65912", 0 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, tps65912_spi_id_table);
+
+static struct spi_driver tps65912_spi_driver = {
+	.driver		= {
+		.name	= "tps65912",
+		.of_match_table = tps65912_spi_of_match_table,
+	},
+	.probe		= tps65912_spi_probe,
+	.remove		= tps65912_spi_remove,
+	.id_table       = tps65912_spi_id_table,
+};
+module_spi_driver(tps65912_spi_driver);
+
+MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
+MODULE_DESCRIPTION("TPS65912x SPI Interface Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mfd/tps65912.h b/include/linux/mfd/tps65912.h
new file mode 100644
index 0000000..8843c0d
--- /dev/null
+++ b/include/linux/mfd/tps65912.h
@@ -0,0 +1,345 @@
+/*
+ * TI TPS65912x
+ *
+ * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Author: Andrew F. Davis <afd@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether expressed or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License version 2 for more details.
+ *
+ * Based on the TPS65218 driver and the previous TPS65912 driver by
+ * Margarita Olaya Cabrera <magi@slimlogic.co.uk>
+ */
+
+#ifndef __LINUX_MFD_TPS65912_H
+#define __LINUX_MFD_TPS65912_H
+
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+
+/* List of registers for TPS65912 */
+#define TPS65912_DCDC1_CTRL		0x00
+#define TPS65912_DCDC2_CTRL		0x01
+#define TPS65912_DCDC3_CTRL		0x02
+#define TPS65912_DCDC4_CTRL		0x03
+#define TPS65912_DCDC1_OP		0x04
+#define TPS65912_DCDC1_AVS		0x05
+#define TPS65912_DCDC1_LIMIT		0x06
+#define TPS65912_DCDC2_OP		0x07
+#define TPS65912_DCDC2_AVS		0x08
+#define TPS65912_DCDC2_LIMIT		0x09
+#define TPS65912_DCDC3_OP		0x0A
+#define TPS65912_DCDC3_AVS		0x0B
+#define TPS65912_DCDC3_LIMIT		0x0C
+#define TPS65912_DCDC4_OP		0x0D
+#define TPS65912_DCDC4_AVS		0x0E
+#define TPS65912_DCDC4_LIMIT		0x0F
+#define TPS65912_LDO1_OP		0x10
+#define TPS65912_LDO1_AVS		0x11
+#define TPS65912_LDO1_LIMIT		0x12
+#define TPS65912_LDO2_OP		0x13
+#define TPS65912_LDO2_AVS		0x14
+#define TPS65912_LDO2_LIMIT		0x15
+#define TPS65912_LDO3_OP		0x16
+#define TPS65912_LDO3_AVS		0x17
+#define TPS65912_LDO3_LIMIT		0x18
+#define TPS65912_LDO4_OP		0x19
+#define TPS65912_LDO4_AVS		0x1A
+#define TPS65912_LDO4_LIMIT		0x1B
+#define TPS65912_LDO5			0x1C
+#define TPS65912_LDO6			0x1D
+#define TPS65912_LDO7			0x1E
+#define TPS65912_LDO8			0x1F
+#define TPS65912_LDO9			0x20
+#define TPS65912_LDO10			0x21
+#define TPS65912_THRM			0x22
+#define TPS65912_CLK32OUT		0x23
+#define TPS65912_DEVCTRL		0x24
+#define TPS65912_DEVCTRL2		0x25
+#define TPS65912_I2C_SPI_CFG		0x26
+#define TPS65912_KEEP_ON		0x27
+#define TPS65912_KEEP_ON2		0x28
+#define TPS65912_SET_OFF1		0x29
+#define TPS65912_SET_OFF2		0x2A
+#define TPS65912_DEF_VOLT		0x2B
+#define TPS65912_DEF_VOLT_MAPPING	0x2C
+#define TPS65912_DISCHARGE		0x2D
+#define TPS65912_DISCHARGE2		0x2E
+#define TPS65912_EN1_SET1		0x2F
+#define TPS65912_EN1_SET2		0x30
+#define TPS65912_EN2_SET1		0x31
+#define TPS65912_EN2_SET2		0x32
+#define TPS65912_EN3_SET1		0x33
+#define TPS65912_EN3_SET2		0x34
+#define TPS65912_EN4_SET1		0x35
+#define TPS65912_EN4_SET2		0x36
+#define TPS65912_PGOOD			0x37
+#define TPS65912_PGOOD2			0x38
+#define TPS65912_INT_STS		0x39
+#define TPS65912_INT_MSK		0x3A
+#define TPS65912_INT_STS2		0x3B
+#define TPS65912_INT_MSK2		0x3C
+#define TPS65912_INT_STS3		0x3D
+#define TPS65912_INT_MSK3		0x3E
+#define TPS65912_INT_STS4		0x3F
+#define TPS65912_INT_MSK4		0x40
+#define TPS65912_GPIO1			0x41
+#define TPS65912_GPIO2			0x42
+#define TPS65912_GPIO3			0x43
+#define TPS65912_GPIO4			0x44
+#define TPS65912_GPIO5			0x45
+#define TPS65912_VMON			0x46
+#define TPS65912_LEDA_CTRL1		0x47
+#define TPS65912_LEDA_CTRL2		0x48
+#define TPS65912_LEDA_CTRL3		0x49
+#define TPS65912_LEDA_CTRL4		0x4A
+#define TPS65912_LEDA_CTRL5		0x4B
+#define TPS65912_LEDA_CTRL6		0x4C
+#define TPS65912_LEDA_CTRL7		0x4D
+#define TPS65912_LEDA_CTRL8		0x4E
+#define TPS65912_LEDB_CTRL1		0x4F
+#define TPS65912_LEDB_CTRL2		0x50
+#define TPS65912_LEDB_CTRL3		0x51
+#define TPS65912_LEDB_CTRL4		0x52
+#define TPS65912_LEDB_CTRL5		0x53
+#define TPS65912_LEDB_CTRL6		0x54
+#define TPS65912_LEDB_CTRL7		0x55
+#define TPS65912_LEDB_CTRL8		0x56
+#define TPS65912_LEDC_CTRL1		0x57
+#define TPS65912_LEDC_CTRL2		0x58
+#define TPS65912_LEDC_CTRL3		0x59
+#define TPS65912_LEDC_CTRL4		0x5A
+#define TPS65912_LEDC_CTRL5		0x5B
+#define TPS65912_LEDC_CTRL6		0x5C
+#define TPS65912_LEDC_CTRL7		0x5D
+#define TPS65912_LEDC_CTRL8		0x5E
+#define TPS65912_LED_RAMP_UP_TIME	0x5F
+#define TPS65912_LED_RAMP_DOWN_TIME	0x60
+#define TPS65912_LED_SEQ_EN		0x61
+#define TPS65912_LOADSWITCH		0x62
+#define TPS65912_SPARE			0x63
+#define TPS65912_VERNUM			0x64
+#define TPS6591X_MAX_REGISTER		0x64
+
+/* INT_STS Register field definitions */
+#define TPS65912_INT_STS_PWRHOLD_F	BIT(0)
+#define TPS65912_INT_STS_VMON		BIT(1)
+#define TPS65912_INT_STS_PWRON		BIT(2)
+#define TPS65912_INT_STS_PWRON_LP	BIT(3)
+#define TPS65912_INT_STS_PWRHOLD_R	BIT(4)
+#define TPS65912_INT_STS_HOTDIE		BIT(5)
+#define TPS65912_INT_STS_GPIO1_R	BIT(6)
+#define TPS65912_INT_STS_GPIO1_F	BIT(7)
+
+/* INT_STS Register field definitions */
+#define TPS65912_INT_STS2_GPIO2_R	BIT(0)
+#define TPS65912_INT_STS2_GPIO2_F	BIT(1)
+#define TPS65912_INT_STS2_GPIO3_R	BIT(2)
+#define TPS65912_INT_STS2_GPIO3_F	BIT(3)
+#define TPS65912_INT_STS2_GPIO4_R	BIT(4)
+#define TPS65912_INT_STS2_GPIO4_F	BIT(5)
+#define TPS65912_INT_STS2_GPIO5_R	BIT(6)
+#define TPS65912_INT_STS2_GPIO5_F	BIT(7)
+
+/* INT_STS Register field definitions */
+#define TPS65912_INT_STS3_PGOOD_DCDC1	BIT(0)
+#define TPS65912_INT_STS3_PGOOD_DCDC2	BIT(1)
+#define TPS65912_INT_STS3_PGOOD_DCDC3	BIT(2)
+#define TPS65912_INT_STS3_PGOOD_DCDC4	BIT(3)
+#define TPS65912_INT_STS3_PGOOD_LDO1	BIT(4)
+#define TPS65912_INT_STS3_PGOOD_LDO2	BIT(5)
+#define TPS65912_INT_STS3_PGOOD_LDO3	BIT(6)
+#define TPS65912_INT_STS3_PGOOD_LDO4	BIT(7)
+
+/* INT_STS Register field definitions */
+#define TPS65912_INT_STS4_PGOOD_LDO5	BIT(0)
+#define TPS65912_INT_STS4_PGOOD_LDO6	BIT(1)
+#define TPS65912_INT_STS4_PGOOD_LDO7	BIT(2)
+#define TPS65912_INT_STS4_PGOOD_LDO8	BIT(3)
+#define TPS65912_INT_STS4_PGOOD_LDO9	BIT(4)
+#define TPS65912_INT_STS4_PGOOD_LDO10	BIT(5)
+
+/* GPIO 1 and 2 Register field definitions */
+#define GPIO_SLEEP_MASK			0x80
+#define GPIO_SLEEP_SHIFT		7
+#define GPIO_DEB_MASK			0x10
+#define GPIO_DEB_SHIFT			4
+#define GPIO_CFG_MASK			0x04
+#define GPIO_CFG_SHIFT			2
+#define GPIO_STS_MASK			0x02
+#define GPIO_STS_SHIFT			1
+#define GPIO_SET_MASK			0x01
+#define GPIO_SET_SHIFT			0
+
+/* GPIO 3 Register field definitions */
+#define GPIO3_SLEEP_MASK		0x80
+#define GPIO3_SLEEP_SHIFT		7
+#define GPIO3_SEL_MASK			0x40
+#define GPIO3_SEL_SHIFT			6
+#define GPIO3_ODEN_MASK			0x20
+#define GPIO3_ODEN_SHIFT		5
+#define GPIO3_DEB_MASK			0x10
+#define GPIO3_DEB_SHIFT			4
+#define GPIO3_PDEN_MASK			0x08
+#define GPIO3_PDEN_SHIFT		3
+#define GPIO3_CFG_MASK			0x04
+#define GPIO3_CFG_SHIFT			2
+#define GPIO3_STS_MASK			0x02
+#define GPIO3_STS_SHIFT			1
+#define GPIO3_SET_MASK			0x01
+#define GPIO3_SET_SHIFT			0
+
+/* GPIO 4 Register field definitions */
+#define GPIO4_SLEEP_MASK		0x80
+#define GPIO4_SLEEP_SHIFT		7
+#define GPIO4_SEL_MASK			0x40
+#define GPIO4_SEL_SHIFT			6
+#define GPIO4_ODEN_MASK			0x20
+#define GPIO4_ODEN_SHIFT		5
+#define GPIO4_DEB_MASK			0x10
+#define GPIO4_DEB_SHIFT			4
+#define GPIO4_PDEN_MASK			0x08
+#define GPIO4_PDEN_SHIFT		3
+#define GPIO4_CFG_MASK			0x04
+#define GPIO4_CFG_SHIFT			2
+#define GPIO4_STS_MASK			0x02
+#define GPIO4_STS_SHIFT			1
+#define GPIO4_SET_MASK			0x01
+#define GPIO4_SET_SHIFT			0
+
+/* Register THERM  (0x80) register.RegisterDescription */
+#define THERM_THERM_HD_MASK		0x20
+#define THERM_THERM_HD_SHIFT		5
+#define THERM_THERM_TS_MASK		0x10
+#define THERM_THERM_TS_SHIFT		4
+#define THERM_THERM_HDSEL_MASK		0x0C
+#define THERM_THERM_HDSEL_SHIFT		2
+#define THERM_RSVD1_MASK		0x02
+#define THERM_RSVD1_SHIFT		1
+#define THERM_THERM_STATE_MASK		0x01
+#define THERM_THERM_STATE_SHIFT		0
+
+/* Register DCDCCTRL1 register.RegisterDescription */
+#define DCDCCTRL_VCON_ENABLE_MASK	0x80
+#define DCDCCTRL_VCON_ENABLE_SHIFT	7
+#define DCDCCTRL_VCON_RANGE1_MASK	0x40
+#define DCDCCTRL_VCON_RANGE1_SHIFT	6
+#define DCDCCTRL_VCON_RANGE0_MASK	0x20
+#define DCDCCTRL_VCON_RANGE0_SHIFT	5
+#define DCDCCTRL_TSTEP2_MASK		0x10
+#define DCDCCTRL_TSTEP2_SHIFT		4
+#define DCDCCTRL_TSTEP1_MASK		0x08
+#define DCDCCTRL_TSTEP1_SHIFT		3
+#define DCDCCTRL_TSTEP0_MASK		0x04
+#define DCDCCTRL_TSTEP0_SHIFT		2
+#define DCDCCTRL_DCDC1_MODE_MASK	0x02
+#define DCDCCTRL_DCDC1_MODE_SHIFT	1
+
+/* Register DCDCCTRL2 and DCDCCTRL3 register.RegisterDescription */
+#define DCDCCTRL_TSTEP2_MASK		0x10
+#define DCDCCTRL_TSTEP2_SHIFT		4
+#define DCDCCTRL_TSTEP1_MASK		0x08
+#define DCDCCTRL_TSTEP1_SHIFT		3
+#define DCDCCTRL_TSTEP0_MASK		0x04
+#define DCDCCTRL_TSTEP0_SHIFT		2
+#define DCDCCTRL_DCDC_MODE_MASK		0x02
+#define DCDCCTRL_DCDC_MODE_SHIFT	1
+#define DCDCCTRL_RSVD0_MASK		0x01
+#define DCDCCTRL_RSVD0_SHIFT		0
+
+/* Register DCDCCTRL4 register.RegisterDescription */
+#define DCDCCTRL_RAMP_TIME_MASK		0x01
+#define DCDCCTRL_RAMP_TIME_SHIFT	0
+
+/* Register DCDCx_AVS */
+#define DCDC_AVS_ENABLE_MASK		0x80
+#define DCDC_AVS_ENABLE_SHIFT		7
+#define DCDC_AVS_ECO_MASK		0x40
+#define DCDC_AVS_ECO_SHIFT		6
+
+/* Register DCDCx_LIMIT */
+#define DCDC_LIMIT_RANGE_MASK		0xC0
+#define DCDC_LIMIT_RANGE_SHIFT		6
+#define DCDC_LIMIT_MAX_SEL_MASK		0x3F
+#define DCDC_LIMIT_MAX_SEL_SHIFT	0
+
+/* Define the TPS65912 IRQ numbers */
+enum tps65912_irqs {
+	/* INT_STS registers */
+	TPS65912_IRQ_PWRHOLD_F,
+	TPS65912_IRQ_VMON,
+	TPS65912_IRQ_PWRON,
+	TPS65912_IRQ_PWRON_LP,
+	TPS65912_IRQ_PWRHOLD_R,
+	TPS65912_IRQ_HOTDIE,
+	TPS65912_IRQ_GPIO1_R,
+	TPS65912_IRQ_GPIO1_F,
+	/* INT_STS2 registers */
+	TPS65912_IRQ_GPIO2_R,
+	TPS65912_IRQ_GPIO2_F,
+	TPS65912_IRQ_GPIO3_R,
+	TPS65912_IRQ_GPIO3_F,
+	TPS65912_IRQ_GPIO4_R,
+	TPS65912_IRQ_GPIO4_F,
+	TPS65912_IRQ_GPIO5_R,
+	TPS65912_IRQ_GPIO5_F,
+	/* INT_STS3 registers */
+	TPS65912_IRQ_PGOOD_DCDC1,
+	TPS65912_IRQ_PGOOD_DCDC2,
+	TPS65912_IRQ_PGOOD_DCDC3,
+	TPS65912_IRQ_PGOOD_DCDC4,
+	TPS65912_IRQ_PGOOD_LDO1,
+	TPS65912_IRQ_PGOOD_LDO2,
+	TPS65912_IRQ_PGOOD_LDO3,
+	TPS65912_IRQ_PGOOD_LDO4,
+	/* INT_STS4 registers */
+	TPS65912_IRQ_PGOOD_LDO5,
+	TPS65912_IRQ_PGOOD_LDO6,
+	TPS65912_IRQ_PGOOD_LDO7,
+	TPS65912_IRQ_PGOOD_LDO8,
+	TPS65912_IRQ_PGOOD_LDO9,
+	TPS65912_IRQ_PGOOD_LDO10,
+};
+
+/*
+ * struct tps65912 - state holder for the tps65912 driver
+ *
+ * Device data may be used to access the TPS65912 chip
+ */
+struct tps65912 {
+	struct device *dev;
+	struct regmap *regmap;
+
+	/* IRQ Data */
+	int irq;
+	struct regmap_irq_chip_data *irq_data;
+};
+
+static const struct regmap_range tps65912_yes_ranges[] = {
+	regmap_reg_range(TPS65912_INT_STS, TPS65912_GPIO5),
+};
+
+static const struct regmap_access_table tps65912_volatile_table = {
+	.yes_ranges = tps65912_yes_ranges,
+	.n_yes_ranges = ARRAY_SIZE(tps65912_yes_ranges),
+};
+
+static const struct regmap_config tps65912_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_RBTREE,
+	.volatile_table = &tps65912_volatile_table,
+};
+
+int tps65912_device_init(struct tps65912 *tps);
+int tps65912_device_exit(struct tps65912 *tps);
+
+#endif /*  __LINUX_MFD_TPS65912_H */
-- 
1.9.1
