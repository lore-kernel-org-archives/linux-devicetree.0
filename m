From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regulator: core: Simplify error flow in _regulator_do_set_voltage()" to the regulator tree
Date: Fri, 16 Sep 2016 18:40:06 +0100
Message-ID: <E1bkx7O-00045b-Hb@debutante>
References: <1473871930-99603-2-git-send-email-mka@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473871930-99603-2-git-send-email-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: core: Simplify error flow in _regulator_do_set_voltage()

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

>From 31dfe686ed0ba5a796bcfc5a6745e77ddb5daa4e Mon Sep 17 00:00:00 2001
From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Date: Wed, 14 Sep 2016 09:52:06 -0700
Subject: [PATCH] regulator: core: Simplify error flow in
 _regulator_do_set_voltage()

If the voltage can not be set jump to the end of the function. This
avoids having to check for an error multiple times and eliminates one
level of nesting in a follow-up change.

Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index b059e8334567..b0076ccf896b 100644
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
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
