From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] regulator: Add support to scale ramp delay based on platform behavior
Date: Mon, 29 Feb 2016 20:10:29 +0530
Message-ID: <1456756829-2277-2-git-send-email-ldewangan@nvidia.com>
References: <1456756829-2277-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456756829-2277-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It is observed that voltage change in given rail affected by the load
and the capacitor in the rail. This may cause the slow ramp in voltage
against what PMIC has programmed.

The machine constraints ramp_delay provides the ramp delay configuration
for PMIC but actual voltage settling time may change based on platform.

Add ramp_delay_scale in the machine constraints for platform specific
scaling for final ramp delay calculation. On this case, final wait
delay time for voltage change is calculated as the
	DIV_ROUND_UP(ramp_delay * ramp_delay_scale, 100)

The value is provided in the term of percentage i.e. 300% means it will
do the 3x delay of calculated value.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/core.c          | 6 ++++++
 drivers/regulator/of_regulator.c  | 7 +++++++
 include/linux/regulator/machine.h | 7 +++++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 055f8c1..476fe6c 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2786,6 +2786,12 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 			delay = 0;
 		}
 
+		if (delay && rdev->constraints &&
+		    rdev->constraints->ramp_delay_scale) {
+			delay *= rdev->constraints->ramp_delay_scale;
+			delay = DIV_ROUND_UP(delay, 100);
+		}
+
 		/* Insert any necessary delays */
 		if (delay >= 1000) {
 			mdelay(delay / 1000);
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 499e437..cd204b1 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -87,6 +87,13 @@ static void of_get_regulation_constraints(struct device_node *np,
 			constraints->ramp_disable = true;
 	}
 
+	if (constraints->ramp_delay) {
+		ret = of_property_read_u32(np, "regulator-ramp-delay-scale",
+					   &pval);
+		if (!ret)
+			constraints->ramp_delay_scale = pval;
+	}
+
 	ret = of_property_read_u32(np, "regulator-enable-ramp-delay", &pval);
 	if (!ret)
 		constraints->enable_time = pval;
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index a1067d0..5153e5a 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -100,6 +100,12 @@ struct regulator_state {
  * @initial_state: Suspend state to set by default.
  * @initial_mode: Mode to set at startup.
  * @ramp_delay: Time to settle down after voltage change (unit: uV/us)
+ * @ramp_delay_scale: Scaling in ramp delay to provide extra guard time
+ *		      to settle down after voltage change. This is
+ *		      provided in terms of percentage like 200% means
+ *		      2x of calculated ramp delay for given voltage change.
+ *		      The final delay is calucated as:
+			DIV_ROUND_UP(ramp_delay * ramp_delay_scale, 100);
  * @enable_time: Turn-on time of the rails (unit: microseconds)
  */
 struct regulation_constraints {
@@ -139,6 +145,7 @@ struct regulation_constraints {
 
 	unsigned int ramp_delay;
 	unsigned int enable_time;
+	unsigned int ramp_delay_scale;
 
 	/* constraint flags */
 	unsigned always_on:1;	/* regulator never off when system is on */
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
