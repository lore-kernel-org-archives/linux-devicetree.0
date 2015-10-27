From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v4] regulator: tps6520x: add dt support for tps6502x regulator
Date: Tue, 27 Oct 2015 13:18:12 +0100
Message-ID: <1445948292-10151-1-git-send-email-hs@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

add DT support for the tps6502x regulators.

Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
---

Changes in v4:
- add comment from Mark Brown:
- adapt subject line to "regulator: tps6520x:"
- use the generic support for locating the DT information
  for regulators using regulators_node and of_match in the
  regulator_desc. Could only test DT support. As this
  touches also platform code handling, it would be good
  to have a "Tested-by" from someone who can test it on
  a platform based board ...

Changes in v3:
- fold kbuild patch:
  regulator, dt: fix platform_no_drv_owner.cocci warnings
  into this patch
  No need to set .owner here. The core will do it.

Changes in v2:
- add comment from kbuild test robot
  - tps6502x_parse_dt_data() can be static
- add comment from Mark Brown:
  - remove arch/arm/boot/dts/tps65023.dtsi
  - do not use "regulator-compatible"

 .../devicetree/bindings/regulator/tps6502x.txt     |  61 ++++
 drivers/regulator/tps65023-regulator.c             | 324 ++++++++++++---------
 2 files changed, 246 insertions(+), 139 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/tps6502x.txt

