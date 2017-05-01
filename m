From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 2/2] regulator: Allow for asymmetric settling times
Date: Mon,  1 May 2017 11:37:15 -0700
Message-ID: <20170501183715.35375-2-mka@chromium.org>
References: <20170501183715.35375-1-mka@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170501183715.35375-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Some regulators have different settling times for voltage increases and
decreases. To avoid a time penalty on the faster transition allow for
different settings for up- and downward transitions.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- Don't remove settling_time property
- Split DT bindings doc into separate patch

 drivers/regulator/core.c          | 6 ++++++
 drivers/regulator/of_regulator.c  | 9 +++++++++
 include/linux/regulator/machine.h | 6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 811096b23143..7836f07431d8 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2775,6 +2775,12 @@ static int _regulator_set_voltage_time(struct regulator_dev *rdev,
 		ramp_delay = rdev->desc->ramp_delay;
 	else if (rdev->constraints->settling_time)
 		return rdev->constraints->settling_time;
+	else if (rdev->constraints->settling_time_up &&
+		 (new_uV > old_uV))
+		return rdev->constraints->settling_time_up;
+	else if (rdev->constraints->settling_time_down &&
+		 (new_uV < old_uV))
+		return rdev->constraints->settling_time_down;
 
 	if (ramp_delay == 0) {
 		rdev_dbg(rdev, "ramp_delay not set\n");
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 09d677d5d3f0..b0a007c349ef 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -90,6 +90,15 @@ static void of_get_regulation_constraints(struct device_node *np,
 	if (!ret)
 		constraints->settling_time = pval;
 
+	ret = of_property_read_u32(np, "regulator-settling-time-up-us", &pval);
+	if (!ret)
+		constraints->settling_time_up = pval;
+
+	ret = of_property_read_u32(np, "regulator-settling-time-down-us",
+				   &pval);
+	if (!ret)
+		constraints->settling_time_down = pval;
+
 	ret = of_property_read_u32(np, "regulator-enable-ramp-delay", &pval);
 	if (!ret)
 		constraints->enable_time = pval;
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 117699d1f7df..9cd4fef37203 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -110,6 +110,10 @@ struct regulator_state {
  * @ramp_delay: Time to settle down after voltage change (unit: uV/us)
  * @settling_time: Time to settle down after voltage change when voltage
  *		   change is non-linear (unit: microseconds).
+ * @settling_time_up: Time to settle down after voltage increase when voltage
+ *		      change is non-linear (unit: microseconds).
+ * @settling_time_down : Time to settle down after voltage decrease when
+ *			 voltage change is non-linear (unit: microseconds).
  * @active_discharge: Enable/disable active discharge. The enum
  *		      regulator_active_discharge values are used for
  *		      initialisation.
@@ -152,6 +156,8 @@ struct regulation_constraints {
 
 	unsigned int ramp_delay;
 	unsigned int settling_time;
+	unsigned int settling_time_up;
+	unsigned int settling_time_down;
 	unsigned int enable_time;
 
 	unsigned int active_discharge;
-- 
2.13.0.rc0.306.g87b477812d-goog
