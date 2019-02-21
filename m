From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] regulator: fan53555: Add support for FAN53526
Date: Wed, 20 Feb 2019 16:43:03 -0800
Message-ID: <20190221004303.2578-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The FAN53526 differs from the FAN53555 only in that the mode bit in
VSEL0/VSEL1 is moved to the CONTROL register, the voltage selector mask
is extended by 1 bit and the step is different.

So extend the existing fan53555 driver to support FAN53526 as well.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/regulator/fan53555.txt           |   3 +-
 drivers/regulator/fan53555.c                  | 101 ++++++++++++++++--
 2 files changed, 93 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/fan53555.txt b/Documentation/devicetree/bindings/regulator/fan53555.txt
index 54a3f2c80e3a..e7fc045281d1 100644
--- a/Documentation/devicetree/bindings/regulator/fan53555.txt
+++ b/Documentation/devicetree/bindings/regulator/fan53555.txt
@@ -1,7 +1,8 @@
 Binding for Fairchild FAN53555 regulators
 
 Required properties:
-  - compatible: one of "fcs,fan53555", "silergy,syr827", "silergy,syr828"
+  - compatible: one of "fcs,fan53555", "fcs,fan53526", "silergy,syr827" or
+		"silergy,syr828"
   - reg: I2C address
 
 Optional properties:
diff --git a/drivers/regulator/fan53555.c b/drivers/regulator/fan53555.c
index a3bc8037153e..d7142352f6bc 100644
--- a/drivers/regulator/fan53555.c
+++ b/drivers/regulator/fan53555.c
@@ -40,7 +40,6 @@
 /* VSEL bit definitions */
 #define VSEL_BUCK_EN	(1 << 7)
 #define VSEL_MODE		(1 << 6)
-#define VSEL_NSEL_MASK	0x3F
 /* Chip ID and Verison */
 #define DIE_ID		0x0F	/* ID1 */
 #define DIE_REV		0x0F	/* ID2 */
@@ -49,14 +48,26 @@
 #define CTL_SLEW_MASK		(0x7 << 4)
 #define CTL_SLEW_SHIFT		4
 #define CTL_RESET			(1 << 2)
+#define CTL_MODE_VSEL0_MODE	BIT(0)
+#define CTL_MODE_VSEL1_MODE	BIT(1)
 
 #define FAN53555_NVOLTAGES	64	/* Numbers of voltages */
+#define FAN53526_NVOLTAGES	128
 
 enum fan53555_vendor {
-	FAN53555_VENDOR_FAIRCHILD = 0,
+	FAN53526_VENDOR_FAIRCHILD = 0,
+	FAN53555_VENDOR_FAIRCHILD,
 	FAN53555_VENDOR_SILERGY,
 };
 
+enum {
+	FAN53526_CHIP_ID_01 = 1,
+};
+
+enum {
+	FAN53526_CHIP_REV_08 = 8,
+};
+
 /* IC Type */
 enum {
 	FAN53555_CHIP_ID_00 = 0,
@@ -94,8 +105,12 @@ struct fan53555_device_info {
 	/* Voltage range and step(linear) */
 	unsigned int vsel_min;
 	unsigned int vsel_step;
+	unsigned int vsel_count;
 	/* Voltage slew rate limiting */
 	unsigned int slew_rate;
+	/* Mode */
+	unsigned int mode_reg;
+	unsigned int mode_mask;
 	/* Sleep voltage cache */
 	unsigned int sleep_vol_cache;
 };
@@ -111,7 +126,7 @@ static int fan53555_set_suspend_voltage(struct regulator_dev *rdev, int uV)
 	if (ret < 0)
 		return ret;
 	ret = regmap_update_bits(di->regmap, di->sleep_reg,
-					VSEL_NSEL_MASK, ret);
+				 di->desc.vsel_mask, ret);
 	if (ret < 0)
 		return ret;
 	/* Cache the sleep voltage setting.
@@ -143,11 +158,11 @@ static int fan53555_set_mode(struct regulator_dev *rdev, unsigned int mode)
 
 	switch (mode) {
 	case REGULATOR_MODE_FAST:
-		regmap_update_bits(di->regmap, di->vol_reg,
-				VSEL_MODE, VSEL_MODE);
+		regmap_update_bits(di->regmap, di->mode_reg,
+				   di->mode_mask, di->mode_mask);
 		break;
 	case REGULATOR_MODE_NORMAL:
-		regmap_update_bits(di->regmap, di->vol_reg, VSEL_MODE, 0);
+		regmap_update_bits(di->regmap, di->vol_reg, di->mode_mask, 0);
 		break;
 	default:
 		return -EINVAL;
@@ -161,10 +176,10 @@ static unsigned int fan53555_get_mode(struct regulator_dev *rdev)
 	unsigned int val;
 	int ret = 0;
 
-	ret = regmap_read(di->regmap, di->vol_reg, &val);
+	ret = regmap_read(di->regmap, di->mode_reg, &val);
 	if (ret < 0)
 		return ret;
-	if (val & VSEL_MODE)
+	if (val & di->mode_mask)
 		return REGULATOR_MODE_FAST;
 	else
 		return REGULATOR_MODE_NORMAL;
@@ -219,6 +234,34 @@ static const struct regulator_ops fan53555_regulator_ops = {
 	.set_suspend_disable = fan53555_set_suspend_disable,
 };
 
+static int fan53526_voltages_setup_fairchild(struct fan53555_device_info *di)
+{
+	/* Init voltage range and step */
+	switch (di->chip_id) {
+	case FAN53526_CHIP_ID_01:
+		switch (di->chip_rev) {
+		case FAN53526_CHIP_REV_08:
+			di->vsel_min = 600000;
+			di->vsel_step = 6250;
+			break;
+		default:
+			dev_err(di->dev,
+				"Chip ID %d with rev %d not supported!\n",
+				di->chip_id, di->chip_rev);
+			return -EINVAL;
+		}
+		break;
+	default:
+		dev_err(di->dev,
+			"Chip ID %d not supported!\n", di->chip_id);
+		return -EINVAL;
+	}
+
+	di->vsel_count = FAN53526_NVOLTAGES;
+
+	return 0;
+}
+
 static int fan53555_voltages_setup_fairchild(struct fan53555_device_info *di)
 {
 	/* Init voltage range and step */
@@ -257,6 +300,8 @@ static int fan53555_voltages_setup_fairchild(struct fan53555_device_info *di)
 		return -EINVAL;
 	}
 
