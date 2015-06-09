From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/2] regulator: max8973: configure ramp delay through callback
Date: Tue, 9 Jun 2015 19:17:52 +0530
Message-ID: <1433857673-28744-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Regulator core framework support the configuration of ramp
delay reading from platform specific regulator data via the
regulator callback ops.

Instead of reading regulator init data on driver and setting
ramp delay, use the callback to achieve this.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/regulator/max8973-regulator.c | 73 +++++++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/max8973-regulator.c b/drivers/regulator/max8973-regulator.c
index 00cf91c..663e4df 100644
--- a/drivers/regulator/max8973-regulator.c
+++ b/drivers/regulator/max8973-regulator.c
@@ -67,6 +67,7 @@
 #define MAX8973_RAMP_25mV_PER_US			0x1
 #define MAX8973_RAMP_50mV_PER_US			0x2
 #define MAX8973_RAMP_200mV_PER_US			0x3
+#define MAX8973_RAMP_MASK				0x3
 
 /* MAX8973_CONTROL2 */
 #define MAX8973_WDTMR_ENABLE				BIT(6)
@@ -243,12 +244,45 @@ static unsigned int max8973_dcdc_get_mode(struct regulator_dev *rdev)
 		REGULATOR_MODE_FAST : REGULATOR_MODE_NORMAL;
 }
 
+static int max8973_set_ramp_delay(struct regulator_dev *rdev,
+		int ramp_delay)
+{
+	struct max8973_chip *max = rdev_get_drvdata(rdev);
+	unsigned int control;
+	int ret;
+	int ret_val;
+
+	/* Set ramp delay */
+	if (ramp_delay < 25000) {
+		control = MAX8973_RAMP_12mV_PER_US;
+		ret_val = 12000;
+	} else if (ramp_delay < 50000) {
+		control = MAX8973_RAMP_25mV_PER_US;
+		ret_val = 25000;
+	} else if (ramp_delay < 200000) {
+		control = MAX8973_RAMP_50mV_PER_US;
+		ret_val = 50000;
+	} else {
+		control = MAX8973_RAMP_200mV_PER_US;
+		ret_val = 200000;
+	}
+
+	ret = regmap_update_bits(max->regmap, MAX8973_CONTROL1,
+			MAX8973_RAMP_MASK, control);
+	if (ret < 0)
+		dev_err(max->dev, "register %d update failed, %d",
+				MAX8973_CONTROL1, ret);
+	return ret;
+}
+
 static const struct regulator_ops max8973_dcdc_ops = {
 	.get_voltage_sel	= max8973_dcdc_get_voltage_sel,
 	.set_voltage_sel	= max8973_dcdc_set_voltage_sel,
 	.list_voltage		= regulator_list_voltage_linear,
 	.set_mode		= max8973_dcdc_set_mode,
 	.get_mode		= max8973_dcdc_get_mode,
+	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+	.set_ramp_delay		= max8973_set_ramp_delay,
 };
 
 static int max8973_init_dcdc(struct max8973_chip *max,
@@ -257,6 +291,29 @@ static int max8973_init_dcdc(struct max8973_chip *max,
 	int ret;
 	uint8_t	control1 = 0;
 	uint8_t control2 = 0;
+	unsigned int data;
+
+	ret = regmap_read(max->regmap, MAX8973_CONTROL1, &data);
+	if (ret < 0) {
+		dev_err(max->dev, "register %d read failed, err = %d",
+				MAX8973_CONTROL1, ret);
+		return ret;
+	}
+	control1 = data & MAX8973_RAMP_MASK;
+	switch (control1) {
+	case MAX8973_RAMP_12mV_PER_US:
+		max->desc.ramp_delay = 12000;
+		break;
+	case MAX8973_RAMP_25mV_PER_US:
+		max->desc.ramp_delay = 252000;
+		break;
+	case MAX8973_RAMP_50mV_PER_US:
+		max->desc.ramp_delay = 50000;
+		break;
+	case MAX8973_RAMP_200mV_PER_US:
+		max->desc.ramp_delay = 200000;
+		break;
+	}
 
 	if (pdata->control_flags & MAX8973_CONTROL_REMOTE_SENSE_ENABLE)
 		control1 |= MAX8973_SNS_ENABLE;
@@ -277,22 +334,6 @@ static int max8973_init_dcdc(struct max8973_chip *max,
 	if (pdata->control_flags & MAX8973_CONTROL_FREQ_SHIFT_9PER_ENABLE)
 		control1 |= MAX8973_FREQSHIFT_9PER;
 
-	/* Set ramp delay */
-	if (pdata->reg_init_data &&
-			pdata->reg_init_data->constraints.ramp_delay) {
-		if (pdata->reg_init_data->constraints.ramp_delay < 25000)
-			control1 |= MAX8973_RAMP_12mV_PER_US;
-		else if (pdata->reg_init_data->constraints.ramp_delay < 50000)
-			control1 |= MAX8973_RAMP_25mV_PER_US;
-		else if (pdata->reg_init_data->constraints.ramp_delay < 200000)
-			control1 |= MAX8973_RAMP_50mV_PER_US;
-		else
-			control1 |= MAX8973_RAMP_200mV_PER_US;
-	} else {
-		control1 |= MAX8973_RAMP_12mV_PER_US;
-		max->desc.ramp_delay = 12500;
-	}
-
 	if (!(pdata->control_flags & MAX8973_CONTROL_PULL_DOWN_ENABLE))
 		control2 |= MAX8973_DISCH_ENBABLE;
 
-- 
2.1.4
