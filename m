From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v5 4/5] regulator: tps65912: Add regulator driver for the TPS65912 PMIC
Date: Thu, 29 Oct 2015 18:38:41 -0500
Message-ID: <1446161922-8755-5-git-send-email-afd@ti.com>
References: <1446161922-8755-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446161922-8755-1-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for TPS65912 PMIC regulators.

The regulators set consists of 4 DCDCs and 10 LDOs. The output
voltages are configurable and are meant to supply power to the
main processor and other components.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/regulator/Kconfig              |   6 ++
 drivers/regulator/Makefile             |   1 +
 drivers/regulator/tps65912-regulator.c | 170 +++++++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 drivers/regulator/tps65912-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 3cb2de9..1dec96a 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -727,6 +727,12 @@ config REGULATOR_TPS65910
 	help
 	  This driver supports TPS65910/TPS65911 voltage regulator chips.
 
+config REGULATOR_TPS65912
+	tristate "TI TPS65912 Power regulator"
+	depends on MFD_TPS65912
+	help
+	    This driver supports TPS65912 voltage regulator chip.
+
 config REGULATOR_TPS80031
 	tristate "TI TPS80031/TPS80032 power regualtor driver"
 	depends on MFD_TPS80031
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 222ff5f..0f81749 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -91,6 +91,7 @@ obj-$(CONFIG_REGULATOR_TPS65218) += tps65218-regulator.o
 obj-$(CONFIG_REGULATOR_TPS6524X) += tps6524x-regulator.o
 obj-$(CONFIG_REGULATOR_TPS6586X) += tps6586x-regulator.o
 obj-$(CONFIG_REGULATOR_TPS65910) += tps65910-regulator.o
+obj-$(CONFIG_REGULATOR_TPS65912) += tps65912-regulator.o
 obj-$(CONFIG_REGULATOR_TPS80031) += tps80031-regulator.o
 obj-$(CONFIG_REGULATOR_TWL4030) += twl-regulator.o
 obj-$(CONFIG_REGULATOR_VEXPRESS) += vexpress.o
