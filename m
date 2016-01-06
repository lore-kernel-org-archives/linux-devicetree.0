From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/1] regulator: max8973: add support for junction thermal warning
Date: Wed, 6 Jan 2016 11:45:22 +0530
Message-ID: <1452060922-24426-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

The driver MAX8973 supports the driver for Maxim PMIC MAX77621.
MAX77621 supports the  junction temp warning at 120 degC and
140 degC which is configurable. It generates alert signal when
junction temperature crosses these threshold.

MAX77621 does not support the continuous temp monitoring of
junction temperature. It just report whether junction temperature
crossed the threshold or not.

Add support to
- Configure junction temp warning threshold via DT property
  to generate alert when it crosses the threshold.
- Add support to interrupt the host from this device when alert
  occurred.
- read the junction temp via thermal framework.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 .../bindings/regulator/max8973-regulator.txt       |   6 +
 drivers/regulator/max8973-regulator.c              | 144 ++++++++++++++++++++-
 include/linux/regulator/max8973-regulator.h        |   6 +
 3 files changed, 154 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/max8973-regulator.txt b/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
index f80ea2f..88bf9b1 100644
--- a/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
@@ -31,6 +31,12 @@ Optional properties:
 		property is available then etr will be enable default.
 
 Enhanced transient response (ETR) will affect the configuration of CKADV.
+-maxim,junction-temp-warning: Junction temp warning on which device generates
+		warning interrupts.
+-interrupt-flags: Interrupt flags for registering interrupt which can not be
+		passed via interrupt properties.
+
+Please note that thermal functionality is only supported on MAX77621.
 
 Example:
 
diff --git a/drivers/regulator/max8973-regulator.c b/drivers/regulator/max8973-regulator.c
index 5b75b7c..6ffb3ac 100644
--- a/drivers/regulator/max8973-regulator.c
+++ b/drivers/regulator/max8973-regulator.c
@@ -38,6 +38,9 @@
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/regmap.h>
+#include <linux/thermal.h>
+#include <linux/irq.h>
+#include <linux/interrupt.h>
 
 /* Register definitions */
 #define MAX8973_VOUT					0x0
@@ -74,6 +77,7 @@
 #define MAX8973_WDTMR_ENABLE				BIT(6)
 #define MAX8973_DISCH_ENBABLE				BIT(5)
 #define MAX8973_FT_ENABLE				BIT(4)
+#define MAX77621_T_JUNCTION_120				BIT(7)
 
 #define MAX8973_CKKADV_TRIP_MASK			0xC
 #define MAX8973_CKKADV_TRIP_DISABLE			0xC
@@ -93,6 +97,13 @@
 #define MAX8973_VOLATGE_STEP				6250
 #define MAX8973_BUCK_N_VOLTAGE				0x80
 
