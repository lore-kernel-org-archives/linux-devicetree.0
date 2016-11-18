From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 1/2] regulator: pwm: DT: Add ramp delay for exponential voltage transition
Date: Fri, 18 Nov 2016 20:05:55 +0530
Message-ID: <1479479756-10755-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some PWM regulator has the exponential transition in voltage change as
opposite to fixed slew-rate linear transition on other regulators.
For such PWM regulators, add the property to tell that voltage change
is exponential and having fixed delay for any level of change.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
CC: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
CC: Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
This patch is continuation of discussion on patch
	regulator: pwm: Fix regulator ramp delay for continuous mode
https://patchwork.kernel.org/patch/9216857/
where is it discussed to have separate property for PWM which has
exponential voltage transition.

Changes from V1:
- Pass the flag to tell that voltage ramp is exponential instead of
  providing delay.
---
 .../devicetree/bindings/regulator/pwm-regulator.txt          | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
index 3aeba9f..2d9ef3a 100644
--- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
@@ -54,6 +54,18 @@ Optional properties:
 --------------------
 - enable-gpios:		GPIO to use to enable/disable the regulator
 
+- voltage-ramp-exponential: Boolean, Some of PWM regulator has the exponential
+			transition in voltage ramp as opposite to fixed
+			slew-rate linear transition on other regulators.
+			For such PWM regulator, presence of this property will
+			tell that value of the regulator ramp delay provided by
+			DT property "regulator-ramp-delay" is exponential and
+			fixed delay for any voltage level change.
+			If PWM regulator supports the fixed linear slew rate
+			then this property should be absent from DT node and
+			property "regulator-ramp-delay" is used as linear slew
+			rate.
+
 Any property defined as part of the core regulator binding can also be used.
 (See: ../regulator/regulator.txt)
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
