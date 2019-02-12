From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [RFC PATCH v1 3/3] regulator: bd718x7: Support SNVS low power state
Date: Tue, 12 Feb 2019 16:19:38 +0200
Message-ID: <06c2f2f730b07caeb1f2fb86be60c02b21d7bea9.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, Robin Gong =?utf-8?B?4oCO?= <yibin.gong@nxp.com>, Elven Wang =?utf-8?B?4oCO?= <elven.wang@nxp.com>, Anson Huang =?utf-8?B?4oCO?= <anson.huang@nxp.com>
List-Id: devicetree@vger.kernel.org

read ROHM BD71837 / BD71847 specific device tree bindings for
controlling the PMIC shutdown/reset states and voltages for
different HW states. The PMIC was designed to be used with NXP
i.MX8 SoC and it supports SNVS low power state which seems to
be typical for NXP i.MX SoCs. However, when SNVS is used we must
not allow SW to control enabling/disabling those regulators which
are crucial for system to boot as there is a HW limitation which
causes SW controlled regulators to be kept shut down after SNVS
reset.

Allow setting the SNVS to be used as reset target state and allow
marking those regulators which are critical for boot.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Please not apply as such. This is compile-tested only and sent
for collecting feedback. If idea is Ok I will do proper testing
and send a non RFC patch.

 drivers/regulator/bd718x7-regulator.c | 135 ++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
index ccea133778c8..327ef9223cb0 100644
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@ -350,6 +350,135 @@ static const struct reg_init bd71837_ldo6_inits[] = {
 	},
 };
 
