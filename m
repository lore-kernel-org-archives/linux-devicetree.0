From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2] regulator: core: Add coupled regulators mechanism
Date: Mon, 18 Sep 2017 10:39:51 +0200
Message-ID: <1505723992-11772-2-git-send-email-m.purski@samsung.com>
References: <1505723992-11772-1-git-send-email-m.purski@samsung.com>
        <CGME20170918084022eucas1p1398f18c5c90535ce484e3952fae80882@eucas1p1.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1505723992-11772-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Odroid XU3/4 and other Exynos5422 based boards there is a case, that
different devices on the board are supplied by different regulators
with non-fixed voltages. If one of these devices temporarily requires
higher voltage, there might occur a situation that the spread between
two devices' voltages is so high, that there is a risk of changing
'high' and 'low' states on the interconnection between devices powered
by those two regulators.

Keeping spread between those voltages below defined max_spread should
be handled by the framework. Information required to do so is obtained
from the device tree. On each voltage change the core should find the
best voltages which suit all consumers' demands and max_spread.
Then set them for a coupled regulator also.

This feature is required to enable support for generic CPUfreq
and devfreq drivers for the mentioned boards.

Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/regulator/core.c         | 274 ++++++++++++++++++++++++++++++++++++---
 include/linux/regulator/driver.h |  16 +++
 2 files changed, 272 insertions(+), 18 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index e567fa5..5360cda 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -107,6 +107,8 @@ static int _notifier_call_chain(struct regulator_dev *rdev,
 				  unsigned long event, void *data);
 static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 				     int min_uV, int max_uV);
+static int regulator_set_voltage_safe(struct regulator_dev *rdev,
+				      int min_uV, int max_uV);
 static struct regulator *create_regulator(struct regulator_dev *rdev,
 					  struct device *dev,
 					  const char *supply_name);
@@ -2181,6 +2183,8 @@ static int _regulator_enable(struct regulator_dev *rdev)
 		/* Fallthrough on positive return values - already enabled */
 	}
 
+	if (rdev->coupled_desc)
+		rdev->coupled_desc->enable_count++;
 	rdev->use_count++;
 
 	return 0;
@@ -2295,6 +2299,8 @@ static int _regulator_disable(struct regulator_dev *rdev)
 
 		rdev->use_count--;
 	}
+	if (rdev->coupled_desc)
+		rdev->coupled_desc->enable_count--;
 
 	return ret;
 }
@@ -2460,10 +2466,9 @@ static int _regulator_is_enabled(struct regulator_dev *rdev)
 	return rdev->desc->ops->is_enabled(rdev);
 }
 
