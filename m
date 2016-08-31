From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 2/2] regulator: pwm: Prevent falling too fast
Date: Tue, 30 Aug 2016 21:21:16 -0700
Message-ID: <1472617277-30814-2-git-send-email-dianders@chromium.org>
References: <1472617277-30814-1-git-send-email-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472617277-30814-1-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Cc: mka@chromium.org, briannorris@chromium.org, javier@dowhile0.org, linux-rockchip@lists.infradead.org, Douglas Anderson <dianders@chromium.org>, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On some boards it's possible that transitioning the PWM regulator
downwards too fast will trigger the over voltage protection (OVP) on the
regulator.  This is because until the voltage actually falls there is a
time when the requested voltage is much lower than the actual voltage.

We'll fix this OVP problem by allowing users to specify the maximum
voltage that we can safely fall.  Apparently this maximum safe voltage
should be specified as a percentage of the current voltage.  The PWM
regulator will then break things into separate steps with a delay in
between.

In order to figure out what the delay should be we need to figure out
how slowly the voltage rail might fall in the worst (slowest) case.
We'll assume this worst case is present and delay so we know for sure
that we've finished each step.

In this patch we actually block returning from the set_voltage() call
until we've finished delaying.  A future patch atop this one might
choose to return more immediately and let the voltages fall in the
background.  That would possibly to allow us to cancel a slow downward
decay if there was a request to go back up.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Changes in v3:
- Prevent falling too fast new for v3.

 .../bindings/regulator/pwm-regulator.txt           |  7 ++
 drivers/regulator/pwm-regulator.c                  | 79 +++++++++++++++++++---
 2 files changed, 78 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
index 9dc15d18e787..99fa09c42aac 100644
--- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
@@ -39,6 +39,13 @@ Optional properties:
 - settle-time-up-us:	Time to settle down after a voltage increase
 			(unit: us). For regulators with a ramp delay
 			the two values are added.
+- safe-fall-percent:	If specified, it's not safe to transition the regulator
+			down faster than this amount and bigger jumps need to
+			be broken into more than one step.
+- slowest-decay-rate:	Describes how slowly the regulator voltage will
+			decay down in the worst case (lightest expected load).
+			Specified in uV / us (like main regulator ramp rate).
+			This is required when safe-fall-percent is specified.
 
 Optional properties for Continuous mode:
 - pwm-dutycycle-unit:	Integer value encoding the duty cycle unit. If not
diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 94f1ca3b793d..47675632c0c6 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -50,6 +50,8 @@ struct pwm_regulator_data {
 	struct gpio_desc *enb_gpio;
 
 	u32 settle_time_up_us;
+	u32 slowest_decay_rate;
+	u32 safe_fall_percent;
 };
 
 struct pwm_voltages {
@@ -188,9 +190,8 @@ static int pwm_regulator_get_voltage(struct regulator_dev *rdev)
 	return voltage + min_uV;
 }
 
-static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
-				     int req_min_uV, int req_max_uV,
-				     unsigned int *selector)
+static int _pwm_regulator_set_voltage(struct regulator_dev *rdev,
+				      int old_uV, int req_uV)
 {
 	struct pwm_regulator_data *drvdata = rdev_get_drvdata(rdev);
 	unsigned int min_uV_duty = drvdata->continuous.min_uV_dutycycle;
@@ -202,7 +203,6 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
 	int max_uV = rdev->constraints->max_uV;
 	int diff_uV = max_uV - min_uV;
 	struct pwm_state pstate;
-	int old_uV = pwm_regulator_get_voltage(rdev);
 	unsigned int diff_duty;
 	unsigned int dutycycle;
 	int ret;
@@ -219,8 +219,7 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
 	else
 		diff_duty = max_uV_duty - min_uV_duty;
 
-	dutycycle = DIV_ROUND_CLOSEST_ULL((u64)(req_min_uV - min_uV) *
-					  diff_duty,
+	dutycycle = DIV_ROUND_CLOSEST_ULL((u64)(req_uV - min_uV) * diff_duty,
 					  diff_uV);
 
 	if (max_uV_duty < min_uV_duty)
@@ -236,12 +235,12 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
 		return ret;
 	}
 
-	if (req_min_uV > old_uV)
+	if (req_uV > old_uV)
 		delay = drvdata->settle_time_up_us;
 
 	if (ramp_delay != 0)
 		/* Adjust ramp delay to uS and add to settle time. */
-		delay += DIV_ROUND_UP(abs(req_min_uV - old_uV), ramp_delay);
+		delay += DIV_ROUND_UP(abs(req_uV - old_uV), ramp_delay);
 
 	if ((delay == 0) || !pwm_regulator_is_enabled(rdev))
 		return 0;
@@ -251,6 +250,47 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
 	return 0;
 }
 
