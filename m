From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/2] regulator: max8973: add support for junction thermal warning
Date: Fri, 4 Mar 2016 15:57:54 +0530
Message-ID: <1457087274-15785-2-git-send-email-ldewangan@nvidia.com>
References: <1457087274-15785-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457087274-15785-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

The driver MAX8973 supports the driver for Maxim PMIC MAX77621.
MAX77621 supports the junction temp warning at 120 degC and
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

This patch was submitted earlier and applied on tree:
        https://lkml.org/lkml/2016/1/6/488
        but somehow it is dropped. This is not visisble in linux-next.
Resending this.
Split this in 2 patches, one from driver and other for binding doc.
Taken care of Rob's review comment for property change.
Compile and tested on linux-next.
---
 drivers/regulator/max8973-regulator.c       | 132 ++++++++++++++++++++++++++++
 include/linux/regulator/max8973-regulator.h |   5 ++
 2 files changed, 137 insertions(+)

diff --git a/drivers/regulator/max8973-regulator.c b/drivers/regulator/max8973-regulator.c
index 5b75b7c..a5e0346 100644
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
@@ -93,6 +97,12 @@
 #define MAX8973_VOLATGE_STEP				6250
 #define MAX8973_BUCK_N_VOLTAGE				0x80
 
+#define MAX77621_CHIPID_TJINT_S				BIT(0)
+
+#define MAX77621_NORMAL_OPERATING_TEMP			100000
+#define MAX77621_TJINT_WARNING_TEMP_120			120000
+#define MAX77621_TJINT_WARNING_TEMP_140			140000
+
 enum device_id {
 	MAX8973,
 	MAX77621
@@ -112,6 +122,9 @@ struct max8973_chip {
 	int curr_gpio_val;
 	struct regulator_ops ops;
 	enum device_id id;
+	int junction_temp_warning;
+	int irq;
+	struct thermal_zone_device *tz_device;
 };
 
 /*
@@ -391,6 +404,10 @@ static int max8973_init_dcdc(struct max8973_chip *max,
 	if (pdata->control_flags & MAX8973_CONTROL_FREQ_SHIFT_9PER_ENABLE)
 		control1 |= MAX8973_FREQSHIFT_9PER;
 
+	if ((pdata->junction_temp_warning == MAX77621_TJINT_WARNING_TEMP_120) &&
+	     (max->id == MAX77621))
+		control2 |= MAX77621_T_JUNCTION_120;
+
 	if (!(pdata->control_flags & MAX8973_CONTROL_PULL_DOWN_ENABLE))
 		control2 |= MAX8973_DISCH_ENBABLE;
 
@@ -457,6 +474,104 @@ static int max8973_init_dcdc(struct max8973_chip *max,
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
+		dev_err(mchip->dev, "Failed to read register CHIPID1, %d", ret);
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
+	thermal_zone_device_update(mchip->tz_device);
+
+	return IRQ_HANDLED;
+}
+
+static const struct thermal_zone_of_device_ops max77621_tz_ops = {
+	.get_temp = max8973_thermal_read_temp,
+};
+
+static int max8973_thermal_init(struct max8973_chip *mchip)
+{
+	struct thermal_zone_device *tzd;
+	struct irq_data *irq_data;
+	unsigned long irq_flags = 0;
+	int ret;
+
+	if (mchip->id != MAX77621)
+		return 0;
+
+	tzd = thermal_zone_of_sensor_register(mchip->dev, 0, mchip,
+					      &max77621_tz_ops);
+	if (IS_ERR(tzd)) {
+		ret = PTR_ERR(tzd);
+		dev_err(mchip->dev, "Failed to register thermal sensor: %d\n",
+			ret);
+		return ret;
+	}
+
+	if (mchip->irq <= 0)
+		return 0;
+
+	irq_data = irq_get_irq_data(mchip->irq);
+	if (irq_data)
+		irq_flags = irqd_get_trigger_type(irq_data);
+
+	ret = request_threaded_irq(mchip->irq, NULL, max8973_thermal_irq,
+				   IRQF_ONESHOT | IRQF_SHARED | irq_flags,
+				   dev_name(mchip->dev), mchip);
+	if (ret < 0) {
+		dev_err(mchip->dev, "Failed to request irq %d, %d\n",
+			mchip->irq, ret);
+		goto fail;
+	}
+
+	return 0;
+
+fail:
+	thermal_zone_of_sensor_unregister(mchip->dev, mchip->tz_device);
+
+	return ret;
+}
+
+
+static void max8973_thermal_deinit(struct max8973_chip *mchip)
+{
+	if ((mchip->id != MAX77621) || !mchip->tz_device)
+		return;
+
+	 if (mchip->irq > 0)
+		free_irq(mchip->irq, mchip);
+
+	thermal_zone_of_sensor_unregister(mchip->dev, mchip->tz_device);
+}
+#else
+static int max8973_thermal_init(struct max8973_chip *mchip)
+{
+	 return 0;
+}
+
+static void max8973_thermal_deinit(struct max8973_chip *mchip) { }
+#endif
+
 static const struct regmap_config max8973_regmap_config = {
 	.reg_bits		= 8,
 	.val_bits		= 8,
@@ -521,6 +636,11 @@ static struct max8973_regulator_platform_data *max8973_parse_dt(
 		pdata->control_flags |= MAX8973_CONTROL_CLKADV_TRIP_DISABLED;
 	}
 
+	pdata->junction_temp_warning = MAX77621_TJINT_WARNING_TEMP_140;
+	ret = of_property_read_u32(np, "junction-warn-millicelsius", &pval);
+	if (!ret && (pval <= MAX77621_TJINT_WARNING_TEMP_120))
+		pdata->junction_temp_warning = MAX77621_TJINT_WARNING_TEMP_120;
+
 	return pdata;
 }
 
@@ -608,6 +728,7 @@ static int max8973_probe(struct i2c_client *client,
 	max->enable_external_control = pdata->enable_ext_control;
 	max->curr_gpio_val = pdata->dvs_def_state;
 	max->curr_vout_reg = MAX8973_VOUT + pdata->dvs_def_state;
+	max->junction_temp_warning = pdata->junction_temp_warning;
 
 	if (gpio_is_valid(max->enable_gpio))
 		max->enable_external_control = true;
@@ -718,6 +839,16 @@ static int max8973_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	max8973_thermal_init(max);
+	return 0;
+}
+
+static int max8973_remove(struct i2c_client *i2c)
+{
+	struct max8973_chip *mchip = i2c_get_clientdata(i2c);
+
+	max8973_thermal_deinit(mchip);
+
 	return 0;
 }
 
@@ -734,6 +865,7 @@ static struct i2c_driver max8973_i2c_driver = {
 		.of_match_table = of_max8973_match_tbl,
 	},
 	.probe = max8973_probe,
+	.remove = max8973_remove,
 	.id_table = max8973_id,
 };
 
diff --git a/include/linux/regulator/max8973-regulator.h b/include/linux/regulator/max8973-regulator.h
index f6a8a16..2fcb998 100644
--- a/include/linux/regulator/max8973-regulator.h
+++ b/include/linux/regulator/max8973-regulator.h
@@ -54,6 +54,10 @@
  * @reg_init_data: The regulator init data.
  * @control_flags: Control flags which are ORed value of above flags to
  *		configure device.
+ * @junction_temp_warning: Junction temp in millicelcius on which warning need
+ *			   to be set. Thermal functionality is only supported on
+ *			   MAX77621. The threshold warning supported by MAX77621
+ *			   are 120C and 140C.
  * @enable_ext_control: Enable the voltage enable/disable through external
  *		control signal from EN input pin. If it is false then
  *		voltage output will be enabled/disabled through EN bit of
@@ -67,6 +71,7 @@
 struct max8973_regulator_platform_data {
 	struct regulator_init_data *reg_init_data;
 	unsigned long control_flags;
+	unsigned long junction_temp_warning;
 	bool enable_ext_control;
 	int enable_gpio;
 	int dvs_gpio;
-- 
2.1.4