-static int _regulator_list_voltage(struct regulator *regulator,
+static int _regulator_list_voltage(struct regulator_dev *rdev,
 				    unsigned selector, int lock)
 {
-	struct regulator_dev *rdev = regulator->rdev;
 	const struct regulator_ops *ops = rdev->desc->ops;
 	int ret;
 
@@ -2479,7 +2484,8 @@ static int _regulator_list_voltage(struct regulator *regulator,
 		if (lock)
 			mutex_unlock(&rdev->mutex);
 	} else if (rdev->is_switch && rdev->supply) {
-		ret = _regulator_list_voltage(rdev->supply, selector, lock);
+		ret = _regulator_list_voltage(rdev->supply->rdev,
+					      selector, lock);
 	} else {
 		return -EINVAL;
 	}
@@ -2555,7 +2561,7 @@ EXPORT_SYMBOL_GPL(regulator_count_voltages);
  */
 int regulator_list_voltage(struct regulator *regulator, unsigned selector)
 {
-	return _regulator_list_voltage(regulator, selector, 1);
+	return _regulator_list_voltage(regulator->rdev, selector, 1);
 }
 EXPORT_SYMBOL_GPL(regulator_list_voltage);
 
@@ -2896,8 +2902,6 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 	int ret = 0;
 	int old_min_uV, old_max_uV;
 	int current_uV;
-	int best_supply_uV = 0;
-	int supply_change_uV = 0;
 
 	/* If we're setting the same range as last time the change
 	 * should be a noop (some cpufreq implementations use the same
@@ -2937,10 +2941,33 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 	regulator->min_uV = min_uV;
 	regulator->max_uV = max_uV;
 
+	/* check if changing voltage won't interfere with other
+	 * consumers' demands
+	 */
 	ret = regulator_check_consumers(rdev, &min_uV, &max_uV);
 	if (ret < 0)
 		goto out2;
 
+	ret = regulator_set_voltage_safe(regulator->rdev, min_uV, max_uV);
+	if (ret < 0)
+		goto out2;
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
+static int regulator_set_voltage_safe(struct regulator_dev *rdev, int min_uV,
+					   int max_uV)
+{
+	int best_supply_uV = 0;
+	int supply_change_uV = 0;
+	int ret;
+
 	if (rdev->supply &&
 	    regulator_ops_is_valid(rdev->supply->rdev,
 				   REGULATOR_CHANGE_VOLTAGE) &&
@@ -2949,16 +2976,20 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 		int current_supply_uV;
 		int selector;
 
+		/* Driver looks for smallest voltage possible
+		 * that suits requested min-max uV.
+		 * Returns index in list_voltage
+		 */
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
@@ -2966,25 +2997,26 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 		current_supply_uV = _regulator_get_voltage(rdev->supply->rdev);
 		if (current_supply_uV < 0) {
 			ret = current_supply_uV;
-			goto out2;
+			goto out;
 		}
 
 		supply_change_uV = best_supply_uV - current_supply_uV;
 	}
 
+	/* if voltage increases */
 	if (supply_change_uV > 0) {
 		ret = regulator_set_voltage_unlocked(rdev->supply,
 				best_supply_uV, INT_MAX);
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
@@ -2998,9 +3030,110 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 
 out:
 	return ret;
-out2:
-	regulator->min_uV = old_min_uV;
-	regulator->max_uV = old_max_uV;
+}
+
+static int regulator_set_coupled_voltage(struct coupled_reg_desc *c_desc)
+{
+	struct regulator_dev **c_rdevs = c_desc->coupled_rdevs;
+	int max_spread = c_desc->max_spread;
+	int best_volt[2] = { };
+	int actual_volt[2];
+	int min_volt, max_volt;
+	int ret = 0, i, max;
+	int ready = 0;
+
+	/* Get voltages desired by all consumers of the coupled regulator */
+	for (i = 0; i < 2; i++) {
+		max = INT_MAX;
+		ret = regulator_check_consumers(c_rdevs[i],
+						&best_volt[i], &max);
+		if (ret < 0)
+			goto out;
+	}
+
+	max_volt = max(best_volt[0], best_volt[1]);
+	min_volt = min(best_volt[0], best_volt[1]);
+	min_volt = max(min_volt, max_volt - max_spread);
+
+	for (i = 0; i < 2; i++) {
+		best_volt[i] = max(best_volt[i], min_volt);
+		actual_volt[i] = _regulator_get_voltage(c_rdevs[i]);
+	}
+
+	/* Loop around, always keeping max_spread constraint */
+	while (ready < 2) {
+		int max_possible, min_possible, volt_possible;
+
+		for (i = 0; i < 2; i++) {
+			if (actual_volt[i] == best_volt[i]) {
+				ready++;
+				continue;
+			}
+
+			max_possible = actual_volt[(i + 1) % 2] + max_spread;
+			min_possible = actual_volt[(i + 1) % 2] - max_spread;
+			volt_possible = max(best_volt[i], min_possible);
+			volt_possible = min(volt_possible, max_possible);
+
+			if (volt_possible == actual_volt[i])
+				continue;
+
+			regulator_lock_supply(c_rdevs[i]);
+			ret = regulator_set_voltage_safe(c_rdevs[i],
+							 volt_possible,
+							 volt_possible);
+			regulator_unlock_supply(c_rdevs[i]);
+
+			if (ret < 0)
+				goto out;
+			actual_volt[i] = volt_possible;
+		}
+	}
+
+out:
+	return ret;
+}
+
+static int regulator_set_coupled_voltage_unlocked(struct regulator *regulator,
+						  int min_uV, int max_uV)
+{
+	struct coupled_reg_desc *c_desc = regulator->rdev->coupled_desc;
+	struct regulator_dev *rdev = regulator->rdev;
+	int old_min_uV, old_max_uV, ret;
+
+	/* If any of coupled regulators is not enabled, set voltage normally */
+	if (c_desc->enable_count < 2) {
+		regulator_lock_supply(rdev);
+		ret = regulator_set_voltage_unlocked(regulator, min_uV, max_uV);
+		regulator_unlock_supply(rdev);
+		goto out;
+	}
+
+	/* constraints check */
+	ret = regulator_check_voltage(rdev, &min_uV, &max_uV);
+	if (ret < 0)
+		goto out;
+
+	old_min_uV = regulator->min_uV;
+	old_max_uV = regulator->max_uV;
+	regulator->min_uV = min_uV;
+	regulator->max_uV = max_uV;
+
+	/* check if changing voltage won't interfere with
+	 * other consumers' demands
+	 */
+	ret = regulator_check_consumers(rdev, &min_uV, &max_uV);
+	if (ret < 0)
+		goto err;
+
+	ret = regulator_set_coupled_voltage(c_desc);
+	if (ret < 0)
+		goto err;
+out:
+	return ret;
+err:
+	regulator->min_uV = min_uV;
+	regulator->max_uV = max_uV;
 
 	return ret;
 }
@@ -3027,11 +3160,20 @@ int regulator_set_voltage(struct regulator *regulator, int min_uV, int max_uV)
 {
 	int ret = 0;
 
-	regulator_lock_supply(regulator->rdev);
+	if (regulator->rdev->coupled_desc) {
+		mutex_lock(&regulator->rdev->coupled_desc->mutex);
 
-	ret = regulator_set_voltage_unlocked(regulator, min_uV, max_uV);
+		ret = regulator_set_coupled_voltage_unlocked(regulator,
+							     min_uV, max_uV);
 
-	regulator_unlock_supply(regulator->rdev);
+		mutex_unlock(&regulator->rdev->coupled_desc->mutex);
+	} else {
+		regulator_lock_supply(regulator->rdev);
+
+		ret = regulator_set_voltage_unlocked(regulator, min_uV, max_uV);
+
+		regulator_unlock_supply(regulator->rdev);
+	}
 
 	return ret;
 }
@@ -3953,6 +4095,99 @@ static int regulator_register_resolve_supply(struct device *dev, void *data)
 	return 0;
 }
 
+/* Function returns regulator coupled with the given regulator_dev */
+static struct regulator_dev *parse_coupled_regulator(struct regulator_dev *rdev,
+						     int *max_spread)
+{
+	struct device_node *node = rdev->dev.of_node;
+	struct device_node *c_node = NULL;
+	struct regulator_dev *c_rdev = NULL;
+
+	c_node = of_parse_phandle(node, "regulator-coupled-with", 0);
+	if (!c_node)
+		return NULL;
+
+	c_rdev = of_find_regulator_by_node(c_node);
+	if (!c_rdev) {
+		dev_dbg(&rdev->dev, "Can't resolve coupled regulator\n");
+		return NULL;
+	}
+
+	if (of_property_read_u32(node, "regulator-couple-max-spread",
+				 max_spread)) {
+		dev_err(&rdev->dev, "Can't read max_spread for coupled regulator\n");
+		return NULL;
+	}
+
+	return c_rdev;
+}
+
+static void regulator_resolve_coupling(struct regulator_dev *rdev)
+{
+	struct coupled_reg_desc *c_desc;
+	struct regulator_dev *c_rdev = NULL;
+	int max_spread, c_max_spread, max_diff;
+
+	c_rdev = parse_coupled_regulator(rdev, &max_spread);
+
+	if (!c_rdev)
+		return;
+
+	if (rdev != parse_coupled_regulator(c_rdev, &c_max_spread)) {
+		dev_err(&c_rdev->dev, "Regulators not coupled with each other\n");
+		return;
+	}
+
+	if (max_spread <= 0 || max_spread != c_max_spread) {
+		dev_err(&rdev->dev, "Max_spread not provided or different values\n");
+		return;
+	}
+
+	max_diff = abs(rdev->constraints->max_uV - c_rdev->constraints->max_uV);
+	if (max_diff > max_spread) {
+		dev_err(&rdev->dev, "Coupled regulators' constraints don't fit with max_spread\n");
+		return;
+	}
+
+	/* Regulators which can't change their voltage can't be coupled */
+	if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_VOLTAGE) ||
+	    !regulator_ops_is_valid(c_rdev, REGULATOR_CHANGE_VOLTAGE))
+		return;
+
+	if ((!rdev->desc->ops->set_voltage &&
+	     !rdev->desc->ops->set_voltage_sel) ||
+	    (!c_rdev->desc->ops->set_voltage &&
+	     !c_rdev->desc->ops->set_voltage_sel))
+		return;
+
+	c_desc = kzalloc(sizeof(*c_desc), GFP_KERNEL);
+	if (!c_desc)
+		return;
+
+	mutex_init(&c_desc->mutex);
+	c_desc->max_spread = max_spread;
+	c_desc->coupled_rdevs[0] = rdev;
+	c_desc->coupled_rdevs[1] = c_rdev;
+	rdev->coupled_desc = c_desc;
+	c_rdev->coupled_desc = c_desc;
+}
+
+static void regulator_clean_coupling(struct regulator_dev *rdev)
+{
+	struct regulator_dev *c_rdevs[2];
+	struct coupled_reg_desc *c_desc;
+
+	if (!rdev->coupled_desc)
+		return;
+
+	c_desc = rdev->coupled_desc;
+	memcpy(c_rdevs, c_desc->coupled_rdevs, sizeof(*c_rdevs));
+
+	kfree(c_desc);
+	c_rdevs[0]->coupled_desc = NULL;
+	c_rdevs[1]->coupled_desc = NULL;
+}
+
 /**
  * regulator_register - register regulator
  * @regulator_desc: regulator to register
@@ -4116,6 +4351,8 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	dev_set_drvdata(&rdev->dev, rdev);
 	rdev_init_debugfs(rdev);
 
+	regulator_resolve_coupling(rdev);
+
 	/* try to resolve regulators supply since a new one was registered */
 	class_for_each_device(&regulator_class, NULL, NULL,
 			      regulator_register_resolve_supply);
@@ -4129,6 +4366,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
 wash:
 	kfree(rdev->constraints);
 	mutex_lock(&regulator_list_mutex);
+	regulator_clean_coupling(rdev);
 	regulator_ena_gpio_free(rdev);
 	mutex_unlock(&regulator_list_mutex);
 clean:
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 94417b4..36bba5f 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -402,6 +402,20 @@ struct regulator_config {
 };
 
 /*
+ * struct coupled_reg_desc
+ *
+ * Describes coupling of two regulators. Each coupled regulator
+ * contains a pointer to that structure. If the regulator is not
+ * coupled with any other, it should remain NULL.
+ */
+struct coupled_reg_desc {
+	struct mutex mutex;
+	struct regulator_dev *coupled_rdevs[2];
+	int max_spread;
+	int enable_count;
+};
+
+/*
  * struct regulator_dev
  *
  * Voltage / Current regulator class device. One for each
@@ -424,6 +438,8 @@ struct regulator_dev {
 	/* lists we own */
 	struct list_head consumer_list; /* consumers we supply */
 
+	struct coupled_reg_desc *coupled_desc;
+
 	struct blocking_notifier_head notifier;
 	struct mutex mutex; /* consumer lock */
 	struct module *owner;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
