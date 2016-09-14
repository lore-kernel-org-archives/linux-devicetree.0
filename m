From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v5 2/6] regulator: core: Simplify error flow in _regulator_do_set_voltage()
Date: Wed, 14 Sep 2016 09:52:06 -0700
Message-ID: <1473871930-99603-2-git-send-email-mka@chromium.org>
References: <1473871930-99603-1-git-send-email-mka@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473871930-99603-1-git-send-email-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>, briannorris@chromium.org, javier@dowhile0.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

If the voltage can not be set jump to the end of the function. This
avoids having to check for an error multiple times and eliminates one
level of nesting in a follow-up change.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v5:
- This patch is new for v5.

 drivers/regulator/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index b059e83..b0076cc 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2800,8 +2800,11 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 		ret = -EINVAL;
 	}
 
+	if (ret)
+		goto out;
+
 	/* Call set_voltage_time_sel if successfully obtained old_selector */
-	if (ret == 0 && !rdev->constraints->ramp_disable && old_selector >= 0
+	if (!rdev->constraints->ramp_disable && old_selector >= 0
 		&& old_selector != selector) {
 
 		delay = ops->set_voltage_time_sel(rdev,
@@ -2821,13 +2824,14 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 		}
 	}
 
-	if (ret == 0 && best_val >= 0) {
+	if (best_val >= 0) {
 		unsigned long data = best_val;
 
 		_notifier_call_chain(rdev, REGULATOR_EVENT_VOLTAGE_CHANGE,
 				     (void *)data);
 	}
 
+out:
 	trace_regulator_set_voltage_complete(rdev_get_name(rdev), best_val);
 
 	return ret;
-- 
2.8.0.rc3.226.g39d4020
