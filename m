From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/2] regulator: da9052: Use lowercase regulator names to match the DT
Date: Fri, 25 Jan 2019 09:37:05 -0600
Message-ID: <20190125153705.29921-2-robh@kernel.org>
References: <20190125153705.29921-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125153705.29921-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org

Since c32569e358ad ("regulator: Use of_node_name_eq for node name
comparisons"), regulator node name comparisons are case sensitive.
The DA9052 driver uses uppercase, but the DT has lowercase.

Fix this by using a lowercase regulator name to match the DT node name.

Fixes: c32569e358ad ("regulator: Use of_node_name_eq for node name comparisons")
Cc: Support Opensource <support.opensource@diasemi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/regulator/da9052-regulator.c | 64 ++++++++++++++--------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/regulator/da9052-regulator.c b/drivers/regulator/da9052-regulator.c
index 207cb3859dcc..cefa3558236d 100644
--- a/drivers/regulator/da9052-regulator.c
+++ b/drivers/regulator/da9052-regulator.c
@@ -290,10 +290,10 @@ static const struct regulator_ops da9052_ldo_ops = {
 	.disable = regulator_disable_regmap,
 };
 
-#define DA9052_LDO(_id, step, min, max, sbits, ebits, abits) \
+#define DA9052_LDO(_id, _name, step, min, max, sbits, ebits, abits) \
 {\
 	.reg_desc = {\
-		.name = #_id,\
+		.name = #_name,\
 		.ops = &da9052_ldo_ops,\
 		.type = REGULATOR_VOLTAGE,\
 		.id = DA9052_ID_##_id,\
@@ -310,10 +310,10 @@ static const struct regulator_ops da9052_ldo_ops = {
 	.activate_bit = (abits),\
 }
 
-#define DA9052_DCDC(_id, step, min, max, sbits, ebits, abits) \
+#define DA9052_DCDC(_id, _name, step, min, max, sbits, ebits, abits) \
 {\
 	.reg_desc = {\
-		.name = #_id,\
+		.name = #_name,\
 		.ops = &da9052_dcdc_ops,\
 		.type = REGULATOR_VOLTAGE,\
 		.id = DA9052_ID_##_id,\
@@ -331,37 +331,37 @@ static const struct regulator_ops da9052_ldo_ops = {
 }
 
 static struct da9052_regulator_info da9052_regulator_info[] = {
-	DA9052_DCDC(BUCK1, 25, 500, 2075, 6, 6, DA9052_SUPPLY_VBCOREGO),
-	DA9052_DCDC(BUCK2, 25, 500, 2075, 6, 6, DA9052_SUPPLY_VBPROGO),
-	DA9052_DCDC(BUCK3, 25, 950, 2525, 6, 6, DA9052_SUPPLY_VBMEMGO),
-	DA9052_DCDC(BUCK4, 50, 1800, 3600, 5, 6, 0),
-	DA9052_LDO(LDO1, 50, 600, 1800, 5, 6, 0),
-	DA9052_LDO(LDO2, 25, 600, 1800, 6, 6, DA9052_SUPPLY_VLDO2GO),
-	DA9052_LDO(LDO3, 25, 1725, 3300, 6, 6, DA9052_SUPPLY_VLDO3GO),
-	DA9052_LDO(LDO4, 25, 1725, 3300, 6, 6, 0),
-	DA9052_LDO(LDO5, 50, 1200, 3600, 6, 6, 0),
-	DA9052_LDO(LDO6, 50, 1200, 3600, 6, 6, 0),
-	DA9052_LDO(LDO7, 50, 1200, 3600, 6, 6, 0),
-	DA9052_LDO(LDO8, 50, 1200, 3600, 6, 6, 0),
-	DA9052_LDO(LDO9, 50, 1250, 3650, 6, 6, 0),
-	DA9052_LDO(LDO10, 50, 1200, 3600, 6, 6, 0),
+	DA9052_DCDC(BUCK1, buck1, 25, 500, 2075, 6, 6, DA9052_SUPPLY_VBCOREGO),
+	DA9052_DCDC(BUCK2, buck2, 25, 500, 2075, 6, 6, DA9052_SUPPLY_VBPROGO),
+	DA9052_DCDC(BUCK3, buck3, 25, 950, 2525, 6, 6, DA9052_SUPPLY_VBMEMGO),
+	DA9052_DCDC(BUCK4, buck4, 50, 1800, 3600, 5, 6, 0),
+	DA9052_LDO(LDO1, ldo1, 50, 600, 1800, 5, 6, 0),
+	DA9052_LDO(LDO2, ldo2, 25, 600, 1800, 6, 6, DA9052_SUPPLY_VLDO2GO),
+	DA9052_LDO(LDO3, ldo3, 25, 1725, 3300, 6, 6, DA9052_SUPPLY_VLDO3GO),
+	DA9052_LDO(LDO4, ldo4, 25, 1725, 3300, 6, 6, 0),
+	DA9052_LDO(LDO5, ldo5, 50, 1200, 3600, 6, 6, 0),
+	DA9052_LDO(LDO6, ldo6, 50, 1200, 3600, 6, 6, 0),
+	DA9052_LDO(LDO7, ldo7, 50, 1200, 3600, 6, 6, 0),
+	DA9052_LDO(LDO8, ldo8, 50, 1200, 3600, 6, 6, 0),
+	DA9052_LDO(LDO9, ldo9, 50, 1250, 3650, 6, 6, 0),
+	DA9052_LDO(LDO10, ldo10, 50, 1200, 3600, 6, 6, 0),
 };
 
 static struct da9052_regulator_info da9053_regulator_info[] = {
-	DA9052_DCDC(BUCK1, 25, 500, 2075, 6, 6, DA9052_SUPPLY_VBCOREGO),
-	DA9052_DCDC(BUCK2, 25, 500, 2075, 6, 6, DA9052_SUPPLY_VBPROGO),
-	DA9052_DCDC(BUCK3, 25, 950, 2525, 6, 6, DA9052_SUPPLY_VBMEMGO),
-	DA9052_DCDC(BUCK4, 25, 950, 2525, 6, 6, 0),
-	DA9052_LDO(LDO1, 50, 600, 1800, 5, 6, 0),
-	DA9052_LDO(LDO2, 25, 600, 1800, 6, 6, DA9052_SUPPLY_VLDO2GO),
-	DA9052_LDO(LDO3, 25, 1725, 3300, 6, 6, DA9052_SUPPLY_VLDO3GO),
-	DA9052_LDO(LDO4, 25, 1725, 3300, 6, 6, 0),
-	DA9052_LDO(LDO5, 50, 1200, 3600, 6, 6, 0),
-	DA9052_LDO(LDO6, 50, 1200, 3600, 6, 6, 0),
-	DA9052_LDO(LDO7, 50, 1200, 3600, 6, 6, 0),
-	DA9052_LDO(LDO8, 50, 1200, 3600, 6, 6, 0),
-	DA9052_LDO(LDO9, 50, 1250, 3650, 6, 6, 0),
-	DA9052_LDO(LDO10, 50, 1200, 3600, 6, 6, 0),
+	DA9052_DCDC(BUCK1, buck1, 25, 500, 2075, 6, 6, DA9052_SUPPLY_VBCOREGO),
+	DA9052_DCDC(BUCK2, buck2, 25, 500, 2075, 6, 6, DA9052_SUPPLY_VBPROGO),
+	DA9052_DCDC(BUCK3, buck3, 25, 950, 2525, 6, 6, DA9052_SUPPLY_VBMEMGO),
+	DA9052_DCDC(BUCK4, buck4, 25, 950, 2525, 6, 6, 0),
+	DA9052_LDO(LDO1, ldo1, 50, 600, 1800, 5, 6, 0),
+	DA9052_LDO(LDO2, ldo2, 25, 600, 1800, 6, 6, DA9052_SUPPLY_VLDO2GO),
+	DA9052_LDO(LDO3, ldo3, 25, 1725, 3300, 6, 6, DA9052_SUPPLY_VLDO3GO),
+	DA9052_LDO(LDO4, ldo4, 25, 1725, 3300, 6, 6, 0),
+	DA9052_LDO(LDO5, ldo5, 50, 1200, 3600, 6, 6, 0),
+	DA9052_LDO(LDO6, ldo6, 50, 1200, 3600, 6, 6, 0),
+	DA9052_LDO(LDO7, ldo7, 50, 1200, 3600, 6, 6, 0),
+	DA9052_LDO(LDO8, ldo8, 50, 1200, 3600, 6, 6, 0),
+	DA9052_LDO(LDO9, ldo9, 50, 1250, 3650, 6, 6, 0),
+	DA9052_LDO(LDO10, ldo10, 50, 1200, 3600, 6, 6, 0),
 };
 
 static inline struct da9052_regulator_info *find_regulator_info(u8 chip_id,
-- 
2.19.1
