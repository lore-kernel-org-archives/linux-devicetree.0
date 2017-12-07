From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v3 3/4] regulator: core: Parse coupled regulators properties
Date: Thu, 07 Dec 2017 10:46:14 +0100
Message-ID: <1512639975-22241-4-git-send-email-m.purski@samsung.com>
References: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
        <CGME20171207094753eucas1p27b835787f92a1da8c46b9a2692376288@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maciej Purski <m.purski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Odroid XU3/4 and other Exynos5422 based boards there is a case, that
different devices on the board are supplied by different regulators
with non-fixed voltages. If one of these devices temporarily requires
higher voltage, there might occur a situation that the spread between
devices' voltages is so high, that there is a risk of changing
'high' and 'low' states on the interconnection between devices powered
by those regulators.

Each coupled regulator, should have phandles to every other in their
DTS. A group of coupled regulators shares a common structure
coupling_desc, which contains information obtained from the device tree:
array of pointers to other coupled regulators and number of coupled
regulators, which can't be higher than defined MAX_COUPLED.

Obtain all the necessery data in regulator_resolve_coupling(),
which can succeed only if all the coupled regulators are already
initialized, so it should be done only once per coupled regulators group
by the last regulator initialized.

Check if coupled regulators phandles arrays match for all coupled
regulators and if their max_spread values are the same.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 drivers/regulator/core.c          | 132 ++++++++++++++++++++++++++++++++++++++
 drivers/regulator/internal.h      |   7 ++
 drivers/regulator/of_regulator.c  |  60 +++++++++++++++++
 include/linux/regulator/driver.h  |  16 +++++
 include/linux/regulator/machine.h |   4 ++
 5 files changed, 219 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 9662e54..c3e6b35 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3940,6 +3940,133 @@ static int regulator_register_resolve_supply(struct device *dev, void *data)
 	return 0;
 }
 
