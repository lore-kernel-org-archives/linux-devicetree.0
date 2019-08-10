From: Raag Jadav <raagjadav@gmail.com>
Subject: [PATCH 1/2] regulator: act8865: operating mode and suspend state support
Date: Sat, 10 Aug 2019 13:18:54 +0530
Message-ID: <1565423335-3213-2-git-send-email-raagjadav@gmail.com>
References: <1565423335-3213-1-git-send-email-raagjadav@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565423335-3213-1-git-send-email-raagjadav@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Raag Jadav <raagjadav@gmail.com>
List-Id: devicetree@vger.kernel.org

Implement ->set_mode(), ->get_mode() and ->set_suspend_xx() hooks
for act8865 with unlocked expert registers.

Based on work done by Borris Brezillon on [1].
[1] https://www.spinics.net/lists/kernel/msg2942960.html

Signed-off-by: Raag Jadav <raagjadav@gmail.com>
---
 drivers/regulator/act8865-regulator.c | 160 +++++++++++++++++++++++++++++++++-
 include/linux/regulator/act8865.h     |   2 +-
 2 files changed, 160 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/act8865-regulator.c b/drivers/regulator/act8865-regulator.c
index 6a90d3c..df9b649 100644
--- a/drivers/regulator/act8865-regulator.c
+++ b/drivers/regulator/act8865-regulator.c
@@ -19,6 +19,7 @@
 #include <linux/power_supply.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/regmap.h>
+#include <dt-bindings/regulator/active-semi,8865-regulator.h>
 
 /*
  * ACT8600 Global Register Map.
@@ -90,23 +91,31 @@
  */
 #define	ACT8865_SYS_MODE	0x00
 #define	ACT8865_SYS_CTRL	0x01
+#define	ACT8865_SYS_UNLK_REGS	0x0b
 #define	ACT8865_DCDC1_VSET1	0x20
 #define	ACT8865_DCDC1_VSET2	0x21
 #define	ACT8865_DCDC1_CTRL	0x22
+#define	ACT8865_DCDC1_SUS	0x24
 #define	ACT8865_DCDC2_VSET1	0x30
 #define	ACT8865_DCDC2_VSET2	0x31
 #define	ACT8865_DCDC2_CTRL	0x32
+#define	ACT8865_DCDC2_SUS	0x34
 #define	ACT8865_DCDC3_VSET1	0x40
 #define	ACT8865_DCDC3_VSET2	0x41
 #define	ACT8865_DCDC3_CTRL	0x42
+#define	ACT8865_DCDC3_SUS	0x44
 #define	ACT8865_LDO1_VSET	0x50
 #define	ACT8865_LDO1_CTRL	0x51
+#define	ACT8865_LDO1_SUS	0x52
 #define	ACT8865_LDO2_VSET	0x54
 #define	ACT8865_LDO2_CTRL	0x55
+#define	ACT8865_LDO2_SUS	0x56
 #define	ACT8865_LDO3_VSET	0x60
 #define	ACT8865_LDO3_CTRL	0x61
+#define	ACT8865_LDO3_SUS	0x62
 #define	ACT8865_LDO4_VSET	0x64
 #define	ACT8865_LDO4_CTRL	0x65
