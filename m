From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] regulator: Fix trivial language typos
Date: Tue,  8 Jan 2019 13:12:33 +0100
Message-ID: <1546949553-30229-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: devicetree@vger.kernel.org

Fix few trivial language typos in core and drivers.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/regulator/pfuze100.txt |  2 +-
 drivers/regulator/Kconfig                                |  8 ++++----
 drivers/regulator/core.c                                 | 16 ++++++++--------
 drivers/regulator/lp8755.c                               |  4 ++--
 drivers/regulator/of_regulator.c                         |  4 ++--
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/pfuze100.txt b/Documentation/devicetree/bindings/regulator/pfuze100.txt
index f9be1acf891c..4d3b12b92cb3 100644
--- a/Documentation/devicetree/bindings/regulator/pfuze100.txt
+++ b/Documentation/devicetree/bindings/regulator/pfuze100.txt
@@ -8,7 +8,7 @@ Optional properties:
 - fsl,pfuze-support-disable-sw: Boolean, if present disable all unused switch
   regulators to save power consumption. Attention, ensure that all important
   regulators (e.g. DDR ref, DDR supply) has set the "regulator-always-on"
-  property. If not present, the switched regualtors are always on and can't be
+  property. If not present, the switched regulators are always on and can't be
   disabled. This binding is a workaround to keep backward compatibility with
   old dtb's which rely on the fact that the switched regulators are always on
   and don't mark them explicit as "regulator-always-on".
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index ee60a222f5eb..7fc1f88e27e7 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -484,7 +484,7 @@ config REGULATOR_MAX8925
 	tristate "Maxim MAX8925 Power Management IC"
 	depends on MFD_MAX8925
 	help
-	  Say y here to support the voltage regulaltor of Maxim MAX8925 PMIC.
+	  Say y here to support the voltage regulator of Maxim MAX8925 PMIC.
 
 config REGULATOR_MAX8952
 	tristate "Maxim MAX8952 Power Management IC"
@@ -501,7 +501,7 @@ config REGULATOR_MAX8973
 	select REGMAP_I2C
 	help
 	  The MAXIM MAX8973 high-efficiency. three phase, DC-DC step-down
-	  switching regulator delievers up to 9A of output current. Each
+	  switching regulator delivers up to 9A of output current. Each
 	  phase operates at a 2MHz fixed frequency with a 120 deg shift
 	  from the adjacent phase, allowing the use of small magnetic component.
 
@@ -646,7 +646,7 @@ config REGULATOR_PCF50633
 	tristate "NXP PCF50633 regulator driver"
 	depends on MFD_PCF50633
 	help
-	 Say Y here to support the voltage regulators and convertors
+	 Say Y here to support the voltage regulators and converters
 	 on PCF50633
 
 config REGULATOR_PFUZE100
@@ -924,7 +924,7 @@ config REGULATOR_TPS65132
 	select REGMAP_I2C
 	help
 	  This driver supports TPS65132 single inductor - dual output
-	  power supply specifcally designed for display panels.
+	  power supply specifically designed for display panels.
 
 config REGULATOR_TPS65217
 	tristate "TI TPS65217 Power regulators"
diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index b9d7b45c7295..3f9d81b6e763 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -326,7 +326,7 @@ static int regulator_lock_recursive(struct regulator_dev *rdev,
  * @rdev:			regulator source
  * @ww_ctx:			w/w mutex acquire context
  *
- * Unlock all regulators related with rdev by coupling or suppling.
+ * Unlock all regulators related with rdev by coupling or supplying.
  */
 static void regulator_unlock_dependent(struct regulator_dev *rdev,
 				       struct ww_acquire_ctx *ww_ctx)
@@ -341,7 +341,7 @@ static void regulator_unlock_dependent(struct regulator_dev *rdev,
  * @ww_ctx:			w/w mutex acquire context
  *
  * This function as a wrapper on regulator_lock_recursive(), which locks
- * all regulators related with rdev by coupling or suppling.
+ * all regulators related with rdev by coupling or supplying.
  */
 static void regulator_lock_dependent(struct regulator_dev *rdev,
 				     struct ww_acquire_ctx *ww_ctx)
@@ -1003,7 +1003,7 @@ static int suspend_set_state(struct regulator_dev *rdev,
 	if (rstate == NULL)
 		return 0;
 
-	/* If we have no suspend mode configration don't set anything;
+	/* If we have no suspend mode configuration don't set anything;
 	 * only warn if the driver implements set_suspend_voltage or
 	 * set_suspend_mode callback.
 	 */
@@ -1131,7 +1131,7 @@ static int machine_constraints_voltage(struct regulator_dev *rdev,
 		int current_uV = _regulator_get_voltage(rdev);
 
 		if (current_uV == -ENOTRECOVERABLE) {
-			/* This regulator can't be read and must be initted */
+			/* This regulator can't be read and must be initialized */
 			rdev_info(rdev, "Setting %d-%duV\n",
 				  rdev->constraints->min_uV,
 				  rdev->constraints->max_uV);
@@ -1780,7 +1780,7 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
 	struct device *dev = rdev->dev.parent;
 	int ret;
 
-	/* No supply to resovle? */
+	/* No supply to resolve? */
 	if (!rdev->supply_name)
 		return 0;
 
@@ -2409,7 +2409,7 @@ static int _regulator_do_enable(struct regulator_dev *rdev)
 			 * timer wrapping.
 			 * in case of multiple timer wrapping, either it can be
 			 * detected by out-of-range remaining, or it cannot be
-			 * detected and we gets a panelty of
+			 * detected and we get a penalty of
 			 * _regulator_enable_delay().
 			 */
 			remaining = intended - start_jiffy;
@@ -2809,7 +2809,7 @@ static void regulator_disable_work(struct work_struct *work)
 /**
  * regulator_disable_deferred - disable regulator output with delay
  * @regulator: regulator source
- * @ms: miliseconds until the regulator is disabled
+ * @ms: milliseconds until the regulator is disabled
  *
  * Execute regulator_disable() on the regulator after a delay.  This
  * is intended for use with devices that require some time to quiesce.
@@ -4943,7 +4943,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	 * device tree until we have handled it over to the core. If the
 	 * config that was passed in to this function DOES NOT contain
 	 * a descriptor, and the config after this call DOES contain
-	 * a descriptor, we definately got one from parsing the device
+	 * a descriptor, we definitely got one from parsing the device
 	 * tree.
 	 */
 	if (!cfg->ena_gpiod && config->ena_gpiod)
diff --git a/drivers/regulator/lp8755.c b/drivers/regulator/lp8755.c
index 244822bb63cd..6d229ad4ef3e 100644
--- a/drivers/regulator/lp8755.c
+++ b/drivers/regulator/lp8755.c
@@ -386,7 +386,7 @@ static irqreturn_t lp8755_irq_handler(int irq, void *data)
 	if (ret < 0)
 		goto err_i2c;
 
-	/* send OCP event to all regualtor devices */
+	/* send OCP event to all regulator devices */
 	if ((flag1 & 0x01) && (pchip->irqmask & 0x01))
 		for (icnt = 0; icnt < LP8755_BUCK_MAX; icnt++)
 			if (pchip->rdev[icnt] != NULL)
@@ -394,7 +394,7 @@ static irqreturn_t lp8755_irq_handler(int irq, void *data)
 							      LP8755_EVENT_OCP,
 							      NULL);
 
-	/* send OVP event to all regualtor devices */
+	/* send OVP event to all regulator devices */
 	if ((flag1 & 0x02) && (pchip->irqmask & 0x02))
 		for (icnt = 0; icnt < LP8755_BUCK_MAX; icnt++)
 			if (pchip->rdev[icnt] != NULL)
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index ffa5fc3724e4..7b6bf3536271 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -255,7 +255,7 @@ static void of_get_regulation_constraints(struct device_node *np,
  * @desc: regulator description
  *
  * Populates regulator_init_data structure by extracting data from device
- * tree node, returns a pointer to the populated struture or NULL if memory
+ * tree node, returns a pointer to the populated structure or NULL if memory
  * alloc fails.
  */
 struct regulator_init_data *of_get_regulator_init_data(struct device *dev,
@@ -547,7 +547,7 @@ bool of_check_coupling_data(struct regulator_dev *rdev)
 							  NULL);
 
 		if (c_n_phandles != n_phandles) {
-			dev_err(&rdev->dev, "number of couped reg phandles mismatch\n");
+			dev_err(&rdev->dev, "number of coupled reg phandles mismatch\n");
 			ret = false;
 			goto clean;
 		}
-- 
2.7.4
