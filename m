From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: Allow for asymmetric settling times" to the regulator tree
Date: Wed, 17 May 2017 10:53:44 +0100
Message-ID: <E1dAveK-00078v-Fr@debutante>
References: <20170516184343.103099-2-mka@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170516184343.103099-2-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>Laxman Dewangan <ldewangan@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: Allow for asymmetric settling times

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

>From 3ffad468cf1d9825b425733941bdad0d8d20e795 Mon Sep 17 00:00:00 2001
From: Matthias Kaehlcke <mka@chromium.org>
Date: Tue, 16 May 2017 11:43:43 -0700
Subject: [PATCH] regulator: Allow for asymmetric settling times

Some regulators have different settling times for voltage increases and
decreases. To avoid a time penalty on the faster transition allow for
different settings for up- and downward transitions.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/core.c          |  6 ++++++
 drivers/regulator/of_regulator.c  | 19 +++++++++++++++++++
 include/linux/regulator/machine.h |  6 ++++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index c0d9ae8d0860..919b7f178209 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2767,6 +2767,12 @@ static int _regulator_set_voltage_time(struct regulator_dev *rdev,
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
index 09d677d5d3f0..96bf75458da5 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -90,6 +90,25 @@ static void of_get_regulation_constraints(struct device_node *np,
 	if (!ret)
 		constraints->settling_time = pval;
 
+	ret = of_property_read_u32(np, "regulator-settling-time-up-us", &pval);
+	if (!ret)
+		constraints->settling_time_up = pval;
+	if (constraints->settling_time_up && constraints->settling_time) {
+		pr_warn("%s: ambiguous configuration for settling time, ignoring 'regulator-settling-time-up-us'\n",
+			np->name);
+		constraints->settling_time_up = 0;
+	}
+
+	ret = of_property_read_u32(np, "regulator-settling-time-down-us",
+				   &pval);
+	if (!ret)
+		constraints->settling_time_down = pval;
+	if (constraints->settling_time_down && constraints->settling_time) {
+		pr_warn("%s: ambiguous configuration for settling time, ignoring 'regulator-settling-time-down-us'\n",
+			np->name);
+		constraints->settling_time_down = 0;
+	}
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
2.11.0
