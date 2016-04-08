From: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Subject: [RFC 2/3] regulator: rk808: Add support for rk818
Date: Fri, 8 Apr 2016 11:47:40 +0200
Message-ID: <1460108861-32818-3-git-send-email-w.egorov@phytec.de>
References: <1460108861-32818-1-git-send-email-w.egorov@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1460108861-32818-1-git-send-email-w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for the rk818 regulator. The regulator module consists
of 4 DCDCs, 9 LDOs, 1 switch and 1 BOOST converter which is used to
power OTG and HDMI5V.

The output voltages are configurable and are meant to supply power
to the main processor and other components.

Signed-off-by: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
---
 drivers/regulator/rk808-regulator.c | 343 +++++++++++++++++++++++++++++++++---
 1 file changed, 322 insertions(+), 21 deletions(-)

diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
index d86a3dc..b2bbca7 100644
--- a/drivers/regulator/rk808-regulator.c
+++ b/drivers/regulator/rk808-regulator.c
@@ -6,6 +6,9 @@
  * Author: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
  * Author: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
  *
+ * Copyright (C) 2016 PHYTEC Messtechnik GmbH
+ * Author: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
+ *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
  * version 2, as published by the Free Software Foundation.
@@ -32,6 +35,12 @@
 #define RK808_BUCK4_VSEL_MASK	0xf
 #define RK808_LDO_VSEL_MASK	0x1f
 
+#define RK818_BUCK_VSEL_MASK		0x3f
+#define RK818_BUCK4_VSEL_MASK		0x1f
+#define RK818_LDO_VSEL_MASK		0x1f
+#define RK818_LDO3_ON_VSEL_MASK		0xf
+#define RK818_BOOST_ON_VSEL_MASK	0xe0
+
 /* Ramp rate definitions for buck1 / buck2 only */
 #define RK808_RAMP_RATE_OFFSET		3
 #define RK808_RAMP_RATE_MASK		(3 << RK808_RAMP_RATE_OFFSET)
@@ -87,6 +96,15 @@ static const struct regulator_linear_range rk808_ldo6_voltage_ranges[] = {
 	REGULATOR_LINEAR_RANGE(800000, 0, 17, 100000),
 };
 
+static const struct regulator_linear_range rk818_buck4_voltage_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1800000, 0, 18, 100000),
+};
+
+static const struct regulator_linear_range rk818_boost_voltage_ranges[] = {
+	REGULATOR_LINEAR_RANGE(4700000, 0, 7, 100000),
+};
+
+
 static int rk808_buck1_2_get_voltage_sel_regmap(struct regulator_dev *rdev)
 {
 	struct rk808_regulator_data *pdata = rdev_get_drvdata(rdev);
@@ -506,6 +524,238 @@ static const struct regulator_desc rk808_reg[] = {
 	},
 };
 
