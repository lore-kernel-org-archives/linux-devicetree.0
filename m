From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 3/3] regulator: max8973: add DT parsing of platform specific parameter
Date: Mon, 20 Apr 2015 18:24:17 +0530
Message-ID: <1429534457-15515-4-git-send-email-ldewangan@nvidia.com>
References: <1429534457-15515-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429534457-15515-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, lgirdwood@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

There are some platform specific parameter required to configure
the device like enable external control, DVS gpio etc.

Add DT parsing of such properties to make platform specific data.

Update DT binding doc accordingly.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 .../bindings/regulator/max8973-regulator.txt       | 14 ++++
 drivers/regulator/max8973-regulator.c              | 85 +++++++++++++++++-----
 2 files changed, 79 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/max8973-regulator.txt b/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
index 4f15d8a..f63de7d 100644
--- a/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
@@ -8,6 +8,20 @@ Required properties:
 Any standard regulator properties can be used to configure the single max8973
 DCDC.
 
+Optional properties:
+
+-maxim,externally-enable: boolean, externally control the regulator output
+		enable/disable.
+-maxim,dvs-gpio: GPIO which is connected to DVS pin of device.
+-maxim,dvs-default-state: Default state of GPIO during initialisation.
+		1 for HIGH and 0 for LOW.
+-maxim,enable-remote-sense: boolean, enable reote sense.
+-maxim,enable-falling-slew-rate: boolean, enable falling slew rate.
+-maxim,enable-active-discharge: boolean: enable active discharge.
+-maxim,enable-frequency-shift: boolean, enable 9% frequency shift.
+-maxim,enable-bias-control: boolean, enable bias control. By enabling this
+		startup delay can be reduce to 20us from 220us.
+
 Example:
 
 	max8973@1b {
diff --git a/drivers/regulator/max8973-regulator.c b/drivers/regulator/max8973-regulator.c
index 85fa2de..da7059c 100644
--- a/drivers/regulator/max8973-regulator.c
+++ b/drivers/regulator/max8973-regulator.c
@@ -33,6 +33,7 @@
 #include <linux/regulator/max8973-regulator.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/gpio.h>
+#include <linux/of_gpio.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/regmap.h>
@@ -360,6 +361,46 @@ static const struct regmap_config max8973_regmap_config = {
 	.cache_type		= REGCACHE_RBTREE,
 };
 
+static struct max8973_regulator_platform_data *max8973_parse_dt(
+		struct device *dev)
+{
+	struct max8973_regulator_platform_data *pdata;
+	struct device_node *np = dev->of_node;
+	int ret;
+	u32 pval;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return NULL;
+
+	pdata->enable_ext_control = of_property_read_bool(np,
+						"maxim,externally-enable");
+	pdata->dvs_gpio = of_get_named_gpio(np, "maxim,dvs-gpio", 0);
+
+	ret = of_property_read_u32(np, "maxim,dvs-default-state", &pval);
+	if (!ret)
+		pdata->dvs_def_state = pval;
+
+	if (of_property_read_bool(np, "maxim,enable-remote-sense"))
+		pdata->control_flags  |= MAX8973_CONTROL_REMOTE_SENSE_ENABLE;
+
+	if (of_property_read_bool(np, "maxim,enable-falling-slew-rate"))
+		pdata->control_flags  |=
+				MAX8973_CONTROL_FALLING_SLEW_RATE_ENABLE;
+
+	if (of_property_read_bool(np, "maxim,enable-active-discharge"))
+		pdata->control_flags  |=
+				MAX8973_CONTROL_OUTPUT_ACTIVE_DISCH_ENABLE;
+
+	if (of_property_read_bool(np, "maxim,enable-frequency-shift"))
+		pdata->control_flags  |= MAX8973_CONTROL_FREQ_SHIFT_9PER_ENABLE;
+
+	if (of_property_read_bool(np, "maxim,enable-bias-control"))
+		pdata->control_flags  |= MAX8973_BIAS_ENABLE;
+
+	return pdata;
+}
+
 static int max8973_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -367,15 +408,24 @@ static int max8973_probe(struct i2c_client *client,
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
 	struct max8973_chip *max;
+	bool pdata_from_dt = false;
 	int ret;
 
 	pdata = dev_get_platdata(&client->dev);
 
-	if (!pdata && !client->dev.of_node) {
+	if (!pdata && client->dev.of_node) {
+		pdata = max8973_parse_dt(&client->dev);
+		pdata_from_dt = true;
+	}
+
+	if (!pdata) {
 		dev_err(&client->dev, "No Platform data");
 		return -EIO;
 	}
 
+	if (pdata->dvs_gpio == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
 	max = devm_kzalloc(&client->dev, sizeof(*max), GFP_KERNEL);
 	if (!max)
 		return -ENOMEM;
@@ -399,7 +449,7 @@ static int max8973_probe(struct i2c_client *client,
 	max->desc.uV_step = MAX8973_VOLATGE_STEP;
 	max->desc.n_voltages = MAX8973_BUCK_N_VOLTAGE;
 
-	if (!pdata || !pdata->enable_ext_control) {
+	if (!pdata->enable_ext_control) {
 		max->desc.enable_reg = MAX8973_VOUT;
 		max->desc.enable_mask = MAX8973_VOUT_ENABLE;
 		max->ops.enable = regulator_enable_regmap;
@@ -407,15 +457,10 @@ static int max8973_probe(struct i2c_client *client,
 		max->ops.is_enabled = regulator_is_enabled_regmap;
 	}
 
-	if (pdata) {
-		max->dvs_gpio = (pdata->dvs_gpio) ? pdata->dvs_gpio : -EINVAL;
-		max->enable_external_control = pdata->enable_ext_control;
-		max->curr_gpio_val = pdata->dvs_def_state;
-		max->curr_vout_reg = MAX8973_VOUT + pdata->dvs_def_state;
-	} else {
-		max->dvs_gpio = -EINVAL;
-		max->curr_vout_reg = MAX8973_VOUT;
-	}
+	max->dvs_gpio = (pdata->dvs_gpio) ? pdata->dvs_gpio : -EINVAL;
+	max->enable_external_control = pdata->enable_ext_control;
+	max->curr_gpio_val = pdata->dvs_def_state;
+	max->curr_vout_reg = MAX8973_VOUT + pdata->dvs_def_state;
 
 	max->lru_index[0] = max->curr_vout_reg;
 
@@ -444,18 +489,18 @@ static int max8973_probe(struct i2c_client *client,
 		max->lru_index[max->curr_vout_reg] = 0;
 	}
 
-	if (pdata) {
-		ret = max8973_init_dcdc(max, pdata);
-		if (ret < 0) {
-			dev_err(max->dev, "Max8973 Init failed, err = %d\n", ret);
-			return ret;
-		}
+	if (pdata_from_dt)
+		pdata->reg_init_data = of_get_regulator_init_data(&client->dev,
+					client->dev.of_node, &max->desc);
+
+	ret = max8973_init_dcdc(max, pdata);
+	if (ret < 0) {
+		dev_err(max->dev, "Max8973 Init failed, err = %d\n", ret);
+		return ret;
 	}
 
 	config.dev = &client->dev;
-	config.init_data = pdata ? pdata->reg_init_data :
-		of_get_regulator_init_data(&client->dev, client->dev.of_node,
-					   &max->desc);
+	config.init_data = pdata->reg_init_data;
 	config.driver_data = max;
 	config.of_node = client->dev.of_node;
 	config.regmap = max->regmap;
-- 
1.8.1.5
