From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v5 3/6] regulator: core: Don't skip set_voltage_time when ramp delay disabled
Date: Wed, 14 Sep 2016 09:52:07 -0700
Message-ID: <1473871930-99603-3-git-send-email-mka@chromium.org>
References: <1473871930-99603-1-git-send-email-mka@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473871930-99603-1-git-send-email-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>, briannorris@chromium.org, javier@dowhile0.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

The current code assumes that only the ramp_delay is used to determine
the time needed for the voltage to stabilize. This may be true for the
calculation done by regulator_set_voltage_time_sel(), however regulators
can implement their own set_voltage_time_sel() op which would be skipped
if no ramp delay is specified. Remove the check in
_regulator_do_set_voltage(), the functions calculating the ramp delay
return 0 anyway when the ramp delay is not configured.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v5:
- This patch is new for v5.

 drivers/regulator/core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index b0076cc..df3028b 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2804,9 +2804,7 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 		goto out;
 
 	/* Call set_voltage_time_sel if successfully obtained old_selector */
-	if (!rdev->constraints->ramp_disable && old_selector >= 0
-		&& old_selector != selector) {
-
+	if (!old_selector >= 0 && old_selector != selector) {
 		delay = ops->set_voltage_time_sel(rdev,
 						old_selector, selector);
 		if (delay < 0) {
@@ -3051,10 +3049,8 @@ int regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 	else if (rdev->desc->ramp_delay)
 		ramp_delay = rdev->desc->ramp_delay;
 
-	if (ramp_delay == 0) {
-		rdev_warn(rdev, "ramp_delay not set\n");
+	if (ramp_delay == 0)
 		return 0;
-	}
 
 	/* sanity check */
 	if (!rdev->desc->ops->list_voltage)
-- 
2.8.0.rc3.226.g39d4020