+#define MAX77621_CHIPID_TJINT_S				BIT(0)
+
+#define MAX77621_NORMAL_OPERATING_TEMP			100000
+#define MAX77621_TJINT_WARNING_TEMP_120			120000
+#define MAX77621_TJINT_WARNING_TEMP_140			140000
+
+
 enum device_id {
 	MAX8973,
 	MAX77621
@@ -112,6 +123,10 @@ struct max8973_chip {
 	int curr_gpio_val;
 	struct regulator_ops ops;
 	enum device_id id;
+	int junction_temp_warning;
+	int irq;
+	unsigned long irq_flags;
+	struct thermal_zone_device *tz_device;
 };
 
 /*
@@ -391,6 +406,10 @@ static int max8973_init_dcdc(struct max8973_chip *max,
 	if (pdata->control_flags & MAX8973_CONTROL_FREQ_SHIFT_9PER_ENABLE)
 		control1 |= MAX8973_FREQSHIFT_9PER;
 
+	if ((max->id == MAX77621) && (pdata->junction_temp_warning ==
+					MAX77621_TJINT_WARNING_TEMP_120))
+		control2 |=  MAX77621_T_JUNCTION_120;
+
 	if (!(pdata->control_flags & MAX8973_CONTROL_PULL_DOWN_ENABLE))
 		control2 |= MAX8973_DISCH_ENBABLE;
 
@@ -457,6 +476,94 @@ static int max8973_init_dcdc(struct max8973_chip *max,
 	return ret;
 }
 
+#ifdef CONFIG_THERMAL_OF
+static int max8973_thermal_read_temp(void *data, int *temp)
+{
+	struct max8973_chip *mchip = data;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(mchip->regmap, MAX8973_CHIPID1, &val);
+	if (ret < 0) {
+		dev_err(mchip->dev, "register CHIPID1 read failed, %d", ret);
+		return ret;
+	}
+
+	/* +1 degC to trigger cool devive */
+	if (val & MAX77621_CHIPID_TJINT_S)
+		*temp = mchip->junction_temp_warning + 1000;
+	else
+		*temp = MAX77621_NORMAL_OPERATING_TEMP;
+
+	return 0;
+}
+
+static irqreturn_t max8973_thermal_irq(int irq, void *data)
+{
+	struct max8973_chip *mchip = data;
+
+	dev_info(mchip->dev, "Junction Temp warning occurred\n");
+	thermal_zone_device_update(mchip->tz_device);
+	return IRQ_HANDLED;
+}
+
+static const struct thermal_zone_of_device_ops max77621_tz_ops = {
+	.get_temp = max8973_thermal_read_temp,
+};
+
+static int max8973_thermal_init(struct max8973_chip *mchip)
+{
+	int ret;
+
+	if (mchip->id != MAX77621)
+		return 0;
+
+	mchip->tz_device = thermal_zone_of_sensor_register(mchip->dev, 0,
+					mchip, &max77621_tz_ops);
+	if (IS_ERR(mchip->tz_device)) {
+		ret = PTR_ERR(mchip->tz_device);
+		dev_err(mchip->dev,
+			"Device can not register as thermal sensor: %d\n", ret);
+		mchip->tz_device = NULL;
+		return ret;
+	}
+
+	if (mchip->irq <= 0)
+		return 0;
+
+	ret = request_threaded_irq(mchip->irq, NULL, max8973_thermal_irq,
+			IRQF_ONESHOT | mchip->irq_flags,
+			dev_name(mchip->dev), mchip);
+	if (ret < 0) {
+		dev_err(mchip->dev, "request irq %d failed: %d\n",
+			mchip->irq, ret);
+		goto fail;
+	}
+	return 0;
+
+fail:
+	thermal_zone_of_sensor_unregister(mchip->dev, mchip->tz_device);
+	return ret;
+}
+
+static void max8973_thermal_deinit(struct max8973_chip *mchip)
+{
+	if ((mchip->id != MAX77621) || !mchip->tz_device)
+		return;
+
+	if (mchip->irq > 0)
+		free_irq(mchip->irq, mchip);
+
+	thermal_zone_of_sensor_unregister(mchip->dev, mchip->tz_device);
+}
+#else
+static int max8973_thermal_init(struct max8973_chip *mchip)
+{
+	return 0;
+}
+static void max8973_thermal_deinit(struct max8973_chip *mchip) { }
+#endif
+
 static const struct regmap_config max8973_regmap_config = {
 	.reg_bits		= 8,
 	.val_bits		= 8,
@@ -465,10 +572,12 @@ static const struct regmap_config max8973_regmap_config = {
 };
 
 static struct max8973_regulator_platform_data *max8973_parse_dt(
-		struct device *dev)
+		struct i2c_client *client)
 {
 	struct max8973_regulator_platform_data *pdata;
+	struct device *dev = &client->dev;
 	struct device_node *np = dev->of_node;
+	struct irq_data *irq_data = irq_get_irq_data(client->irq);
 	int ret;
 	u32 pval;
 	bool etr_enable;
@@ -521,6 +630,20 @@ static struct max8973_regulator_platform_data *max8973_parse_dt(
 		pdata->control_flags |= MAX8973_CONTROL_CLKADV_TRIP_DISABLED;
 	}
 
+	ret = of_property_read_u32(np, "maxim,junction-temp-warning", &pval);
+	if (!ret)
+		pdata->junction_temp_warning = pval;
+	pdata->junction_temp_warning = (pdata->junction_temp_warning <
+					MAX77621_TJINT_WARNING_TEMP_120) ?
+					MAX77621_TJINT_WARNING_TEMP_120 :
+					MAX77621_TJINT_WARNING_TEMP_140;
+	if (irq_data) {
+		pdata->irq_flags = irqd_get_trigger_type(irq_data);
+		pval = 0;
+		ret = of_property_read_u32(np, "interrupt-flags", &pval);
+		pdata->irq_flags |= (ret) ? 0 : pval;
+		dev_info(dev, "Irq flag is 0x%08lx\n", pdata->irq_flags);
+	}
 	return pdata;
 }
 
