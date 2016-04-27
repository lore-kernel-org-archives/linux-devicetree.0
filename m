From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: rk808: Add rk808_reg_ops_ranges for LDO3" to the regulator tree
Date: Wed, 27 Apr 2016 17:35:12 +0100
Message-ID: <E1avSQi-0004XP-Kn@debutante>
References: <1461682450-22173-2-git-send-email-w.egorov@phytec.de>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1461682450-22173-2-git-send-email-w.egorov@phytec.de>
Sender: linux-clk-owner@vger.kernel.org
To: Wadim Egorov <w.egorov@phytec.de>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, lee.jones@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, lgirdwood@gmail.combroonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, dianders@chromium.org, zyw@rock-chips.com
List-Id: devicetree@vger.kernel.org

The patch

   regulator: rk808: Add rk808_reg_ops_ranges for LDO3

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 129d7cf98f5c739014ae5aa0311e48f6a64b0758 Mon Sep 17 00:00:00 2001
From: Wadim Egorov <w.egorov@phytec.de>
Date: Tue, 26 Apr 2016 16:54:04 +0200
Subject: [PATCH] regulator: rk808: Add rk808_reg_ops_ranges for LDO3

LDO_REG3 descriptor is using linear_ranges.
Add and use proper ops for LDO_REG3.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/rk808-regulator.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
index 67f72feed815..6601ab5fcc2d 100644
--- a/drivers/regulator/rk808-regulator.c
+++ b/drivers/regulator/rk808-regulator.c
@@ -238,6 +238,21 @@ static int rk808_set_suspend_voltage(struct regulator_dev *rdev, int uv)
 				  sel);
 }
 
+static int rk808_set_suspend_voltage_range(struct regulator_dev *rdev, int uv)
+{
+	unsigned int reg;
+	int sel = regulator_map_voltage_linear_range(rdev, uv, uv);
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
 static int rk808_set_suspend_enable(struct regulator_dev *rdev)
 {
 	unsigned int reg;
@@ -288,6 +303,19 @@ static struct regulator_ops rk808_reg_ops = {
 	.set_suspend_disable	= rk808_set_suspend_disable,
 };
 
+static struct regulator_ops rk808_reg_ops_ranges = {
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.map_voltage		= regulator_map_voltage_linear_range,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_suspend_voltage	= rk808_set_suspend_voltage_range,
+	.set_suspend_enable	= rk808_set_suspend_enable,
+	.set_suspend_disable	= rk808_set_suspend_disable,
+};
+
 static struct regulator_ops rk808_switch_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
@@ -383,7 +411,7 @@ static const struct regulator_desc rk808_reg[] = {
 		.name = "LDO_REG3",
 		.supply_name = "vcc7",
 		.id = RK808_ID_LDO3,
-		.ops = &rk808_reg_ops,
+		.ops = &rk808_reg_ops_ranges,
 		.type = REGULATOR_VOLTAGE,
 		.n_voltages = 16,
 		.linear_ranges = rk808_ldo3_voltage_ranges,
-- 
2.8.0.rc3

