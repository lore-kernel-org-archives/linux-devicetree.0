From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] regulator: act8865: Add act8600 support
Date: Fri, 27 Feb 2015 17:04:04 +0000
Message-ID: <1425056644-29334-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds act8600 support to the act8865 driver.

VBUS and USB charger supported by this chip can be added later

Tested on MIPS Creator CI20

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

---

I've tried to be least intrusive.

But can't use the macro because of differences in SUDCDC and LDO9/10

Tried adding more variation in the macro but it resulted in unnecessary
complexity for the other chips.

Patch based on 4.0-rc1

Tested on MIPS Creator CI20

Cheers,
ZubairLK
---
 .../bindings/regulator/act8865-regulator.txt       |   5 +-
 drivers/regulator/act8865-regulator.c              | 120 ++++++++++++++++++++-
 include/linux/regulator/act8865.h                  |  14 +++
 3 files changed, 137 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/act8865-regulator.txt b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
index dad6358..e170df2 100644
--- a/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
@@ -2,7 +2,7 @@ ACT88xx regulators
 -------------------
 
 Required properties:
-- compatible: "active-semi,act8846" or "active-semi,act8865"
+- compatible: "active-semi,act8846" or "active-semi,act8865" or "active-semi,act8600"
 - reg: I2C slave address
 
 Optional properties:
@@ -16,6 +16,9 @@ The valid names for regulators are:
 	REG1, REG2, REG3, REG4, REG5, REG6, REG7, REG8, REG9, REG10, REG11, REG12
 	- for act8865:
 	DCDC_REG1, DCDC_REG2, DCDC_REG3, LDO_REG1, LDO_REG2, LDO_REG3, LDO_REG4.
+	- for act8600:
+	DCDC_REG1, DCDC_REG2, DCDC_REG3, SUDCDC_REG4, LDO_REG5, LDO_REG6, LDO_REG7,
+	LDO_REG8, LDO_REG9, LDO_REG10,
 
 Example:
 --------
diff --git a/drivers/regulator/act8865-regulator.c b/drivers/regulator/act8865-regulator.c
index 9eec453..3781f6e 100644
--- a/drivers/regulator/act8865-regulator.c
+++ b/drivers/regulator/act8865-regulator.c
@@ -29,6 +29,35 @@
 #include <linux/regmap.h>
 
 /*
+ * ACT8600 Global Register Map.
+ */
+#define ACT8600_SYS_MODE	0x00
+#define ACT8600_SYS_CTRL	0x01
+#define ACT8600_DCDC1_VSET	0x10
+#define ACT8600_DCDC1_CTRL	0x12
+#define ACT8600_DCDC2_VSET	0x20
+#define ACT8600_DCDC2_CTRL	0x22
+#define ACT8600_DCDC3_VSET	0x30
+#define ACT8600_DCDC3_CTRL	0x32
+#define ACT8600_SUDCDC4_VSET	0x40
+#define ACT8600_SUDCDC4_CTRL	0x41
+#define ACT8600_LDO5_VSET	0x50
+#define ACT8600_LDO5_CTRL	0x51
+#define ACT8600_LDO6_VSET	0x60
+#define ACT8600_LDO6_CTRL	0x61
+#define ACT8600_LDO7_VSET	0x70
+#define ACT8600_LDO7_CTRL	0x71
+#define ACT8600_LDO8_VSET	0x80
+#define ACT8600_LDO8_CTRL	0x81
+#define ACT8600_LDO910_CTRL	0x91
+#define ACT8600_APCH0		0xA1
+#define ACT8600_APCH1		0xA8
+#define ACT8600_APCH2		0xA9
+#define ACT8600_APCH_STAT	0xAA
+#define ACT8600_OTG0		0xB0
+#define ACT8600_OTG1		0xB2
+
+/*
  * ACT8846 Global Register Map.
  */
 #define	ACT8846_SYS0		0x00
@@ -94,10 +123,15 @@
 #define	ACT8865_ENA		0x80	/* ON - [7] */
 #define	ACT8865_VSEL_MASK	0x3F	/* VSET - [5:0] */
 
