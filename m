From: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v3 3/8] regulator: rk808: remove linear range definitions with
 a single range
Date: Mon, 25 Apr 2016 15:20:43 +0200
Message-ID: <1461590448-47685-4-git-send-email-w.egorov@phytec.de>
References: <1461590448-47685-1-git-send-email-w.egorov@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1461590448-47685-1-git-send-email-w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The driver was using only linear ranges. Now we remove linear range
definitions with a single range. So we have to add an ops struct for
ranges and adjust all other ops functions accordingly.

Signed-off-by: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
---
 drivers/regulator/rk808-regulator.c | 90 +++++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 39 deletions(-)

diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
index 37aaba9..32cf1b5 100644
--- a/drivers/regulator/rk808-regulator.c
+++ b/drivers/regulator/rk808-regulator.c
@@ -66,27 +66,11 @@ static const int rk808_buck_config_regs[] = {
 	RK808_BUCK4_CONFIG_REG,
 };
 
-static const struct regulator_linear_range rk808_buck_voltage_ranges[] = {
-	REGULATOR_LINEAR_RANGE(712500, 0, 63, 12500),
-};
-
-static const struct regulator_linear_range rk808_buck4_voltage_ranges[] = {
-	REGULATOR_LINEAR_RANGE(1800000, 0, 15, 100000),
-};
-
-static const struct regulator_linear_range rk808_ldo_voltage_ranges[] = {
-	REGULATOR_LINEAR_RANGE(1800000, 0, 16, 100000),
-};
-
 static const struct regulator_linear_range rk808_ldo3_voltage_ranges[] = {
 	REGULATOR_LINEAR_RANGE(800000, 0, 13, 100000),
 	REGULATOR_LINEAR_RANGE(2500000, 15, 15, 0),
 };
 
