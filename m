From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 4/5] regulator: lochnagar: Add support for the Cirrus Logic Lochnagar
Date: Mon, 8 Oct 2018 14:25:41 +0100
Message-ID: <20181008132542.19775-4-ckeepax@opensource.cirrus.com>
References: <20181008132542.19775-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008132542.19775-1-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Lochnagar is an evaluation and development board for Cirrus
Logic Smart CODEC and Amp devices. It allows the connection of
most Cirrus Logic devices on mini-cards, as well as allowing
connection of various application processor systems to provide a
full evaluation platform. This driver supports the board
controller chip on the Lochnagar board.

The Lochnagar board provides power supplies for the attached
CODEC/Amp device. Currently this driver supports the microphone
supplies and the digital core voltage for the attached
device. There are some additional supplies that will be
added in time but these supplies are sufficient for most
systems/use-cases.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---

Changes since v1:
 - Update commit message a little

Thanks,
Charles

 drivers/regulator/Kconfig               |   7 +
 drivers/regulator/Makefile              |   1 +
 drivers/regulator/lochnagar-regulator.c | 255 ++++++++++++++++++++++++++++++++
 3 files changed, 263 insertions(+)
 create mode 100644 drivers/regulator/lochnagar-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 329cdd33ed624..3eda02afdcdeb 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -356,6 +356,13 @@ config REGULATOR_LM363X
 	  One boost output voltage is configurable and always on.
 	  Other LDOs are used for the display module.
 
+config REGULATOR_LOCHNAGAR
+	tristate "Cirrus Logic Lochnagar regulator driver"
+	depends on MFD_LOCHNAGAR
+	help
+	  This enables regulator support on the Cirrus Logic Lochnagar audio
+	  development board.
+
 config REGULATOR_LP3971
 	tristate "National Semiconductors LP3971 PMIC regulator driver"
 	depends on I2C
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 801d9a34a2037..0c715fa77bd62 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_REGULATOR_HI655X) += hi655x-regulator.o
 obj-$(CONFIG_REGULATOR_ISL6271A) += isl6271a-regulator.o
 obj-$(CONFIG_REGULATOR_ISL9305) += isl9305.o
 obj-$(CONFIG_REGULATOR_LM363X) += lm363x-regulator.o
+obj-$(CONFIG_REGULATOR_LOCHNAGAR) += lochnagar-regulator.o
 obj-$(CONFIG_REGULATOR_LP3971) += lp3971.o
 obj-$(CONFIG_REGULATOR_LP3972) += lp3972.o
 obj-$(CONFIG_REGULATOR_LP872X) += lp872x.o
