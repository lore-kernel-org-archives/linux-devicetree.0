From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 RESEND 2/4] regulator: core: Add support for active-discharge configuration
Date: Wed, 2 Mar 2016 16:24:46 +0530
Message-ID: <1456916088-25543-3-git-send-email-ldewangan@nvidia.com>
References: <1456916088-25543-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456916088-25543-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, lgirdwood@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add support to enable/disable active discharge of regulator via
machine constraints. This configuration is done when setting
machine constraint during regulator register and if regulator
driver implemented the callback ops.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
Changes from V1:
 Make the interface like 0 (non-init member) will be treated as default,
 1 for disable and 2 for enable. Created enum for active discharge
 default/enable/disable


 drivers/regulator/core.c          | 11 +++++++++++
 drivers/regulator/of_regulator.c  |  6 ++++++
 include/linux/regulator/driver.h  |  3 +++
 include/linux/regulator/machine.h | 12 ++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 055f8c1..095de51 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1139,6 +1139,17 @@ static int set_machine_constraints(struct regulator_dev *rdev,
 		}
 	}
 
+	if (rdev->constraints->active_discharge && ops->set_active_discharge) {
+		bool ad_state = (rdev->constraints->active_discharge ==
+			      REGULATOR_ACTIVE_DISCHARGE_ENABLE) ? true : false;
+
+		ret = ops->set_active_discharge(rdev, ad_state);
+		if (ret < 0) {
+			rdev_err(rdev, "failed to set active discharge\n");
+			return ret;
+		}
+	}
+
 	print_constraints(rdev);
 	return 0;
 }
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 499e437..fe2e3344 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -93,6 +93,12 @@ static void of_get_regulation_constraints(struct device_node *np,
 
 	constraints->soft_start = of_property_read_bool(np,
 					"regulator-soft-start");
+	ret = of_property_read_u32(np, "regulator-active-discharge", &pval);
+	if (!ret) {
+		constraints->active_discharge =
+				(pval) ? REGULATOR_ACTIVE_DISCHARGE_ENABLE :
+					REGULATOR_ACTIVE_DISCHARGE_DISABLE;
+	}
 
 	if (!of_property_read_u32(np, "regulator-initial-mode", &pval)) {
 		if (desc && desc->of_map_mode) {
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 16ac9e1..59dbaf7 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -93,6 +93,8 @@ struct regulator_linear_range {
  * @get_current_limit: Get the configured limit for a current-limited regulator.
  * @set_input_current_limit: Configure an input limit.
  *
+ * @set_active_discharge: Set active discharge enable/disable of regulators.
+ *
  * @set_mode: Set the configured operating mode for the regulator.
  * @get_mode: Get the configured operating mode for the regulator.
  * @get_status: Return actual (not as-configured) status of regulator, as a
@@ -149,6 +151,7 @@ struct regulator_ops {
 
 	int (*set_input_current_limit) (struct regulator_dev *, int lim_uA);
 	int (*set_over_current_protection) (struct regulator_dev *);
+	int (*set_active_discharge) (struct regulator_dev *, bool enable);
 
 	/* enable/disable regulator */
 	int (*enable) (struct regulator_dev *);
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index a1067d0..5d627c8 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -42,6 +42,13 @@ struct regulator;
 #define REGULATOR_CHANGE_DRMS		0x10
 #define REGULATOR_CHANGE_BYPASS		0x20
 
+/* Regulator active discharge flags */
+enum regulator_active_discharge {
+	REGULATOR_ACTIVE_DISCHARGE_DEFAULT,
+	REGULATOR_ACTIVE_DISCHARGE_DISABLE,
+	REGULATOR_ACTIVE_DISCHARGE_ENABLE,
+};
+
 /**
  * struct regulator_state - regulator state during low power system states
  *
@@ -100,6 +107,9 @@ struct regulator_state {
  * @initial_state: Suspend state to set by default.
  * @initial_mode: Mode to set at startup.
  * @ramp_delay: Time to settle down after voltage change (unit: uV/us)
+ * @active_discharge: Enable/disable active discharge. The enum
+ *		      regulator_active_discharge values are used for
+ *		      initialisation.
  * @enable_time: Turn-on time of the rails (unit: microseconds)
  */
 struct regulation_constraints {
@@ -140,6 +150,8 @@ struct regulation_constraints {
 	unsigned int ramp_delay;
 	unsigned int enable_time;
 
+	unsigned int active_discharge;
+
 	/* constraint flags */
 	unsigned always_on:1;	/* regulator never off when system is on */
 	unsigned boot_on:1;	/* bootloader/firmware enabled regulator */
-- 
2.1.4
