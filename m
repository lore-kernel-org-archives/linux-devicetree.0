From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 2/2] regulator: pfuze100: add support to en-/disable switch regulators
Date: Thu, 12 Jul 2018 13:02:40 +0200
Message-ID: <20180712110240.3006-3-m.felsch@pengutronix.de>
References: <20180712110240.3006-1-m.felsch@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712110240.3006-1-m.felsch@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: fabio.estevam@nxp.com, Anson.Huang@nxp.com, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add enable/disable support for switch regulators on pfuze100.

Based on commit 5fe156f1cab4 ("regulator: pfuze100: add enable/disable for
switch") which is reverted due to boot regressions by commit 464a5686e6c9
("regulator: Revert "regulator: pfuze100: add enable/disable for switch"").
Disabling the switch regulators will only be done if the user specifies
"pfuze-disable-sw" in its device tree to keep backward compatibility with
current dtb's [1]. Otherwise the regulators are marked as 'disabled', but
the driver keeps them on. So it's more like a simulated disable.

[1] https://patchwork.kernel.org/patch/10490381/

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

---
Changes since https://patchwork.kernel.org/patch/10405723/
  - Use DT property to keep backward compatibility
  - Use the default register val 0x8 as enable_val

 drivers/regulator/pfuze100-regulator.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index cde6eda1d283..2f5f3eb43e42 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -17,6 +17,8 @@
 #include <linux/slab.h>
 #include <linux/regmap.h>
 
+#define PFUZE_FLAG_DISABLE_SW	BIT(1)
+
 #define PFUZE_NUMREGS		128
 #define PFUZE100_VOL_OFFSET	0
 #define PFUZE100_STANDBY_OFFSET	1
@@ -54,6 +56,7 @@ struct pfuze_regulator {
 
 struct pfuze_chip {
 	int	chip_id;
+	int     flags;
 	struct regmap *regmap;
 	struct device *dev;
 	struct pfuze_regulator regulator_descs[PFUZE100_MAX_REGULATOR];
@@ -106,6 +109,18 @@ static const struct of_device_id pfuze_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, pfuze_dt_ids);
 
+static int pfuze100_disable(struct regulator_dev *rdev)
+{
+	struct pfuze_chip *pfuze100 = rdev_get_drvdata(rdev);
+
+	/*
+	 * Only disable the regulator if the user really wants it, else simulate
+	 * a disabled regulator but leave the regulator on.
+	 */
+	return (pfuze100->flags & PFUZE_FLAG_DISABLE_SW) ?
+		regulator_disable_regmap(rdev) : 0;
+}
+
 static int pfuze100_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 {
 	struct pfuze_chip *pfuze100 = rdev_get_drvdata(rdev);
@@ -163,6 +178,9 @@ static const struct regulator_ops pfuze100_fixed_regulator_ops = {
 };
 
 static const struct regulator_ops pfuze100_sw_regulator_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = pfuze100_disable,
+	.is_enabled = regulator_is_enabled_regmap,
 	.list_voltage = regulator_list_voltage_linear,
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
@@ -209,6 +227,11 @@ static const struct regulator_ops pfuze100_swb_regulator_ops = {
 			.uV_step = (step),	\
 			.vsel_reg = (base) + PFUZE100_VOL_OFFSET,	\
 			.vsel_mask = 0x3f,	\
+			.enable_reg = (base) + PFUZE100_MODE_OFFSET,	\
+			.enable_val = 0x8,	\
+			.disable_val = 0x0,	\
+			.enable_mask = 0xf,	\
+			.enable_time = 500,	\
 		},	\
 		.stby_reg = (base) + PFUZE100_STANDBY_OFFSET,	\
 		.stby_mask = 0x3f,	\
@@ -471,6 +494,9 @@ static int pfuze_parse_regulators_dt(struct pfuze_chip *chip)
 	if (!np)
 		return -EINVAL;
 
+	if (of_property_read_bool(np, "pfuze-disable-sw"))
+		chip->flags |= PFUZE_FLAG_DISABLE_SW;
+
 	parent = of_get_child_by_name(np, "regulators");
 	if (!parent) {
 		dev_err(dev, "regulators node not found\n");
-- 
2.18.0
