From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v4 1/4] regulator: Add set_voltage_time op
Date: Tue, 6 Sep 2016 14:01:25 -0700
Message-ID: <20160906210125.GE79728@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>, briannorris@chromium.org, javier@dowhile0.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The new op is analogous to set_voltage_time_sel. It can be used by
regulators that don't have a table of discrete voltages. The function
returns the time for the regulator voltage output voltage to stabilize
after being set to a new value, in microseconds. The actual calculation
of the stabilization time is done in the same place for both types of
regulators.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v4:
- This patch is new for v4.

 drivers/regulator/core.c         | 140 +++++++++++++++++++++++++--------------
 include/linux/regulator/driver.h |   8 +++
 2 files changed, 97 insertions(+), 51 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index db320e8..b1cef47 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2751,6 +2751,7 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 	int best_val = 0;
 	unsigned int selector;
 	int old_selector = -1;
+	int old_uV = _regulator_get_voltage(rdev);
 
 	trace_regulator_set_voltage(rdev_get_name(rdev), min_uV, max_uV);
 
@@ -2800,27 +2801,38 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 		ret = -EINVAL;
 	}
 
-	/* Call set_voltage_time_sel if successfully obtained old_selector */
-	if (ret == 0 && !rdev->constraints->ramp_disable && old_selector >= 0
-		&& old_selector != selector) {
+	if (ret != 0 || rdev->constraints->ramp_disable)
+		goto no_delay;
 
-		delay = rdev->desc->ops->set_voltage_time_sel(rdev,
-						old_selector, selector);
-		if (delay < 0) {
-			rdev_warn(rdev, "set_voltage_time_sel() failed: %d\n",
-				  delay);
-			delay = 0;
-		}
+	if (rdev->desc->ops->set_voltage_time) {
+		int new_uV = _regulator_get_voltage(rdev);
 
-		/* Insert any necessary delays */
-		if (delay >= 1000) {
-			mdelay(delay / 1000);
-			udelay(delay % 1000);
-		} else if (delay) {
-			udelay(delay);
-		}
+		if (old_uV == new_uV)
+			goto no_delay;
+
+		delay =	rdev->desc->ops->set_voltage_time(rdev, old_uV, new_uV);
+	} else if (rdev->desc->ops->set_voltage_time_sel) {
+		if (old_selector < 0 || old_selector == selector)
+			goto no_delay;
+
+		delay = rdev->desc->ops->set_voltage_time_sel(
+			rdev, old_selector, selector);
+	}
+
+	if (delay < 0) {
+		rdev_warn(rdev, "failed to get delay: %d\n", delay);
+		delay = 0;
 	}
 
+	/* Insert any necessary delays */
+	if (delay >= 1000) {
+		mdelay(delay / 1000);
+		udelay(delay % 1000);
+	} else if (delay) {
+		udelay(delay);
+	}
+
+no_delay:
 	if (ret == 0 && best_val >= 0) {
 		unsigned long data = best_val;
 
@@ -2993,54 +3005,58 @@ int regulator_set_voltage_time(struct regulator *regulator,
 {
 	struct regulator_dev *rdev = regulator->rdev;
 	const struct regulator_ops *ops = rdev->desc->ops;
-	int old_sel = -1;
-	int new_sel = -1;
-	int voltage;
-	int i;
 
-	/* Currently requires operations to do this */
-	if (!ops->list_voltage || !ops->set_voltage_time_sel
-	    || !rdev->desc->n_voltages)
-		return -EINVAL;
+	if (ops->set_voltage_time) {
+		return ops->set_voltage_time(rdev, old_uV, new_uV);
+	} else if (ops->set_voltage_time_sel) {
+		int old_sel = -1;
+		int new_sel = -1;
+		int voltage;
+		int i;
 
-	for (i = 0; i < rdev->desc->n_voltages; i++) {
-		/* We only look for exact voltage matches here */
-		voltage = regulator_list_voltage(regulator, i);
-		if (voltage < 0)
+		/* Currently requires operations to do this */
+		if (!ops->list_voltage || !rdev->desc->n_voltages)
 			return -EINVAL;
-		if (voltage == 0)
-			continue;
-		if (voltage == old_uV)
-			old_sel = i;
-		if (voltage == new_uV)
-			new_sel = i;
-	}
 
-	if (old_sel < 0 || new_sel < 0)
-		return -EINVAL;
+		for (i = 0; i < rdev->desc->n_voltages; i++) {
+			/* We only look for exact voltage matches here */
+			voltage = regulator_list_voltage(regulator, i);
+			if (voltage < 0)
+				return -EINVAL;
+			if (voltage == 0)
+				continue;
+			if (voltage == old_uV)
+				old_sel = i;
+			if (voltage == new_uV)
+				new_sel = i;
+		}
+
+		if (old_sel < 0 || new_sel < 0)
+			return -EINVAL;
+
+		return ops->set_voltage_time_sel(rdev, old_sel, new_sel);
+	}
 
-	return ops->set_voltage_time_sel(rdev, old_sel, new_sel);
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(regulator_set_voltage_time);
 
 /**
- * regulator_set_voltage_time_sel - get raise/fall time
- * @rdev: regulator source device
- * @old_selector: selector for starting voltage
- * @new_selector: selector for target voltage
+ * regulator_set_voltage_time_op - get raise/fall time
+ * @regulator: regulator source
+ * @old_uV: starting voltage in microvolts
+ * @new_uV: target voltage in microvolts
  *
- * Provided with the starting and target voltage selectors, this function
- * returns time in microseconds required to rise or fall to this new voltage
+ * Provided with the starting and ending voltage, this function calculates
+ * the time in microseconds required to rise or fall to this new voltage.
  *
  * Drivers providing ramp_delay in regulation_constraints can use this as their
- * set_voltage_time_sel() operation.
+ * set_voltage_time() operation.
  */
-int regulator_set_voltage_time_sel(struct regulator_dev *rdev,
-				   unsigned int old_selector,
-				   unsigned int new_selector)
+int regulator_set_voltage_time_op(struct regulator_dev *rdev,
+				int old_uV, int new_uV)
 {
 	unsigned int ramp_delay = 0;
-	int old_volt, new_volt;
 
 	if (rdev->constraints->ramp_delay)
 		ramp_delay = rdev->constraints->ramp_delay;
@@ -3052,6 +3068,28 @@ int regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 		return 0;
 	}
 
+	return DIV_ROUND_UP(abs(new_uV - old_uV), ramp_delay);
+}
+EXPORT_SYMBOL_GPL(regulator_set_voltage_time_op);
+
+/**
+ * regulator_set_voltage_time_sel - get raise/fall time
+ * @rdev: regulator source device
+ * @old_selector: selector for starting voltage
+ * @new_selector: selector for target voltage
+ *
+ * Provided with the starting and target voltage selectors, this function
+ * returns time in microseconds required to rise or fall to this new voltage
+ *
+ * Drivers providing ramp_delay in regulation_constraints can use this as their
+ * set_voltage_time_sel() operation.
+ */
+int regulator_set_voltage_time_sel(struct regulator_dev *rdev,
+				   unsigned int old_selector,
+				   unsigned int new_selector)
+{
+	int old_volt, new_volt;
+
 	/* sanity check */
 	if (!rdev->desc->ops->list_voltage)
 		return -EINVAL;
@@ -3059,7 +3097,7 @@ int regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 	old_volt = rdev->desc->ops->list_voltage(rdev, old_selector);
 	new_volt = rdev->desc->ops->list_voltage(rdev, new_selector);
 
-	return DIV_ROUND_UP(abs(new_volt - old_volt), ramp_delay);
+	return regulator_set_voltage_time_op(rdev, old_volt, new_volt);
 }
 EXPORT_SYMBOL_GPL(regulator_set_voltage_time_sel);
 
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index fcfa40a..537ca7f 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -113,6 +113,10 @@ struct regulator_linear_range {
  *               stabilise after being enabled, in microseconds.
  * @set_ramp_delay: Set the ramp delay for the regulator. The driver should
  *		select ramp delay equal to or less than(closest) ramp_delay.
+ * @set_voltage_time: Time taken for the regulator voltage output voltage
+ *               to stabilise after being set to a new value, in microseconds.
+ *               The function provides the from and to voltage, the function
+ *               should return the worst case.
  * @set_voltage_time_sel: Time taken for the regulator voltage output voltage
  *               to stabilise after being set to a new value, in microseconds.
  *               The function provides the from and to voltage selector, the
@@ -168,6 +172,8 @@ struct regulator_ops {
 	/* Time taken to enable or set voltage on the regulator */
 	int (*enable_time) (struct regulator_dev *);
 	int (*set_ramp_delay) (struct regulator_dev *, int ramp_delay);
+	int (*set_voltage_time) (struct regulator_dev *,
+				int old_uV, int new_uV);
 	int (*set_voltage_time_sel) (struct regulator_dev *,
 				     unsigned int old_selector,
 				     unsigned int new_selector);
@@ -461,6 +467,8 @@ int regulator_set_voltage_sel_regmap(struct regulator_dev *rdev, unsigned sel);
 int regulator_is_enabled_regmap(struct regulator_dev *rdev);
 int regulator_enable_regmap(struct regulator_dev *rdev);
 int regulator_disable_regmap(struct regulator_dev *rdev);
+int regulator_set_voltage_time_op(struct regulator_dev *rdev,
+				int old_uV, int new_uV);
 int regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 				   unsigned int old_selector,
 				   unsigned int new_selector);
-- 
2.8.0.rc3.226.g39d4020