+static const struct regulator_desc rk818_reg[] = {
+	{
+		.name = "DCDC_REG1",
+		.supply_name = "vcc1",
+		.id = RK818_ID_DCDC1,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 64,
+		.linear_ranges = rk808_buck_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk808_buck_voltage_ranges),
+		.vsel_reg = RK818_BUCK1_ON_VSEL_REG,
+		.vsel_mask = RK818_BUCK_VSEL_MASK,
+		.enable_reg = RK818_DCDC_EN_REG,
+		.enable_mask = BIT(0),
+		.owner = THIS_MODULE,
+	}, {
+		.name = "DCDC_REG2",
+		.supply_name = "vcc2",
+		.id = RK818_ID_DCDC2,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 64,
+		.linear_ranges = rk808_buck_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk808_buck_voltage_ranges),
+		.vsel_reg = RK818_BUCK2_ON_VSEL_REG,
+		.vsel_mask = RK818_BUCK_VSEL_MASK,
+		.enable_reg = RK818_DCDC_EN_REG,
+		.enable_mask = BIT(1),
+		.owner = THIS_MODULE,
+	}, {
+		.name = "DCDC_REG3",
+		.supply_name = "vcc3",
+		.id = RK818_ID_DCDC3,
+		.ops = &rk808_switch_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 1,
+		.enable_reg = RK818_DCDC_EN_REG,
+		.enable_mask = BIT(2),
+		.owner = THIS_MODULE,
+	}, {
+		.name = "DCDC_REG4",
+		.supply_name = "vcc4",
+		.id = RK818_ID_DCDC4,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 19,
+		.linear_ranges = rk818_buck4_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk818_buck4_voltage_ranges),
+		.vsel_reg = RK818_BUCK4_ON_VSEL_REG,
+		.vsel_mask = RK818_BUCK4_VSEL_MASK,
+		.enable_reg = RK818_DCDC_EN_REG,
+		.enable_mask = BIT(3),
+		.owner = THIS_MODULE,
+	}, {
+		.name = "DCDC_BOOST",
+		.supply_name = "boost",
+		.id = RK818_ID_BOOST,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 8,
+		.linear_ranges = rk818_boost_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk818_boost_voltage_ranges),
+		.vsel_reg = RK818_BOOST_LDO9_ON_VSEL_REG,
+		.vsel_mask = RK818_BOOST_ON_VSEL_MASK,
+		.enable_reg = RK818_DCDC_EN_REG,
+		.enable_mask = BIT(4),
+		.owner = THIS_MODULE,
+	}, {
+		.name = "LDO_REG1",
+		.supply_name = "vcc6",
+		.id = RK818_ID_LDO1,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 17,
+		.linear_ranges = rk808_ldo_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk808_ldo_voltage_ranges),
+		.vsel_reg = RK818_LDO1_ON_VSEL_REG,
+		.vsel_mask = RK818_LDO_VSEL_MASK,
+		.enable_reg = RK818_LDO_EN_REG,
+		.enable_mask = BIT(0),
+		.enable_time = 400,
+		.owner = THIS_MODULE,
+	}, {
+		.name = "LDO_REG2",
+		.supply_name = "vcc6",
+		.id = RK818_ID_LDO2,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 17,
+		.linear_ranges = rk808_ldo_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk808_ldo_voltage_ranges),
+		.vsel_reg = RK818_LDO2_ON_VSEL_REG,
+		.vsel_mask = RK818_LDO_VSEL_MASK,
+		.enable_reg = RK818_LDO_EN_REG,
+		.enable_mask = BIT(1),
+		.enable_time = 400,
+		.owner = THIS_MODULE,
+	}, {
+		.name = "LDO_REG3",
+		.supply_name = "vcc7",
+		.id = RK818_ID_LDO3,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 16,
+		.linear_ranges = rk808_ldo3_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk808_ldo3_voltage_ranges),
+		.vsel_reg = RK818_LDO3_ON_VSEL_REG,
+		.vsel_mask = RK818_LDO3_ON_VSEL_MASK,
+		.enable_reg = RK818_LDO_EN_REG,
+		.enable_mask = BIT(2),
+		.enable_time = 400,
+		.owner = THIS_MODULE,
+	}, {
+		.name = "LDO_REG4",
+		.supply_name = "vcc8",
+		.id = RK818_ID_LDO4,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 17,
+		.linear_ranges = rk808_ldo_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk808_ldo_voltage_ranges),
+		.vsel_reg = RK818_LDO4_ON_VSEL_REG,
+		.vsel_mask = RK818_LDO_VSEL_MASK,
+		.enable_reg = RK818_LDO_EN_REG,
+		.enable_mask = BIT(3),
+		.enable_time = 400,
+		.owner = THIS_MODULE,
+	}, {
+		.name = "LDO_REG5",
+		.supply_name = "vcc7",
+		.id = RK818_ID_LDO5,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 17,
+		.linear_ranges = rk808_ldo_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk808_ldo_voltage_ranges),
+		.vsel_reg = RK818_LDO5_ON_VSEL_REG,
+		.vsel_mask = RK818_LDO_VSEL_MASK,
+		.enable_reg = RK818_LDO_EN_REG,
+		.enable_mask = BIT(4),
+		.enable_time = 400,
+		.owner = THIS_MODULE,
+	}, {
+		.name = "LDO_REG6",
+		.supply_name = "vcc8",
+		.id = RK818_ID_LDO6,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 18,
+		.linear_ranges = rk808_ldo6_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk808_ldo6_voltage_ranges),
+		.vsel_reg = RK818_LDO6_ON_VSEL_REG,
+		.vsel_mask = RK818_LDO_VSEL_MASK,
+		.enable_reg = RK818_LDO_EN_REG,
+		.enable_mask = BIT(5),
+		.enable_time = 400,
+		.owner = THIS_MODULE,
+	}, {
+		.name = "LDO_REG7",
+		.supply_name = "vcc7",
+		.id = RK818_ID_LDO7,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 18,
+		.linear_ranges = rk808_ldo6_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk808_ldo6_voltage_ranges),
+		.vsel_reg = RK818_LDO7_ON_VSEL_REG,
+		.vsel_mask = RK818_LDO_VSEL_MASK,
+		.enable_reg = RK818_LDO_EN_REG,
+		.enable_mask = BIT(6),
+		.enable_time = 400,
+		.owner = THIS_MODULE,
+	}, {
+		.name = "LDO_REG8",
+		.supply_name = "vcc8",
+		.id = RK818_ID_LDO8,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 17,
+		.linear_ranges = rk808_ldo_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk808_ldo_voltage_ranges),
+		.vsel_reg = RK818_LDO8_ON_VSEL_REG,
+		.vsel_mask = RK818_LDO_VSEL_MASK,
+		.enable_reg = RK818_LDO_EN_REG,
+		.enable_mask = BIT(7),
+		.enable_time = 400,
+		.owner = THIS_MODULE,
+	}, {
+		.name = "LDO_REG9",
+		.supply_name = "vcc9",
+		.id = RK818_ID_LDO9,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 17,
+		.linear_ranges = rk808_ldo_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk808_ldo_voltage_ranges),
+		.vsel_reg = RK818_BOOST_LDO9_ON_VSEL_REG,
+		.vsel_mask = RK818_LDO_VSEL_MASK,
+		.enable_reg = RK818_DCDC_EN_REG,
+		.enable_mask = BIT(5),
+		.enable_time = 400,
+		.owner = THIS_MODULE,
+	}, {
+		.name = "SWITCH_REG",
+		.supply_name = "vcc9",
+		.id = RK818_ID_SWITCH,
+		.ops = &rk808_switch_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = RK818_DCDC_EN_REG,
+		.enable_mask = BIT(6),
+		.owner = THIS_MODULE,
+	}, {
+		.name = "HDMI_SWITCH",
+		.supply_name = "h_5v",
+		.id = RK818_ID_HDMI_SWITCH,
+		.ops = &rk808_switch_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = RK818_H5V_EN_REG,
+		.enable_mask = BIT(0),
+		.owner = THIS_MODULE,
+	}, {
+		.name = "OTG_SWITCH",
+		.supply_name = "usb",
+		.id = RK818_ID_OTG_SWITCH,
+		.ops = &rk808_switch_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = RK818_DCDC_EN_REG,
+		.enable_mask = BIT(7),
+		.owner = THIS_MODULE,
+	},
+};
+
 static struct of_regulator_match rk808_reg_matches[] = {
 	[RK808_ID_DCDC1]	= { .name = "DCDC_REG1" },
 	[RK808_ID_DCDC2]	= { .name = "DCDC_REG2" },
@@ -523,11 +773,32 @@ static struct of_regulator_match rk808_reg_matches[] = {
 	[RK808_ID_SWITCH2]	= { .name = "SWITCH_REG2" },
 };
 
+static struct of_regulator_match rk818_reg_matches[] = {
+	[RK818_ID_DCDC1]	= { .name = "DCDC_REG1" },
+	[RK818_ID_DCDC2]	= { .name = "DCDC_REG2" },
+	[RK818_ID_DCDC3]	= { .name = "DCDC_REG3" },
+	[RK818_ID_DCDC4]	= { .name = "DCDC_REG4" },
+	[RK818_ID_BOOST]	= { .name = "DCDC_BOOST" },
+	[RK818_ID_LDO1]		= { .name = "LDO_REG1" },
+	[RK818_ID_LDO2]		= { .name = "LDO_REG2" },
+	[RK818_ID_LDO3]		= { .name = "LDO_REG3" },
+	[RK818_ID_LDO4]		= { .name = "LDO_REG4" },
+	[RK818_ID_LDO5]		= { .name = "LDO_REG5" },
+	[RK818_ID_LDO6]		= { .name = "LDO_REG6" },
+	[RK818_ID_LDO7]		= { .name = "LDO_REG7" },
+	[RK818_ID_LDO8]		= { .name = "LDO_REG8" },
+	[RK818_ID_LDO9]		= { .name = "LDO_REG9" },
+	[RK818_ID_SWITCH]	= { .name = "SWITCH_REG" },
+	[RK818_ID_HDMI_SWITCH]	= { .name = "HDMI_SWITCH" },
+	[RK818_ID_OTG_SWITCH]	= { .name = "OTG_SWITCH" },
+};
+
 static int rk808_regulator_dt_parse_pdata(struct device *dev,
 				   struct device *client_dev,
 				   struct regmap *map,
 				   struct rk808_regulator_data *pdata)
 {
+	struct rk808 *rk808 = dev_get_drvdata(dev->parent);
 	struct device_node *np;
 	int tmp, ret, i;
 
@@ -535,8 +806,12 @@ static int rk808_regulator_dt_parse_pdata(struct device *dev,
 	if (!np)
 		return -ENXIO;
 
-	ret = of_regulator_match(dev, np, rk808_reg_matches,
-				 RK808_NUM_REGULATORS);
+	if (rk808->variant == RK808_ID)
+		ret = of_regulator_match(dev, np, rk808_reg_matches,
+					 RK808_NUM_REGULATORS);
+	else if (rk808->variant == RK818_ID)
+		ret = of_regulator_match(dev, np, rk818_reg_matches,
+					RK818_NUM_REGULATORS);
 	if (ret < 0)
 		goto dt_parse_end;
 
@@ -586,27 +861,53 @@ static int rk808_regulator_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pdata);
 
-	/* Instantiate the regulators */
-	for (i = 0; i < RK808_NUM_REGULATORS; i++) {
-		if (!rk808_reg_matches[i].init_data ||
-		    !rk808_reg_matches[i].of_node)
-			continue;
-
-		config.dev = &client->dev;
-		config.driver_data = pdata;
-		config.regmap = rk808->regmap;
-		config.of_node = rk808_reg_matches[i].of_node;
-		config.init_data = rk808_reg_matches[i].init_data;
-
-		rk808_rdev = devm_regulator_register(&pdev->dev,
-						     &rk808_reg[i], &config);
-		if (IS_ERR(rk808_rdev)) {
-			dev_err(&client->dev,
-				"failed to register %d regulator\n", i);
-			return PTR_ERR(rk808_rdev);
+	if (rk808->variant == RK818_ID) {
+		/* Instantiate the regulators */
+		for (i = 0; i < RK818_NUM_REGULATORS; i++) {
+			if (!rk818_reg_matches[i].init_data ||
+			    !rk818_reg_matches[i].of_node)
+				continue;
+
+			config.dev = &client->dev;
+			config.driver_data = pdata;
+			config.regmap = rk808->regmap;
+			config.of_node = rk818_reg_matches[i].of_node;
+			config.init_data = rk818_reg_matches[i].init_data;
+
+			rk808_rdev = devm_regulator_register(&pdev->dev,
+					&rk818_reg[i], &config);
+			if (IS_ERR(rk808_rdev)) {
+				dev_err(&client->dev,
+					"failed to register %d regulator\n", i);
+				return PTR_ERR(rk808_rdev);
+			}
+		}
+	} else if (rk808->variant == RK808_ID) {
+		/* Instantiate the regulators */
+		for (i = 0; i < RK808_NUM_REGULATORS; i++) {
+			if (!rk808_reg_matches[i].init_data ||
+			    !rk808_reg_matches[i].of_node)
+				continue;
+
+			config.dev = &client->dev;
+			config.driver_data = pdata;
+			config.regmap = rk808->regmap;
+			config.of_node = rk808_reg_matches[i].of_node;
+			config.init_data = rk808_reg_matches[i].init_data;
+
+			rk808_rdev = devm_regulator_register(&pdev->dev,
+					&rk808_reg[i], &config);
+			if (IS_ERR(rk808_rdev)) {
+				dev_err(&client->dev,
+					"failed to register %d regulator\n", i);
+				return PTR_ERR(rk808_rdev);
+			}
 		}
+	} else {
+		dev_err(&client->dev, "unsupported RK8XX ID %lu\n",
+			rk808->variant);
+		return -EINVAL;
 	}
-
 	return 0;
 }
 
-- 
1.9.1
