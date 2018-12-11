From: Priit Laes <plaes@plaes.org>
Subject: [PATCH v2 4/8] regulator: axp20x: add software based soft_start for AXP209 LDO3
Date: Tue, 11 Dec 2018 17:17:08 +0200
Message-ID: <c77b37b68b18a299cafd282ef1edf3434eabeb2d.1544512919.git-series.plaes@plaes.org>
References: <cover.923997dd7d7396bb4d71f8967698b58ca956b929.1544512919.git-series.plaes@plaes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.923997dd7d7396bb4d71f8967698b58ca956b929.1544512919.git-series.plaes@plaes.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Olliver Schinagl <oliver@schinagl.nl>, linux-sunxi <linux-sunxi@googlegroups.com>
Cc: Priit Laes <plaes@plaes.org>
List-Id: devicetree@vger.kernel.org

From: Olliver Schinagl <oliver@schinagl.nl>

In the past, there have been words on various lists that if LDO3 is
disabled in u-boot, but enabled in the DTS, the axp209 driver would
fail to continue/hang. Several enable/disable patches have been
issues to devicetree's in both the kernel and u-boot to address
this issue.

What really happened however, was that the AXP209 shuts down without
a notice and without setting an interrupt. This is caused when LDO3
gets overloaded, for example with large capacitors on the LDO3 output.

Normally, we would expect that AXP209 would source 200 mA as per
datasheet and set and trigger an interrupt when being overloaded.
For some reason however, this does not happen.

As a work-around, we use the soft-start constraint of the regulator
node to first bring up the LDO3 to the lowest possible voltage and
then enable the LDO. After that, we can set the requested voltage
as usual.

Combining this setting with the regulator-ramp-delay allows LDO3 to
enable voltage slowly and staggered, potentially reducing overall
inrush current.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
Signed-off-by: Priit Laes <plaes@plaes.org>
---
 drivers/regulator/axp20x-regulator.c | 57 ++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index 1d9fa62..e8a895b 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -14,6 +14,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/mfd/axp20x.h>
@@ -23,6 +24,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 
 #define AXP20X_GPIO0_FUNC_MASK		GENMASK(3, 0)
@@ -430,6 +432,59 @@ static int axp20x_set_ramp_delay(struct regulator_dev *rdev, int ramp)
 	return regmap_update_bits(axp20x->regmap, reg, mask, cfg);
 }
 
+static int axp20x_regulator_enable_regmap(struct regulator_dev *rdev)
+{
+	struct axp20x_dev *axp20x = rdev_get_drvdata(rdev);
+	const struct regulator_desc *desc = rdev->desc;
+
+	if (!rdev)
+		return -EINVAL;
+
+	switch (axp20x->variant) {
+	case AXP209_ID:
+		if ((desc->id == AXP20X_LDO3) &&
+		    rdev->constraints && rdev->constraints->soft_start) {
+			int v_out;
+			int ret;
+
+			/*
+			 * On some boards, the LDO3 can be overloaded when
+			 * turning on, causing the entire PMIC to shutdown
+			 * without warning. Turning it on at the minimal voltage
+			 * and then setting the voltage to the requested value
+			 * works reliably.
+			 */
+			if (regulator_is_enabled_regmap(rdev))
+				break;
+
+			v_out = regulator_get_voltage_sel_regmap(rdev);
+			if (v_out < 0)
+				return v_out;
+
+			if (v_out == 0)
+				break;
+
+			ret = regulator_set_voltage_sel_regmap(rdev, 0x00);
+			/*
+			 * A small pause is needed between
+			 * setting the voltage and enabling the LDO to give the
+			 * internal state machine time to process the request.
+			 */
+			usleep_range(1000, 5000);
+			ret |= regulator_enable_regmap(rdev);
+			ret |= regulator_set_voltage_sel_regmap(rdev, v_out);
+
+			return ret;
+		}
+		break;
+	default:
+		/* No quirks */
+		break;
+	}
+
+	return regulator_enable_regmap(rdev);
+};
+
 static const struct regulator_ops axp20x_ops_fixed = {
 	.list_voltage		= regulator_list_voltage_linear,
 };
@@ -447,7 +502,7 @@ static const struct regulator_ops axp20x_ops = {
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
 	.list_voltage		= regulator_list_voltage_linear,
-	.enable			= regulator_enable_regmap,
+	.enable			= axp20x_regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
 	.set_ramp_delay		= axp20x_set_ramp_delay,
-- 
git-series 0.9.1
