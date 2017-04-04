From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V4 2/2] regulator: Add settling time for non-linear voltage transition
Date: Tue, 4 Apr 2017 18:59:50 +0530
Message-ID: <1491312590-20887-2-git-send-email-ldewangan@nvidia.com>
References: <1491312590-20887-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491312590-20887-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org
Cc: mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Some regulators (some PWM regulators) have the voltage transition
non-linear i.e. exponentially. On such cases, the settling time
for voltage transition can not be presented in the voltage-ramp-delay.

Add new property for non-linear voltage transition and handle this
in getting the voltage settling time.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

---
This patch is continuation of discussion on patch
    regulator: pwm: Fix regulator ramp delay for continuous mode
https://patchwork.kernel.org/patch/9216857/
where is it discussed to have separate property for PWM which has
exponential voltage transition.

Changes from V1:
- Use new DT property to finding that voltage ramp is exponential or
  not and use flag for having fixed delay for all voltage change.

Changes from V2:
- Based on review comment from V1, make the settling time property
  independent of the regulator-ramp-delay and move this to core
  framework instead of handling in PWM regulator.

Changes from V3:
- The change was sent long back and resuming this patch.
- Rebase on linux-next tag 20170330 for resend.
---
 drivers/regulator/core.c          | 2 ++
 drivers/regulator/of_regulator.c  | 4 ++++
 include/linux/regulator/machine.h | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 0753635..7303454 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2773,6 +2773,8 @@ static int _regulator_set_voltage_time(struct regulator_dev *rdev,
 		ramp_delay = rdev->constraints->ramp_delay;
 	else if (rdev->desc->ramp_delay)
 		ramp_delay = rdev->desc->ramp_delay;
+	else if (rdev->constraints->settling_time)
+		return rdev->constraints->settling_time;
 
 	if (ramp_delay == 0) {
 		rdev_dbg(rdev, "ramp_delay not set\n");
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 4f613ec..09d677d 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -86,6 +86,10 @@ static void of_get_regulation_constraints(struct device_node *np,
 			constraints->ramp_disable = true;
 	}
 
+	ret = of_property_read_u32(np, "regulator-settling-time-us", &pval);
+	if (!ret)
+		constraints->settling_time = pval;
+
 	ret = of_property_read_u32(np, "regulator-enable-ramp-delay", &pval);
 	if (!ret)
 		constraints->enable_time = pval;
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index c9f795e..117699d 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -108,6 +108,8 @@ struct regulator_state {
  * @initial_state: Suspend state to set by default.
  * @initial_mode: Mode to set at startup.
  * @ramp_delay: Time to settle down after voltage change (unit: uV/us)
+ * @settling_time: Time to settle down after voltage change when voltage
+ *		   change is non-linear (unit: microseconds).
  * @active_discharge: Enable/disable active discharge. The enum
  *		      regulator_active_discharge values are used for
  *		      initialisation.
@@ -149,6 +151,7 @@ struct regulation_constraints {
 	unsigned int initial_mode;
 
 	unsigned int ramp_delay;
+	unsigned int settling_time;
 	unsigned int enable_time;
 
 	unsigned int active_discharge;
-- 
2.1.4