+
+#define ACT8600_LDO10_ENA		0x40	/* ON - [6] */
+#define ACT8600_SUDCDC_VSEL_MASK	0xFF	/* SUDCDC VSET - [7:0] */
+
 /*
  * ACT8865 voltage number
  */
 #define	ACT8865_VOLTAGE_NUM	64
+#define ACT8600_SUDCDC_VOLTAGE_NUM	255
 
 struct act8865 {
 	struct regmap *regmap;
@@ -116,6 +150,13 @@ static const struct regulator_linear_range act8865_voltage_ranges[] = {
 	REGULATOR_LINEAR_RANGE(2400000, 48, 63, 100000),
 };
 
+static const struct regulator_linear_range act8600_sudcdc_voltage_ranges[] = {
+	REGULATOR_LINEAR_RANGE(3000000, 0, 63, 0),
+	REGULATOR_LINEAR_RANGE(3000000, 64, 159, 100000),
+	REGULATOR_LINEAR_RANGE(12600000, 160, 191, 200000),
+	REGULATOR_LINEAR_RANGE(19000000, 191, 255, 400000),
+};
+
 static struct regulator_ops act8865_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.map_voltage		= regulator_map_voltage_linear_range,
@@ -126,6 +167,12 @@ static struct regulator_ops act8865_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 };
 