diff --git a/Documentation/devicetree/bindings/regulator/tps6502x.txt b/Documentation/devicetree/bindings/regulator/tps6502x.txt
new file mode 100644
index 0000000..dfb23d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/tps6502x.txt
@@ -0,0 +1,61 @@
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
+Each regulator is defined using the standard binding for regulators.
+
+Example:
+
+	tps: tps@48 {
+		compatible = "ti,tps65023";
+
+		regulators {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			vdcdc1_reg: vdcdc1 {
+				reg = <0>;
+				regulator-name = "vdd_core";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+			};
+			vdcdc2_reg: vdcdc2 {
+				reg = <1>;
+				regulator-name = "vddshv";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+			vdcdc3_reg: vdcdc3 {
+				reg = <2>;
+				regulator-name = "vdds";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+			vldo1_reg: ldo1 {
+				reg = <3>;
+				regulator-name = "vdda1p8v_usbphy";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+			vldo2_reg: ldo2 {
+				reg = <4>;
+				regulator-name = "vdda3p3v_usbphy";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+		};
+	};
diff --git a/drivers/regulator/tps65023-regulator.c b/drivers/regulator/tps65023-regulator.c
index 5cc19b4..ffeb3b5 100644
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
@@ -86,6 +90,44 @@
 
 #define TPS65023_MAX_REG_ID		TPS65023_LDO_2
 
+#define TPS65023_REGULATOR(_name, _id, _of_match, _ops, _n, _vr, _vm, _em, \
+			   _t) \
+	{						\
+		.name		= _name,		\
+		.id		= _id,			\
+		.of_match       = of_match_ptr(_of_match),    \
+		.regulators_node = of_match_ptr("regulators"), \
+		.ops		= &_ops,		\
+		.n_voltages	= _n,			\
+		.type		= REGULATOR_VOLTAGE,	\
+		.owner		= THIS_MODULE,		\
+		.vsel_reg	= _vr,			\
+		.vsel_mask	= _vm,			\
+		.enable_reg	= TPS65023_REG_REG_CTRL,\
+		.enable_mask	= _em,			\
+		.volt_table	= _t,			\
+	}						\
+
+#define TPS65023_REGULATOR_DCDX(_name, _id, _of_match, _ops, _n, _vr, _vm, \
+				_em, _ar, _ab, _t) \
+	{						\
+		.name		= _name,		\
+		.id		= _id,			\
+		.of_match       = of_match_ptr(_of_match),    \
+		.regulators_node = of_match_ptr("regulators"), \
+		.ops		= &_ops,		\
+		.n_voltages	= _n,			\
+		.type		= REGULATOR_VOLTAGE,	\
+		.owner		= THIS_MODULE,		\
+		.vsel_reg	= _vr,			\
+		.vsel_mask	= _vm,			\
+		.enable_reg	= TPS65023_REG_REG_CTRL,\
+		.enable_mask	= _em,			\
+		.apply_reg	= _ar,			\
+		.apply_bit	= _ab,			\
+		.volt_table	= _t,			\
+	}						\
+
 /* Supported voltage values for regulators */
 static const unsigned int VCORE_VSEL_table[] = {
 	800000, 825000, 850000, 875000,
@@ -124,25 +166,24 @@ static const unsigned int TPS65023_LDO2_VSEL_table[] = {
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
 	struct regulator_desc desc[TPS65023_NUM_REGULATOR];
 	struct regulator_dev *rdev[TPS65023_NUM_REGULATOR];
-	const struct tps_info *info[TPS65023_NUM_REGULATOR];
 	struct regmap *regmap;
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
-	const struct tps_info *info;
+	enum tps6502x_id id;
+	const struct regulator_desc *regulators;
 	u8 core_regulator;
 };
 
@@ -199,11 +240,119 @@ static const struct regmap_config tps65023_regmap_config = {
 	.val_bits = 8,
 };
 
+static const struct regulator_desc regulators_65020[] = {
+	TPS65023_REGULATOR_DCDX("DCDC1", TPS65023_DCDC_1, "dcdc1",
+			   tps65023_dcdc_ops,
+			   ARRAY_SIZE(DCDC_FIXED_3300000_VSEL_table),
+			   TPS65023_REG_DEF_CORE,
+			   ARRAY_SIZE(DCDC_FIXED_3300000_VSEL_table) - 1,
+			   1 << (TPS65023_NUM_REGULATOR - 0),
+			   TPS65023_REG_CON_CTRL2, TPS65023_REG_CTRL2_GO,
+			   DCDC_FIXED_3300000_VSEL_table),
+	TPS65023_REGULATOR_DCDX("DCDC2", TPS65023_DCDC_2, "dcdc2",
+			   tps65023_dcdc_ops,
+			   ARRAY_SIZE(DCDC_FIXED_1800000_VSEL_table),
+			   TPS65023_REG_DEF_CORE,
+			   ARRAY_SIZE(DCDC_FIXED_1800000_VSEL_table) - 1,
+			   1 << (TPS65023_NUM_REGULATOR - 1),
+			   TPS65023_REG_CON_CTRL2, TPS65023_REG_CTRL2_GO,
+			   DCDC_FIXED_1800000_VSEL_table),
+	TPS65023_REGULATOR_DCDX("DCDC3", TPS65023_DCDC_3, "dcdc3",
+			   tps65023_dcdc_ops, ARRAY_SIZE(VCORE_VSEL_table),
+			   TPS65023_REG_DEF_CORE,
+			   ARRAY_SIZE(VCORE_VSEL_table) - 1,
+			   1 << (TPS65023_NUM_REGULATOR - 2),
+			   TPS65023_REG_CON_CTRL2, TPS65023_REG_CTRL2_GO,
+			   VCORE_VSEL_table),
+	TPS65023_REGULATOR("LDO1", TPS65023_LDO_1, "ldo1",
+			   tps65023_ldo_ops,
+			   ARRAY_SIZE(TPS65020_LDO_VSEL_table),
+			   TPS65023_REG_LDO_CTRL,
+			   0x07, 1 << 1, TPS65020_LDO_VSEL_table),
+	TPS65023_REGULATOR("LDO2", TPS65023_LDO_2, "ldo2",
+			   tps65023_ldo_ops,
+			   ARRAY_SIZE(TPS65020_LDO_VSEL_table),
+			   TPS65023_REG_LDO_CTRL,
+			   0x70, 1 << 2, TPS65020_LDO_VSEL_table),
+};
+
+static const struct regulator_desc regulators_65021[] = {
+	TPS65023_REGULATOR_DCDX("DCDC1", TPS65023_DCDC_1, "dcdc1",
+			   tps65023_dcdc_ops,
+			   ARRAY_SIZE(DCDC_FIXED_3300000_VSEL_table),
+			   TPS65023_REG_DEF_CORE,
+			   ARRAY_SIZE(DCDC_FIXED_3300000_VSEL_table) - 1,
+			   1 << (TPS65023_NUM_REGULATOR - 0),
+			   TPS65023_REG_CON_CTRL2, TPS65023_REG_CTRL2_GO,
+			   DCDC_FIXED_3300000_VSEL_table),
+	TPS65023_REGULATOR_DCDX("DCDC2", TPS65023_DCDC_2, "dcdc2",
+			   tps65023_dcdc_ops,
+			   ARRAY_SIZE(DCDC_FIXED_1800000_VSEL_table),
+			   TPS65023_REG_DEF_CORE,
+			   ARRAY_SIZE(DCDC_FIXED_1800000_VSEL_table) - 1,
+			   1 << (TPS65023_NUM_REGULATOR - 1),
+			   TPS65023_REG_CON_CTRL2, TPS65023_REG_CTRL2_GO,
+			   DCDC_FIXED_1800000_VSEL_table),
+	TPS65023_REGULATOR_DCDX("DCDC3", TPS65023_DCDC_3, "dcdc3",
+			   tps65023_dcdc_ops, ARRAY_SIZE(VCORE_VSEL_table),
+			   TPS65023_REG_DEF_CORE,
+			   ARRAY_SIZE(VCORE_VSEL_table) - 1,
+			   1 << (TPS65023_NUM_REGULATOR - 2),
+			   TPS65023_REG_CON_CTRL2, TPS65023_REG_CTRL2_GO,
+			   VCORE_VSEL_table),
+	TPS65023_REGULATOR("LDO1", TPS65023_LDO_1, "ldo1",
+			   tps65023_ldo_ops,
+			   ARRAY_SIZE(TPS65023_LDO1_VSEL_table),
+			   TPS65023_REG_LDO_CTRL,
+			   0x07, 1 << 1, TPS65023_LDO1_VSEL_table),
+	TPS65023_REGULATOR("LDO2", TPS65023_LDO_2, "ldo2",
+			   tps65023_ldo_ops,
+			   ARRAY_SIZE(TPS65023_LDO2_VSEL_table),
+			   TPS65023_REG_LDO_CTRL,
+			   0x70, 1 << 2, TPS65023_LDO2_VSEL_table),
+};
+
+static const struct regulator_desc regulators_65023[] = {
+	TPS65023_REGULATOR_DCDX("DCDC1", TPS65023_DCDC_1, "dcdc1",
+			   tps65023_dcdc_ops,
+			   ARRAY_SIZE(VCORE_VSEL_table),
+			   TPS65023_REG_DEF_CORE,
+			   ARRAY_SIZE(VCORE_VSEL_table) - 1,
+			   1 << (TPS65023_NUM_REGULATOR - 0),
+			   TPS65023_REG_CON_CTRL2, TPS65023_REG_CTRL2_GO,
+			   VCORE_VSEL_table),
+	TPS65023_REGULATOR_DCDX("DCDC2", TPS65023_DCDC_2, "dcdc2",
+			   tps65023_dcdc_ops,
+			   ARRAY_SIZE(DCDC_FIXED_3300000_VSEL_table),
+			   TPS65023_REG_DEF_CORE,
+			   ARRAY_SIZE(DCDC_FIXED_3300000_VSEL_table) - 1,
+			   1 << (TPS65023_NUM_REGULATOR - 1),
+			   TPS65023_REG_CON_CTRL2, TPS65023_REG_CTRL2_GO,
+			   DCDC_FIXED_3300000_VSEL_table),
+	TPS65023_REGULATOR_DCDX("DCDC3", TPS65023_DCDC_3, "dcdc3",
+			   tps65023_dcdc_ops,
+			   ARRAY_SIZE(DCDC_FIXED_1800000_VSEL_table),
+			   TPS65023_REG_DEF_CORE,
+			   ARRAY_SIZE(DCDC_FIXED_1800000_VSEL_table) - 1,
+			   1 << (TPS65023_NUM_REGULATOR - 2),
+			   TPS65023_REG_CON_CTRL2, TPS65023_REG_CTRL2_GO,
+			   DCDC_FIXED_1800000_VSEL_table),
+	TPS65023_REGULATOR("LDO1", TPS65023_LDO_1, "ldo1",
+			   tps65023_ldo_ops,
+			   ARRAY_SIZE(TPS65023_LDO1_VSEL_table),
+			   TPS65023_REG_LDO_CTRL,
+			   0x07, 1 << 1, TPS65023_LDO1_VSEL_table),
+	TPS65023_REGULATOR("LDO2", TPS65023_LDO_2, "ldo2",
+			   tps65023_ldo_ops,
+			   ARRAY_SIZE(TPS65023_LDO2_VSEL_table),
+			   TPS65023_REG_LDO_CTRL,
+			   0x70, 1 << 2, TPS65023_LDO2_VSEL_table),
+};
+
 static int tps_65023_probe(struct i2c_client *client,
 				     const struct i2c_device_id *id)
 {
 	const struct tps_driver_data *drv_data = (void *)id->driver_data;
-	const struct tps_info *info = drv_data->info;
 	struct regulator_config config = { };
 	struct regulator_init_data *init_data;
 	struct regulator_dev *rdev;
@@ -216,8 +365,6 @@ static int tps_65023_probe(struct i2c_client *client,
 	 * coming from the board-evm file.
 	 */
 	init_data = dev_get_platdata(&client->dev);
-	if (!init_data)
-		return -EIO;
 
 	tps = devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
 	if (!tps)
@@ -234,54 +381,23 @@ static int tps_65023_probe(struct i2c_client *client,
 	/* common for all regulators */
 	tps->core_regulator = drv_data->core_regulator;
 
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
+	for (i = 0; i < TPS65023_NUM_REGULATOR; i++) {
+		/* Register the regulators */
 		config.dev = &client->dev;
-		config.init_data = init_data;
+		if (init_data)
+			config.init_data = &init_data[i];
+
 		config.driver_data = tps;
 		config.regmap = tps->regmap;
 
-		/* Register the regulators */
-		rdev = devm_regulator_register(&client->dev, &tps->desc[i],
+		rdev = devm_regulator_register(&client->dev,
+					       &drv_data->regulators[i],
 					       &config);
 		if (IS_ERR(rdev)) {
-			dev_err(&client->dev, "failed to register %s\n",
-				id->name);
+			dev_err(&client->dev, "failed to register %s regulator\n",
+				drv_data->regulators[i].name);
 			return PTR_ERR(rdev);
 		}
-
 		/* Save regulator for cleanup */
 		tps->rdev[i] = rdev;
 	}
@@ -296,102 +412,21 @@ static int tps_65023_probe(struct i2c_client *client,
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
-};
-
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
-	{
-		.name = "LDO2",
-		.table_len = ARRAY_SIZE(TPS65023_LDO2_VSEL_table),
-		.table = TPS65023_LDO2_VSEL_table,
-	},
-};
-
 static struct tps_driver_data tps65020_drv_data = {
-	.info = tps65020_regs,
+	.id = TPS65020,
+	.regulators = regulators_65020,
 	.core_regulator = TPS65023_DCDC_3,
 };
 
 static struct tps_driver_data tps65021_drv_data = {
-	.info = tps65021_regs,
+	.id = TPS65021,
+	.regulators = regulators_65021,
 	.core_regulator = TPS65023_DCDC_3,
 };
 
 static struct tps_driver_data tps65023_drv_data = {
-	.info = tps65023_regs,
+	.id = TPS65023,
+	.regulators = regulators_65023,
 	.core_regulator = TPS65023_DCDC_1,
 };
 
@@ -407,9 +442,20 @@ static const struct i2c_device_id tps_65023_id[] = {
 
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
 static struct i2c_driver tps_65023_i2c_driver = {
 	.driver = {
 		.name = "tps65023",
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
