From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 4/4] regulator: core: Balance coupled regulators voltages
Date: Thu, 07 Dec 2017 10:46:15 +0100
Message-ID: <1512639975-22241-5-git-send-email-m.purski@samsung.com>
References: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
        <CGME20171207094754eucas1p1528c6c30135124430a5c703eb81de8d2@eucas1p1.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1512639975-22241-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Odroid XU3/4 and other Exynos5422 based boards there is a case, that
different devices on the board are supplied by different regulators
with non-fixed voltages. If one of these devices temporarily requires
higher voltage, there might occur a situation that the spread between
two devices' voltages is so high, that there is a risk of changing
'high' and 'low' states on the interconnection between devices powered
by those regulators.

Introduce new function regulator_balance_coupled(), which
keeps max_spread constraint fulfilled between a group of coupled
regulators. It should be called if a coupled regulator changes its
voltage or after disabling or enabling. Disabled regulators should
follow changes of the enabled ones, but their consumers' demands
shouldn't be taken into account while calculating voltage of other
coupled regulators.

Find voltages, which are closest to suiting all the consumers' demands,
while fulfilling max_spread constraint, keeping the following rules:
- if one regulator is about to rise its voltage, rise others
  voltages in order to keep the max_spread
- if a regulator, which has caused rising other regulators, is
  lowered, lower other regulators if possible
- if one regulator is about to lower its voltage, but it hasn't caused
  rising other regulators, don't change its voltage if it breaks the
  max_spread

Change regulators' voltages step by step, keeping max_spread constraint
fulfilled all the time. Function regulator_coupled_get_optimal_voltage()
should find the best possible change for the regulator, which doesn't break
max_spread constraint. In function regulator_balance_coupled_voltage()
optimize number of steps by finding highest voltage difference on each
iteration.

Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/regulator/core.c | 269 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 253 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index c3e6b35..dde77ee 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -105,6 +105,9 @@ static int _notifier_call_chain(struct regulator_dev *rdev,
 				  unsigned long event, void *data);
 static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 				     int min_uV, int max_uV);
+static int regulator_set_voltage_rdev(struct regulator_dev *rdev,
+				      int min_uV, int max_uV);
+static int regulator_balance_coupled(struct coupling_desc *c_desc);
 static struct regulator *create_regulator(struct regulator_dev *rdev,
 					  struct device *dev,
 					  const char *supply_name);
@@ -178,6 +181,32 @@ static void regulator_unlock_supply(struct regulator_dev *rdev)
 }
 
 /**
+ * regulator_lock_coupled - lock a group of coupled regulators
+ * @c_desc:      coupled regulators description source
+ */
+static void regulator_lock_coupled(struct coupling_desc *c_desc)
+{
+	int n_coupled = c_desc->n_coupled;
+	int i;
+
+	for (i = 0; i < n_coupled; i++)
+		mutex_lock_nested(&c_desc->coupled_rdevs[i]->mutex, i);
+}
+
+/**
+ * regulator_unlock_coupled - unlock a group of coupled regulators
+ * @c_desc:      coupled regulators description source
+ */
+static void regulator_unlock_coupled(struct coupling_desc *c_desc)
+{
+	int n_coupled = c_desc->n_coupled;
+	int i;
+
+	for (i = 0; i < n_coupled; i++)
+		mutex_unlock(&c_desc->coupled_rdevs[i]->mutex);
+}
+
+/**
  * of_get_regulator - get a regulator device node based on supply name
  * @dev: Device pointer for the consumer (of regulator) device
  * @supply: regulator supply name
@@ -2197,6 +2226,8 @@ int regulator_enable(struct regulator *regulator)
 	if (ret != 0 && rdev->supply)
 		regulator_disable(rdev->supply);
 
+	regulator_balance_coupled(rdev->coupling_desc);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regulator_enable);
@@ -2302,6 +2333,8 @@ int regulator_disable(struct regulator *regulator)
 	ret = _regulator_disable(rdev);
 	mutex_unlock(&rdev->mutex);
 
+	regulator_balance_coupled(rdev->coupling_desc);
+
 	if (ret == 0 && rdev->supply)
 		regulator_disable(rdev->supply);
 
@@ -2358,6 +2391,8 @@ int regulator_force_disable(struct regulator *regulator)
 		while (rdev->open_count--)
 			regulator_disable(rdev->supply);
 
+	regulator_balance_coupled(rdev->coupling_desc);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regulator_force_disable);
@@ -2447,10 +2482,9 @@ static int _regulator_is_enabled(struct regulator_dev *rdev)
 	return rdev->desc->ops->is_enabled(rdev);
 }
 
-static int _regulator_list_voltage(struct regulator *regulator,
-				    unsigned selector, int lock)
+static int _regulator_list_voltage(struct regulator_dev *rdev,
+				   unsigned selector, int lock)
 {
-	struct regulator_dev *rdev = regulator->rdev;
 	const struct regulator_ops *ops = rdev->desc->ops;
 	int ret;
 
@@ -2466,7 +2500,8 @@ static int _regulator_list_voltage(struct regulator *regulator,
 		if (lock)
 			mutex_unlock(&rdev->mutex);
 	} else if (rdev->is_switch && rdev->supply) {
-		ret = _regulator_list_voltage(rdev->supply, selector, lock);
+		ret = _regulator_list_voltage(rdev->supply->rdev,
+					      selector, lock);
 	} else {
 		return -EINVAL;
 	}
@@ -2542,7 +2577,7 @@ EXPORT_SYMBOL_GPL(regulator_count_voltages);
  */
 int regulator_list_voltage(struct regulator *regulator, unsigned selector)
 {
-	return _regulator_list_voltage(regulator, selector, 1);
+	return _regulator_list_voltage(regulator->rdev, selector, 1);
 }
 EXPORT_SYMBOL_GPL(regulator_list_voltage);
 
