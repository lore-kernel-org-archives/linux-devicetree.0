From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v4 2/4] regulator: pwm: Use core functionality to delay after
 changing voltage
Date: Tue, 6 Sep 2016 12:03:30 -0700
Message-ID: <20160906190330.GD92391@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>, briannorris@chromium.org, javier@dowhile0.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Use the new set_voltage_time() op to calculate the stabilization time
instead of duplicating the calculation in the core code.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v4:
- This patch is new for v4.

 drivers/regulator/pwm-regulator.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index c245242..3cf57f1 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -194,12 +194,10 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
 	unsigned int min_uV_duty = drvdata->continuous.min_uV_dutycycle;
 	unsigned int max_uV_duty = drvdata->continuous.max_uV_dutycycle;
 	unsigned int duty_unit = drvdata->continuous.dutycycle_unit;
-	unsigned int ramp_delay = rdev->constraints->ramp_delay;
 	int min_uV = rdev->constraints->min_uV;
 	int max_uV = rdev->constraints->max_uV;
 	int diff_uV = max_uV - min_uV;
 	struct pwm_state pstate;
-	int old_uV = pwm_regulator_get_voltage(rdev);
 	unsigned int diff_duty;
 	unsigned int dutycycle;
 	int ret;
@@ -233,13 +231,6 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
 		return ret;
 	}
 
-	if ((ramp_delay == 0) || !pwm_regulator_is_enabled(rdev))
-		return 0;
-
-	/* Ramp delay is in uV/uS. Adjust to uS and delay */
-	ramp_delay = DIV_ROUND_UP(abs(req_min_uV - old_uV), ramp_delay);
-	usleep_range(ramp_delay, ramp_delay + DIV_ROUND_UP(ramp_delay, 10));
-
 	return 0;
 }
 
@@ -256,6 +247,7 @@ static struct regulator_ops pwm_regulator_voltage_table_ops = {
 static struct regulator_ops pwm_regulator_voltage_continuous_ops = {
 	.get_voltage = pwm_regulator_get_voltage,
 	.set_voltage = pwm_regulator_set_voltage,
+	.set_voltage_time = regulator_set_voltage_time_op,
 	.enable          = pwm_regulator_enable,
 	.disable         = pwm_regulator_disable,
 	.is_enabled      = pwm_regulator_is_enabled,
-- 
2.8.0.rc3.226.g39d4020

 
