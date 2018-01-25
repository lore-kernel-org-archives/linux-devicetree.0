From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regulator: empty the old suspend functions" to the regulator tree
Date: Thu, 25 Jan 2018 12:15:39 +0000
Message-ID: <E1eegRP-0006WK-B8@debutante>
References: <1513837506-26543-5-git-send-email-zhang.chunyan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513837506-26543-5-git-send-email-zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: empty the old suspend functions

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

>From 6103427372a81f7018525ca84c0647f36532a94e Mon Sep 17 00:00:00 2001
From: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Tue, 23 Jan 2018 19:59:42 +0800
Subject: [PATCH] regulator: empty the old suspend functions

Regualtor suspend/resume functions should only be called by PM suspend
core via registering dev_pm_ops, and regulator devices should implement
the callback functions.  Thus, any regulator consumer shouldn't call
the regulator suspend/resume functions directly.

In order to avoid compile errors, two empty functions with the same name
still be left for the time being.

Signed-off-by: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/core.c          | 74 ---------------------------------------
 include/linux/regulator/machine.h |  5 ++-
 2 files changed, 2 insertions(+), 77 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 5ea80e94eb69..080c2334edc5 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4179,80 +4179,6 @@ void regulator_unregister(struct regulator_dev *rdev)
 }
 EXPORT_SYMBOL_GPL(regulator_unregister);
 
-static int _regulator_suspend_prepare(struct device *dev, void *data)
-{
-	struct regulator_dev *rdev = dev_to_rdev(dev);
-	const suspend_state_t *state = data;
-	int ret;
-
-	mutex_lock(&rdev->mutex);
-	ret = suspend_prepare(rdev, *state);
-	mutex_unlock(&rdev->mutex);
-
-	return ret;
-}
-
-/**
- * regulator_suspend_prepare - prepare regulators for system wide suspend
- * @state: system suspend state
- *
- * Configure each regulator with it's suspend operating parameters for state.
- * This will usually be called by machine suspend code prior to supending.
- */
-int regulator_suspend_prepare(suspend_state_t state)
-{
-	/* ON is handled by regulator active state */
-	if (state == PM_SUSPEND_ON)
-		return -EINVAL;
-
-	return class_for_each_device(&regulator_class, NULL, &state,
-				     _regulator_suspend_prepare);
-}
-EXPORT_SYMBOL_GPL(regulator_suspend_prepare);
-
-static int _regulator_suspend_finish(struct device *dev, void *data)
-{
-	struct regulator_dev *rdev = dev_to_rdev(dev);
-	int ret;
-
-	mutex_lock(&rdev->mutex);
-	if (rdev->use_count > 0  || rdev->constraints->always_on) {
-		if (!_regulator_is_enabled(rdev)) {
-			ret = _regulator_do_enable(rdev);
-			if (ret)
-				dev_err(dev,
-					"Failed to resume regulator %d\n",
-					ret);
-		}
-	} else {
-		if (!have_full_constraints())
-			goto unlock;
-		if (!_regulator_is_enabled(rdev))
-			goto unlock;
-
-		ret = _regulator_do_disable(rdev);
-		if (ret)
-			dev_err(dev, "Failed to suspend regulator %d\n", ret);
-	}
-unlock:
-	mutex_unlock(&rdev->mutex);
-
-	/* Keep processing regulators in spite of any errors */
-	return 0;
-}
-
-/**
- * regulator_suspend_finish - resume regulators from system wide suspend
- *
- * Turn on regulators that might be turned off by regulator_suspend_prepare
- * and that should be turned on according to the regulators properties.
- */
-int regulator_suspend_finish(void)
-{
-	return class_for_each_device(&regulator_class, NULL, NULL,
-				     _regulator_suspend_finish);
-}
-EXPORT_SYMBOL_GPL(regulator_suspend_finish);
 
 /**
  * regulator_has_full_constraints - the system has fully specified constraints
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index e50519f13d4d..b4ddb56e7c19 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -231,12 +231,12 @@ struct regulator_init_data {
 
 #ifdef CONFIG_REGULATOR
 void regulator_has_full_constraints(void);
-int regulator_suspend_prepare(suspend_state_t state);
-int regulator_suspend_finish(void);
 #else
 static inline void regulator_has_full_constraints(void)
 {
 }
+#endif
+
 static inline int regulator_suspend_prepare(suspend_state_t state)
 {
 	return 0;
@@ -245,6 +245,5 @@ static inline int regulator_suspend_finish(void)
 {
 	return 0;
 }
-#endif
 
 #endif
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
