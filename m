From: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 1/2] regulator: pwm: Add support for a fixed delay after duty cycle changes
Date: Tue, 30 Aug 2016 21:21:15 -0700
Message-ID: <1472617277-30814-1-git-send-email-dianders@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

A change of the duty cycle doesn't necessarily cause an immediate switch
to the target voltage.  On many PWM regulators there is a fixed "settle
time" (irrespective of the jump size) that we need to wait after an
upward jump.  This change introduces the device tree property
"settle-time-up-us" which allows us to specify a fixed delay after a
voltage increase.

We don't add an option of a fixed delay on the way down for now because
the way down is probably modelled best with a ramp rate, not a fixed
delay.

Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v3:
- Took out fixed delay for falling transitions
- Updated description

 .../devicetree/bindings/regulator/pwm-regulator.txt   |  6 ++++++
 drivers/regulator/pwm-regulator.c                     | 19 +++++++++++++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
index 3aeba9f86ed8..9dc15d18e787 100644
--- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
@@ -34,6 +34,12 @@ Only required for Voltage Table Mode:
 			    First cell is voltage in microvolts (uV)
 			    Second cell is duty-cycle in percent (%)
 
+Optional properties:
+--------------------
+- settle-time-up-us:	Time to settle down after a voltage increase
+			(unit: us). For regulators with a ramp delay
+			the two values are added.
+
 Optional properties for Continuous mode:
 - pwm-dutycycle-unit:	Integer value encoding the duty cycle unit. If not
 			defined, <100> is assumed, meaning that
diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index c24524242da2..94f1ca3b793d 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -48,6 +48,8 @@ struct pwm_regulator_data {
 
 	/* Enable GPIO */
 	struct gpio_desc *enb_gpio;
+
+	u32 settle_time_up_us;
 };
 
 struct pwm_voltages {
@@ -195,6 +197,7 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
 	unsigned int max_uV_duty = drvdata->continuous.max_uV_dutycycle;
 	unsigned int duty_unit = drvdata->continuous.dutycycle_unit;
 	unsigned int ramp_delay = rdev->constraints->ramp_delay;
+	unsigned int delay = 0;
 	int min_uV = rdev->constraints->min_uV;
 	int max_uV = rdev->constraints->max_uV;
 	int diff_uV = max_uV - min_uV;
@@ -233,12 +236,17 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
 		return ret;
 	}
 
-	if ((ramp_delay == 0) || !pwm_regulator_is_enabled(rdev))
+	if (req_min_uV > old_uV)
+		delay = drvdata->settle_time_up_us;
+
+	if (ramp_delay != 0)
+		/* Adjust ramp delay to uS and add to settle time. */
+		delay += DIV_ROUND_UP(abs(req_min_uV - old_uV), ramp_delay);
+
+	if ((delay == 0) || !pwm_regulator_is_enabled(rdev))
 		return 0;
 
-	/* Ramp delay is in uV/uS. Adjust to uS and delay */
-	ramp_delay = DIV_ROUND_UP(abs(req_min_uV - old_uV), ramp_delay);
-	usleep_range(ramp_delay, ramp_delay + DIV_ROUND_UP(ramp_delay, 10));
+	usleep_range(delay, delay + DIV_ROUND_UP(delay, 10));
 
 	return 0;
 }
@@ -368,6 +376,9 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 	if (!init_data)
 		return -ENOMEM;
 
+	of_property_read_u32(np, "settle-time-up-us",
+			&drvdata->settle_time_up_us);
+
 	config.of_node = np;
 	config.dev = &pdev->dev;
 	config.driver_data = drvdata;
-- 
2.8.0.rc3.226.g39d4020

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
