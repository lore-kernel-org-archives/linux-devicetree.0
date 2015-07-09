From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] regulator: pwm-regulator: Remove obsoleted property
Date: Thu,  9 Jul 2015 16:35:27 +0100
Message-ID: <1436456128-18278-2-git-send-email-lee.jones@linaro.org>
References: <1436456128-18278-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436456128-18278-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In "[3d7ef30] regulator: pwm-regulator: Simplify voltage to duty-cycle
call" we stopped using max_duty_cycle, so we can retire it from device
data and DT.

There is no need to deprecate this property, as it hasn't hit Mainline
yet.

Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/regulator/pwm-regulator.txt | 11 ++++-------
 drivers/regulator/pwm-regulator.c                             |  9 ---------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
index 23b4772..ed936f0 100644
--- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
@@ -29,15 +29,14 @@ Required properties:
 
 - pwms:			PWM specification (See: ../pwm/pwm.txt)
 
-One of these must be provided:
+Only required for Voltage Table Mode:
 - voltage-table: 	Voltage and Duty-Cycle table consisting of 2 cells
 			    First cell is voltage in microvolts (uV)
 			    Second cell is duty-cycle in percent (%)
 
-- max-duty-cycle:	Maximum Duty-Cycle value -- this will normally be
-  			255 (0xff) for an 8 bit PWM device
-
-If both are provided, the current default is voltage-table mode.
+NB: To be clear, if voltage-table is provided, then the device will be used
+in Voltage Table Mode.  If no voltage-table is provided, then the device will
+be used in Continuous Voltage Mode.
 
 Any property defined as part of the core regulator binding can also be used.
 (See: ../regulator/regulator.txt)
@@ -49,8 +48,6 @@ Continuous Voltage Example:
 		regulator-min-microvolt = <1016000>;
 		regulator-max-microvolt = <1114000>;
 		regulator-name = "vdd_logic";
-
-		max-duty-cycle = <255>; /* 8bit PWM */
 	};
 
 Voltage Table Example:
diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index cb48208..d92e667 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -30,7 +30,6 @@ struct pwm_regulator_data {
 	int state;
 
 	/* Continuous voltage */
-	u32 max_duty_cycle;
 	int volt_uV;
 };
 
@@ -201,14 +200,6 @@ static int pwm_regulator_init_continuous(struct platform_device *pdev,
 					 struct pwm_regulator_data *drvdata)
 {
 	struct device_node *np = pdev->dev.of_node;
-	int ret;
-
-	ret = of_property_read_u32(np, "max-duty-cycle",
-				   &drvdata->max_duty_cycle);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to read \"pwm-max-value\"\n");
-		return ret;
-	}
 
 	pwm_regulator_desc.ops = &pwm_regulator_voltage_continuous_ops;
 	pwm_regulator_desc.continuous_voltage_range = true;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
