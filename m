From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC PATCH v2 2/3] regulator: core: Parse coupled regulators
 properties
Date: Wed, 18 Oct 2017 14:47:01 +0200
Message-ID: <1508330822-8039-3-git-send-email-m.purski@samsung.com>
References: <1508330822-8039-1-git-send-email-m.purski@samsung.com>
        <CGME20171018124735eucas1p2dc60191fb185f18dee16d4b3de8502cf@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1508330822-8039-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Odroid XU3/4 and other Exynos5422 based boards there is a case, that
different devices on the board are supplied by different regulators
with non-fixed voltages. If one of these devices temporarily requires
higher voltage, there might occur a situation that the spread between
devices' voltages is so high, that there is a risk of changing
'high' and 'low' states on the interconnection between devices powered
by those regulators.

Each coupled regulator, should have phandles to every other in their
DTS. All coupled regulators must share common structure
coupled_reg_desc, which contains information obtained from the device
tree: array of pointers to other coupled regulators, maximum allowed
voltage spread and number of coupled regulators, which can't be higher
than defined MAX_COUPLED.

Read all the necessary data from DTS in regulator_resolve_coupling(),
which can succeed only if all the coupled regulators are already
initialized, so it should be done only once per coupled regulators group
by the last regulator initialized.

Check if coupled regulators phandles arrays match for all coupled
regulators and if their max_spread values are the same.

Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/regulator/core.c         | 195 +++++++++++++++++++++++++++++++++++++++
 include/linux/regulator/driver.h |  17 ++++
 2 files changed, 212 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index e567fa5..a6cf902 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3953,6 +3953,198 @@ static int regulator_register_resolve_supply(struct device *dev, void *data)
 	return 0;
 }
 