+static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
+				     int req_min_uV, int req_max_uV,
+				     unsigned int *selector)
+{
+	struct pwm_regulator_data *drvdata = rdev_get_drvdata(rdev);
+	int safe_fall_percent = drvdata->safe_fall_percent;
+	int slowest_decay_rate = drvdata->slowest_decay_rate;
+	int orig_uV = pwm_regulator_get_voltage(rdev);
+	int uV = orig_uV;
+	int ret;
+
+	/* If we're rising or we're falling but don't need to slow; easy */
+	if (req_min_uV >= uV || !safe_fall_percent)
+		return _pwm_regulator_set_voltage(rdev, uV, req_min_uV);
+
+	while (uV > req_min_uV) {
+		int max_drop_uV = (uV * safe_fall_percent) / 100;
+		int next_uV;
+		int delay;
+
+		/* Make sure no infinite loop even in crazy cases */
+		if (max_drop_uV == 0)
+			max_drop_uV = 1;
+
+		next_uV = max_t(int, req_min_uV, uV - max_drop_uV);
+		delay = DIV_ROUND_UP(uV - next_uV, slowest_decay_rate);
+
+		ret = _pwm_regulator_set_voltage(rdev, uV, next_uV);
+		if (ret) {
+			/* Try to go back to original */
+			_pwm_regulator_set_voltage(rdev, uV, orig_uV);
+			return ret;
+		}
+
+		usleep_range(delay, delay + DIV_ROUND_UP(delay, 10));
+		uV = next_uV;
+	}
+
+	return 0;
+}
+
 static struct regulator_ops pwm_regulator_voltage_table_ops = {
 	.set_voltage_sel = pwm_regulator_set_voltage_sel,
 	.get_voltage_sel = pwm_regulator_get_voltage_sel,
@@ -378,6 +418,29 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 
 	of_property_read_u32(np, "settle-time-up-us",
 			&drvdata->settle_time_up_us);
+	of_property_read_u32(np, "slowest-decay-rate",
+			&drvdata->slowest_decay_rate);
+	of_property_read_u32(np, "safe-fall-percent",
+			&drvdata->safe_fall_percent);
+
+	/* We treat as int above; sanity check */
+	if (drvdata->slowest_decay_rate > INT_MAX) {
+		dev_err(&pdev->dev, "slowest-decay-rate (%u) too big\n",
+			(unsigned int)drvdata->slowest_decay_rate);
+		return -EINVAL;
+	}
+
+	if (drvdata->safe_fall_percent > 100) {
+		dev_err(&pdev->dev, "safe-fall-percent (%u) > 100\n",
+			(unsigned int)drvdata->safe_fall_percent);
+		return -EINVAL;
+	}
+
+	if (drvdata->safe_fall_percent && !drvdata->slowest_decay_rate) {
+		dev_err(&pdev->dev,
+			"slowest-decay-rate required safe-fall-percent\n");
+		return -EINVAL;
+	}
 
 	config.of_node = np;
 	config.dev = &pdev->dev;
-- 
2.8.0.rc3.226.g39d4020
