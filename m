From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 4/5] regulator: fan53555: add devicetree support
Date: Sun, 14 Sep 2014 21:23:04 +0200
Message-ID: <1410722585-13393-5-git-send-email-heiko@sntech.de>
References: <1410722585-13393-1-git-send-email-heiko@sntech.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410722585-13393-1-git-send-email-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Add the ability to parse regulator-data from the devicetree.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/regulator/fan53555.c | 53 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/regulator/fan53555.c b/drivers/regulator/fan53555.c
index d143790..0ec1762 100644
--- a/drivers/regulator/fan53555.c
+++ b/drivers/regulator/fan53555.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/regmap.h>
@@ -233,9 +234,48 @@ static struct regmap_config fan53555_regmap_config = {
 	.val_bits = 8,
 };
 
+static int slew_rates[] = {
+	64000,
+	32000,
+	16000,
+	 8000,
+	 4000,
+	 2000,
+	 1000,
+	  500,
+};
+
+static struct fan53555_platform_data *fan53555_parse_dt(struct device *dev,
+							struct device_node *np)
+{
+	struct fan53555_platform_data *pdata;
+	int ret, i;
+	u32 tmp;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return NULL;
+
+	pdata->regulator = of_get_regulator_init_data(dev, np);
+
+	ret = of_property_read_u32(np, "fairchild,suspend-regulator", &tmp);
+	if (!ret)
+		pdata->sleep_vsel_id = tmp;
+
+	ret = of_property_read_u32(np, "fairchild,slew-rate-microvolt", &tmp);
+	if (!ret) {
+		for (i = 0; i < ARRAY_SIZE(slew_rates); i++)
+			if (slew_rates[i] == tmp)
+				pdata->slew_rate = i;
+	}
+
+	return pdata;
+}
+
 static int fan53555_regulator_probe(struct i2c_client *client,
 				const struct i2c_device_id *id)
 {
+	struct device_node *np = client->dev.of_node;
 	struct fan53555_device_info *di;
 	struct fan53555_platform_data *pdata;
 	struct regulator_config config = { };
@@ -243,6 +283,9 @@ static int fan53555_regulator_probe(struct i2c_client *client,
 	int ret;
 
 	pdata = dev_get_platdata(&client->dev);
+	if (!pdata)
+		pdata = fan53555_parse_dt(&client->dev, np);
+
 	if (!pdata || !pdata->regulator) {
 		dev_err(&client->dev, "Platform data not found!\n");
 		return -ENODEV;
@@ -283,11 +326,14 @@ static int fan53555_regulator_probe(struct i2c_client *client,
 		dev_err(&client->dev, "Failed to setup device!\n");
 		return ret;
 	}
+
 	/* Register regulator */
 	config.dev = di->dev;
 	config.init_data = di->regulator;
 	config.regmap = di->regmap;
 	config.driver_data = di;
+	config.of_node = np;
+
 	ret = fan53555_regulator_register(di, &config);
 	if (ret < 0)
 		dev_err(&client->dev, "Failed to register regulator!\n");
@@ -295,6 +341,12 @@ static int fan53555_regulator_probe(struct i2c_client *client,
 
 }
 
+static const struct of_device_id fan53555_dt_ids[] = {
+	{ .compatible = "fairchild,fan53555" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, fan53555_dt_ids);
+
 static const struct i2c_device_id fan53555_id[] = {
 	{"fan53555", -1},
 	{ },
@@ -303,6 +355,7 @@ static const struct i2c_device_id fan53555_id[] = {
 static struct i2c_driver fan53555_regulator_driver = {
 	.driver = {
 		.name = "fan53555-regulator",
+		.of_match_table = of_match_ptr(fan53555_dt_ids),
 	},
 	.probe = fan53555_regulator_probe,
 	.id_table = fan53555_id,
-- 
2.0.1
