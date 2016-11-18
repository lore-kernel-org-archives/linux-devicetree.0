From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 2/2] regulator: pwm: Add ramp delay for exponential voltage transition
Date: Fri, 18 Nov 2016 20:05:56 +0530
Message-ID: <1479479756-10755-2-git-send-email-ldewangan@nvidia.com>
References: <1479479756-10755-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479479756-10755-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Douglas Anderson <dianders@chromium.org>, Aleksandr Frid <afrid@nvidia.com>
List-Id: devicetree@vger.kernel.org

Some PWM regulator has the exponential transition in voltage change
as opposite to fixed slew-rate linear transition on other regulators.
For such PWM regulators, add support for handling the exponential
voltage ramp delay.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
CC: Douglas Anderson <dianders@chromium.org>
CC: Aleksandr Frid <afrid@nvidia.com>

---
This patch is continuation of discussion on patch
	regulator: pwm: Fix regulator ramp delay for continuous mode
https://patchwork.kernel.org/patch/9216857/
where is it discussed to have separate property for PWM which has
exponential voltage transition.

Changes from V1:
- Use new DT property to finding that voltage ramp is exponential or
  not and use flag for having fixed delay for all voltage change.
---
 drivers/regulator/pwm-regulator.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 1b88e0e1..bcffeee 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -233,6 +233,24 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
 	return 0;
 }
 
+/**
+ * Some of PWM regulators have exponential voltage ramp. On such PWM
+ * regulators, voltage settling time is same regardless of voltage
+ * level change.
+ */
+static int pwm_regulator_set_voltage_time(struct regulator_dev *rdev,
+					  int old_uV, int new_uV)
+{
+	return rdev->constraints->ramp_delay;
+}
+
+static int pwm_regulator_set_voltage_time_sel(struct regulator_dev *rdev,
+					      unsigned int old_selector,
+					      unsigned int new_selector)
+{
+	return rdev->constraints->ramp_delay;
+}
+
 static struct regulator_ops pwm_regulator_voltage_table_ops = {
 	.set_voltage_sel = pwm_regulator_set_voltage_sel,
 	.get_voltage_sel = pwm_regulator_get_voltage_sel,
@@ -294,17 +312,25 @@ static int pwm_regulator_init_table(struct platform_device *pdev,
 	drvdata->desc.ops = &drvdata->ops;
 	drvdata->desc.n_voltages	= length / sizeof(*duty_cycle_table);
 
+	if (of_property_read_bool(np, "voltage-ramp-exponential"))
+		drvdata->ops.set_voltage_time_sel =
+					pwm_regulator_set_voltage_time_sel;
 	return 0;
 }
 
 static int pwm_regulator_init_continuous(struct platform_device *pdev,
 					 struct pwm_regulator_data *drvdata)
 {
+	struct device_node *np = pdev->dev.of_node;
 	u32 dutycycle_range[2] = { 0, 100 };
 	u32 dutycycle_unit = 100;
 
 	memcpy(&drvdata->ops, &pwm_regulator_voltage_continuous_ops,
 	       sizeof(drvdata->ops));
+
+	if (of_property_read_bool(np, "voltage-ramp-exponential"))
+		drvdata->ops.set_voltage_time = pwm_regulator_set_voltage_time;
+
 	drvdata->desc.ops = &drvdata->ops;
 	drvdata->desc.continuous_voltage_range = true;
 
-- 
2.1.4