diff --git a/drivers/regulator/lochnagar-regulator.c b/drivers/regulator/lochnagar-regulator.c
new file mode 100644
index 0000000000000..54d791d204080
--- /dev/null
+++ b/drivers/regulator/lochnagar-regulator.c
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Lochnagar regulator driver
+ *
+ * Copyright (c) 2017-2018 Cirrus Logic, Inc. and
+ *                         Cirrus Logic International Semiconductor Ltd.
+ *
+ * Author: Charles Keepax <ckeepax@opensource.cirrus.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+
+#include <linux/mfd/lochnagar.h>
+
+static const struct regulator_ops lochnagar_micvdd_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+};
+
+static const struct regulator_linear_range lochnagar_micvdd_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1000000, 0,    0xC, 50000),
+	REGULATOR_LINEAR_RANGE(1700000, 0xD, 0x1F, 100000),
+};
+
+static int lochnagar_micbias_enable(struct regulator_dev *rdev)
+{
+	struct lochnagar *lochnagar = rdev_get_drvdata(rdev);
+	int ret;
+
+	mutex_lock(&lochnagar->analogue_config_lock);
+
+	ret = regulator_enable_regmap(rdev);
+	if (ret < 0)
+		goto err;
+
+	ret = lochnagar_update_config(lochnagar);
+
+err:
+	mutex_unlock(&lochnagar->analogue_config_lock);
+
+	return ret;
+}
+
+static int lochnagar_micbias_disable(struct regulator_dev *rdev)
+{
+	struct lochnagar *lochnagar = rdev_get_drvdata(rdev);
+	int ret;
+
+	mutex_lock(&lochnagar->analogue_config_lock);
+
+	ret = regulator_disable_regmap(rdev);
+	if (ret < 0)
+		goto err;
+
+	ret = lochnagar_update_config(lochnagar);
+
+err:
+	mutex_unlock(&lochnagar->analogue_config_lock);
+
+	return ret;
+}
+
+static const struct regulator_ops lochnagar_micbias_ops = {
+	.enable = lochnagar_micbias_enable,
+	.disable = lochnagar_micbias_disable,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static const struct regulator_ops lochnagar_vddcore_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+};
+
+static const struct regulator_linear_range lochnagar_vddcore_ranges[] = {
+	REGULATOR_LINEAR_RANGE(600000, 0x8, 0x41, 12500),
+};
+
+enum lochnagar_regulators {
+	LOCHNAGAR_MICVDD,
+	LOCHNAGAR_MIC1VDD,
+	LOCHNAGAR_MIC2VDD,
+	LOCHNAGAR_VDDCORE,
+};
+
+static int lochnagar_micbias_of_parse(struct device_node *np,
+				      const struct regulator_desc *desc,
+				      struct regulator_config *config)
+{
+	struct lochnagar *lochnagar = config->driver_data;
+	int shift = (desc->id - LOCHNAGAR_MIC1VDD) *
+		    LOCHNAGAR2_P2_MICBIAS_SRC_SHIFT;
+	int mask = LOCHNAGAR2_P1_MICBIAS_SRC_MASK << shift;
+	unsigned int val;
+	int ret;
+
+	ret = of_property_read_u32(np, "cirrus,micbias-input", &val);
+	if (ret >= 0) {
+		mutex_lock(&lochnagar->analogue_config_lock);
+		ret = regmap_update_bits(lochnagar->regmap,
+					 LOCHNAGAR2_ANALOGUE_PATH_CTRL2,
+					 mask, val << shift);
+		mutex_unlock(&lochnagar->analogue_config_lock);
+		if (ret < 0) {
+			dev_err(lochnagar->dev,
+				"Failed to update micbias source: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct regulator_desc lochnagar_regulators[] = {
+	[LOCHNAGAR_MICVDD] = {
+		.name = "MICVDD",
+		.supply_name = "SYSVDD",
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 32,
+		.ops = &lochnagar_micvdd_ops,
+
+		.id = LOCHNAGAR_MICVDD,
+		.of_match = of_match_ptr("MICVDD"),
+
+		.enable_reg = LOCHNAGAR2_MICVDD_CTRL1,
+		.enable_mask = LOCHNAGAR2_MICVDD_REG_ENA_MASK,
+		.vsel_reg = LOCHNAGAR2_MICVDD_CTRL2,
+		.vsel_mask = LOCHNAGAR2_MICVDD_VSEL_MASK,
+
+		.linear_ranges = lochnagar_micvdd_ranges,
+		.n_linear_ranges = ARRAY_SIZE(lochnagar_micvdd_ranges),
+
+		.enable_time = 3000,
+		.ramp_delay = 1000,
+
+		.owner = THIS_MODULE,
+	},
+	[LOCHNAGAR_MIC1VDD] = {
+		.name = "MIC1VDD",
+		.supply_name = "MICBIAS1",
+		.type = REGULATOR_VOLTAGE,
+		.ops = &lochnagar_micbias_ops,
+
+		.id = LOCHNAGAR_MIC1VDD,
+		.of_match = of_match_ptr("MIC1VDD"),
+		.of_parse_cb = lochnagar_micbias_of_parse,
+
+		.enable_reg = LOCHNAGAR2_ANALOGUE_PATH_CTRL2,
+		.enable_mask = LOCHNAGAR2_P1_INPUT_BIAS_ENA_MASK,
+
+		.owner = THIS_MODULE,
+	},
+	[LOCHNAGAR_MIC2VDD] = {
+		.name = "MIC2VDD",
+		.supply_name = "MICBIAS2",
+		.type = REGULATOR_VOLTAGE,
+		.ops = &lochnagar_micbias_ops,
+
+		.id = LOCHNAGAR_MIC2VDD,
+		.of_match = of_match_ptr("MIC2VDD"),
+		.of_parse_cb = lochnagar_micbias_of_parse,
+
+		.enable_reg = LOCHNAGAR2_ANALOGUE_PATH_CTRL2,
+		.enable_mask = LOCHNAGAR2_P2_INPUT_BIAS_ENA_MASK,
+
+		.owner = THIS_MODULE,
+	},
+	[LOCHNAGAR_VDDCORE] = {
+		.name = "VDDCORE",
+		.supply_name = "SYSVDD",
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 57,
+		.ops = &lochnagar_vddcore_ops,
+
+		.id = LOCHNAGAR_VDDCORE,
+		.of_match = of_match_ptr("VDDCORE"),
+
+		.enable_reg = LOCHNAGAR2_VDDCORE_CDC_CTRL1,
+		.enable_mask = LOCHNAGAR2_VDDCORE_CDC_REG_ENA_MASK,
+		.vsel_reg = LOCHNAGAR2_VDDCORE_CDC_CTRL2,
+		.vsel_mask = LOCHNAGAR2_VDDCORE_CDC_VSEL_MASK,
+
+		.linear_ranges = lochnagar_vddcore_ranges,
+		.n_linear_ranges = ARRAY_SIZE(lochnagar_vddcore_ranges),
+
+		.enable_time = 3000,
+		.ramp_delay = 1000,
+
+		.owner = THIS_MODULE,
+	},
+};
+
+static int lochnagar_regulator_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lochnagar *lochnagar = dev_get_drvdata(dev->parent);
+	struct regulator_config config = { };
+	struct regulator_dev *rdev;
+	int ret, i;
+
+	config.dev = lochnagar->dev;
+	config.regmap = lochnagar->regmap;
+	config.driver_data = lochnagar;
+
+	for (i = 0; i < ARRAY_SIZE(lochnagar_regulators); i++) {
+		const struct regulator_desc *desc = &lochnagar_regulators[i];
+
+		rdev = devm_regulator_register(dev, desc, &config);
+		if (IS_ERR(rdev)) {
+			ret = PTR_ERR(rdev);
+			dev_err(dev, "Failed to register %s regulator: %d\n",
+				desc->name, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static struct platform_driver lochnagar_regulator_driver = {
+	.driver = {
+		.name = "lochnagar-regulator",
+	},
+
+	.probe = lochnagar_regulator_probe,
+};
+module_platform_driver(lochnagar_regulator_driver);
+
+MODULE_AUTHOR("Charles Keepax <ckeepax@opensource.cirrus.com>");
+MODULE_DESCRIPTION("Regulator driver for Cirrus Logic Lochnagar Board");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:lochnagar-regulator");
-- 
2.11.0
