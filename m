From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/2] regulator: pwm: DT: Add ramp delay for exponential voltage transition
Date: Fri, 4 Nov 2016 23:07:54 +0530
Message-ID: <1478281075-3498-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Douglas Anderson <dianders@chromium.org>, Aleksandr Frid <afrid@nvidia.com>
List-Id: devicetree@vger.kernel.org

Some PWM regulator has the exponential transition in voltage change as
opposite to fixed slew-rate linear transition on other regulators.
For such PWM regulators, add the property for providing the delay
from DT node.

Add DT binding details of the new property
"pwm-regulator-voltage-ramp-time-us" added for providing voltage
transition delay.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
CC: Douglas Anderson <dianders@chromium.org>
CC: Aleksandr Frid <afrid@nvidia.com>

---
This patch is continuation of discussion on patch
	regulator: pwm: Fix regulator ramp delay for continuous mode
https://patchwork.kernel.org/patch/9216857/
where is it discussed to have separate property for PWM which has
exponential voltage transition.
---
 Documentation/devicetree/bindings/regulator/pwm-regulator.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
index 3aeba9f..a163f42 100644
--- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
@@ -54,6 +54,16 @@ Optional properties:
 --------------------
 - enable-gpios:		GPIO to use to enable/disable the regulator
 
+- pwm-regulator-voltage-ramp-time-us: Integer, voltage ramp time in
+			microseconds. Some PWM regulator has the exponential
+			transition in voltage change as opposite to fixed
+			slew-rate linear transition on other regulators.
+			For such regulator, this property is used to provide
+			the settling time for voltage change which is same
+			for any voltage change.
+			If PWM regulator supports the fixed slew rate then
+			property "regulator-ramp-delay" should be used.
+
 Any property defined as part of the core regulator binding can also be used.
 (See: ../regulator/regulator.txt)
 
-- 
2.1.4