+static struct regulator_ops act8865_ldo_ops = {
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+};
+
 #define ACT88xx_REG(_name, _family, _id, _vsel_reg)			\
 	[_family##_ID_##_id] = {					\
 		.name			= _name,			\
@@ -142,6 +189,52 @@ static struct regulator_ops act8865_ops = {
 		.owner			= THIS_MODULE,			\
 	}
 
+static const struct regulator_desc act8600_regulators[] = {
+	ACT88xx_REG("DCDC1", ACT8600, DCDC1, VSET),
+	ACT88xx_REG("DCDC2", ACT8600, DCDC2, VSET),
+	ACT88xx_REG("DCDC3", ACT8600, DCDC3, VSET),
+	{
+		.name = "SUDCDC_REG4",
+		.id = ACT8600_ID_SUDCDC4,
+		.ops = &act8865_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = ACT8600_SUDCDC_VOLTAGE_NUM,
+		.linear_ranges = act8600_sudcdc_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(act8600_sudcdc_voltage_ranges),
+		.vsel_reg = ACT8600_SUDCDC4_VSET,
+		.vsel_mask = ACT8600_SUDCDC_VSEL_MASK,
+		.enable_reg = ACT8600_SUDCDC4_CTRL,
+		.enable_mask = ACT8865_ENA,
+		.owner = THIS_MODULE,
+	},
+	ACT88xx_REG("LDO5", ACT8600, LDO5, VSET),
+	ACT88xx_REG("LDO6", ACT8600, LDO6, VSET),
+	ACT88xx_REG("LDO7", ACT8600, LDO7, VSET),
+	ACT88xx_REG("LDO8", ACT8600, LDO8, VSET),
+	{
+		.name = "LDO_REG9",
+		.id = ACT8600_ID_LDO9,
+		.ops = &act8865_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 1,
+		.fixed_uV = 1800000,
+		.enable_reg = ACT8600_LDO910_CTRL,
+		.enable_mask = ACT8865_ENA,
+		.owner = THIS_MODULE,
+	},
+	{
+		.name = "LDO_REG10",
+		.id = ACT8600_ID_LDO10,
+		.ops = &act8865_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 1,
+		.fixed_uV = 1200000,
+		.enable_reg = ACT8600_LDO910_CTRL,
+		.enable_mask = ACT8600_LDO10_ENA,
+		.owner = THIS_MODULE,
+	},
+};
+
 static const struct regulator_desc act8846_regulators[] = {
 	ACT88xx_REG("REG1", ACT8846, REG1, VSET),
 	ACT88xx_REG("REG2", ACT8846, REG2, VSET0),
@@ -169,6 +262,7 @@ static const struct regulator_desc act8865_regulators[] = {
 
 #ifdef CONFIG_OF
 static const struct of_device_id act8865_dt_ids[] = {
+	{ .compatible = "active-semi,act8600", .data = (void *)ACT8600 },
 	{ .compatible = "active-semi,act8846", .data = (void *)ACT8846 },
 	{ .compatible = "active-semi,act8865", .data = (void *)ACT8865 },
 	{ }
@@ -200,6 +294,19 @@ static struct of_regulator_match act8865_matches[] = {
 	[ACT8865_ID_LDO4]	= { .name = "LDO_REG4"},
 };
 
+static struct of_regulator_match act8600_matches[] = {
+	[ACT8600_ID_DCDC1]	= { .name = "DCDC_REG1"},
+	[ACT8600_ID_DCDC2]	= { .name = "DCDC_REG2"},
+	[ACT8600_ID_DCDC3]	= { .name = "DCDC_REG3"},
+	[ACT8600_ID_SUDCDC4]	= { .name = "SUDCDC_REG4"},
+	[ACT8600_ID_LDO5]	= { .name = "LDO_REG5"},
+	[ACT8600_ID_LDO6]	= { .name = "LDO_REG6"},
+	[ACT8600_ID_LDO7]	= { .name = "LDO_REG7"},
+	[ACT8600_ID_LDO8]	= { .name = "LDO_REG8"},
+	[ACT8600_ID_LDO9]	= { .name = "LDO_REG9"},
+	[ACT8600_ID_LDO10]	= { .name = "LDO_REG10"},
+};
+
 static int act8865_pdata_from_dt(struct device *dev,
 				 struct device_node **of_node,
 				 struct act8865_platform_data *pdata,
@@ -217,6 +324,10 @@ static int act8865_pdata_from_dt(struct device *dev,
 	}
 
 	switch (type) {
+	case ACT8600:
+		matches = act8600_matches;
+		num_matches = ARRAY_SIZE(act8600_matches);
+		break;
 	case ACT8846:
 		matches = act8846_matches;
 		num_matches = ARRAY_SIZE(act8846_matches);
@@ -317,6 +428,12 @@ static int act8865_pmic_probe(struct i2c_client *client,
 	}
 
 	switch (type) {
+	case ACT8600:
+		regulators = act8600_regulators;
+		num_regulators = ARRAY_SIZE(act8600_regulators);
+		off_reg = -1;
+		off_mask = -1;
+		break;
 	case ACT8846:
 		regulators = act8846_regulators;
 		num_regulators = ARRAY_SIZE(act8846_regulators);
@@ -366,7 +483,7 @@ static int act8865_pmic_probe(struct i2c_client *client,
 	}
 
 	if (of_device_is_system_power_controller(dev->of_node)) {
-		if (!pm_power_off) {
+		if (!pm_power_off && (off_reg > 0)) {
 			act8865_i2c_client = client;
 			act8865->off_reg = off_reg;
 			act8865->off_mask = off_mask;
@@ -402,6 +519,7 @@ static int act8865_pmic_probe(struct i2c_client *client,
 }
 
 static const struct i2c_device_id act8865_ids[] = {
+	{ .name = "act8600", .driver_data = ACT8600 },
 	{ .name = "act8846", .driver_data = ACT8846 },
 	{ .name = "act8865", .driver_data = ACT8865 },
 	{ },
diff --git a/include/linux/regulator/act8865.h b/include/linux/regulator/act8865.h
index b6c4909..15fa8f2 100644
--- a/include/linux/regulator/act8865.h
+++ b/include/linux/regulator/act8865.h
@@ -19,6 +19,19 @@
 #include <linux/regulator/machine.h>
 
 enum {
+	ACT8600_ID_DCDC1,
+	ACT8600_ID_DCDC2,
+	ACT8600_ID_DCDC3,
+	ACT8600_ID_SUDCDC4,
+	ACT8600_ID_LDO5,
+	ACT8600_ID_LDO6,
+	ACT8600_ID_LDO7,
+	ACT8600_ID_LDO8,
+	ACT8600_ID_LDO9,
+	ACT8600_ID_LDO10,
+};
+
+enum {
 	ACT8865_ID_DCDC1,
 	ACT8865_ID_DCDC2,
 	ACT8865_ID_DCDC3,
@@ -46,6 +59,7 @@ enum {
 };
 
 enum {
+	ACT8600,
 	ACT8865,
 	ACT8846,
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