+static int check_coupled_regulators_array(struct coupling_desc *c_desc,
+					  int index)
+{
+	struct regulator_dev **rdevs = c_desc->coupled_rdevs;
+	struct regulator_dev *rdev = rdevs[index];
+	struct device_node *node = rdev->dev.of_node;
+	int n_coupled = c_desc->n_coupled;
+	int i, j;
+
+	/* Different number of regulators coupled */
+	if (of_count_phandle_with_args(node, "regulator-coupled-with", 0) !=
+				      (n_coupled - 1))
+		return -EINVAL;
+
+	for (i = 0; i < n_coupled; i++) {
+		/* Don't look for rdev in its own array */
+		if (rdevs[i] == rdev)
+			continue;
+
+		for (j = 0; j < n_coupled - 1; j++) {
+			struct regulator_dev *tmp;
+
+			tmp = of_parse_coupled_regulator(rdev, j);
+			if (!tmp)
+				return -EINVAL;
+
+			/* Regulator found */
+			if (tmp == rdevs[i])
+				break;
+		}
+	}
+
+	return 0;
+}
+
+static int check_coupled_regulator_ops(struct coupling_desc *c_desc,
+				       int index)
+{
+	struct regulator_dev *rdev = c_desc->coupled_rdevs[index];
+
+	if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_VOLTAGE))
+		return -EINVAL;
+
+	if (!rdev->desc->ops->set_voltage &&
+	    !rdev->desc->ops->set_voltage_sel)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void regulator_resolve_coupling(struct regulator_dev *rdev)
+{
+	struct coupling_desc *c_desc;
+	int i;
+
+	c_desc = kzalloc(sizeof(*c_desc), GFP_KERNEL);
+	if (!c_desc)
+		return;
+
+	if (of_fill_coupled_regulators_array(rdev, c_desc))
+		goto err;
+
+	if (rdev->constraints->max_spread <= 0) {
+		rdev_err(rdev, "wrong max_spread value\n");
+		goto err;
+	}
+
+	/*
+	 * Each coupled regulator must have phandles to all regulators
+	 * they are coupled with. This should be checked by comparing
+	 * rdevs array with phandles array of each regulator.
+	 * There's no need for checking rdevs[0] as its device_node
+	 * was a source to fill rdevs array.
+	 */
+	for (i = 1; i < c_desc->n_coupled; i++) {
+		if (check_coupled_regulators_array(c_desc, i)) {
+			rdev_err(rdev,
+				 "coupled regulators arrays mismatch\n");
+			goto err;
+		}
+	}
+
+	for (i = 0; i < c_desc->n_coupled; i++) {
+		/*
+		 * All coupled regulators max_spread
+		 * must have the same value.
+		 */
+		if (c_desc->coupled_rdevs[i]->constraints->max_spread !=
+		    rdev->constraints->max_spread) {
+			rdev_err(rdev, "coupled regulators max_spread mismatch\n");
+			goto err;
+		}
+
+		/*
+		 * Regulators which can't change their voltage can't be
+		 * coupled.
+		 */
+		if (check_coupled_regulator_ops(c_desc, i)) {
+			rdev_err(rdev, "coupled regulators ops not valid\n");
+			goto err;
+		}
+	}
+
+	for (i = 0; i < c_desc->n_coupled; i++)
+		c_desc->coupled_rdevs[i]->coupling_desc = c_desc;
+
+	return;
+err:
+	kfree(c_desc);
+}
+
+static void regulator_clean_coupling(struct regulator_dev *rdev)
+{
+	struct regulator_dev *c_rdevs[MAX_COUPLED];
+	struct coupling_desc *c_desc;
+	int i;
+
+	if (!rdev->coupling_desc)
+		return;
+
+	c_desc = rdev->coupling_desc;
+	for (i = 0; i < c_desc->n_coupled; i++)
+		c_rdevs[0]->coupling_desc = NULL;
+
+	kfree(c_desc);
+}
+
 /**
  * regulator_register - register regulator
  * @regulator_desc: regulator to register
@@ -4103,6 +4230,10 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	dev_set_drvdata(&rdev->dev, rdev);
 	rdev_init_debugfs(rdev);
 
+	mutex_lock(&regulator_list_mutex);
+	regulator_resolve_coupling(rdev);
+	mutex_unlock(&regulator_list_mutex);
+
 	/* try to resolve regulators supply since a new one was registered */
 	class_for_each_device(&regulator_class, NULL, NULL,
 			      regulator_register_resolve_supply);
@@ -4116,6 +4247,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
 wash:
 	kfree(rdev->constraints);
 	mutex_lock(&regulator_list_mutex);
+	regulator_clean_coupling(rdev);
 	regulator_ena_gpio_free(rdev);
 	mutex_unlock(&regulator_list_mutex);
 clean:
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index 2f3218b..6290384 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -16,6 +16,8 @@
 #ifndef __REGULATOR_INTERNAL_H
 #define __REGULATOR_INTERNAL_H
 
