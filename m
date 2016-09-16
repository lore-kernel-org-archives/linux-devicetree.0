From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: core: Add set_voltage_time op" to the regulator tree
Date: Fri, 16 Sep 2016 18:40:00 +0100
Message-ID: <E1bkx7I-00043W-L1@debutante>
References: <1473871930-99603-4-git-send-email-mka@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473871930-99603-4-git-send-email-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Mark Brown <broonie@kernel.org>Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com, Douglas Anderson <dianders@chromium.org>, briannorris@chromium.org, javier@dowhile0.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: core: Add set_voltage_time op

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 73e705bf81ceb84b39ef9cf6ffb8d12ca0c58a23 Mon Sep 17 00:00:00 2001
From: Matthias Kaehlcke <mka@chromium.org>
Date: Wed, 14 Sep 2016 09:52:08 -0700
Subject: [PATCH] regulator: core: Add set_voltage_time op

The new op is analogous to set_voltage_time_sel. It can be used by
regulators which don't have a table of discrete voltages. The function
returns the time for the regulator output voltage to stabilize after
being set to a new value, in microseconds. If the op is not set a
default implementation is used to calculate the delay.

This change also removes the ramp_delay calculation in the PWM
regulator, since the driver now uses the core code for the calculation
of the delay.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/core.c          | 86 +++++++++++++++++++++++++++------------
 drivers/regulator/pwm-regulator.c | 10 -----
 include/linux/regulator/driver.h  | 10 ++++-
 3 files changed, 67 insertions(+), 39 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index df3028b2a8e9..c52fc0ce2693 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2743,6 +2743,24 @@ static int _regulator_call_set_voltage_sel(struct regulator_dev *rdev,
 	return ret;
 }
 