diff --git a/drivers/regulator/tps65912-regulator.c b/drivers/regulator/tps65912-regulator.c
new file mode 100644
index 0000000..1c9e474
--- /dev/null
+++ b/drivers/regulator/tps65912-regulator.c
@@ -0,0 +1,170 @@
+/*
+ * Regulator driver for TPS65912x PMIC
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
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+
+#include <linux/mfd/tps65912.h>
+
+enum tps65912_regulators { DCDC1, DCDC2, DCDC3, DCDC4, LDO1, LDO2, LDO3,
+	LDO4, LDO5, LDO6, LDO7, LDO8, LDO9, LDO10 };
+
+#define TPS65912_REGULATOR(_name, _id, _of_match, _ops, _vr, _er, _lr)	\
+	[_id] = {							\
+		.name			= _name,			\
+		.of_match		= of_match_ptr(_of_match),	\
+		.id			= _id,				\
+		.ops			= &_ops,			\
+		.n_voltages		= 64,				\
+		.type			= REGULATOR_VOLTAGE,		\
+		.owner			= THIS_MODULE,			\
+		.vsel_reg		= _vr,				\
+		.vsel_mask		= 0x3f,				\
+		.enable_reg		= _er,				\
+		.enable_mask		= BIT(7),			\
+		.volt_table		= NULL,				\
+		.linear_ranges		= _lr,				\
+		.n_linear_ranges	= ARRAY_SIZE(_lr),		\
+	}
+
+static const struct regulator_linear_range tps65912_dcdc_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000, 0x0, 0x3f, 50000),
+};
+
+static const struct regulator_linear_range tps65912_ldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(800000, 0x0, 0x20, 25000),
+	REGULATOR_LINEAR_RANGE(1650000, 0x21, 0x3c, 50000),
+	REGULATOR_LINEAR_RANGE(3100000, 0x3d, 0x3f, 100000),
+};
+
+/* Operations permitted on DCDCx */
+static struct regulator_ops tps65912_ops_dcdc = {
+	.is_enabled		= regulator_is_enabled_regmap,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.list_voltage		= regulator_list_voltage_linear_range,
+};
+
+/* Operations permitted on LDOx */
+static struct regulator_ops tps65912_ops_ldo = {
+	.is_enabled		= regulator_is_enabled_regmap,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.map_voltage		= regulator_map_voltage_linear_range,
+};
+
+static const struct regulator_desc regulators[] = {
+	TPS65912_REGULATOR("DCDC1", DCDC1, "dcdc1", tps65912_ops_dcdc,
+			   TPS65912_DCDC1_OP, TPS65912_DCDC1_CTRL,
+			   tps65912_dcdc_ranges),
+	TPS65912_REGULATOR("DCDC2", DCDC2, "dcdc2", tps65912_ops_dcdc,
+			   TPS65912_DCDC2_OP, TPS65912_DCDC2_CTRL,
+			   tps65912_dcdc_ranges),
+	TPS65912_REGULATOR("DCDC3", DCDC3, "dcdc3", tps65912_ops_dcdc,
+			   TPS65912_DCDC3_OP, TPS65912_DCDC3_CTRL,
+			   tps65912_dcdc_ranges),
+	TPS65912_REGULATOR("DCDC4", DCDC4, "dcdc4", tps65912_ops_dcdc,
+			   TPS65912_DCDC4_OP, TPS65912_DCDC4_CTRL,
+			   tps65912_dcdc_ranges),
+	TPS65912_REGULATOR("LDO1", LDO1, "ldo1", tps65912_ops_ldo,
+			   TPS65912_LDO1_OP, TPS65912_LDO1_AVS,
+			   tps65912_ldo_ranges),
+	TPS65912_REGULATOR("LDO2", LDO2, "ldo2", tps65912_ops_ldo,
+			   TPS65912_LDO2_OP, TPS65912_LDO2_AVS,
+			   tps65912_ldo_ranges),
+	TPS65912_REGULATOR("LDO3", LDO3, "ldo3", tps65912_ops_ldo,
+			   TPS65912_LDO3_OP, TPS65912_LDO3_AVS,
+			   tps65912_ldo_ranges),
+	TPS65912_REGULATOR("LDO4", LDO4, "ldo4", tps65912_ops_ldo,
+			   TPS65912_LDO4_OP, TPS65912_LDO4_AVS,
+			   tps65912_ldo_ranges),
+	TPS65912_REGULATOR("LDO5", LDO5, "ldo5", tps65912_ops_ldo,
+			   TPS65912_LDO5, TPS65912_LDO5,
+			   tps65912_ldo_ranges),
+	TPS65912_REGULATOR("LDO6", LDO6, "ldo6", tps65912_ops_ldo,
+			   TPS65912_LDO6, TPS65912_LDO6,
+			   tps65912_ldo_ranges),
+	TPS65912_REGULATOR("LDO7", LDO7, "ldo7", tps65912_ops_ldo,
+			   TPS65912_LDO7, TPS65912_LDO7,
+			   tps65912_ldo_ranges),
+	TPS65912_REGULATOR("LDO8", LDO8, "ldo8", tps65912_ops_ldo,
+			   TPS65912_LDO8, TPS65912_LDO8,
+			   tps65912_ldo_ranges),
+	TPS65912_REGULATOR("LDO9", LDO9, "ldo9", tps65912_ops_ldo,
+			   TPS65912_LDO9, TPS65912_LDO9,
+			   tps65912_ldo_ranges),
+	TPS65912_REGULATOR("LDO10", LDO10, "ldo10", tps65912_ops_ldo,
+			   TPS65912_LDO10, TPS65912_LDO10,
+			   tps65912_ldo_ranges),
+};
+
+static int tps65912_regulator_probe(struct platform_device *pdev)
+{
+	struct tps65912 *tps = dev_get_drvdata(pdev->dev.parent);
+	struct regulator_config config = { };
+	struct regulator_dev *rdev;
+	int i;
+
+	platform_set_drvdata(pdev, tps);
+
+	config.dev = &pdev->dev;
+	config.driver_data = tps;
+	config.of_node = pdev->dev.of_node;
+	config.regmap = tps->regmap;
+
+	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
+		rdev = devm_regulator_register(&pdev->dev, &regulators[i],
+					       &config);
+		if (IS_ERR(rdev)) {
+			dev_err(tps->dev, "failed to register %s regulator\n",
+				pdev->name);
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id tps65912_regulator_id_table[] = {
+	{ "tps65912-regulator", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, tps65912_regulator_id_table);
+
+static struct platform_driver tps65912_regulator_driver = {
+	.driver = {
+		.name = "tps65912-regulator",
+	},
+	.probe = tps65912_regulator_probe,
+	.id_table = tps65912_regulator_id_table,
+};
+module_platform_driver(tps65912_regulator_driver);
+
+MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
+MODULE_DESCRIPTION("TPS65912 voltage regulator driver");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1
