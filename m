From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 3/3] regulator: arizona-micsupp: Add support for Cirrus Logic Madera codecs
Date: Tue, 21 May 2019 11:04:39 +0100
Message-ID: <20190521100439.27383-3-ckeepax@opensource.cirrus.com>
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

This adds a new driver identity "madera-micsupp" and probe function
so that this driver can be used to control the micsupp regulator on
Cirrus Logic Madera codecs.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/regulator/Kconfig           |  7 ++--
 drivers/regulator/arizona-micsupp.c | 71 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d2db658840f47..53576c2df737b 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -143,11 +143,12 @@ config REGULATOR_ARIZONA_LDO1
 	  and Wolfson Microelectronic Arizona codecs.
 
 config REGULATOR_ARIZONA_MICSUPP
-	tristate "Wolfson Arizona class devices MICSUPP"
-	depends on MFD_ARIZONA
+	tristate "Cirrus Madera and Wolfson Arizona class devices MICSUPP"
+	depends on MFD_ARIZONA || MFD_MADERA
 	depends on SND_SOC
 	help
-	  Support for the MICSUPP regulators found on Wolfson Arizona class
+	  Support for the MICSUPP regulators found on Cirrus Logic Madera codecs
+	  and Wolfson Microelectronic Arizona codecs
 	  devices.
 
 config REGULATOR_AS3711
diff --git a/drivers/regulator/arizona-micsupp.c b/drivers/regulator/arizona-micsupp.c
index be0d46da51a14..de6802b85e9f9 100644
--- a/drivers/regulator/arizona-micsupp.c
+++ b/drivers/regulator/arizona-micsupp.c
@@ -25,6 +25,10 @@
 #include <linux/mfd/arizona/pdata.h>
 #include <linux/mfd/arizona/registers.h>
 
+#include <linux/mfd/madera/core.h>
+#include <linux/mfd/madera/pdata.h>
+#include <linux/mfd/madera/registers.h>
+
 #include <linux/regulator/arizona-micsupp.h>
 
 struct arizona_micsupp {
@@ -200,6 +204,28 @@ static const struct regulator_init_data arizona_micsupp_ext_default = {
 	.num_consumer_supplies = 1,
 };
 
+static const struct regulator_desc madera_micsupp = {
+	.name = "MICVDD",
+	.supply_name = "CPVDD1",
+	.type = REGULATOR_VOLTAGE,
+	.n_voltages = 40,
+	.ops = &arizona_micsupp_ops,
+
+	.vsel_reg = MADERA_LDO2_CONTROL_1,
+	.vsel_mask = MADERA_LDO2_VSEL_MASK,
+	.enable_reg = MADERA_MIC_CHARGE_PUMP_1,
+	.enable_mask = MADERA_CPMIC_ENA,
+	.bypass_reg = MADERA_MIC_CHARGE_PUMP_1,
+	.bypass_mask = MADERA_CPMIC_BYPASS,
+
+	.linear_ranges = arizona_micsupp_ext_ranges,
+	.n_linear_ranges = ARRAY_SIZE(arizona_micsupp_ext_ranges),
+
+	.enable_time = 3000,
+
+	.owner = THIS_MODULE,
+};
+
 static int arizona_micsupp_of_get_pdata(struct arizona_micsupp_pdata *pdata,
 					struct regulator_config *config,
 					const struct regulator_desc *desc)
@@ -316,6 +342,24 @@ static int arizona_micsupp_probe(struct platform_device *pdev)
 					   &arizona->pdata.micvdd);
 }
 
+static int madera_micsupp_probe(struct platform_device *pdev)
+{
+	struct madera *madera = dev_get_drvdata(pdev->dev.parent);
+	struct arizona_micsupp *micsupp;
+
+	micsupp = devm_kzalloc(&pdev->dev, sizeof(*micsupp), GFP_KERNEL);
+	if (!micsupp)
+		return -ENOMEM;
+
+	micsupp->regmap = madera->regmap;
+	micsupp->dapm = &madera->dapm;
+	micsupp->dev = madera->dev;
+	micsupp->init_data = arizona_micsupp_ext_default;
+
+	return arizona_micsupp_common_init(pdev, micsupp, &madera_micsupp,
+					   &madera->pdata.micvdd);
+}
+
 static struct platform_driver arizona_micsupp_driver = {
 	.probe = arizona_micsupp_probe,
 	.driver		= {
@@ -323,10 +367,35 @@ static struct platform_driver arizona_micsupp_driver = {
 	},
 };
 
-module_platform_driver(arizona_micsupp_driver);
+static struct platform_driver madera_micsupp_driver = {
+	.probe = madera_micsupp_probe,
+	.driver		= {
+		.name	= "madera-micsupp",
+	},
+};
+
+static struct platform_driver * const arizona_micsupp_drivers[] = {
+	&arizona_micsupp_driver,
+	&madera_micsupp_driver,
+};
+
+static int __init arizona_micsupp_init(void)
+{
+	return platform_register_drivers(arizona_micsupp_drivers,
+					 ARRAY_SIZE(arizona_micsupp_drivers));
+}
+module_init(arizona_micsupp_init);
+
+static void __exit arizona_micsupp_exit(void)
+{
+	platform_unregister_drivers(arizona_micsupp_drivers,
+				    ARRAY_SIZE(arizona_micsupp_drivers));
+}
+module_exit(arizona_micsupp_exit);
 
 /* Module information */
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
 MODULE_DESCRIPTION("Arizona microphone supply driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:arizona-micsupp");
+MODULE_ALIAS("platform:madera-micsupp");
-- 
2.11.0
