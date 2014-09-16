From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 2/3] regulator: fan53555: add devicetree support
Date: Tue, 16 Sep 2014 21:22:53 +0200
Message-ID: <1410895374-18367-3-git-send-email-heiko@sntech.de>
References: <1410895374-18367-1-git-send-email-heiko@sntech.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410895374-18367-1-git-send-email-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Add the ability to parse regulator-data from the devicetree.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/regulator/fan53555.c | 50 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/fan53555.c b/drivers/regulator/fan53555.c
index 5808435..fa29ba0 100644
--- a/drivers/regulator/fan53555.c
+++ b/drivers/regulator/fan53555.c
@@ -18,6 +18,8 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/of_device.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/regmap.h>
@@ -252,9 +254,39 @@ static struct regmap_config fan53555_regmap_config = {
 	.val_bits = 8,
 };
 
+static struct fan53555_platform_data *fan53555_parse_dt(struct device *dev,
+							struct device_node *np)
+{
+	struct fan53555_platform_data *pdata;
+	int ret;
+	u32 tmp;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return NULL;
+
+	pdata->regulator = of_get_regulator_init_data(dev, np);
+
+	ret = of_property_read_u32(np, "fcs,suspend-voltage-selector",
+				   &tmp);
+	if (!ret)
+		pdata->sleep_vsel_id = tmp;
+
+	return pdata;
+}
+
+static const struct of_device_id fan53555_dt_ids[] = {
+	{
+		.compatible = "fcs,fan53555",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, fan53555_dt_ids);
+
 static int fan53555_regulator_probe(struct i2c_client *client,
 				const struct i2c_device_id *id)
 {
+	struct device_node *np = client->dev.of_node;
 	struct fan53555_device_info *di;
 	struct fan53555_platform_data *pdata;
 	struct regulator_config config = { };
@@ -262,6 +294,9 @@ static int fan53555_regulator_probe(struct i2c_client *client,
 	int ret;
 
 	pdata = dev_get_platdata(&client->dev);
+	if (!pdata)
+		pdata = fan53555_parse_dt(&client->dev, np);
+
 	if (!pdata || !pdata->regulator) {
 		dev_err(&client->dev, "Platform data not found!\n");
 		return -ENODEV;
@@ -272,11 +307,15 @@ static int fan53555_regulator_probe(struct i2c_client *client,
 	if (!di)
 		return -ENOMEM;
 
-	/* if no ramp constraint set, get the pdata ramp_delay */
-	if (!di->regulator->constraints.ramp_delay) {
-		int slew_idx = (pdata->slew_rate & 0x7) ? pdata->slew_rate : 0;
+	if (!client->dev.of_node) {
+		/* if no ramp constraint set, get the pdata ramp_delay */
+		if (!di->regulator->constraints.ramp_delay) {
+			int slew_idx = (pdata->slew_rate & 0x7)
+						? pdata->slew_rate : 0;
 
-		di->regulator->constraints.ramp_delay = slew_rates[slew_idx];
+			di->regulator->constraints.ramp_delay
+						= slew_rates[slew_idx];
+		}
 	}
 
 	di->regmap = devm_regmap_init_i2c(client, &fan53555_regmap_config);
@@ -314,6 +353,8 @@ static int fan53555_regulator_probe(struct i2c_client *client,
 	config.init_data = di->regulator;
 	config.regmap = di->regmap;
 	config.driver_data = di;
+	config.of_node = np;
+
 	ret = fan53555_regulator_register(di, &config);
 	if (ret < 0)
 		dev_err(&client->dev, "Failed to register regulator!\n");
@@ -329,6 +370,7 @@ static const struct i2c_device_id fan53555_id[] = {
 static struct i2c_driver fan53555_regulator_driver = {
 	.driver = {
 		.name = "fan53555-regulator",
+		.of_match_table = of_match_ptr(fan53555_dt_ids),
 	},
 	.probe = fan53555_regulator_probe,
 	.id_table = fan53555_id,
-- 
2.0.1