+/* Function returns regulator coupled with the given regulator_dev */
+static struct regulator_dev *parse_coupled_regulator(struct regulator_dev *rdev,
+						     int index)
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
+static int check_coupled_regulators_array(struct coupled_reg_desc *c_desc,
+					  int index)
+{
+	struct regulator_dev *rdev = c_desc->coupled_rdevs[index];
+	struct regulator_dev **rdevs = c_desc->coupled_rdevs;
+	struct regulator_dev *c_rdev, *tmp_rdev;
+	struct device_node *node = rdev->dev.of_node;
+	int n_coupled = c_desc->n_coupled;
+	int i, j;
+
+	/* Different number of regulators coupled */
+	if (of_count_phandle_with_args(node, "regulator-coupled-with", 0) !=
+				       (n_coupled - 1))
+		return -1;
+
+	/* Check if coupled regulators array match */
+	for (i = 0; i < n_coupled; i++) {
+		c_rdev = rdevs[i];
+		/* Don't look for rdev in rdev's phandles array */
+		if (c_rdev == rdev)
+			continue;
+
+		/* Look for c_rdev phandle */
+		for (j = 0; j < n_coupled; j++) {
+			tmp_rdev = parse_coupled_regulator(rdev, j);
+			if (!tmp_rdev)
+				return -1;
+
+			/* Regulator found */
+			if (tmp_rdev == c_rdev)
+				break;
+		}
+
+		/* Regulator can't be found */
+		if (j == n_coupled && tmp_rdev != c_rdev)
+			return -1;
+	}
+
+	return 0;
+}
+
+static int check_coupled_regulator_constraints(struct coupled_reg_desc *c_desc,
+					       int index)
+{
+	int c_max_spread;
+	struct regulator_dev *rdev = c_desc->coupled_rdevs[index];
+	struct device_node *node = rdev->dev.of_node;
+
+	if (of_property_read_u32(node, "regulator-couple-max-spread",
+				 &c_max_spread))
+		return -1;
+
+	/* Max_spread value different than in coupled regulator or wrong */
+	if (c_max_spread < 0 || c_desc->max_spread != c_max_spread)
+		return -1;
+
+	return 0;
+}
+
+static int check_coupled_regulator_ops(struct coupled_reg_desc *c_desc,
+				       int index)
+{
+	struct regulator_dev *rdev = c_desc->coupled_rdevs[index];
+
+	if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_VOLTAGE))
+		return -1;
+
+	if (!rdev->desc->ops->set_voltage &&
+	    !rdev->desc->ops->set_voltage_sel)
+		return -1;
+	return 0;
+}
+
+static void regulator_resolve_coupling(struct regulator_dev *rdev)
+{
+	struct coupled_reg_desc *c_desc;
+	struct device_node *node = rdev->dev.of_node;
+	struct regulator_dev *c_rdev = NULL;
+	int max_spread, n_phandles, i;
+
+	c_desc = kzalloc(sizeof(*c_desc), GFP_KERNEL);
+	if (!c_desc)
+		return;
+
+	n_phandles = of_count_phandle_with_args(node, "regulator-coupled-with",
+						0);
+	if (n_phandles <= 0 || n_phandles >= MAX_COUPLED)
+		goto err;
+
+	c_desc->n_coupled = n_phandles + 1;
+
+	if (of_property_read_u32(node, "regulator-coupled-max-spread",
+				 &max_spread)) {
+		rdev_err(rdev, "can't read max_spread for coupled regulator\n");
+		goto err;
+	}
+
+	c_desc->max_spread = max_spread;
+
+	/*
+	 * Fill rdevs array with pointers to regulators parsed from
+	 * device tree
+	 */
+	c_desc->coupled_rdevs[0] = rdev;
+	for (i = 0; i < n_phandles; i++) {
+		c_rdev = parse_coupled_regulator(rdev, i);
+		if (!c_rdev) {
+			rdev_err(rdev, "can't parse coupled regulators array\n");
+			goto err;
+		}
+		c_desc->coupled_rdevs[i + 1] = c_rdev;
+	}
+
+	/*
+	 * Each coupled regulator must have phandles to all regulators
+	 * they are coupled with. This should be checked by comparing
+	 * rdevs array with phandles array of each regulator.
+	 * There's no need for checking rdevs[0] as its device_node
+	 * was a source to fill rdevs array.
+	 */
+	for (i = 0; i < n_phandles; i++) {
+		if (check_coupled_regulators_array(c_desc, i + 1)) {
+			rdev_err(rdev,
+				 "coupled regulators arrays don't match\n");
+			goto err;
+		}
+	}
+
+	for (i = 0; i < c_desc->n_coupled; i++) {
+		/*
+		 * All coupled regulators need to have
+		 * regulator-couple-max-spread property with
+		 * the same value.
+		 */
+		if (check_coupled_regulator_constraints(c_desc, i)) {
+			rdev_err(rdev, "coupled regulators max_spread wrong\n");
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
+		c_desc->coupled_rdevs[i]->coupled_desc = c_desc;
+
+	return;
+err:
+	kfree(c_desc);
+}
+
+static void regulator_clean_coupling(struct regulator_dev *rdev)
+{
+	struct regulator_dev *c_rdevs[MAX_COUPLED];
+	struct coupled_reg_desc *c_desc;
+	int i;
+
+	if (!rdev->coupled_desc)
+		return;
+
+	c_desc = rdev->coupled_desc;
+	for (i = 0; i < c_desc->n_coupled; i++)
+		c_rdevs[0]->coupled_desc = NULL;
+
+	kfree(c_desc);
+}
+
 /**
  * regulator_register - register regulator
  * @regulator_desc: regulator to register
@@ -4116,6 +4308,8 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	dev_set_drvdata(&rdev->dev, rdev);
 	rdev_init_debugfs(rdev);
 
+	regulator_resolve_coupling(rdev);
+
 	/* try to resolve regulators supply since a new one was registered */
 	class_for_each_device(&regulator_class, NULL, NULL,
 			      regulator_register_resolve_supply);
@@ -4129,6 +4323,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
 wash:
 	kfree(rdev->constraints);
 	mutex_lock(&regulator_list_mutex);
+	regulator_clean_coupling(rdev);
 	regulator_ena_gpio_free(rdev);
 	mutex_unlock(&regulator_list_mutex);
 clean:
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 94417b4..8ca3215 100644
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
@@ -402,6 +404,19 @@ struct regulator_config {
 };
 
 /*
+ * struct coupled_reg_desc
+ *
+ * Describes coupling of regulators. Each coupled regulator
+ * contains a pointer to that structure. If the regulator is not
+ * coupled with any other, it should remain NULL.
+ */
+struct coupled_reg_desc {
+	struct regulator_dev *coupled_rdevs[MAX_COUPLED];
+	int max_spread;
+	int n_coupled;
+};
+
+/*
  * struct regulator_dev
  *
  * Voltage / Current regulator class device. One for each
@@ -424,6 +439,8 @@ struct regulator_dev {
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
