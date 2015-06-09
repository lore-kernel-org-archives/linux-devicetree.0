From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/2] regulator: max8973: add support for MAX77621
Date: Tue, 9 Jun 2015 19:17:53 +0530
Message-ID: <1433857673-28744-2-git-send-email-ldewangan@nvidia.com>
References: <1433857673-28744-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433857673-28744-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Maxim MAX77621 device is high-efficiency, three-phase,
DC-DC step-down switching regulator delivers peak
output currents up to 16A. This device is extension of
MAX8973 and compatible with the register definition.

The MAX77621 has the SHUTDOWN pin which is EN pin on the
MAX8973. On MAX77621, the SHUTDOWN pin (active low) reset
device register to its POR/OTP value. The voltage output
is enabled when SHUTDONW pin is HIGH and EN bit on VOUT
register is HIGH.

For MAX8973, VOUT is enabled when EN bit or EN pin is high.

Add support of the MAX77621 device on max8973 regulator driver
with following changes:
- Make sure SHUTDOWN pin is set HIGH through GPIO calls if
  GPIO from AP connected to SHUTDOWN pin provided.
- Enable/disable the rail through register access only.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 .../bindings/regulator/max8973-regulator.txt       |   4 +-
 drivers/regulator/max8973-regulator.c              | 104 +++++++++++++++++----
 2 files changed, 87 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/max8973-regulator.txt b/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
index 201a263..55efb24 100644
--- a/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
@@ -2,7 +2,9 @@
 
 Required properties:
 
-- compatible:	must be "maxim,max8973"
+- compatible:	must be one of following:
+			"maxim,max8973"
+			"maxim,max77621".
 - reg:		the i2c slave address of the regulator. It should be 0x1b.
 
 Any standard regulator properties can be used to configure the single max8973
diff --git a/drivers/regulator/max8973-regulator.c b/drivers/regulator/max8973-regulator.c
index 663e4df..89e53e0 100644
--- a/drivers/regulator/max8973-regulator.c
+++ b/drivers/regulator/max8973-regulator.c
@@ -27,6 +27,7 @@
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
@@ -91,6 +92,11 @@
 #define MAX8973_VOLATGE_STEP				6250
 #define MAX8973_BUCK_N_VOLTAGE				0x80
 
