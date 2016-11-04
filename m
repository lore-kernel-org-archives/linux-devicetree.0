From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/2] regulator: pwm: Add ramp delay for exponential voltage transition
Date: Fri, 4 Nov 2016 23:07:55 +0530
Message-ID: <1478281075-3498-2-git-send-email-ldewangan@nvidia.com>
References: <1478281075-3498-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478281075-3498-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Douglas Anderson <dianders@chromium.org>, Aleksandr Frid <afrid@nvidia.com>
List-Id: devicetree@vger.kernel.org

Some PWM regulator has the exponential transition in voltage change as
opposite to fixed slew-rate linear transition on other regulators.
For such PWM regulators, voltage transition is same for all voltage
change.

Add support for handling the voltage transition ramp time when voltage
transition is exponential.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
CC: Douglas Anderson <dianders@chromium.org>
CC: Aleksandr Frid <afrid@nvidia.com>

---
This patch is continuation of discussion on patch
	regulator: pwm: Fix regulator ramp delay for continuous mode
https://patchwork.kernel.org/patch/9216857/
where is it discussed to have separate property for PWM which has
exponential voltage transition.
---
 drivers/regulator/pwm-regulator.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 1b88e0e1..f990b86 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -47,6 +47,9 @@ struct pwm_regulator_data {
 
 	/* Enable GPIO */
 	struct gpio_desc *enb_gpio;
+
+	/* Voltage ramp time */
+	u32 voltage_ramp_time;
 };
 
 struct pwm_voltages {
@@ -233,6 +236,14 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
 	return 0;
 }
 
+static int pwm_regulator_set_voltage_time_sel(struct regulator_dev *rdev,
+					      int old_uV, int new_uV)
+{
+	struct pwm_regulator_data *drvdata = rdev_get_drvdata(rdev);
+
+	return drvdata->voltage_ramp_time;
+}
+
 static struct regulator_ops pwm_regulator_voltage_table_ops = {
 	.set_voltage_sel = pwm_regulator_set_voltage_sel,
 	.get_voltage_sel = pwm_regulator_get_voltage_sel,
@@ -305,6 +316,13 @@ static int pwm_regulator_init_continuous(struct platform_device *pdev,
 
 	memcpy(&drvdata->ops, &pwm_regulator_voltage_continuous_ops,
 	       sizeof(drvdata->ops));
+
+	if (!of_property_read_u32(pdev->dev.of_node,
+				  "pwm-regulator-voltage-ramp-time-us",
+				  &drvdata->voltage_ramp_time))
+		drvdata->ops.set_voltage_time =
+				pwm_regulator_set_voltage_time_sel;
+
 	drvdata->desc.ops = &drvdata->ops;
 	drvdata->desc.continuous_voltage_range = true;
 
-- 
2.1.4
