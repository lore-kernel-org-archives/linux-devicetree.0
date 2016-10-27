From: Eric Jeong <eric.jeong.opensource@diasemi.com>
Subject: [PATCH V2 3/4] regulator: pv88080: Update Regulator driver for MFD
 support
Date: Thu, 27 Oct 2016 10:03:14 +0900
Message-ID: <711afefe3e65c166111473024bf9b54f3d4cc8b6.1477530195.git.eric.jeong@diasemi.com>
References: <cover.1477530195.git.eric.jeong@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1477530195.git.eric.jeong@diasemi.com>
Sender: linux-gpio-owner@vger.kernel.org
To: LINUX-KERNEL <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-GPIO <linux-gpio@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org


From: Eric Jeong <eric.jeong.opensource@diasemi.com>

This change convert from using struct i2c_clinet 
to using struct platform_device for MFD structure.
And, the declaration of of_device_id and regmap_config
are also move to MFD driver.

The configuration for MASK registers is moved 
to MFD core.

Kconfig is updated to reflect support for PV88080 regulator.

Signed-off-by: Eric Jeong <eric.jeong.opensource@diasemi.com>

---
This patch applies against linux-next and next-20161026

Hi,

The existing PV88080 regulstor driver is updated to support
MFD structure by adding GPIO function.
Most of changes are related with MFD structure support.

Change since PATCH V1
 - Patch separated from PATCH V1

Regards,
Eric Jeong, Dialog Semiconductor Ltd.


 drivers/regulator/Kconfig             |    5 +-
 drivers/regulator/pv88080-regulator.c |  202 +++++++++++++--------------------
 drivers/regulator/pv88080-regulator.h |  118 -------------------
 3 files changed, 81 insertions(+), 244 deletions(-)
 delete mode 100644 drivers/regulator/pv88080-regulator.h

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
-- 
end-of-patch for PATCH V2

