From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: leave one item to record whether regulator is enabled" to the regulator tree
Date: Fri, 26 Jan 2018 15:26:04 +0000
Message-ID: <E1ef5tE-0006dc-Qf@debutante>
References: <1515752305-15907-4-git-send-email-zhang.chunyan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515752305-15907-4-git-send-email-zhang.chunyan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunyan Zhang <zhang.chunyan@linaro.org>
Cc: Mark Brown <broonie@kernel.org>Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Chunyan Zhang <zhang.lyra@gmail.com>linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: leave one item to record whether regulator is enabled

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

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

>From 72069f9957a11896e79e95c8b55ec815e97c2187 Mon Sep 17 00:00:00 2001
From: Chunyan Zhang <zhang.chunyan@linaro.org>
Date: Fri, 26 Jan 2018 21:08:45 +0800
Subject: [PATCH] regulator: leave one item to record whether regulator is
 enabled

The items "disabled" and "enabled" are a little redundant, since only one
of them would be set to record if the regulator device should keep on
or be switched to off in suspend states.

So in this patch, the "disabled" was removed, only leave the "enabled":
  - enabled == 1 for regulator-on-in-suspend
  - enabled == 0 for regulator-off-in-suspend
  - enabled == -1 means do nothing when entering suspend mode.

Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/core.c          | 14 ++++++--------
 drivers/regulator/of_regulator.c  |  6 ++++--
 include/linux/regulator/machine.h | 19 +++++++++++++++----
 3 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 97bc9f7adf2f..5ea80e94eb69 100644
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
index 14637a01ba2d..41dad42b18f0 100644
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
index 9cd4fef37203..ce89c5548c89 100644
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
2.15.1