+enum device_id {
+	MAX8973,
+	MAX77621
+};
+
 /* Maxim 8973 chip information */
 struct max8973_chip {
 	struct device *dev;
@@ -104,6 +110,7 @@ struct max8973_chip {
 	int curr_vout_reg;
 	int curr_gpio_val;
 	struct regulator_ops ops;
+	enum device_id id;
 };
 
 /*
@@ -390,7 +397,7 @@ static int max8973_init_dcdc(struct max8973_chip *max,
 	}
 
 	/* If external control is enabled then disable EN bit */
-	if (max->enable_external_control) {
+	if (max->enable_external_control && (max->id == MAX8973)) {
 		ret = regmap_update_bits(max->regmap, MAX8973_VOUT,
 						MAX8973_VOUT_ENABLE, 0);
 		if (ret < 0)
@@ -448,6 +455,13 @@ static struct max8973_regulator_platform_data *max8973_parse_dt(
 	return pdata;
 }
 
+static const struct of_device_id of_max8973_match_tbl[] = {
+	{ .compatible = "maxim,max8973", .data = (void *)MAX8973, },
+	{ .compatible = "maxim,max77621", .data = (void *)MAX77621, },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, of_max8973_match_tbl);
+
 static int max8973_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -457,6 +471,7 @@ static int max8973_probe(struct i2c_client *client,
 	struct regulator_dev *rdev;
 	struct max8973_chip *max;
 	bool pdata_from_dt = false;
+	unsigned int chip_id;
 	int ret;
 
 	pdata = dev_get_platdata(&client->dev);
@@ -486,6 +501,27 @@ static int max8973_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	if (client->dev.of_node) {
+		const struct of_device_id *match;
+
+		match = of_match_device(of_match_ptr(of_max8973_match_tbl),
+				&client->dev);
+		if (!match)
+			return -ENODATA;
+		max->id = (u32)((uintptr_t)match->data);
+	} else {
+		max->id = id->driver_data;
+	}
+
+	ret = regmap_read(max->regmap, MAX8973_CHIPID1, &chip_id);
+	if (ret < 0) {
+		dev_err(&client->dev, "register CHIPID1 read failed, %d", ret);
+		return ret;
+	}
+
+	dev_info(&client->dev, "CHIP-ID OTP: 0x%02x ID_M: 0x%02x\n",
+			(chip_id >> 4) & 0xF, (chip_id >> 1) & 0x7);
+
 	i2c_set_clientdata(client, max);
 	max->ops = max8973_dcdc_ops;
 	max->dev = &client->dev;
@@ -507,14 +543,6 @@ static int max8973_probe(struct i2c_client *client,
 	if (gpio_is_valid(max->enable_gpio))
 		max->enable_external_control = true;
 
-	if (!pdata->enable_ext_control) {
-		max->desc.enable_reg = MAX8973_VOUT;
-		max->desc.enable_mask = MAX8973_VOUT_ENABLE;
-		max->ops.enable = regulator_enable_regmap;
-		max->ops.disable = regulator_disable_regmap;
-		max->ops.is_enabled = regulator_is_enabled_regmap;
-	}
-
 	max->lru_index[0] = max->curr_vout_reg;
 
 	if (gpio_is_valid(max->dvs_gpio)) {
@@ -546,6 +574,50 @@ static int max8973_probe(struct i2c_client *client,
 		pdata->reg_init_data = of_get_regulator_init_data(&client->dev,
 					client->dev.of_node, &max->desc);
 
+	ridata = pdata->reg_init_data;
+	switch (max->id) {
+	case MAX8973:
+		if (!pdata->enable_ext_control) {
+			max->desc.enable_reg = MAX8973_VOUT;
+			max->desc.enable_mask = MAX8973_VOUT_ENABLE;
+			max->ops.enable = regulator_enable_regmap;
+			max->ops.disable = regulator_disable_regmap;
+			max->ops.is_enabled = regulator_is_enabled_regmap;
+			break;
+		}
+
+		if (gpio_is_valid(max->enable_gpio)) {
+			config.ena_gpio_flags = GPIOF_OUT_INIT_LOW;
+			if (ridata && (ridata->constraints.always_on ||
+					ridata->constraints.boot_on))
+				config.ena_gpio_flags = GPIOF_OUT_INIT_HIGH;
+			config.ena_gpio = max->enable_gpio;
+		}
+		break;
+
+	case MAX77621:
+		if (gpio_is_valid(max->enable_gpio)) {
+			ret = devm_gpio_request_one(&client->dev,
+					max->enable_gpio, GPIOF_OUT_INIT_HIGH,
+					"max8973-en-gpio");
+			if (ret) {
+				dev_err(&client->dev,
+					"gpio_request for gpio %d failed: %d\n",
+					max->enable_gpio, ret);
+				return ret;
+			}
+		}
+
+		max->desc.enable_reg = MAX8973_VOUT;
+		max->desc.enable_mask = MAX8973_VOUT_ENABLE;
+		max->ops.enable = regulator_enable_regmap;
+		max->ops.disable = regulator_disable_regmap;
+		max->ops.is_enabled = regulator_is_enabled_regmap;
+		break;
+	default:
+		break;
+	}
+
 	ret = max8973_init_dcdc(max, pdata);
 	if (ret < 0) {
 		dev_err(max->dev, "Max8973 Init failed, err = %d\n", ret);
@@ -558,15 +630,6 @@ static int max8973_probe(struct i2c_client *client,
 	config.of_node = client->dev.of_node;
 	config.regmap = max->regmap;
 
-	if (gpio_is_valid(max->enable_gpio)) {
-		ridata = pdata->reg_init_data;
-		config.ena_gpio_flags = GPIOF_OUT_INIT_LOW;
-		if (ridata && (ridata->constraints.always_on ||
-			ridata->constraints.boot_on))
-			config.ena_gpio_flags = GPIOF_OUT_INIT_HIGH;
-		config.ena_gpio = max->enable_gpio;
-	}
-
 	/* Register the regulators */
 	rdev = devm_regulator_register(&client->dev, &max->desc, &config);
 	if (IS_ERR(rdev)) {
@@ -579,15 +642,16 @@ static int max8973_probe(struct i2c_client *client,
 }
 
 static const struct i2c_device_id max8973_id[] = {
-	{.name = "max8973",},
+	{.name = "max8973", .driver_data = MAX8973},
+	{.name = "max77621", .driver_data = MAX77621},
 	{},
 };
-
 MODULE_DEVICE_TABLE(i2c, max8973_id);
 
 static struct i2c_driver max8973_i2c_driver = {
 	.driver = {
 		.name = "max8973",
+		.of_match_table = of_max8973_match_tbl,
 		.owner = THIS_MODULE,
 	},
 	.probe = max8973_probe,
-- 
2.1.4
