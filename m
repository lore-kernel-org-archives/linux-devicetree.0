From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] regulator, dt: add dt support for tps6502x regulator
Date: Mon, 19 Oct 2015 08:27:13 +0200
Message-ID: <1445236033-27747-1-git-send-email-hs@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

add DT support for the tps6502x regulators.

Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
---

 .../devicetree/bindings/regulator/tps6502x.txt     |  56 ++++
 arch/arm/boot/dts/tps65023.dtsi                    |  46 +++
 drivers/regulator/tps65023-regulator.c             | 326 +++++++++++++++------
 3 files changed, 331 insertions(+), 97 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/tps6502x.txt
 create mode 100644 arch/arm/boot/dts/tps65023.dtsi

diff --git a/Documentation/devicetree/bindings/regulator/tps6502x.txt b/Documentation/devicetree/bindings/regulator/tps6502x.txt
new file mode 100644
index 0000000..9d26070
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/tps6502x.txt
@@ -0,0 +1,56 @@
+TPS6502x family of regulators
+
+Required properties:
+- compatible: "ti,tps65020", "ti,tps65021" or "ti,tps65023"
+- reg: I2C slave address
+- regulators: list of regulators provided by this controller, must be named
+  after their hardware counterparts: dcdc[1-3] and ldo[1-2]
+- regulators: This is the list of child nodes that specify the regulator
+  initialization data for defined regulators. Not all regulators for the given
+  device need to be present. The definition for each of these nodes is defined
+  using the standard binding for regulators found at
+  Documentation/devicetree/bindings/regulator/regulator.txt.
+
+  The valid names for regulators are:
+  tps6502x: dcdc1, dcdc2, dcdc3, ldo1 and ldo2
+
+Each regulator is defined using the standard binding for regulators.
+
+Example:
+
+	tps: tps@48 {
+		compatible = "ti,tps65023";
+
+		regulators {
+			vdcdc1_reg: regulator@0 {
+				regulator-name = "vdd_core";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+			};
+			vdcdc2_reg: regulator@1 {
+				regulator-name = "vddshv";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+			vdcdc3_reg: regulator@2 {
+				regulator-name = "vdds";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+			vldo1_reg: regulator@3 {
+				regulator-name = "vdda1p8v_usbphy";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+			vldo2_reg: regulator@4 {
+				regulator-name = "vdda3p3v_usbphy";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+		};
+	};
diff --git a/arch/arm/boot/dts/tps65023.dtsi b/arch/arm/boot/dts/tps65023.dtsi
new file mode 100644
index 0000000..9e2b5f0
--- /dev/null
+++ b/arch/arm/boot/dts/tps65023.dtsi
@@ -0,0 +1,46 @@
+/*
+ * Copyright (C) 2015 DENX Software GmbH Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/*
+ * Integrated Power Management Chip
+ * www.ti.com/lit/ds/symlink/tps65023.pdf
+ */
+
+&tps {
+	compatible = "ti,tps65023";
+
+	regulators {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdcdc1_reg: regulator@0 {
+			reg = <0>;
+			regulator-compatible = "vdcdc1", "regulator-compatible";
+		};
+
+		vdcdc2_reg: regulator@1 {
+			reg = <1>;
+			regulator-compatible = "vdcdc2", "regulator-compatible";
+		};
+
+		vdcdc3_reg: regulator@2 {
+			reg = <2>;
+			regulator-compatible = "vdcdc3", "regulator-compatible";
+		};
+
+		vldo1_reg: regulator@3 {
+			reg = <3>;
+			regulator-compatible = "vldo1", "regulator-compatible";
+		};
+
+		vldo2_reg: regulator@4 {
+			reg = <4>;
+			regulator-compatible = "vldo2", "regulator-compatible";
+		};
+	};
+};
diff --git a/drivers/regulator/tps65023-regulator.c b/drivers/regulator/tps65023-regulator.c
index 5cc19b4..d143267 100644
--- a/drivers/regulator/tps65023-regulator.c
+++ b/drivers/regulator/tps65023-regulator.c
@@ -25,6 +25,10 @@
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/regmap.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+#include <linux/regulator/of_regulator.h>
 
 /* Register definitions */
 #define	TPS65023_REG_VERSION		0
@@ -140,8 +144,15 @@ struct tps_pmic {
 	u8 core_regulator;
 };
 
+enum tps6502x_id {
+	TPS65020,
+	TPS65021,
+	TPS65023,
+};
+
 /* Struct passed as driver data */
 struct tps_driver_data {
+	enum tps6502x_id id;
 	const struct tps_info *info;
 	u8 core_regulator;
 };
@@ -199,103 +210,6 @@ static const struct regmap_config tps65023_regmap_config = {
 	.val_bits = 8,
 };
 
-static int tps_65023_probe(struct i2c_client *client,
-				     const struct i2c_device_id *id)
-{
-	const struct tps_driver_data *drv_data = (void *)id->driver_data;
-	const struct tps_info *info = drv_data->info;
-	struct regulator_config config = { };
-	struct regulator_init_data *init_data;
-	struct regulator_dev *rdev;
-	struct tps_pmic *tps;
-	int i;
-	int error;
-
-	/**
-	 * init_data points to array of regulator_init structures
-	 * coming from the board-evm file.
-	 */
-	init_data = dev_get_platdata(&client->dev);
-	if (!init_data)
-		return -EIO;
-
-	tps = devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
-	if (!tps)
-		return -ENOMEM;
-
-	tps->regmap = devm_regmap_init_i2c(client, &tps65023_regmap_config);
-	if (IS_ERR(tps->regmap)) {
-		error = PTR_ERR(tps->regmap);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			error);
-		return error;
-	}
-
-	/* common for all regulators */
-	tps->core_regulator = drv_data->core_regulator;
-
-	for (i = 0; i < TPS65023_NUM_REGULATOR; i++, info++, init_data++) {
-		/* Store regulator specific information */
-		tps->info[i] = info;
-
-		tps->desc[i].name = info->name;
-		tps->desc[i].id = i;
-		tps->desc[i].n_voltages = info->table_len;
-		tps->desc[i].volt_table = info->table;
-		tps->desc[i].ops = (i > TPS65023_DCDC_3 ?
-					&tps65023_ldo_ops : &tps65023_dcdc_ops);
-		tps->desc[i].type = REGULATOR_VOLTAGE;
-		tps->desc[i].owner = THIS_MODULE;
-
-		tps->desc[i].enable_reg = TPS65023_REG_REG_CTRL;
-		switch (i) {
-		case TPS65023_LDO_1:
-			tps->desc[i].vsel_reg = TPS65023_REG_LDO_CTRL;
-			tps->desc[i].vsel_mask = 0x07;
-			tps->desc[i].enable_mask = 1 << 1;
-			break;
-		case TPS65023_LDO_2:
-			tps->desc[i].vsel_reg = TPS65023_REG_LDO_CTRL;
-			tps->desc[i].vsel_mask = 0x70;
-			tps->desc[i].enable_mask = 1 << 2;
-			break;
-		default: /* DCDCx */
-			tps->desc[i].enable_mask =
-					1 << (TPS65023_NUM_REGULATOR - i);
-			tps->desc[i].vsel_reg = TPS65023_REG_DEF_CORE;
-			tps->desc[i].vsel_mask = info->table_len - 1;
-			tps->desc[i].apply_reg = TPS65023_REG_CON_CTRL2;
-			tps->desc[i].apply_bit = TPS65023_REG_CTRL2_GO;
-		}
-
-		config.dev = &client->dev;
-		config.init_data = init_data;
-		config.driver_data = tps;
-		config.regmap = tps->regmap;
-
-		/* Register the regulators */
-		rdev = devm_regulator_register(&client->dev, &tps->desc[i],
-					       &config);
-		if (IS_ERR(rdev)) {
-			dev_err(&client->dev, "failed to register %s\n",
-				id->name);
-			return PTR_ERR(rdev);
-		}
-
-		/* Save regulator for cleanup */
-		tps->rdev[i] = rdev;
-	}
-
-	i2c_set_clientdata(client, tps);
-
-	/* Enable setting output voltage by I2C */
-	regmap_update_bits(tps->regmap, TPS65023_REG_CON_CTRL2,
-					TPS65023_REG_CTRL2_CORE_ADJ,
-					TPS65023_REG_CTRL2_CORE_ADJ);
-
-	return 0;
-}
-
 static const struct tps_info tps65020_regs[] = {
 	{
 		.name = "VDCDC1",
@@ -381,16 +295,19 @@ static const struct tps_info tps65023_regs[] = {
 };
 
 static struct tps_driver_data tps65020_drv_data = {
+	.id = TPS65020,
 	.info = tps65020_regs,
 	.core_regulator = TPS65023_DCDC_3,
 };
 
 static struct tps_driver_data tps65021_drv_data = {
+	.id = TPS65021,
 	.info = tps65021_regs,
 	.core_regulator = TPS65023_DCDC_3,
 };
 
 static struct tps_driver_data tps65023_drv_data = {
+	.id = TPS65023,
 	.info = tps65023_regs,
 	.core_regulator = TPS65023_DCDC_1,
 };
@@ -407,9 +324,224 @@ static const struct i2c_device_id tps_65023_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, tps_65023_id);
 
+#if defined(CONFIG_OF)
+static const struct of_device_id tps6502x_of_match[] = {
+	 { .compatible = "ti,tps65023", .data = (void *)&tps65023_drv_data},
+	 { .compatible = "ti,tps65021", .data = (void *)&tps65021_drv_data},
+	 { .compatible = "ti,tps65020", .data = (void *)&tps65020_drv_data},
+	{},
+};
+MODULE_DEVICE_TABLE(of, tps6502x_of_match);
+#endif
+
+#if defined(CONFIG_OF)
+static struct of_regulator_match tps65020_matches[] = {
+	{ .name = "vdcdc1",	.driver_data = (void *) &tps65020_regs[0] },
+	{ .name = "vdcdc2",	.driver_data = (void *) &tps65020_regs[1] },
+	{ .name = "vdcdc3",	.driver_data = (void *) &tps65020_regs[2] },
+	{ .name = "ldo1",	.driver_data = (void *) &tps65020_regs[3] },
+	{ .name = "ldo2",	.driver_data = (void *) &tps65020_regs[4] },
+};
+
+static struct of_regulator_match tps65021_matches[] = {
+	{ .name = "vdcdc1",	.driver_data = (void *) &tps65021_regs[0] },
+	{ .name = "vdcdc2",	.driver_data = (void *) &tps65021_regs[1] },
+	{ .name = "vdcdc3",	.driver_data = (void *) &tps65021_regs[2] },
+	{ .name = "ldo1",	.driver_data = (void *) &tps65021_regs[3] },
+	{ .name = "ldo2",	.driver_data = (void *) &tps65021_regs[4] },
+};
+
+static struct of_regulator_match tps65023_matches[] = {
+	{ .name = "vdcdc1",	.driver_data = (void *) &tps65023_regs[0] },
+	{ .name = "vdcdc2",	.driver_data = (void *) &tps65023_regs[1] },
+	{ .name = "vdcdc3",	.driver_data = (void *) &tps65023_regs[2] },
+	{ .name = "ldo1",	.driver_data = (void *) &tps65023_regs[3] },
+	{ .name = "ldo2",	.driver_data = (void *) &tps65023_regs[4] },
+};
+
+struct regulator_init_data
+*tps6502x_parse_dt_data(struct device *dev,
+			  const struct tps_driver_data *drv_data,
+			  struct of_regulator_match **tps6502x_reg_matches)
+{
+	struct device_node *np = dev->of_node;
+	struct regulator_init_data *init_data;
+	struct device_node *regulators;
+	struct of_regulator_match *matches;
+	int i, count, ret;
+
+	init_data = devm_kzalloc(dev, TPS65023_NUM_REGULATOR *
+				 sizeof(struct regulator_init_data),
+				 GFP_KERNEL);
+	if (!init_data)
+		return NULL;
+
+	regulators = of_get_child_by_name(np, "regulators");
+	if (!regulators) {
+		dev_err(dev, "regulator node not found\n");
+		return NULL;
+	}
+
+	switch (drv_data->id) {
+	case TPS65020:
+		count = ARRAY_SIZE(tps65020_matches);
+		matches = tps65020_matches;
+		break;
+	case TPS65021:
+		count = ARRAY_SIZE(tps65021_matches);
+		matches = tps65021_matches;
+		break;
+	case TPS65023:
+		count = ARRAY_SIZE(tps65023_matches);
+		matches = tps65023_matches;
+		break;
+	default:
+		of_node_put(regulators);
+		dev_err(dev, "Invalid tps chip version\n");
+		return NULL;
+	}
+
+	ret = of_regulator_match(dev, regulators, matches, count);
+	of_node_put(regulators);
+	if (ret < 0) {
+		dev_err(dev, "Error parsing regulator init data: %d\n", ret);
+		return NULL;
+	}
+
+	*tps6502x_reg_matches = matches;
+
+	for (i = 0; i < count; i++) {
+		if (!matches[i].of_node)
+			continue;
+
+		memcpy(&init_data[i], matches[i].init_data,
+		       sizeof(struct regulator_init_data));
+	}
+
+	return init_data;
+}
+#else
+struct regulator_init_data
+*tps6502x_parse_dt_data(struct device *dev,
+			  const struct tps_driver_data *drv_data,
+			  struct of_regulator_match **tps6502x_reg_matches)
+{
+	*tps6502x_reg_matches = NULL;
+	return NULL;
+}
+
+#endif
+
+static int tps_65023_probe(struct i2c_client *client,
+				     const struct i2c_device_id *id)
+{
+	const struct tps_driver_data *drv_data = (void *)id->driver_data;
+	const struct tps_info *info = drv_data->info;
+	struct regulator_config config = { };
+	struct regulator_init_data *init_data;
+	struct regulator_dev *rdev;
+	struct of_regulator_match *tps6502x_reg_matches = NULL;
+	struct tps_pmic *tps;
+	int i;
+	int error;
+
+	if (client->dev.of_node) {
+		init_data = tps6502x_parse_dt_data(&client->dev, drv_data,
+						     &tps6502x_reg_matches);
+	} else {
+		/**
+		 * init_data points to array of regulator_init structures
+		 * coming from the board-evm file.
+		 */
+		init_data = dev_get_platdata(&client->dev);
+	}
+	if (!init_data)
+		return -EIO;
+
+	tps = devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
+	if (!tps)
+		return -ENOMEM;
+
+	tps->regmap = devm_regmap_init_i2c(client, &tps65023_regmap_config);
+	if (IS_ERR(tps->regmap)) {
+		error = PTR_ERR(tps->regmap);
+		dev_err(&client->dev, "Failed to allocate register map: %d\n",
+			error);
+		return error;
+	}
+
+	/* common for all regulators */
+	tps->core_regulator = drv_data->core_regulator;
+
+	for (i = 0; i < TPS65023_NUM_REGULATOR; i++, info++, init_data++) {
+		/* Store regulator specific information */
+		tps->info[i] = info;
+
+		tps->desc[i].name = info->name;
+		tps->desc[i].id = i;
+		tps->desc[i].n_voltages = info->table_len;
+		tps->desc[i].volt_table = info->table;
+		tps->desc[i].ops = (i > TPS65023_DCDC_3 ?
+					&tps65023_ldo_ops : &tps65023_dcdc_ops);
+		tps->desc[i].type = REGULATOR_VOLTAGE;
+		tps->desc[i].owner = THIS_MODULE;
+
+		tps->desc[i].enable_reg = TPS65023_REG_REG_CTRL;
+		switch (i) {
+		case TPS65023_LDO_1:
+			tps->desc[i].vsel_reg = TPS65023_REG_LDO_CTRL;
+			tps->desc[i].vsel_mask = 0x07;
+			tps->desc[i].enable_mask = 1 << 1;
+			break;
+		case TPS65023_LDO_2:
+			tps->desc[i].vsel_reg = TPS65023_REG_LDO_CTRL;
+			tps->desc[i].vsel_mask = 0x70;
+			tps->desc[i].enable_mask = 1 << 2;
+			break;
+		default: /* DCDCx */
+			tps->desc[i].enable_mask =
+					1 << (TPS65023_NUM_REGULATOR - i);
+			tps->desc[i].vsel_reg = TPS65023_REG_DEF_CORE;
+			tps->desc[i].vsel_mask = info->table_len - 1;
+			tps->desc[i].apply_reg = TPS65023_REG_CON_CTRL2;
+			tps->desc[i].apply_bit = TPS65023_REG_CTRL2_GO;
+		}
+
+		config.dev = &client->dev;
+		config.init_data = init_data;
+		config.driver_data = tps;
+		config.regmap = tps->regmap;
+		if (tps6502x_reg_matches)
+			config.of_node = tps6502x_reg_matches[i].of_node;
+
+		/* Register the regulators */
+		rdev = devm_regulator_register(&client->dev, &tps->desc[i],
+					       &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&client->dev, "failed to register %s\n",
+				id->name);
+			return PTR_ERR(rdev);
+		}
+
+		/* Save regulator for cleanup */
+		tps->rdev[i] = rdev;
+	}
+
+	i2c_set_clientdata(client, tps);
+
+	/* Enable setting output voltage by I2C */
+	regmap_update_bits(tps->regmap, TPS65023_REG_CON_CTRL2,
+					TPS65023_REG_CTRL2_CORE_ADJ,
+					TPS65023_REG_CTRL2_CORE_ADJ);
+
+	return 0;
+}
+
 static struct i2c_driver tps_65023_i2c_driver = {
 	.driver = {
 		.name = "tps65023",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(tps6502x_of_match),
 	},
 	.probe = tps_65023_probe,
 	.id_table = tps_65023_id,
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
