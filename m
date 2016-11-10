From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: [RESEND PATCH] regulator: pwm: fix syntax errors in the examples
Date: Thu, 10 Nov 2016 11:25:27 +0100
Message-ID: <1478773527-10936-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

While at it, clean up some other things as well.

Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
---
 .../devicetree/bindings/regulator/pwm-regulator.txt          | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
index 3aeba9f86ed8..6d98fbaeb506 100644
--- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
@@ -55,11 +55,11 @@ Optional properties:
 - enable-gpios:		GPIO to use to enable/disable the regulator
 
 Any property defined as part of the core regulator binding can also be used.
-(See: ../regulator/regulator.txt)
+(See: regulator.txt)
 
 Continuous Voltage With Enable GPIO Example:
-	pwm_regulator {
-		compatible = "pwm-regulator;
+	pwm-regulator {
+		compatible = "pwm-regulator";
 		pwms = <&pwm1 0 8448 0>;
 		enable-gpios = <&gpio0 23 GPIO_ACTIVE_HIGH>;
 		regulator-min-microvolt = <1016000>;
@@ -71,12 +71,12 @@ Continuous Voltage With Enable GPIO Example:
 		 * Inverted PWM logic, and the duty cycle range is limited
 		 * to 30%-70%.
 		 */
-		pwm-dutycycle-range <700 300>; /* */
+		pwm-dutycycle-range <700 300>;
 	};
 
 Voltage Table Example:
-	pwm_regulator {
-		compatible = "pwm-regulator;
+	pwm-regulator {
+		compatible = "pwm-regulator";
 		pwms = <&pwm1 0 8448 0>;
 		regulator-min-microvolt = <1016000>;
 		regulator-max-microvolt = <1114000>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
