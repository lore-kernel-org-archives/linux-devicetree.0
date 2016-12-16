From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/3] regulator: fixed: add support for gpio power switches
Date: Fri, 16 Dec 2016 16:52:30 +0100
Message-ID: <1481903550-3582-4-git-send-email-bgolaszewski@baylibre.com>
References: <1481903550-3582-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481903550-3582-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>, Patrick Titiano <ptitiano@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

The difference between a regular fixed regulator and a GPIO power load
switch is the fact that the latter may be controlled from user space.

Reuse the fixed regulator driver to support power switches.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/regulator/fixed.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index 988a747..f125a3e 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -31,6 +31,8 @@
 #include <linux/regulator/of_regulator.h>
 #include <linux/regulator/machine.h>
 
+#define REG_FIXED_POWER_SWITCH		BIT(0)
+
 struct fixed_voltage_data {
 	struct regulator_desc desc;
 	struct regulator_dev *dev;
@@ -97,11 +99,27 @@ of_get_fixed_voltage_config(struct device *dev,
 static struct regulator_ops fixed_voltage_ops = {
 };
 
+#if defined(CONFIG_OF)
+static const struct of_device_id fixed_of_match[] = {
+	{
+		.compatible = "regulator-fixed",
+	},
+	{
+		.compatible = "gpio-power-switch",
+		.data = (void *)REG_FIXED_POWER_SWITCH,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, fixed_of_match);
+#endif
+
 static int reg_fixed_voltage_probe(struct platform_device *pdev)
 {
 	struct fixed_voltage_config *config;
 	struct fixed_voltage_data *drvdata;
 	struct regulator_config cfg = { };
+	const struct of_device_id *of_id;
+	long flags = 0;
 	int ret;
 
 	drvdata = devm_kzalloc(&pdev->dev, sizeof(struct fixed_voltage_data),
@@ -175,6 +193,13 @@ static int reg_fixed_voltage_probe(struct platform_device *pdev)
 	cfg.driver_data = drvdata;
 	cfg.of_node = pdev->dev.of_node;
 
+	of_id = of_match_node(fixed_of_match, pdev->dev.of_node);
+	if (of_id)
+		flags = (long)of_id->data;
+
+	if (flags & REG_FIXED_POWER_SWITCH)
+		drvdata->desc.userspace_control = 1;
+
 	drvdata->dev = devm_regulator_register(&pdev->dev, &drvdata->desc,
 					       &cfg);
 	if (IS_ERR(drvdata->dev)) {
@@ -191,14 +216,6 @@ static int reg_fixed_voltage_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#if defined(CONFIG_OF)
-static const struct of_device_id fixed_of_match[] = {
-	{ .compatible = "regulator-fixed", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, fixed_of_match);
-#endif
-
 static struct platform_driver regulator_fixed_voltage_driver = {
 	.probe		= reg_fixed_voltage_probe,
 	.driver		= {
-- 
2.9.3