+	di->vsel_count = FAN53555_NVOLTAGES;
+
 	return 0;
 }
 
@@ -274,6 +319,8 @@ static int fan53555_voltages_setup_silergy(struct fan53555_device_info *di)
 		return -EINVAL;
 	}
 
+	di->vsel_count = FAN53555_NVOLTAGES;
+
 	return 0;
 }
 
@@ -302,7 +349,35 @@ static int fan53555_device_setup(struct fan53555_device_info *di,
 		return -EINVAL;
 	}
 
+	/* Setup mode control register */
+	switch (di->vendor) {
+	case FAN53526_VENDOR_FAIRCHILD:
+		di->mode_reg = FAN53555_CONTROL;
+
+		switch (pdata->sleep_vsel_id) {
+		case FAN53555_VSEL_ID_0:
+			di->mode_mask = CTL_MODE_VSEL1_MODE;
+			break;
+		case FAN53555_VSEL_ID_1:
+			di->mode_mask = CTL_MODE_VSEL0_MODE;
+			break;
+		}
+		break;
+	case FAN53555_VENDOR_FAIRCHILD:
+	case FAN53555_VENDOR_SILERGY:
+		di->mode_reg = di->vol_reg;
+		di->mode_mask = VSEL_MODE;
+		break;
+	default:
+		dev_err(di->dev, "vendor %d not supported!\n", di->vendor);
+		return -EINVAL;
+	}
+
+	/* Setup voltage range */
 	switch (di->vendor) {
+	case FAN53526_VENDOR_FAIRCHILD:
+		ret = fan53526_voltages_setup_fairchild(di);
+		break;
 	case FAN53555_VENDOR_FAIRCHILD:
 		ret = fan53555_voltages_setup_fairchild(di);
 		break;
@@ -326,13 +401,13 @@ static int fan53555_regulator_register(struct fan53555_device_info *di,
 	rdesc->supply_name = "vin";
 	rdesc->ops = &fan53555_regulator_ops;
 	rdesc->type = REGULATOR_VOLTAGE;
-	rdesc->n_voltages = FAN53555_NVOLTAGES;
+	rdesc->n_voltages = di->vsel_count;
 	rdesc->enable_reg = di->vol_reg;
 	rdesc->enable_mask = VSEL_BUCK_EN;
 	rdesc->min_uV = di->vsel_min;
 	rdesc->uV_step = di->vsel_step;
 	rdesc->vsel_reg = di->vol_reg;
-	rdesc->vsel_mask = VSEL_NSEL_MASK;
+	rdesc->vsel_mask = di->vsel_count - 1;
 	rdesc->owner = THIS_MODULE;
 
 	di->rdev = devm_regulator_register(di->dev, &di->desc, config);
@@ -368,6 +443,9 @@ static struct fan53555_platform_data *fan53555_parse_dt(struct device *dev,
 
 static const struct of_device_id fan53555_dt_ids[] = {
 	{
+		.compatible = "fcs,fan53526",
+		.data = (void *)FAN53526_VENDOR_FAIRCHILD,
+	}, {
 		.compatible = "fcs,fan53555",
 		.data = (void *)FAN53555_VENDOR_FAIRCHILD
 	}, {
@@ -467,6 +545,9 @@ static int fan53555_regulator_probe(struct i2c_client *client,
 
 static const struct i2c_device_id fan53555_id[] = {
 	{
+		.name = "fan53526",
+		.driver_data = FAN53526_VENDOR_FAIRCHILD
+	}, {
 		.name = "fan53555",
 		.driver_data = FAN53555_VENDOR_FAIRCHILD
 	}, {
-- 
2.18.0
