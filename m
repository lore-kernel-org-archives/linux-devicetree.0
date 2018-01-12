From: Chunyan Zhang <zhang.chunyan@linaro.org>
Subject: [PATCH v3 3/5] drivers: regulator: leave one item to record whether regulator is enabled
Date: Fri, 12 Jan 2018 18:18:23 +0800
Message-ID: <1515752305-15907-4-git-send-email-zhang.chunyan@linaro.org>
References: <1515752305-15907-1-git-send-email-zhang.chunyan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515752305-15907-1-git-send-email-zhang.chunyan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

The items "disabled" and "enabled" are a little redundant, since only one
of them would be set to record if the regulator device should keep on
or be switched to off in suspend states.

So in this patch, the "disabled" was removed, only leave the "enabled":
  - enabled == 1 for regulator-on-in-suspend
  - enabled == 0 for regulator-off-in-suspend
  - enabled == -1 means do nothing when entering suspend mode.

Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
---
 drivers/regulator/core.c          | 14 ++++++--------
 drivers/regulator/of_regulator.c  |  6 ++++--
 include/linux/regulator/machine.h | 19 +++++++++++++++----
 3 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 97bc9f7..5ea80e9 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -742,21 +742,19 @@ static int suspend_set_state(struct regulator_dev *rdev,
 	 * only warn if the driver implements set_suspend_voltage or
 	 * set_suspend_mode callback.
 	 */
-	if (!rstate->enabled && !rstate->disabled) {
+	if (rstate->enabled != ENABLE_IN_SUSPEND &&
+	    rstate->enabled != DISABLE_IN_SUSPEND) {
 		if (rdev->desc->ops->set_suspend_voltage ||
 		    rdev->desc->ops->set_suspend_mode)
 			rdev_warn(rdev, "No configuration\n");
 		return 0;
 	}
 
-	if (rstate->enabled && rstate->disabled) {
-		rdev_err(rdev, "invalid configuration\n");
-		return -EINVAL;
-	}
-
-	if (rstate->enabled && rdev->desc->ops->set_suspend_enable)
+	if (rstate->enabled == ENABLE_IN_SUSPEND &&
+		rdev->desc->ops->set_suspend_enable)
 		ret = rdev->desc->ops->set_suspend_enable(rdev);
-	else if (rstate->disabled && rdev->desc->ops->set_suspend_disable)
+	else if (rstate->enabled == DISABLE_IN_SUSPEND &&
+		rdev->desc->ops->set_suspend_disable)
 		ret = rdev->desc->ops->set_suspend_disable(rdev);
 	else /* OK if set_suspend_enable or set_suspend_disable is NULL */
 		ret = 0;
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 14637a0..41dad42 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -177,10 +177,12 @@ static void of_get_regulation_constraints(struct device_node *np,
 
 		if (of_property_read_bool(suspend_np,
 					"regulator-on-in-suspend"))
-			suspend_state->enabled = true;
+			suspend_state->enabled = ENABLE_IN_SUSPEND;
 		else if (of_property_read_bool(suspend_np,
 					"regulator-off-in-suspend"))
-			suspend_state->disabled = true;
+			suspend_state->enabled = DISABLE_IN_SUSPEND;
+		else
+			suspend_state->enabled = DO_NOTHING_IN_SUSPEND;
 
 		if (!of_property_read_u32(suspend_np,
 					"regulator-suspend-microvolt", &pval))
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 9cd4fef..ce89c55 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -42,6 +42,16 @@ struct regulator;
 #define REGULATOR_CHANGE_DRMS		0x10
 #define REGULATOR_CHANGE_BYPASS		0x20
 
+/*
+ * operations in suspend mode
+ * DO_NOTHING_IN_SUSPEND - the default value
+ * DISABLE_IN_SUSPEND	- turn off regulator in suspend states
+ * ENABLE_IN_SUSPEND	- keep regulator on in suspend states
+ */
+#define DO_NOTHING_IN_SUSPEND	(-1)
+#define DISABLE_IN_SUSPEND	0
+#define ENABLE_IN_SUSPEND	1
+
 /* Regulator active discharge flags */
 enum regulator_active_discharge {
 	REGULATOR_ACTIVE_DISCHARGE_DEFAULT,
@@ -58,14 +68,15 @@ enum regulator_active_discharge {
  *
  * @uV: Operating voltage during suspend.
  * @mode: Operating mode during suspend.
- * @enabled: Enabled during suspend.
- * @disabled: Disabled during suspend.
+ * @enabled: operations during suspend.
+ *	     - DO_NOTHING_IN_SUSPEND
+ *	     - DISABLE_IN_SUSPEND
+ *	     - ENABLE_IN_SUSPEND
  */
 struct regulator_state {
 	int uV;	/* suspend voltage */
 	unsigned int mode; /* suspend regulator operating mode */
-	int enabled; /* is regulator enabled in this suspend state */
-	int disabled; /* is the regulator disabled in this suspend state */
+	int enabled;
 };
 
 /**
-- 
2.7.4
