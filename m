From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v5 1/8] regulator: lochnagar: Move driver to binding from DT
Date: Tue, 20 Nov 2018 14:16:24 +0000
Message-ID: <20181120141631.18949-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Based on review comments on the MFD driver, move the child drivers for
the Lochnagar MFD over to binding through device tree.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v4:
 - Split out regulator binding for each regulator

Thanks,
Charles

 drivers/regulator/lochnagar-regulator.c | 48 +++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/lochnagar-regulator.c b/drivers/regulator/lochnagar-regulator.c
index 182198246479..5a89e6d4b9a6 100644
--- a/drivers/regulator/lochnagar-regulator.c
+++ b/drivers/regulator/lochnagar-regulator.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
@@ -214,28 +215,52 @@ static const struct regulator_desc lochnagar_regulators[] = {
 	},
 };
 
+static const struct of_device_id lochnagar_of_match[] = {
+	{
+		.compatible = "cirrus,lochnagar2-micvdd",
+		.data = &lochnagar_regulators[LOCHNAGAR_MICVDD],
+	},
+	{
+		.compatible = "cirrus,lochnagar2-mic1vdd",
+		.data = &lochnagar_regulators[LOCHNAGAR_MIC1VDD],
+	},
+	{
+		.compatible = "cirrus,lochnagar2-mic2vdd",
+		.data = &lochnagar_regulators[LOCHNAGAR_MIC1VDD],
+	},
+	{
+		.compatible = "cirrus,lochnagar2-vddcore",
+		.data = &lochnagar_regulators[LOCHNAGAR_VDDCORE],
+	},
+	{},
+};
+
 static int lochnagar_regulator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct lochnagar *lochnagar = dev_get_drvdata(dev->parent);
 	struct regulator_config config = { };
+	const struct of_device_id *of_id;
+	const struct regulator_desc *desc;
 	struct regulator_dev *rdev;
-	int ret, i;
+	int ret;
 
-	config.dev = lochnagar->dev;
+	config.dev = dev;
 	config.regmap = lochnagar->regmap;
 	config.driver_data = lochnagar;
 
-	for (i = 0; i < ARRAY_SIZE(lochnagar_regulators); i++) {
-		const struct regulator_desc *desc = &lochnagar_regulators[i];
+	of_id = of_match_device(lochnagar_of_match, dev);
+	if (!of_id)
+		return -EINVAL;
 
-		rdev = devm_regulator_register(dev, desc, &config);
-		if (IS_ERR(rdev)) {
-			ret = PTR_ERR(rdev);
-			dev_err(dev, "Failed to register %s regulator: %d\n",
-				desc->name, ret);
-			return ret;
-		}
+	desc = of_id->data;
+
+	rdev = devm_regulator_register(dev, desc, &config);
+	if (IS_ERR(rdev)) {
+		ret = PTR_ERR(rdev);
+		dev_err(dev, "Failed to register %s regulator: %d\n",
+			desc->name, ret);
+		return ret;
 	}
 
 	return 0;
@@ -244,6 +269,7 @@ static int lochnagar_regulator_probe(struct platform_device *pdev)
 static struct platform_driver lochnagar_regulator_driver = {
 	.driver = {
 		.name = "lochnagar-regulator",
+		.of_match_table = of_match_ptr(lochnagar_of_match),
 	},
 
 	.probe = lochnagar_regulator_probe,
-- 
2.11.0
