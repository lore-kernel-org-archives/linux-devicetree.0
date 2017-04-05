From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: Add settling time for non-linear voltage transition" to the regulator tree
Date: Wed, 05 Apr 2017 18:31:17 +0100
Message-ID: <E1cvom5-0000w3-D4@debutante>
References: <1491312590-20887-2-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491312590-20887-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.orglinux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: Add settling time for non-linear voltage transition

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

>From d6c1dc3f52e3a65f35c58433ba57d14c0bad902f Mon Sep 17 00:00:00 2001
From: Laxman Dewangan <ldewangan@nvidia.com>
Date: Tue, 4 Apr 2017 18:59:50 +0530
Subject: [PATCH] regulator: Add settling time for non-linear voltage
 transition

Some regulators (some PWM regulators) have the voltage transition
non-linear i.e. exponentially. On such cases, the settling time
for voltage transition can not be presented in the voltage-ramp-delay.

Add new property for non-linear voltage transition and handle this
in getting the voltage settling time.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/core.c          | 2 ++
 drivers/regulator/of_regulator.c  | 4 ++++
 include/linux/regulator/machine.h | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 04baac9a165b..3a641d64f8e1 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2753,6 +2753,8 @@ static int _regulator_set_voltage_time(struct regulator_dev *rdev,
 		ramp_delay = rdev->constraints->ramp_delay;
 	else if (rdev->desc->ramp_delay)
 		ramp_delay = rdev->desc->ramp_delay;
+	else if (rdev->constraints->settling_time)
+		return rdev->constraints->settling_time;
 
 	if (ramp_delay == 0) {
 		rdev_dbg(rdev, "ramp_delay not set\n");
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 4f613ec99500..09d677d5d3f0 100644
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
index ad3e5158e586..598a493b3927 100644
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
2.11.0
