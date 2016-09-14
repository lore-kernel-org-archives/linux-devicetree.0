From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regulator: core: Use local ops variable in _regulator_do_set_voltage()" to the regulator tree
Date: Wed, 14 Sep 2016 18:16:08 +0100
Message-ID: <E1bkDn6-0001pQ-CO@debutante>
References: <1473871930-99603-1-git-send-email-mka@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473871930-99603-1-git-send-email-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: core: Use local ops variable in _regulator_do_set_voltage()

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

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

>From 57995a4860542ea2089558c84f739e12d5ca1059 Mon Sep 17 00:00:00 2001
From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Date: Wed, 14 Sep 2016 09:52:05 -0700
Subject: [PATCH] regulator: core: Use local ops variable in
 _regulator_do_set_voltage()

Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/core.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index db320e8fa865..b059e8334567 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2751,6 +2751,7 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 	int best_val = 0;
 	unsigned int selector;
 	int old_selector = -1;
+	const struct regulator_ops *ops = rdev->desc->ops;
 
 	trace_regulator_set_voltage(rdev_get_name(rdev), min_uV, max_uV);
 
@@ -2762,29 +2763,28 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 	 * info to call set_voltage_time_sel().
 	 */
 	if (_regulator_is_enabled(rdev) &&
-	    rdev->desc->ops->set_voltage_time_sel &&
-	    rdev->desc->ops->get_voltage_sel) {
-		old_selector = rdev->desc->ops->get_voltage_sel(rdev);
+	    ops->set_voltage_time_sel && ops->get_voltage_sel) {
+		old_selector = ops->get_voltage_sel(rdev);
 		if (old_selector < 0)
 			return old_selector;
 	}
 
-	if (rdev->desc->ops->set_voltage) {
+	if (ops->set_voltage) {
 		ret = _regulator_call_set_voltage(rdev, min_uV, max_uV,
 						  &selector);
 
 		if (ret >= 0) {
-			if (rdev->desc->ops->list_voltage)
-				best_val = rdev->desc->ops->list_voltage(rdev,
-									 selector);
+			if (ops->list_voltage)
+				best_val = ops->list_voltage(rdev,
+							     selector);
 			else
 				best_val = _regulator_get_voltage(rdev);
 		}
 
-	} else if (rdev->desc->ops->set_voltage_sel) {
+	} else if (ops->set_voltage_sel) {
 		ret = regulator_map_voltage(rdev, min_uV, max_uV);
 		if (ret >= 0) {
-			best_val = rdev->desc->ops->list_voltage(rdev, ret);
+			best_val = ops->list_voltage(rdev, ret);
 			if (min_uV <= best_val && max_uV >= best_val) {
 				selector = ret;
 				if (old_selector == selector)
@@ -2804,7 +2804,7 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 	if (ret == 0 && !rdev->constraints->ramp_disable && old_selector >= 0
 		&& old_selector != selector) {
 
-		delay = rdev->desc->ops->set_voltage_time_sel(rdev,
+		delay = ops->set_voltage_time_sel(rdev,
 						old_selector, selector);
 		if (delay < 0) {
 			rdev_warn(rdev, "set_voltage_time_sel() failed: %d\n",
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