+#define NUM_DVS_BUCKS 4
+
+struct of_dvs_setting {
+	const char *prop;
+	unsigned int reg;
+};
+
+static int set_dvs_levels(const struct of_dvs_setting *dvs,
+			  struct device_node *np,
+			  const struct regulator_desc *desc,
+			  struct regmap *regmap)
+{
+	int ret, i;
+	unsigned int uv;
+
+	ret = of_property_read_u32(np, dvs->prop, &uv);
+	if (ret) {
+		if (ret != -EINVAL)
+			return ret;
+		return 0;
+	}
+
+	for (i = 0; i < desc->n_voltages; i++) {
+		ret = regulator_desc_list_voltage_linear_range(desc, i);
+		if (ret < 0)
+			continue;
+		if (ret == uv) {
+			i <<= ffs(desc->vsel_mask) - 1;
+			ret = regmap_update_bits(regmap, dvs->reg,
+						 DVS_BUCK_RUN_MASK, i);
+			break;
+		}
+	}
+	return ret;
+}
+
+static int buck4_set_hw_dvs_levels(struct device_node *np,
+			    const struct regulator_desc *desc,
+			    struct regulator_config *cfg)
+{
+	int ret, i;
+	const struct of_dvs_setting dvs[] = {
+		{
+			.prop = "rohm,dvs-run-voltage",
+			.reg = BD71837_REG_BUCK4_VOLT_RUN,
+		},
+	};
+
+	for (i = 0; i < ARRAY_SIZE(dvs); i++) {
+		ret = set_dvs_levels(&dvs[i], np, desc, cfg->regmap);
+		if (ret)
+			break;
+	}
+	return ret;
+}
+static int buck3_set_hw_dvs_levels(struct device_node *np,
+			    const struct regulator_desc *desc,
+			    struct regulator_config *cfg)
+{
+	int ret, i;
+	const struct of_dvs_setting dvs[] = {
+		{
+			.prop = "rohm,dvs-run-voltage",
+			.reg = BD71837_REG_BUCK3_VOLT_RUN,
+		},
+	};
+
+	for (i = 0; i < ARRAY_SIZE(dvs); i++) {
+		ret = set_dvs_levels(&dvs[i], np, desc, cfg->regmap);
+		if (ret)
+			break;
+	}
+	return ret;
+}
+
+static int buck2_set_hw_dvs_levels(struct device_node *np,
+			    const struct regulator_desc *desc,
+			    struct regulator_config *cfg)
+{
+	int ret, i;
+	const struct of_dvs_setting dvs[] = {
+		{
+			.prop = "rohm,dvs-run-voltage",
+			.reg = BD718XX_REG_BUCK2_VOLT_RUN,
+		},
+		{
+			.prop = "rohm,dvs-idle-voltage",
+			.reg = BD718XX_REG_BUCK2_VOLT_IDLE,
+		},
+	};
+
+
+
+	for (i = 0; i < ARRAY_SIZE(dvs); i++) {
+		ret = set_dvs_levels(&dvs[i], np, desc, cfg->regmap);
+		if (ret)
+			break;
+	}
+	return ret;
+}
+
+static int buck1_set_hw_dvs_levels(struct device_node *np,
+			    const struct regulator_desc *desc,
+			    struct regulator_config *cfg)
+{
+	int ret, i;
+	const struct of_dvs_setting dvs[] = {
+		{
+			.prop = "rohm,dvs-run-voltage",
+			.reg = BD718XX_REG_BUCK1_VOLT_RUN,
+		},
+		{
+			.prop = "rohm,dvs-idle-voltage",
+			.reg = BD718XX_REG_BUCK1_VOLT_IDLE,
+		},
+		{
+			.prop = "rohm,dvs-suspend-voltage",
+			.reg = BD718XX_REG_BUCK1_VOLT_SUSP,
+		},
+	};
+
+	for (i = 0; i < ARRAY_SIZE(dvs); i++) {
+		ret = set_dvs_levels(&dvs[i], np, desc, cfg->regmap);
+		if (ret)
+			break;
+	}
+	return ret;
+}
+
 static const struct bd718xx_regulator_data bd71847_regulators[] = {
 	{
 		.desc = {
@@ -368,6 +497,7 @@ static const struct bd718xx_regulator_data bd71847_regulators[] = {
 			.enable_reg = BD718XX_REG_BUCK1_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
+			.of_parse_cb = buck1_set_hw_dvs_levels,
 		},
 		.init = {
 			.reg = BD718XX_REG_BUCK1_CTRL,
@@ -391,6 +521,7 @@ static const struct bd718xx_regulator_data bd71847_regulators[] = {
 			.enable_reg = BD718XX_REG_BUCK2_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
+			.of_parse_cb = buck2_set_hw_dvs_levels,
 		},
 		.init = {
 			.reg = BD718XX_REG_BUCK2_CTRL,
@@ -662,6 +793,7 @@ static const struct bd718xx_regulator_data bd71837_regulators[] = {
 			.enable_reg = BD718XX_REG_BUCK1_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
+			.of_parse_cb = buck1_set_hw_dvs_levels,
 		},
 		.init = {
 			.reg = BD718XX_REG_BUCK1_CTRL,
@@ -685,6 +817,7 @@ static const struct bd718xx_regulator_data bd71837_regulators[] = {
 			.enable_reg = BD718XX_REG_BUCK2_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
+			.of_parse_cb = buck1_set_hw_dvs_levels,
 		},
 		.init = {
 			.reg = BD718XX_REG_BUCK2_CTRL,
@@ -708,6 +841,7 @@ static const struct bd718xx_regulator_data bd71837_regulators[] = {
 			.enable_reg = BD71837_REG_BUCK3_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
+			.of_parse_cb = buck3_set_hw_dvs_levels,
 		},
 		.init = {
 			.reg = BD71837_REG_BUCK3_CTRL,
@@ -731,6 +865,7 @@ static const struct bd718xx_regulator_data bd71837_regulators[] = {
 			.enable_reg = BD71837_REG_BUCK4_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
+			.of_parse_cb = buck4_set_hw_dvs_levels,
 		},
 		.init = {
 			.reg = BD71837_REG_BUCK4_CTRL,
-- 
2.14.3


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes.  Just then, he vanished ~~~
