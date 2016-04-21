From: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 4/7] regulator: rk808: Add regulator driver for RK818
Date: Thu, 21 Apr 2016 15:12:38 +0200
Message-ID: <1461244361-45686-5-git-send-email-w.egorov@phytec.de>
References: <1461244361-45686-1-git-send-email-w.egorov@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1461244361-45686-1-git-send-email-w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
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

Add support for the rk818 regulator. The regulator module consists
of 4 DCDCs, 9 LDOs, 1 switch and 1 BOOST converter which is used to
power OTG and HDMI5V.

The output voltages are configurable and are meant to supply power
to the main processor and other components.

Signed-off-by: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
---
 drivers/regulator/Kconfig           |   4 +-
 drivers/regulator/rk808-regulator.c | 141 ++++++++++++++++++++++++++++++++++--
 2 files changed, 137 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index c77dc08..0efbcbf 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -609,11 +609,11 @@ config REGULATOR_RC5T583
 	  outputs which can be controlled by i2c communication.
 
 config REGULATOR_RK808
-	tristate "Rockchip RK808 Power regulators"
+	tristate "Rockchip RK808/RK818 Power regulators"
 	depends on MFD_RK808
 	help
 	  Select this option to enable the power regulator of ROCKCHIP
-	  PMIC RK808.
+	  PMIC RK808 and RK818.
 	  This driver supports the control of different power rails of device
 	  through regulator interface. The device supports multiple DCDC/LDO
 	  outputs which can be controlled by i2c communication.
diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
index 2c529fa..9931097 100644
--- a/drivers/regulator/rk808-regulator.c
+++ b/drivers/regulator/rk808-regulator.c
@@ -6,6 +6,10 @@
  * Author: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
  * Author: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
  *
+ * Copyright (C) 2016 PHYTEC Messtechnik GmbH
+ *
+ * Author: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
+ *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
  * version 2, as published by the Free Software Foundation.
@@ -32,6 +36,12 @@
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
@@ -454,6 +464,108 @@ static const struct regulator_desc rk808_reg[] = {
 		RK808_DCDC_EN_REG, BIT(6)),
 };
 