+static int _regulator_set_voltage_time(struct regulator_dev *rdev,
+				       int old_uV, int new_uV)
+{
+	unsigned int ramp_delay = 0;
+
+	if (rdev->constraints->ramp_delay)
+		ramp_delay = rdev->constraints->ramp_delay;
+	else if (rdev->desc->ramp_delay)
+		ramp_delay = rdev->desc->ramp_delay;
+
+	if (ramp_delay == 0) {
+		rdev_warn(rdev, "ramp_delay not set\n");
+		return 0;
+	}
+
+	return DIV_ROUND_UP(abs(new_uV - old_uV), ramp_delay);
+}
+
 static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 				     int min_uV, int max_uV)
 {
@@ -2752,6 +2770,7 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 	unsigned int selector;
 	int old_selector = -1;
 	const struct regulator_ops *ops = rdev->desc->ops;
+	int old_uV = _regulator_get_voltage(rdev);
 
 	trace_regulator_set_voltage(rdev_get_name(rdev), min_uV, max_uV);
 
@@ -2803,23 +2822,37 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 	if (ret)
 		goto out;
 
-	/* Call set_voltage_time_sel if successfully obtained old_selector */
-	if (!old_selector >= 0 && old_selector != selector) {
-		delay = ops->set_voltage_time_sel(rdev,
-						old_selector, selector);
-		if (delay < 0) {
-			rdev_warn(rdev, "set_voltage_time_sel() failed: %d\n",
-				  delay);
-			delay = 0;
+	if (ops->set_voltage_time_sel) {
+		/*
+		 * Call set_voltage_time_sel if successfully obtained
+		 * old_selector
+		 */
+		if (old_selector >= 0 && old_selector != selector)
+			delay = ops->set_voltage_time_sel(rdev, old_selector,
+							  selector);
+	} else {
+		if (old_uV != best_val) {
+			if (ops->set_voltage_time)
+				delay = ops->set_voltage_time(rdev, old_uV,
+							      best_val);
+			else
+				delay = _regulator_set_voltage_time(rdev,
+								    old_uV,
+								    best_val);
 		}
+	}
 
-		/* Insert any necessary delays */
-		if (delay >= 1000) {
-			mdelay(delay / 1000);
-			udelay(delay % 1000);
-		} else if (delay) {
-			udelay(delay);
-		}
+	if (delay < 0) {
+		rdev_warn(rdev, "failed to get delay: %d\n", delay);
+		delay = 0;
+	}
+
+	/* Insert any necessary delays */
+	if (delay >= 1000) {
+		mdelay(delay / 1000);
+		udelay(delay % 1000);
+	} else if (delay) {
+		udelay(delay);
 	}
 
 	if (best_val >= 0) {
@@ -3000,9 +3033,13 @@ int regulator_set_voltage_time(struct regulator *regulator,
 	int voltage;
 	int i;
 
+	if (ops->set_voltage_time)
+		return ops->set_voltage_time(rdev, old_uV, new_uV);
+	else if (!ops->set_voltage_time_sel)
+		return _regulator_set_voltage_time(rdev, old_uV, new_uV);
+
 	/* Currently requires operations to do this */
-	if (!ops->list_voltage || !ops->set_voltage_time_sel
-	    || !rdev->desc->n_voltages)
+	if (!ops->list_voltage || !rdev->desc->n_voltages)
 		return -EINVAL;
 
 	for (i = 0; i < rdev->desc->n_voltages; i++) {
@@ -3041,17 +3078,8 @@ int regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 				   unsigned int old_selector,
 				   unsigned int new_selector)
 {
-	unsigned int ramp_delay = 0;
 	int old_volt, new_volt;
 
-	if (rdev->constraints->ramp_delay)
-		ramp_delay = rdev->constraints->ramp_delay;
-	else if (rdev->desc->ramp_delay)
-		ramp_delay = rdev->desc->ramp_delay;
-
-	if (ramp_delay == 0)
-		return 0;
-
 	/* sanity check */
 	if (!rdev->desc->ops->list_voltage)
 		return -EINVAL;
@@ -3059,7 +3087,11 @@ int regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 	old_volt = rdev->desc->ops->list_voltage(rdev, old_selector);
 	new_volt = rdev->desc->ops->list_voltage(rdev, new_selector);
 
-	return DIV_ROUND_UP(abs(new_volt - old_volt), ramp_delay);
+	if (rdev->desc->ops->set_voltage_time)
+		return rdev->desc->ops->set_voltage_time(rdev, old_volt,
+							 new_volt);
+	else
+		return _regulator_set_voltage_time(rdev, old_volt, new_volt);
 }
 EXPORT_SYMBOL_GPL(regulator_set_voltage_time_sel);
 
diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index c24524242da2..1b88e0e15a70 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -10,7 +10,6 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/err.h>
@@ -194,12 +193,10 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
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
@@ -233,13 +230,6 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
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
 
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index fcfa40a6692c..37b532410528 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -113,10 +113,14 @@ struct regulator_linear_range {
  *               stabilise after being enabled, in microseconds.
  * @set_ramp_delay: Set the ramp delay for the regulator. The driver should
  *		select ramp delay equal to or less than(closest) ramp_delay.
+ * @set_voltage_time: Time taken for the regulator voltage output voltage
+ *               to stabilise after being set to a new value, in microseconds.
+ *               The function receives the from and to voltage as input, it
+ *               should return the worst case.
  * @set_voltage_time_sel: Time taken for the regulator voltage output voltage
  *               to stabilise after being set to a new value, in microseconds.
- *               The function provides the from and to voltage selector, the
- *               function should return the worst case.
+ *               The function receives the from and to voltage selector as
+ *               input, it should return the worst case.
  * @set_soft_start: Enable soft start for the regulator.
  *
  * @set_suspend_voltage: Set the voltage for the regulator when the system
@@ -168,6 +172,8 @@ struct regulator_ops {
 	/* Time taken to enable or set voltage on the regulator */
 	int (*enable_time) (struct regulator_dev *);
 	int (*set_ramp_delay) (struct regulator_dev *, int ramp_delay);
+	int (*set_voltage_time) (struct regulator_dev *, int old_uV,
+				 int new_uV);
 	int (*set_voltage_time_sel) (struct regulator_dev *,
 				     unsigned int old_selector,
 				     unsigned int new_selector);
-- 
2.8.1
