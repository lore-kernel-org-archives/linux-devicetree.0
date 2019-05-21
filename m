From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 2/3] regulator: arizona-ldo1: Add support for Cirrus Logic Madera codecs
Date: Tue, 21 May 2019 11:04:38 +0100
Message-ID: <20190521100439.27383-2-ckeepax@opensource.cirrus.com>
References: <20190521100439.27383-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521100439.27383-1-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Richard Fitzgerald <rf@opensource.cirrus.com>

This adds a new driver identity "madera-ldo1" and probe function
so that this driver can be used to control the LDO1 regulator on
some Cirrus Logic Madera codecs.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/regulator/Kconfig        |  8 ++--
 drivers/regulator/arizona-ldo1.c | 83 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 86 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 6c37f0df93232..d2db658840f47 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -135,12 +135,12 @@ config REGULATOR_AB8500
 	  signal AB8500 PMIC
 
 config REGULATOR_ARIZONA_LDO1
-	tristate "Wolfson Arizona class devices LDO1"
-	depends on MFD_ARIZONA
+	tristate "Cirrus Madera and Wolfson Arizona class devices LDO1"
+	depends on MFD_ARIZONA || MFD_MADERA
 	depends on SND_SOC
 	help
-	  Support for the LDO1 regulators found on Wolfson Arizona class
-	  devices.
+	  Support for the LDO1 regulators found on Cirrus Logic Madera codecs
+	  and Wolfson Microelectronic Arizona codecs.
 
 config REGULATOR_ARIZONA_MICSUPP
 	tristate "Wolfson Arizona class devices MICSUPP"
diff --git a/drivers/regulator/arizona-ldo1.c b/drivers/regulator/arizona-ldo1.c
index e4bc7b1e5ccdd..1a3d7b720f5e0 100644
--- a/drivers/regulator/arizona-ldo1.c
+++ b/drivers/regulator/arizona-ldo1.c
@@ -25,6 +25,10 @@
 #include <linux/mfd/arizona/pdata.h>
 #include <linux/mfd/arizona/registers.h>
 
+#include <linux/mfd/madera/core.h>
+#include <linux/mfd/madera/pdata.h>
+#include <linux/mfd/madera/registers.h>
+
 struct arizona_ldo1 {
 	struct regulator_dev *regulator;
 	struct regmap *regmap;
@@ -158,6 +162,31 @@ static const struct regulator_init_data arizona_ldo1_wm5110 = {
 	.num_consumer_supplies = 1,
 };
 
+static const struct regulator_desc madera_ldo1 = {
+	.name = "LDO1",
+	.supply_name = "LDOVDD",
+	.type = REGULATOR_VOLTAGE,
+	.ops = &arizona_ldo1_ops,
+
+	.vsel_reg = MADERA_LDO1_CONTROL_1,
+	.vsel_mask = MADERA_LDO1_VSEL_MASK,
+	.min_uV = 900000,
+	.uV_step = 25000,
+	.n_voltages = 13,
+	.enable_time = 3000,
+
+	.owner = THIS_MODULE,
+};
+
+static const struct regulator_init_data madera_ldo1_default = {
+	.constraints = {
+		.min_uV = 1200000,
+		.max_uV = 1200000,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = 1,
+};
+
 static int arizona_ldo1_of_get_pdata(struct arizona_ldo1_pdata *pdata,
 				     struct regulator_config *config,
 				     const struct regulator_desc *desc,
@@ -320,6 +349,32 @@ static int arizona_ldo1_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int madera_ldo1_probe(struct platform_device *pdev)
+{
+	struct madera *madera = dev_get_drvdata(pdev->dev.parent);
+	struct arizona_ldo1 *ldo1;
+	bool external_dcvdd;
+	int ret;
+
+	ldo1 = devm_kzalloc(&pdev->dev, sizeof(*ldo1), GFP_KERNEL);
+	if (!ldo1)
+		return -ENOMEM;
+
+	ldo1->regmap = madera->regmap;
+
+	ldo1->init_data = madera_ldo1_default;
+
+	ret = arizona_ldo1_common_init(pdev, ldo1, &madera_ldo1,
+				       &madera->pdata.ldo1,
+				       &external_dcvdd);
+	if (ret)
+		return ret;
+
+	madera->internal_dcvdd = !external_dcvdd;
+
+	return 0;
+}
+
 static struct platform_driver arizona_ldo1_driver = {
 	.probe = arizona_ldo1_probe,
 	.remove = arizona_ldo1_remove,
@@ -328,10 +383,36 @@ static struct platform_driver arizona_ldo1_driver = {
 	},
 };
 
-module_platform_driver(arizona_ldo1_driver);
+static struct platform_driver madera_ldo1_driver = {
+	.probe = madera_ldo1_probe,
+	.remove = arizona_ldo1_remove,
+	.driver		= {
+		.name	= "madera-ldo1",
+	},
+};
+
+static struct platform_driver * const madera_ldo1_drivers[] = {
+	&arizona_ldo1_driver,
+	&madera_ldo1_driver,
+};
+
+static int __init arizona_ldo1_init(void)
+{
+	return platform_register_drivers(madera_ldo1_drivers,
+					 ARRAY_SIZE(madera_ldo1_drivers));
+}
+module_init(arizona_ldo1_init);
+
+static void __exit madera_ldo1_exit(void)
+{
+	platform_unregister_drivers(madera_ldo1_drivers,
+				    ARRAY_SIZE(madera_ldo1_drivers));
+}
+module_exit(madera_ldo1_exit);
 
 /* Module information */
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
 MODULE_DESCRIPTION("Arizona LDO1 driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:arizona-ldo1");
+MODULE_ALIAS("platform:madera-ldo1");
-- 
2.11.0
