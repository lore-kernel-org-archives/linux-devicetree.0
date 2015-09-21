From: Thomas Elste <thomas.elste-cSCHQGRfioA@public.gmane.org>
Subject: [PATCH v2] regulator: tps65023: add device tree support
Date: Mon, 21 Sep 2015 16:30:47 +0200
Message-ID: <1442845847-4247-1-git-send-email-thomas.elste@imms.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree based initialization support for tps65023 regulators.
Therefore add macros for regulator definition setting of_match and
regulators_node members. Add initialization of regulator_desc data
using these macros. Remove old regulator_desc initialization.

Add device tree binding document for tps65023 regulators.

Signed-off-by: Thomas Elste <thomas.elste-cSCHQGRfioA@public.gmane.org>
---

Changes in v2:
 - don't match the regulator nodes in the driver anymore
 - add regulator_desc initialization macros
 - add regulator_desc data
 - remove old regulator_desc initialization code
 - remove tps_info struct and data
 - move driver_data to tps_pmic struct

 .../devicetree/bindings/regulator/tps65023.txt     |  60 +++++
 drivers/regulator/tps65023-regulator.c             | 282 ++++++++-------------
 2 files changed, 168 insertions(+), 174 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65023.txt

diff --git a/Documentation/devicetree/bindings/regulator/tps65023.txt b/Documentation/devicetree/bindings/regulator/tps65023.txt
new file mode 100644
index 0000000..a4714e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/tps65023.txt
@@ -0,0 +1,60 @@
+TPS65023 family of regulators
+
+Required properties:
+- compatible: Must be one of the following.
+	"ti,tps65020",
+	"ti,tps65021",
+	"ti,tps65023",
+- reg: I2C slave address
+- regulators: list of regulators provided by this controller, must be named
+  after their hardware counterparts: VDCDC[1-3] and LDO[1-2]
+- regulators: This is the list of child nodes that specify the regulator
+  initialization data for defined regulators. The definition for each of
+  these nodes is defined using the standard binding for regulators found at
+  Documentation/devicetree/bindings/regulator/regulator.txt.
+
+Each regulator is defined using the standard binding for regulators.
+
+Example:
+
+	tps65023@48 {
+		compatible = "ti,tps65023";
+		reg = <0x48>;
+
+		regulators {
+			VDCDC1 {
+				regulator-name = "vdd_mpu";
+				regulator-always-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			VDCDC2 {
+				regulator-name = "vdd_core";
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			VDCDC3 {
+				regulator-name = "vdd_io";
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			LDO1 {
+				regulator-name = "vdd_usb18";
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			LDO2 {
+				regulator-name = "vdd_usb33";
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+		};
+	};
diff --git a/drivers/regulator/tps65023-regulator.c b/drivers/regulator/tps65023-regulator.c
index 5cc19b4..d2c3d7c 100644
--- a/drivers/regulator/tps65023-regulator.c
+++ b/drivers/regulator/tps65023-regulator.c
@@ -86,6 +86,42 @@
 
 #define TPS65023_MAX_REG_ID		TPS65023_LDO_2
 
+#define TPS65023_REGULATOR_DCDC(_num, _t, _em)			\
+	{							\
+		.name		= "VDCDC"#_num,			\
+		.of_match	= of_match_ptr("VDCDC"#_num),	\
+		.regulators_node = of_match_ptr("regulators"),	\
+		.id		= TPS65023_DCDC_##_num,		\
+		.n_voltages     = ARRAY_SIZE(_t),		\
+		.ops		= &tps65023_dcdc_ops,		\
+		.type		= REGULATOR_VOLTAGE,		\
+		.owner		= THIS_MODULE,			\
+		.volt_table	= _t,				\
+		.vsel_reg	= TPS65023_REG_DEF_CORE,	\
+		.vsel_mask	= ARRAY_SIZE(_t) - 1,		\
+		.enable_mask	= _em,				\
+		.enable_reg	= TPS65023_REG_REG_CTRL,	\
+		.apply_reg	= TPS65023_REG_CON_CTRL2,	\
+		.apply_bit	= TPS65023_REG_CTRL2_GO,	\
+	}							\
+
+#define TPS65023_REGULATOR_LDO(_num, _t, _vm)			\
+	{							\
+		.name		= "LDO"#_num,			\
+		.of_match	= of_match_ptr("LDO"#_num),	\
+		.regulators_node = of_match_ptr("regulators"),	\
+		.id		= TPS65023_LDO_##_num,		\
+		.n_voltages     = ARRAY_SIZE(_t),		\
+		.ops		= &tps65023_ldo_ops,		\
+		.type		= REGULATOR_VOLTAGE,		\
+		.owner		= THIS_MODULE,			\
+		.volt_table	= _t,				\
+		.vsel_reg	= TPS65023_REG_LDO_CTRL,	\
+		.vsel_mask	= _vm,				\
+		.enable_mask	= 1 << (_num),			\
+		.enable_reg	= TPS65023_REG_REG_CTRL,	\
+	}							\
+
 /* Supported voltage values for regulators */
 static const unsigned int VCORE_VSEL_table[] = {
 	800000, 825000, 850000, 875000,
@@ -124,25 +160,16 @@ static const unsigned int TPS65023_LDO2_VSEL_table[] = {
 	2500000, 2800000, 3000000, 3300000,
 };
 
-/* Regulator specific details */
-struct tps_info {
-	const char *name;
-	u8 table_len;
-	const unsigned int *table;
-};
-
 /* PMIC details */
 struct tps_pmic {
-	struct regulator_desc desc[TPS65023_NUM_REGULATOR];
 	struct regulator_dev *rdev[TPS65023_NUM_REGULATOR];
-	const struct tps_info *info[TPS65023_NUM_REGULATOR];
+	const struct tps_driver_data *driver_data;
 	struct regmap *regmap;
-	u8 core_regulator;
 };
 
 /* Struct passed as driver data */
 struct tps_driver_data {
-	const struct tps_info *info;
+	const struct regulator_desc *desc;
 	u8 core_regulator;
 };
 
@@ -154,7 +181,7 @@ static int tps65023_dcdc_get_voltage_sel(struct regulator_dev *dev)
 	if (dcdc < TPS65023_DCDC_1 || dcdc > TPS65023_DCDC_3)
 		return -EINVAL;
 
-	if (dcdc != tps->core_regulator)
+	if (dcdc != tps->driver_data->core_regulator)
 		return 0;
 
 	return regulator_get_voltage_sel_regmap(dev);
@@ -166,7 +193,7 @@ static int tps65023_dcdc_set_voltage_sel(struct regulator_dev *dev,
 	struct tps_pmic *tps = rdev_get_drvdata(dev);
 	int dcdc = rdev_get_id(dev);
 
-	if (dcdc != tps->core_regulator)
+	if (dcdc != tps->driver_data->core_regulator)
 		return -EINVAL;
 
 	return regulator_set_voltage_sel_regmap(dev, selector);
@@ -199,30 +226,60 @@ static const struct regmap_config tps65023_regmap_config = {
 	.val_bits = 8,
 };
 
+static const struct regulator_desc tps65020_regulators[] = {
+	TPS65023_REGULATOR_DCDC(1, DCDC_FIXED_3300000_VSEL_table, 0x20),
+	TPS65023_REGULATOR_DCDC(2, DCDC_FIXED_1800000_VSEL_table, 0x10),
+	TPS65023_REGULATOR_DCDC(3, VCORE_VSEL_table, 0x08),
+	TPS65023_REGULATOR_LDO(1, TPS65020_LDO_VSEL_table, 0x07),
+	TPS65023_REGULATOR_LDO(2, TPS65020_LDO_VSEL_table, 0x70),
+};
+
+static const struct regulator_desc tps65021_regulators[] = {
+	TPS65023_REGULATOR_DCDC(1, DCDC_FIXED_3300000_VSEL_table, 0x20),
+	TPS65023_REGULATOR_DCDC(2, DCDC_FIXED_1800000_VSEL_table, 0x10),
+	TPS65023_REGULATOR_DCDC(3, VCORE_VSEL_table, 0x08),
+	TPS65023_REGULATOR_LDO(1, TPS65023_LDO1_VSEL_table, 0x07),
+	TPS65023_REGULATOR_LDO(2, TPS65023_LDO2_VSEL_table, 0x70),
+};
+
+static const struct regulator_desc tps65023_regulators[] = {
+	TPS65023_REGULATOR_DCDC(1, VCORE_VSEL_table, 0x20),
+	TPS65023_REGULATOR_DCDC(2, DCDC_FIXED_3300000_VSEL_table, 0x10),
+	TPS65023_REGULATOR_DCDC(3, DCDC_FIXED_1800000_VSEL_table, 0x08),
+	TPS65023_REGULATOR_LDO(1, TPS65023_LDO1_VSEL_table, 0x07),
+	TPS65023_REGULATOR_LDO(2, TPS65023_LDO2_VSEL_table, 0x70),
+};
+
+static struct tps_driver_data tps65020_drv_data = {
+	.desc = tps65020_regulators,
+	.core_regulator = TPS65023_DCDC_3,
+};
+
+static struct tps_driver_data tps65021_drv_data = {
+	.desc = tps65021_regulators,
+	.core_regulator = TPS65023_DCDC_3,
+};
+
+static struct tps_driver_data tps65023_drv_data = {
+	.desc = tps65023_regulators,
+	.core_regulator = TPS65023_DCDC_1,
+};
+
 static int tps_65023_probe(struct i2c_client *client,
 				     const struct i2c_device_id *id)
 {
-	const struct tps_driver_data *drv_data = (void *)id->driver_data;
-	const struct tps_info *info = drv_data->info;
+	struct regulator_init_data *init_data = dev_get_platdata(&client->dev);
 	struct regulator_config config = { };
-	struct regulator_init_data *init_data;
-	struct regulator_dev *rdev;
 	struct tps_pmic *tps;
 	int i;
 	int error;
 
-	/**
-	 * init_data points to array of regulator_init structures
-	 * coming from the board-evm file.
-	 */
-	init_data = dev_get_platdata(&client->dev);
-	if (!init_data)
-		return -EIO;
-
 	tps = devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
 	if (!tps)
 		return -ENOMEM;
 
+	tps->driver_data = (struct tps_driver_data *)id->driver_data;
+
 	tps->regmap = devm_regmap_init_i2c(client, &tps65023_regmap_config);
 	if (IS_ERR(tps->regmap)) {
 		error = PTR_ERR(tps->regmap);
@@ -232,58 +289,22 @@ static int tps_65023_probe(struct i2c_client *client,
 	}
 
 	/* common for all regulators */
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
+	config.dev = &client->dev;
+	config.driver_data = tps;
+	config.regmap = tps->regmap;
 
-		config.dev = &client->dev;
-		config.init_data = init_data;
-		config.driver_data = tps;
-		config.regmap = tps->regmap;
+	for (i = 0; i < TPS65023_NUM_REGULATOR; i++) {
+		if (init_data)
+			config.init_data = &init_data[i];
 
 		/* Register the regulators */
-		rdev = devm_regulator_register(&client->dev, &tps->desc[i],
-					       &config);
-		if (IS_ERR(rdev)) {
+		tps->rdev[i] = devm_regulator_register(&client->dev,
+					&tps->driver_data->desc[i], &config);
+		if (IS_ERR(tps->rdev[i])) {
 			dev_err(&client->dev, "failed to register %s\n",
 				id->name);
-			return PTR_ERR(rdev);
+			return PTR_ERR(tps->rdev[i]);
 		}
-
-		/* Save regulator for cleanup */
-		tps->rdev[i] = rdev;
 	}
 
 	i2c_set_clientdata(client, tps);
@@ -296,120 +317,33 @@ static int tps_65023_probe(struct i2c_client *client,
 	return 0;
 }
 
-static const struct tps_info tps65020_regs[] = {
-	{
-		.name = "VDCDC1",
-		.table_len = ARRAY_SIZE(DCDC_FIXED_3300000_VSEL_table),
-		.table = DCDC_FIXED_3300000_VSEL_table,
-	},
-	{
-		.name = "VDCDC2",
-		.table_len = ARRAY_SIZE(DCDC_FIXED_1800000_VSEL_table),
-		.table = DCDC_FIXED_1800000_VSEL_table,
-	},
-	{
-		.name = "VDCDC3",
-		.table_len = ARRAY_SIZE(VCORE_VSEL_table),
-		.table = VCORE_VSEL_table,
-	},
-	{
-		.name = "LDO1",
-		.table_len = ARRAY_SIZE(TPS65020_LDO_VSEL_table),
-		.table = TPS65020_LDO_VSEL_table,
-	},
-	{
-		.name = "LDO2",
-		.table_len = ARRAY_SIZE(TPS65020_LDO_VSEL_table),
-		.table = TPS65020_LDO_VSEL_table,
-	},
-};
-
-static const struct tps_info tps65021_regs[] = {
-	{
-		.name = "VDCDC1",
-		.table_len = ARRAY_SIZE(DCDC_FIXED_3300000_VSEL_table),
-		.table = DCDC_FIXED_3300000_VSEL_table,
-	},
-	{
-		.name = "VDCDC2",
-		.table_len = ARRAY_SIZE(DCDC_FIXED_1800000_VSEL_table),
-		.table = DCDC_FIXED_1800000_VSEL_table,
-	},
-	{
-		.name = "VDCDC3",
-		.table_len = ARRAY_SIZE(VCORE_VSEL_table),
-		.table = VCORE_VSEL_table,
-	},
-	{
-		.name = "LDO1",
-		.table_len = ARRAY_SIZE(TPS65023_LDO1_VSEL_table),
-		.table = TPS65023_LDO1_VSEL_table,
-	},
-	{
-		.name = "LDO2",
-		.table_len = ARRAY_SIZE(TPS65023_LDO2_VSEL_table),
-		.table = TPS65023_LDO2_VSEL_table,
-	},
+static const struct of_device_id tps65023_of_match[] = {
+	{ .compatible = "ti,tps65020", .data = &tps65020_drv_data},
+	{ .compatible = "ti,tps65021", .data = &tps65021_drv_data},
+	{ .compatible = "ti,tps65023", .data = &tps65023_drv_data},
+	{},
 };
+MODULE_DEVICE_TABLE(of, tps65023_of_match);
 
-static const struct tps_info tps65023_regs[] = {
-	{
-		.name = "VDCDC1",
-		.table_len = ARRAY_SIZE(VCORE_VSEL_table),
-		.table = VCORE_VSEL_table,
-	},
-	{
-		.name = "VDCDC2",
-		.table_len = ARRAY_SIZE(DCDC_FIXED_3300000_VSEL_table),
-		.table = DCDC_FIXED_3300000_VSEL_table,
-	},
-	{
-		.name = "VDCDC3",
-		.table_len = ARRAY_SIZE(DCDC_FIXED_1800000_VSEL_table),
-		.table = DCDC_FIXED_1800000_VSEL_table,
-	},
-	{
-		.name = "LDO1",
-		.table_len = ARRAY_SIZE(TPS65023_LDO1_VSEL_table),
-		.table = TPS65023_LDO1_VSEL_table,
-	},
+static const struct i2c_device_id tps_65023_id[] = {
 	{
-		.name = "LDO2",
-		.table_len = ARRAY_SIZE(TPS65023_LDO2_VSEL_table),
-		.table = TPS65023_LDO2_VSEL_table,
+		.name = "tps65023",
+		.driver_data = (kernel_ulong_t)&tps65023_drv_data
+	}, {
+		.name = "tps65021",
+		.driver_data = (kernel_ulong_t)&tps65021_drv_data
+	}, {
+		.name = "tps65020",
+		.driver_data = (kernel_ulong_t)&tps65020_drv_data
 	},
-};
-
-static struct tps_driver_data tps65020_drv_data = {
-	.info = tps65020_regs,
-	.core_regulator = TPS65023_DCDC_3,
-};
-
-static struct tps_driver_data tps65021_drv_data = {
-	.info = tps65021_regs,
-	.core_regulator = TPS65023_DCDC_3,
-};
-
-static struct tps_driver_data tps65023_drv_data = {
-	.info = tps65023_regs,
-	.core_regulator = TPS65023_DCDC_1,
-};
-
-static const struct i2c_device_id tps_65023_id[] = {
-	{.name = "tps65023",
-	.driver_data = (unsigned long) &tps65023_drv_data},
-	{.name = "tps65021",
-	.driver_data = (unsigned long) &tps65021_drv_data,},
-	{.name = "tps65020",
-	.driver_data = (unsigned long) &tps65020_drv_data},
 	{ },
 };
-
 MODULE_DEVICE_TABLE(i2c, tps_65023_id);
 
 static struct i2c_driver tps_65023_i2c_driver = {
 	.driver = {
 		.name = "tps65023",
+		.of_match_table = of_match_ptr(tps65023_of_match),
 	},
 	.probe = tps_65023_probe,
 	.id_table = tps_65023_id,
-- 
2.3.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
