From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regulator: core: Don't skip set_voltage_time when ramp delay disabled" to the regulator tree
Date: Fri, 16 Sep 2016 18:40:03 +0100
Message-ID: <E1bkx7L-00044d-K4@debutante>
References: <1473871930-99603-3-git-send-email-mka@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473871930-99603-3-git-send-email-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: core: Don't skip set_voltage_time when ramp delay disabled

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

>From d89564efe79419a093e966a959bf5ba2c94e693f Mon Sep 17 00:00:00 2001
From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Date: Wed, 14 Sep 2016 09:52:07 -0700
Subject: [PATCH] regulator: core: Don't skip set_voltage_time when ramp delay
 disabled

The current code assumes that only the ramp_delay is used to determine
the time needed for the voltage to stabilize. This may be true for the
calculation done by regulator_set_voltage_time_sel(), however regulators
can implement their own set_voltage_time_sel() op which would be skipped
if no ramp delay is specified. Remove the check in
_regulator_do_set_voltage(), the functions calculating the ramp delay
return 0 anyway when the ramp delay is not configured.

Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index b0076ccf896b..df3028b2a8e9 100644
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
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