@@ -546,7 +669,7 @@ static int max8973_probe(struct i2c_client *client,
 	pdata = dev_get_platdata(&client->dev);
 
 	if (!pdata && client->dev.of_node) {
-		pdata = max8973_parse_dt(&client->dev);
+		pdata = max8973_parse_dt(client);
 		pdata_from_dt = true;
 	}
 
@@ -592,6 +715,7 @@ static int max8973_probe(struct i2c_client *client,
 			(chip_id >> 4) & 0xF, (chip_id >> 1) & 0x7);
 
 	i2c_set_clientdata(client, max);
+	max->irq = client->irq;
 	max->ops = max8973_dcdc_ops;
 	max->dev = &client->dev;
 	max->desc.name = id->name;
@@ -608,6 +732,8 @@ static int max8973_probe(struct i2c_client *client,
 	max->enable_external_control = pdata->enable_ext_control;
 	max->curr_gpio_val = pdata->dvs_def_state;
 	max->curr_vout_reg = MAX8973_VOUT + pdata->dvs_def_state;
+	max->irq_flags = pdata->irq_flags;
+	max->junction_temp_warning = pdata->junction_temp_warning;
 
 	if (gpio_is_valid(max->enable_gpio))
 		max->enable_external_control = true;
@@ -718,6 +844,19 @@ static int max8973_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	ret = max8973_thermal_init(max);
+	if (ret < 0)
+		dev_info(max->dev, "Juntion Thermal not initialised, %d\n",
+			ret);
+
+	return 0;
+}
+
+static int max8973_remove(struct i2c_client *i2c)
+{
+	struct max8973_chip *mchip = i2c_get_clientdata(i2c);
+
+	max8973_thermal_deinit(mchip);
 	return 0;
 }
 
@@ -734,6 +873,7 @@ static struct i2c_driver max8973_i2c_driver = {
 		.of_match_table = of_max8973_match_tbl,
 	},
 	.probe = max8973_probe,
+	.remove = max8973_remove,
 	.id_table = max8973_id,
 };
 
diff --git a/include/linux/regulator/max8973-regulator.h b/include/linux/regulator/max8973-regulator.h
index f6a8a16..f43071f 100644
--- a/include/linux/regulator/max8973-regulator.h
+++ b/include/linux/regulator/max8973-regulator.h
@@ -54,6 +54,10 @@
  * @reg_init_data: The regulator init data.
  * @control_flags: Control flags which are ORed value of above flags to
  *		configure device.
+ * @irq_flags: Interrupt flag for registering interrupt like if it is SHARED
+ *		or not.
+ * @junction_temp_warning: Junction temp in Millicelcius on which warning need
+ *		to be set.
  * @enable_ext_control: Enable the voltage enable/disable through external
  *		control signal from EN input pin. If it is false then
  *		voltage output will be enabled/disabled through EN bit of
@@ -67,6 +71,8 @@
 struct max8973_regulator_platform_data {
 	struct regulator_init_data *reg_init_data;
 	unsigned long control_flags;
+	unsigned long irq_flags;
+	int junction_temp_warning;
 	bool enable_ext_control;
 	int enable_gpio;
 	int dvs_gpio;
-- 
2.1.4