+static const struct regulator_desc rk818_reg[] = {
+	{
+		.name = "DCDC_REG1",
+		.supply_name = "vcc1",
+		.of_match = of_match_ptr("DCDC_REG1"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = RK818_ID_DCDC1,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.min_uV = 712500,
+		.uV_step = 12500,
+		.n_voltages = 64,
+		.vsel_reg = RK818_BUCK1_ON_VSEL_REG,
+		.vsel_mask = RK818_BUCK_VSEL_MASK,
+		.enable_reg = RK818_DCDC_EN_REG,
+		.enable_mask = BIT(0),
+		.owner = THIS_MODULE,
+	}, {
+		.name = "DCDC_REG2",
+		.supply_name = "vcc2",
+		.of_match = of_match_ptr("DCDC_REG2"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = RK818_ID_DCDC2,
+		.ops = &rk808_reg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.min_uV = 712500,
+		.uV_step = 12500,
+		.n_voltages = 64,
+		.vsel_reg = RK818_BUCK2_ON_VSEL_REG,
+		.vsel_mask = RK818_BUCK_VSEL_MASK,
+		.enable_reg = RK818_DCDC_EN_REG,
+		.enable_mask = BIT(1),
+		.owner = THIS_MODULE,
+	}, {
+		.name = "DCDC_REG3",
+		.supply_name = "vcc3",
+		.of_match = of_match_ptr("DCDC_REG3"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = RK818_ID_DCDC3,
+		.ops = &rk808_switch_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 1,
+		.enable_reg = RK818_DCDC_EN_REG,
+		.enable_mask = BIT(2),
+		.owner = THIS_MODULE,
+	},
+	RK8XX_DESC(RK818_ID_DCDC4, "DCDC_REG4", "vcc4", 1800, 3600, 100,
+		RK818_BUCK4_ON_VSEL_REG, RK818_BUCK4_VSEL_MASK,
+		RK818_DCDC_EN_REG, BIT(3), 0),
+	RK8XX_DESC(RK818_ID_BOOST, "DCDC_BOOST", "boost", 4700, 5400, 100,
+		RK818_BOOST_LDO9_ON_VSEL_REG, RK818_BOOST_ON_VSEL_MASK,
+		RK818_DCDC_EN_REG, BIT(4), 0),
+	RK8XX_DESC(RK818_ID_LDO1, "LDO_REG1", "vcc6", 1800, 3400, 100,
+		RK818_LDO1_ON_VSEL_REG, RK818_LDO_VSEL_MASK, RK818_LDO_EN_REG,
+		BIT(0), 400),
+	RK8XX_DESC(RK818_ID_LDO2, "LDO_REG2", "vcc6", 1800, 3400, 100,
+		RK818_LDO1_ON_VSEL_REG, RK818_LDO_VSEL_MASK, RK818_LDO_EN_REG,
+		BIT(1), 400),
+	{
+		.name = "LDO_REG3",
+		.supply_name = "vcc7",
+		.of_match = of_match_ptr("LDO_REG3"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = RK818_ID_LDO3,
+		.ops = &rk808_reg_ops_ranges,
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
+	},
+	RK8XX_DESC(RK818_ID_LDO4, "LDO_REG4", "vcc8", 1800, 3400, 100,
+		RK818_LDO4_ON_VSEL_REG, RK818_LDO_VSEL_MASK, RK818_LDO_EN_REG,
+		BIT(3), 400),
+	RK8XX_DESC(RK818_ID_LDO5, "LDO_REG5", "vcc7", 1800, 3400, 100,
+		RK818_LDO5_ON_VSEL_REG, RK818_LDO_VSEL_MASK, RK818_LDO_EN_REG,
+		BIT(4), 400),
+	RK8XX_DESC(RK818_ID_LDO6, "LDO_REG6", "vcc8", 800, 2500, 100,
+		RK818_LDO6_ON_VSEL_REG, RK818_LDO_VSEL_MASK, RK818_LDO_EN_REG,
+		BIT(5), 400),
+	RK8XX_DESC(RK818_ID_LDO7, "LDO_REG7", "vcc7", 800, 2500, 100,
+		RK818_LDO7_ON_VSEL_REG, RK818_LDO_VSEL_MASK, RK818_LDO_EN_REG,
+		BIT(6), 400),
+	RK8XX_DESC(RK818_ID_LDO8, "LDO_REG8", "vcc8", 1800, 3400, 100,
+		RK818_LDO8_ON_VSEL_REG, RK818_LDO_VSEL_MASK, RK818_LDO_EN_REG,
+		BIT(7), 400),
+	RK8XX_DESC(RK818_ID_LDO9, "LDO_REG9", "vcc9", 1800, 3400, 100,
+		RK818_BOOST_LDO9_ON_VSEL_REG, RK818_LDO_VSEL_MASK,
+		RK818_DCDC_EN_REG, BIT(5), 400),
+	RK8XX_DESC_SWITCH(RK818_ID_SWITCH, "SWITCH_REG", "vcc9",
+		RK818_DCDC_EN_REG, BIT(6)),
+	RK8XX_DESC_SWITCH(RK818_ID_HDMI_SWITCH, "HDMI_SWITCH", "h_5v",
+		RK818_H5V_EN_REG, BIT(0)),
+	RK8XX_DESC_SWITCH(RK818_ID_OTG_SWITCH, "OTG_SWITCH", "usb",
+		RK818_DCDC_EN_REG, BIT(7)),
+};
+
 static int rk808_regulator_dt_parse_pdata(struct device *dev,
 				   struct device *client_dev,
 				   struct regmap *map,
@@ -499,7 +611,8 @@ static int rk808_regulator_probe(struct platform_device *pdev)
 	struct regulator_config config = {};
 	struct regulator_dev *rk808_rdev;
 	struct rk808_regulator_data *pdata;
-	int ret, i;
+	const struct regulator_desc *regulators;
+	int ret, i, nregulators;
 
 	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
@@ -512,14 +625,29 @@ static int rk808_regulator_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pdata);
 
+	switch (rk8xx->variant) {
+	case RK808_ID:
+		regulators = rk808_reg;
+		nregulators = RK808_NUM_REGULATORS;
+		break;
+	case RK818_ID:
+		regulators = rk818_reg;
+		nregulators = RK818_NUM_REGULATORS;
+		break;
+	default:
+		dev_err(&client->dev, "unsupported RK8XX ID %lu\n",
+			rk8xx->variant);
+		return -EINVAL;
+	}
+
 	config.dev = &client->dev;
 	config.driver_data = pdata;
 	config.regmap = rk8xx->regmap;
 
 	/* Instantiate the regulators */
-	for (i = 0; i < RK808_NUM_REGULATORS; i++) {
+	for (i = 0; i < nregulators; i++) {
 		rk808_rdev = devm_regulator_register(&pdev->dev,
-						     &rk808_reg[i], &config);
+						     &regulators[i], &config);
 		if (IS_ERR(rk808_rdev)) {
 			dev_err(&client->dev,
 				"failed to register %d regulator\n", i);
@@ -540,8 +668,9 @@ static struct platform_driver rk808_regulator_driver = {
 
 module_platform_driver(rk808_regulator_driver);
 
-MODULE_DESCRIPTION("regulator driver for the rk808 series PMICs");
-MODULE_AUTHOR("Chris Zhong<zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
-MODULE_AUTHOR("Zhang Qing<zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
+MODULE_DESCRIPTION("regulator driver for the rk8xx series PMICs");
+MODULE_AUTHOR("Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
+MODULE_AUTHOR("Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
+MODULE_AUTHOR("Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:rk808-regulator");
-- 
1.9.1