-static const struct regulator_linear_range rk808_ldo6_voltage_ranges[] = {
-	REGULATOR_LINEAR_RANGE(800000, 0, 17, 100000),
-};
-
 static int rk808_buck1_2_get_voltage_sel_regmap(struct regulator_dev *rdev)
 {
 	struct rk808_regulator_data *pdata = rdev_get_drvdata(rdev);
@@ -242,6 +226,21 @@ static int rk808_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 static int rk808_set_suspend_voltage(struct regulator_dev *rdev, int uv)
 {
 	unsigned int reg;
+	int sel = regulator_map_voltage_linear(rdev, uv, uv);
+
+	if (sel < 0)
+		return -EINVAL;
+
+	reg = rdev->desc->vsel_reg + RK808_SLP_REG_OFFSET;
+
+	return regmap_update_bits(rdev->regmap, reg,
+				  rdev->desc->vsel_mask,
+				  sel);
+}
+
+static int rk808_set_suspend_voltage_range(struct regulator_dev *rdev, int uv)
+{
+	unsigned int reg;
 	int sel = regulator_map_voltage_linear_range(rdev, uv, uv);
 
 	if (sel < 0)
@@ -277,8 +276,8 @@ static int rk808_set_suspend_disable(struct regulator_dev *rdev)
 }
 
 static struct regulator_ops rk808_buck1_2_ops = {
-	.list_voltage		= regulator_list_voltage_linear_range,
-	.map_voltage		= regulator_map_voltage_linear_range,
+	.list_voltage		= regulator_list_voltage_linear,
+	.map_voltage		= regulator_map_voltage_linear,
 	.get_voltage_sel	= rk808_buck1_2_get_voltage_sel_regmap,
 	.set_voltage_sel	= rk808_buck1_2_set_voltage_sel,
 	.set_voltage_time_sel	= rk808_buck1_2_set_voltage_time_sel,
@@ -292,6 +291,19 @@ static struct regulator_ops rk808_buck1_2_ops = {
 };
 
 static struct regulator_ops rk808_reg_ops = {
+	.list_voltage		= regulator_list_voltage_linear,
+	.map_voltage		= regulator_map_voltage_linear,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_suspend_voltage	= rk808_set_suspend_voltage,
+	.set_suspend_enable	= rk808_set_suspend_enable,
+	.set_suspend_disable	= rk808_set_suspend_disable,
+};
+
+static struct regulator_ops rk808_reg_ops_ranges = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.map_voltage		= regulator_map_voltage_linear_range,
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
@@ -299,7 +311,7 @@ static struct regulator_ops rk808_reg_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
-	.set_suspend_voltage	= rk808_set_suspend_voltage,
+	.set_suspend_voltage	= rk808_set_suspend_voltage_range,
 	.set_suspend_enable	= rk808_set_suspend_enable,
 	.set_suspend_disable	= rk808_set_suspend_disable,
 };
@@ -319,9 +331,9 @@ static const struct regulator_desc rk808_reg[] = {
 		.id = RK808_ID_DCDC1,
 		.ops = &rk808_buck1_2_ops,
 		.type = REGULATOR_VOLTAGE,
+		.min_uV = 712500,
+		.uV_step = 12500,
 		.n_voltages = 64,
-		.linear_ranges = rk808_buck_voltage_ranges,
-		.n_linear_ranges = ARRAY_SIZE(rk808_buck_voltage_ranges),
 		.vsel_reg = RK808_BUCK1_ON_VSEL_REG,
 		.vsel_mask = RK808_BUCK_VSEL_MASK,
 		.enable_reg = RK808_DCDC_EN_REG,
@@ -333,9 +345,9 @@ static const struct regulator_desc rk808_reg[] = {
 		.id = RK808_ID_DCDC2,
 		.ops = &rk808_buck1_2_ops,
 		.type = REGULATOR_VOLTAGE,
+		.min_uV = 712500,
+		.uV_step = 12500,
 		.n_voltages = 64,
-		.linear_ranges = rk808_buck_voltage_ranges,
-		.n_linear_ranges = ARRAY_SIZE(rk808_buck_voltage_ranges),
 		.vsel_reg = RK808_BUCK2_ON_VSEL_REG,
 		.vsel_mask = RK808_BUCK_VSEL_MASK,
 		.enable_reg = RK808_DCDC_EN_REG,
@@ -357,9 +369,9 @@ static const struct regulator_desc rk808_reg[] = {
 		.id = RK808_ID_DCDC4,
 		.ops = &rk808_reg_ops,
 		.type = REGULATOR_VOLTAGE,
+		.min_uV = 1800000,
+		.uV_step = 100000,
 		.n_voltages = 16,
-		.linear_ranges = rk808_buck4_voltage_ranges,
-		.n_linear_ranges = ARRAY_SIZE(rk808_buck4_voltage_ranges),
 		.vsel_reg = RK808_BUCK4_ON_VSEL_REG,
 		.vsel_mask = RK808_BUCK4_VSEL_MASK,
 		.enable_reg = RK808_DCDC_EN_REG,
@@ -371,9 +383,9 @@ static const struct regulator_desc rk808_reg[] = {
 		.id = RK808_ID_LDO1,
 		.ops = &rk808_reg_ops,
 		.type = REGULATOR_VOLTAGE,
+		.min_uV = 1800000,
+		.uV_step = 100000,
 		.n_voltages = 17,
-		.linear_ranges = rk808_ldo_voltage_ranges,
-		.n_linear_ranges = ARRAY_SIZE(rk808_ldo_voltage_ranges),
 		.vsel_reg = RK808_LDO1_ON_VSEL_REG,
 		.vsel_mask = RK808_LDO_VSEL_MASK,
 		.enable_reg = RK808_LDO_EN_REG,
@@ -386,9 +398,9 @@ static const struct regulator_desc rk808_reg[] = {
 		.id = RK808_ID_LDO2,
 		.ops = &rk808_reg_ops,
 		.type = REGULATOR_VOLTAGE,
+		.min_uV = 1800000,
+		.uV_step = 100000,
 		.n_voltages = 17,
-		.linear_ranges = rk808_ldo_voltage_ranges,
-		.n_linear_ranges = ARRAY_SIZE(rk808_ldo_voltage_ranges),
 		.vsel_reg = RK808_LDO2_ON_VSEL_REG,
 		.vsel_mask = RK808_LDO_VSEL_MASK,
 		.enable_reg = RK808_LDO_EN_REG,
@@ -416,9 +428,9 @@ static const struct regulator_desc rk808_reg[] = {
 		.id = RK808_ID_LDO4,
 		.ops = &rk808_reg_ops,
 		.type = REGULATOR_VOLTAGE,
+		.min_uV = 1800000,
+		.uV_step = 100000,
 		.n_voltages = 17,
-		.linear_ranges = rk808_ldo_voltage_ranges,
-		.n_linear_ranges = ARRAY_SIZE(rk808_ldo_voltage_ranges),
 		.vsel_reg = RK808_LDO4_ON_VSEL_REG,
 		.vsel_mask = RK808_LDO_VSEL_MASK,
 		.enable_reg = RK808_LDO_EN_REG,
@@ -431,9 +443,9 @@ static const struct regulator_desc rk808_reg[] = {
 		.id = RK808_ID_LDO5,
 		.ops = &rk808_reg_ops,
 		.type = REGULATOR_VOLTAGE,
+		.min_uV = 1800000,
+		.uV_step = 100000,
 		.n_voltages = 17,
-		.linear_ranges = rk808_ldo_voltage_ranges,
-		.n_linear_ranges = ARRAY_SIZE(rk808_ldo_voltage_ranges),
 		.vsel_reg = RK808_LDO5_ON_VSEL_REG,
 		.vsel_mask = RK808_LDO_VSEL_MASK,
 		.enable_reg = RK808_LDO_EN_REG,
@@ -446,9 +458,9 @@ static const struct regulator_desc rk808_reg[] = {
 		.id = RK808_ID_LDO6,
 		.ops = &rk808_reg_ops,
 		.type = REGULATOR_VOLTAGE,
+		.min_uV = 800000,
+		.uV_step = 100000,
 		.n_voltages = 18,
-		.linear_ranges = rk808_ldo6_voltage_ranges,
-		.n_linear_ranges = ARRAY_SIZE(rk808_ldo6_voltage_ranges),
 		.vsel_reg = RK808_LDO6_ON_VSEL_REG,
 		.vsel_mask = RK808_LDO_VSEL_MASK,
 		.enable_reg = RK808_LDO_EN_REG,
@@ -461,9 +473,9 @@ static const struct regulator_desc rk808_reg[] = {
 		.id = RK808_ID_LDO7,
 		.ops = &rk808_reg_ops,
 		.type = REGULATOR_VOLTAGE,
+		.min_uV = 800000,
+		.uV_step = 100000,
 		.n_voltages = 18,
-		.linear_ranges = rk808_ldo6_voltage_ranges,
-		.n_linear_ranges = ARRAY_SIZE(rk808_ldo6_voltage_ranges),
 		.vsel_reg = RK808_LDO7_ON_VSEL_REG,
 		.vsel_mask = RK808_LDO_VSEL_MASK,
 		.enable_reg = RK808_LDO_EN_REG,
@@ -476,9 +488,9 @@ static const struct regulator_desc rk808_reg[] = {
 		.id = RK808_ID_LDO8,
 		.ops = &rk808_reg_ops,
 		.type = REGULATOR_VOLTAGE,
+		.min_uV = 1800000,
+		.uV_step = 100000,
 		.n_voltages = 17,
-		.linear_ranges = rk808_ldo_voltage_ranges,
-		.n_linear_ranges = ARRAY_SIZE(rk808_ldo_voltage_ranges),
 		.vsel_reg = RK808_LDO8_ON_VSEL_REG,
 		.vsel_mask = RK808_LDO_VSEL_MASK,
 		.enable_reg = RK808_LDO_EN_REG,
-- 
1.9.1