+#include <linux/regulator/driver.h>
+
 /*
  * struct regulator
  *
@@ -70,4 +72,9 @@ enum regulator_get_type {
 struct regulator *_regulator_get(struct device *dev, const char *id,
 				 enum regulator_get_type get_type);
 
+struct regulator_dev *of_parse_coupled_regulator(struct regulator_dev *rdev,
+						 int index);
+
+int of_fill_coupled_regulators_array(struct regulator_dev *rdev,
+				     struct coupling_desc *c_desc);
 #endif
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 54e810a..f6a70e6 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -138,6 +138,10 @@ static void of_get_regulation_constraints(struct device_node *np,
 	if (!of_property_read_u32(np, "regulator-system-load", &pval))
 		constraints->system_load = pval;
 
+	if (!of_property_read_u32(np, "regulator-coupled-max-spread",
+				  &pval))
+		constraints->max_spread = pval;
+
 	constraints->over_current_protection = of_property_read_bool(np,
 					"regulator-over-current-protection");
 
@@ -390,3 +394,59 @@ struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
 
 	return dev ? dev_to_rdev(dev) : NULL;
 }
+
+struct regulator_dev *of_parse_coupled_regulator(struct regulator_dev *rdev,
+						 int index)
+{
+	struct device_node *node = rdev->dev.of_node;
+	struct device_node *c_node;
+	struct regulator_dev *c_rdev;
+
+	c_node = of_parse_phandle(node, "regulator-coupled-with", index);
+	if (!c_node)
+		return NULL;
+
+	c_rdev = of_find_regulator_by_node(c_node);
+	if (!c_rdev)
+		return NULL;
+
+	return c_rdev;
+}
+
+int of_fill_coupled_regulators_array(struct regulator_dev *rdev,
+				     struct coupling_desc *c_desc)
+{
+	struct regulator_dev *c_rdev;
+	struct device_node *node = rdev->dev.of_node;
+	int n_phandles, i;
+
+	n_phandles = of_count_phandle_with_args(node,
+						"regulator-coupled-with", 0);
+	if (n_phandles <= 0) {
+		dev_dbg(&rdev->dev, "no coupled regulators phandles provided\n");
+		return -EINVAL;
+	}
+
+	if (n_phandles >= MAX_COUPLED) {
+		dev_err(&rdev->dev, "too many coupled regulators phandles\n");
+		return -EINVAL;
+	}
+
+	c_desc->n_coupled = n_phandles + 1;
+
+	/*
+	 * Fill rdevs array with pointers to regulators parsed from
+	 * device tree
+	 */
+	c_desc->coupled_rdevs[0] = rdev;
+	for (i = 0; i < n_phandles; i++) {
+		c_rdev = of_parse_coupled_regulator(rdev, i);
+		if (!c_rdev) {
+			dev_dbg(&rdev->dev, "can't parse coupled regulators array\n");
+			return -EINVAL;
+		}
+		c_desc->coupled_rdevs[i + 1] = c_rdev;
+	}
+
+	return 0;
+}
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 94417b4..1a1613b 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -15,6 +15,8 @@
 #ifndef __LINUX_REGULATOR_DRIVER_H_
 #define __LINUX_REGULATOR_DRIVER_H_
 
+#define MAX_COUPLED		10
+
 #include <linux/device.h>
 #include <linux/notifier.h>
 #include <linux/regulator/consumer.h>
@@ -402,6 +404,18 @@ struct regulator_config {
 };
 
 /*
+ * struct coupling_desc
+ *
+ * Describes coupling of regulators. Each coupled regulator
+ * contains a pointer to that structure. If the regulator is not
+ * coupled with any other, it should remain NULL.
+ */
+struct coupling_desc {
+	struct regulator_dev *coupled_rdevs[MAX_COUPLED];
+	int n_coupled;
+};
+
+/*
  * struct regulator_dev
  *
  * Voltage / Current regulator class device. One for each
@@ -424,6 +438,8 @@ struct regulator_dev {
 	/* lists we own */
 	struct list_head consumer_list; /* consumers we supply */
 
+	struct coupling_desc *coupling_desc;
+
 	struct blocking_notifier_head notifier;
 	struct mutex mutex; /* consumer lock */
 	struct module *owner;
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 9cd4fef..f871fd1 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -85,6 +85,7 @@ struct regulator_state {
  * @ilim_uA: Maximum input current.
  * @system_load: Load that isn't captured by any consumer requests.
  *
+ * @max_spread: Max possible spread between coupled regulators
  * @valid_modes_mask: Mask of modes which may be configured by consumers.
  * @valid_ops_mask: Operations which may be performed by consumers.
  *
@@ -136,6 +137,9 @@ struct regulation_constraints {
 
 	int system_load;
 
+	/* used for coupled regulators */
+	int max_spread;
+
 	/* valid regulator operating modes for this machine */
 	unsigned int valid_modes_mask;
 
-- 
2.7.4