@@ -2883,8 +2918,6 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 	int ret = 0;
 	int old_min_uV, old_max_uV;
 	int current_uV;
-	int best_supply_uV = 0;
-	int supply_change_uV = 0;
 
 	/* If we're setting the same range as last time the change
 	 * should be a noop (some cpufreq implementations use the same
@@ -2928,6 +2961,35 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 	if (ret < 0)
 		goto out2;
 
+	/*
+	 * If the regulator is not coupled just set voltage normally, else
+	 * return after changing consumer demands without changing voltage.
+	 * This will be handled outside the function
+	 * by regulator_balance_coupled()
+	 */
+	if (!rdev->coupling_desc) {
+		ret = regulator_set_voltage_rdev(regulator->rdev,
+						 min_uV, max_uV);
+		if (ret < 0)
+			goto out2;
+	}
+
+out:
+	return 0;
+out2:
+	regulator->min_uV = old_min_uV;
+	regulator->max_uV = old_max_uV;
+
+	return ret;
+}
+
+static int regulator_set_voltage_rdev(struct regulator_dev *rdev, int min_uV,
+				      int max_uV)
+{
+	int best_supply_uV = 0;
+	int supply_change_uV = 0;
+	int ret;
+
 	if (rdev->supply &&
 	    regulator_ops_is_valid(rdev->supply->rdev,
 				   REGULATOR_CHANGE_VOLTAGE) &&
@@ -2939,13 +3001,13 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 		selector = regulator_map_voltage(rdev, min_uV, max_uV);
 		if (selector < 0) {
 			ret = selector;
-			goto out2;
+			goto out;
 		}
 
-		best_supply_uV = _regulator_list_voltage(regulator, selector, 0);
+		best_supply_uV = _regulator_list_voltage(rdev, selector, 0);
 		if (best_supply_uV < 0) {
 			ret = best_supply_uV;
-			goto out2;
+			goto out;
 		}
 
 		best_supply_uV += rdev->desc->min_dropout_uV;
@@ -2953,7 +3015,7 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 		current_supply_uV = _regulator_get_voltage(rdev->supply->rdev);
 		if (current_supply_uV < 0) {
 			ret = current_supply_uV;
-			goto out2;
+			goto out;
 		}
 
 		supply_change_uV = best_supply_uV - current_supply_uV;
@@ -2965,13 +3027,13 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 		if (ret) {
 			dev_err(&rdev->dev, "Failed to increase supply voltage: %d\n",
 					ret);
-			goto out2;
+			goto out;
 		}
 	}
 
 	ret = _regulator_do_set_voltage(rdev, min_uV, max_uV);
 	if (ret < 0)
-		goto out2;
+		goto out;
 
 	if (supply_change_uV < 0) {
 		ret = regulator_set_voltage_unlocked(rdev->supply,
@@ -2985,9 +3047,181 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 
 out:
 	return ret;
-out2:
-	regulator->min_uV = old_min_uV;
-	regulator->max_uV = old_max_uV;
+}
+
+static int regulator_coupled_get_optimal_voltage(struct regulator_dev *rdev)
+{
+	struct coupling_desc *c_desc = rdev->coupling_desc;
+	struct regulator_dev **c_rdevs = c_desc->coupled_rdevs;
+	int max_spread = rdev->constraints->max_spread;
+	int n_coupled = c_desc->n_coupled;
+	int desired_min_uV, desired_max_uV, min_actual_uV = INT_MAX;
+	int max_actual_uV = 0, highest_min_uV = 0, target_uV, possible_uV;
+	int i, ret;
+
+	/* If consumers don't provide any demands, set voltage to min_uV */
+	desired_min_uV = rdev->constraints->min_uV;
+	desired_max_uV = rdev->constraints->max_uV;
+	ret = regulator_check_consumers(rdev,
+					&desired_min_uV,
+					&desired_max_uV);
+	if (ret < 0)
+		goto out;
+
+	/* Find highest min desired voltage */
+	for (i = 0; i < n_coupled; i++) {
+		int tmp_min = 0;
+		int tmp_max = INT_MAX;
+
+		if (!_regulator_is_enabled(c_rdevs[i]))
+			continue;
+
+		ret = regulator_check_consumers(c_rdevs[i],
+						&tmp_min,
+						&tmp_max);
+		if (ret < 0)
+			goto out;
+
+		if (tmp_min > highest_min_uV)
+			highest_min_uV = tmp_min;
+	}
+
+	/*
+	 * Let target_uV be equal to the desired one if possible.
+	 * If not, set it to minimum voltage, allowed by other coupled
+	 * regulators.
+	 */
+	target_uV = max(desired_min_uV,  highest_min_uV - max_spread);
+
+	/*
+	 * Find min and max voltages, which currently aren't
+	 * violating max_spread
+	 */
+	for (i = 0; i < n_coupled; i++) {
+		int tmp_act;
+
+		/*
+		 * Don't check the regulator, which is about
+		 * to change voltage
+		 */
+		if (c_rdevs[i] == rdev)
+			continue;
+		if (!_regulator_is_enabled(c_rdevs[i]))
+			continue;
+
+		tmp_act = _regulator_get_voltage(c_rdevs[i]);
+		if (tmp_act < 0) {
+			ret = tmp_act;
+			goto out;
+		}
+
+		if (tmp_act < min_actual_uV)
+			min_actual_uV = tmp_act;
+
+		if (tmp_act > max_actual_uV)
+			max_actual_uV = tmp_act;
+	}
+
+	/* There aren't any other regulators enabled */
+	if (max_actual_uV == 0) {
+		possible_uV = target_uV;
+	} else {
+		/*
+		 * Correct target voltage, so as it currently isn't
+		 * violating max_spread
+		 */
+		possible_uV = max(target_uV, max_actual_uV - max_spread);
+		possible_uV = min(possible_uV, min_actual_uV + max_spread);
+	}
+
+	if (possible_uV > desired_max_uV) {
+		ret = -EINVAL;
+		goto out;
+	}
+	ret = possible_uV;
+
+out:
+	return ret;
+}
+
+static int regulator_balance_coupled(struct coupling_desc *c_desc)
+{
+	struct regulator_dev **c_rdevs;
+	struct regulator_dev *best_rdev;
+	int n_coupled;
+	int i, best_delta, best_uV, ret = 1;
+
+	if (!c_desc)
+		return -EINVAL;
+
+	c_rdevs = c_desc->coupled_rdevs;
+	n_coupled = c_desc->n_coupled;
+	/*
+	 * Find the best possible voltage change on each loop. Leave the loop
+	 * if there isn't any possible change.
+	 */
+	while (1) {
+		best_delta = 0;
+		best_uV = 0;
+		best_rdev = NULL;
+
+		regulator_lock_coupled(c_desc);
+
+		/*
+		 * Find highest difference between optimal voltage
+		 * and actual voltage.
+		 */
+		for (i = 0; i < n_coupled; i++) {
+			/*
+			 * optimal_uV is the best voltage that can be set for
+			 * i-th regulator at the moment without violating
+			 * max_spread constraint in order to balance
+			 * the coupled voltages.
+			 */
+			int optimal_uV, actual_uV;
+
+			optimal_uV = regulator_coupled_get_optimal_voltage(c_rdevs[i]);
+			if (optimal_uV < 0) {
+				ret = optimal_uV;
+				goto unlock;
+			}
+
+			actual_uV = _regulator_get_voltage(c_rdevs[i]);
+			if (actual_uV < 0) {
+				ret = optimal_uV;
+				goto unlock;
+			}
+
+			if (abs(best_delta) < abs(optimal_uV - actual_uV)) {
+				best_delta = optimal_uV - actual_uV;
+				best_rdev = c_rdevs[i];
+				best_uV = optimal_uV;
+			}
+		}
+
+		/* Nothing to change, return successfully */
+		if (!best_rdev) {
+			ret = 0;
+			goto unlock;
+		}
+		/*
+		 * Lock just the supply regulators, as the regulator itself
+		 * is already locked by regulator_lock_coupled().
+		 */
+		if (best_rdev->supply)
+			regulator_lock_supply(best_rdev->supply->rdev);
+
+		ret = regulator_set_voltage_rdev(best_rdev, best_uV,
+						 best_uV);
+		if (best_rdev->supply)
+			regulator_unlock_supply(best_rdev->supply->rdev);
+
+unlock:
+		regulator_unlock_coupled(c_desc);
+
+		if (ret < 0 || !best_rdev)
+			break;
+	}
 
 	return ret;
 }
@@ -3020,6 +3254,9 @@ int regulator_set_voltage(struct regulator *regulator, int min_uV, int max_uV)
 
 	regulator_unlock_supply(regulator->rdev);
 
+	if (regulator->rdev->coupling_desc)
+		ret = regulator_balance_coupled(regulator->rdev->coupling_desc);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regulator_set_voltage);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
