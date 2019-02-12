From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [RFC PATCH v1 2/3] regulator: add
 regulator_desc_list_voltage_linear_range
Date: Tue, 12 Feb 2019 16:18:46 +0200
Message-ID: <b07e501c84c77c59f0a2a67c43576373a140f10f.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, Robin Gong =?utf-8?B?4oCO?= <yibin.gong@nxp.com>, Elven Wang =?utf-8?B?4oCO?= <elven.wang@nxp.com>, Anson Huang =?utf-8?B?4oCO?= <anson.huang@nxp.com>
List-Id: devicetree@vger.kernel.org

Add regulator_desc_list_voltage_linear_range which can be used
by drivers for getting the voltages before regulator is registered.
This may be useful for drivers which need to fetch the voltage
selectors at device-tree parsing callback.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Please not apply as such. This is compile-tested only and sent
for collecting feedback. If idea is Ok I will do proper testing
and send a non RFC patch.

 drivers/regulator/helpers.c      | 39 +++++++++++++++++++++++++++++----------
 include/linux/regulator/driver.h |  6 ++++++
 2 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/helpers.c b/drivers/regulator/helpers.c
index 5686a1335bd3..68ac6017ef28 100644
--- a/drivers/regulator/helpers.c
+++ b/drivers/regulator/helpers.c
@@ -594,28 +594,30 @@ int regulator_list_voltage_pickable_linear_range(struct regulator_dev *rdev,
 EXPORT_SYMBOL_GPL(regulator_list_voltage_pickable_linear_range);
 
 /**
- * regulator_list_voltage_linear_range - List voltages for linear ranges
+ * regulator_desc_list_voltage_linear_range - List voltages for linear ranges
  *
- * @rdev: Regulator device
+ * @desc: Regulator desc for regulator which volatges are to be listed
  * @selector: Selector to convert into a voltage
  *
  * Regulators with a series of simple linear mappings between voltages
- * and selectors can set linear_ranges in the regulator descriptor and
- * then use this function as their list_voltage() operation,
+ * and selectors who have set linear_ranges in the regulator descriptor
+ * can use this function prior regulator registration to list voltages.
+ * This is useful when voltages need to be listed during device-tree
+ * parsing.
  */
-int regulator_list_voltage_linear_range(struct regulator_dev *rdev,
-					unsigned int selector)
+int regulator_desc_list_voltage_linear_range(const struct regulator_desc *desc,
+					     unsigned int selector)
 {
 	const struct regulator_linear_range *range;
 	int i;
 
-	if (!rdev->desc->n_linear_ranges) {
-		BUG_ON(!rdev->desc->n_linear_ranges);
+	if (!desc->n_linear_ranges) {
+		BUG_ON(!desc->n_linear_ranges);
 		return -EINVAL;
 	}
 
-	for (i = 0; i < rdev->desc->n_linear_ranges; i++) {
-		range = &rdev->desc->linear_ranges[i];
+	for (i = 0; i < desc->n_linear_ranges; i++) {
+		range = &desc->linear_ranges[i];
 
 		if (!(selector >= range->min_sel &&
 		      selector <= range->max_sel))
@@ -628,6 +630,23 @@ int regulator_list_voltage_linear_range(struct regulator_dev *rdev,
 
 	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(regulator_desc_list_voltage_linear_range);
+
+/**
+ * regulator_list_voltage_linear_range - List voltages for linear ranges
+ *
+ * @rdev: Regulator device
+ * @selector: Selector to convert into a voltage
+ *
+ * Regulators with a series of simple linear mappings between voltages
+ * and selectors can set linear_ranges in the regulator descriptor and
+ * then use this function as their list_voltage() operation,
+ */
+int regulator_list_voltage_linear_range(struct regulator_dev *rdev,
+					unsigned int selector)
+{
+	return regulator_desc_list_voltage_linear_range(rdev->desc, selector);
+}
 EXPORT_SYMBOL_GPL(regulator_list_voltage_linear_range);
 
 /**
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 7f8345bff4e1..05efe2b057c1 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -539,4 +539,10 @@ void *regulator_get_init_drvdata(struct regulator_init_data *reg_init_data);
 void regulator_lock(struct regulator_dev *rdev);
 void regulator_unlock(struct regulator_dev *rdev);
 
+/*
+ * Helper functions intended to be used by regulator drivers prior registering
+ * their regulators.
+ */
+int regulator_desc_list_voltage_linear_range(const struct regulator_desc *desc,
+					     unsigned int selector);
 #endif
-- 
2.14.3


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes.  Just then, he vanished ~~~
