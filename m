From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v5 1/6] regulator: core: Use local ops variable in _regulator_do_set_voltage()
Date: Wed, 14 Sep 2016 09:52:05 -0700
Message-ID: <1473871930-99603-1-git-send-email-mka@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>, briannorris@chromium.org, javier@dowhile0.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v5:
- This patch is new for v5.

 drivers/regulator/core.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index db320e8..b059e83 100644
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
2.8.0.rc3.226.g39d4020