+#define	ACT8865_LDO4_SUS	0x66
 #define	ACT8865_MSTROFF		0x20
 
 /*
@@ -136,6 +145,7 @@ struct act8865 {
 	struct regmap *regmap;
 	int off_reg;
 	int off_mask;
+	u32 op_mode[ACT8865_ID_MAX];
 };
 
 static const struct regmap_range act8600_reg_ranges[] = {
@@ -225,6 +235,143 @@ static const struct regulator_linear_range act8600_sudcdc_voltage_ranges[] = {
 	REGULATOR_LINEAR_RANGE(41400000, 248, 255, 0),
 };
 
+static int act8865_set_suspend_state(struct regulator_dev *rdev, bool enable)
+{
+	struct regmap *regmap = rdev->regmap;
+	int id = rdev->desc->id, reg, val;
+
+	switch (id) {
+	case ACT8865_ID_DCDC1:
+		reg = ACT8865_DCDC1_SUS;
+		val = 0xa8;
+		break;
+	case ACT8865_ID_DCDC2:
+		reg = ACT8865_DCDC2_SUS;
+		val = 0xa8;
+		break;
+	case ACT8865_ID_DCDC3:
+		reg = ACT8865_DCDC3_SUS;
+		val = 0xa8;
+		break;
+	case ACT8865_ID_LDO1:
+		reg = ACT8865_LDO1_SUS;
+		val = 0xe8;
+		break;
+	case ACT8865_ID_LDO2:
+		reg = ACT8865_LDO2_SUS;
+		val = 0xe8;
+		break;
+	case ACT8865_ID_LDO3:
+		reg = ACT8865_LDO3_SUS;
+		val = 0xe8;
+		break;
+	case ACT8865_ID_LDO4:
+		reg = ACT8865_LDO4_SUS;
+		val = 0xe8;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (enable)
+		val |= BIT(4);
+
+	/*
+	 * Ask the PMIC to enable/disable this output when entering hibernate
+	 * mode.
+	 */
+	return regmap_write(regmap, reg, val);
+}
+
+static int act8865_set_suspend_enable(struct regulator_dev *rdev)
+{
+	return act8865_set_suspend_state(rdev, true);
+}
+
+static int act8865_set_suspend_disable(struct regulator_dev *rdev)
+{
+	return act8865_set_suspend_state(rdev, false);
+}
+
+static unsigned int act8865_of_map_mode(unsigned int mode)
+{
+	switch (mode) {
+	case ACT8865_REGULATOR_MODE_FIXED:
+	case ACT8865_REGULATOR_MODE_NORMAL:
+		return REGULATOR_MODE_NORMAL;
+	case ACT8865_REGULATOR_MODE_LOWPOWER:
+		return REGULATOR_MODE_STANDBY;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
+static int act8865_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	struct act8865 *act8865 = rdev_get_drvdata(rdev);
+	struct regmap *regmap = rdev->regmap;
+	int id = rdev_get_id(rdev);
+	int reg, ret, val = 0;
+
+	switch (id) {
+	case ACT8865_ID_DCDC1:
+		reg = ACT8865_DCDC1_CTRL;
+		break;
+	case ACT8865_ID_DCDC2:
+		reg = ACT8865_DCDC2_CTRL;
+		break;
+	case ACT8865_ID_DCDC3:
+		reg = ACT8865_DCDC3_CTRL;
+		break;
+	case ACT8865_ID_LDO1:
+		reg = ACT8865_LDO1_SUS;
+		break;
+	case ACT8865_ID_LDO2:
+		reg = ACT8865_LDO2_SUS;
+		break;
+	case ACT8865_ID_LDO3:
+		reg = ACT8865_LDO3_SUS;
+		break;
+	case ACT8865_ID_LDO4:
+		reg = ACT8865_LDO4_SUS;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (mode) {
+	case REGULATOR_MODE_STANDBY:
+		if (id > ACT8865_ID_DCDC3)
+			val = BIT(5);
+		break;
+	case REGULATOR_MODE_NORMAL:
+		if (id <= ACT8865_ID_DCDC3)
+			val = BIT(5);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = regmap_update_bits(regmap, reg, BIT(5), val);
+	if (ret)
+		return ret;
+
+	act8865->op_mode[id] = mode;
+
+	return 0;
+}
+
+static unsigned int act8865_get_mode(struct regulator_dev *rdev)
+{
+	struct act8865 *act8865 = rdev_get_drvdata(rdev);
+	int id = rdev_get_id(rdev);
+
+	if (id < ACT8865_ID_DCDC1 || id >= ACT8865_ID_MAX)
+		return -EINVAL;
+
+	return act8865->op_mode[id];
+}
+
 static const struct regulator_ops act8865_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.map_voltage		= regulator_map_voltage_linear_range,
@@ -232,7 +379,11 @@ static const struct regulator_ops act8865_ops = {
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
+	.set_mode		= act8865_set_mode,
+	.get_mode		= act8865_get_mode,
 	.is_enabled		= regulator_is_enabled_regmap,
+	.set_suspend_enable	= act8865_set_suspend_enable,
+	.set_suspend_disable	= act8865_set_suspend_disable,
 };
 
 static const struct regulator_ops act8865_ldo_ops = {
@@ -242,7 +393,11 @@ static const struct regulator_ops act8865_ldo_ops = {
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
+	.set_mode		= act8865_set_mode,
+	.get_mode		= act8865_get_mode,
 	.is_enabled		= regulator_is_enabled_regmap,
+	.set_suspend_enable	= act8865_set_suspend_enable,
+	.set_suspend_disable	= act8865_set_suspend_disable,
 	.set_pull_down		= regulator_set_pull_down_regmap,
 };
 
@@ -256,6 +411,7 @@ static const struct regulator_ops act8865_fixed_ldo_ops = {
 	[_family##_ID_##_id] = {					\
 		.name			= _name,			\
 		.of_match		= of_match_ptr(_name),		\
+		.of_map_mode		= act8865_of_map_mode,		\
 		.regulators_node	= of_match_ptr("regulators"),	\
 		.supply_name		= _supply,			\
 		.id			= _family##_ID_##_id,		\
@@ -590,7 +746,9 @@ static int act8865_pmic_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, act8865);
 
-	return 0;
+	/* Unlock expert registers for ACT8865. */
+	return type != ACT8865 ? 0 : regmap_write(act8865->regmap,
+						  ACT8865_SYS_UNLK_REGS, 0xef);
 }
 
 static const struct i2c_device_id act8865_ids[] = {
diff --git a/include/linux/regulator/act8865.h b/include/linux/regulator/act8865.h
index d25e24f..55660e6 100644
--- a/include/linux/regulator/act8865.h
+++ b/include/linux/regulator/act8865.h
@@ -31,7 +31,7 @@ enum {
 	ACT8865_ID_LDO2,
 	ACT8865_ID_LDO3,
 	ACT8865_ID_LDO4,
-	ACT8865_REG_NUM,
+	ACT8865_ID_MAX,
 };
 
 enum {
-- 
2.7.4
