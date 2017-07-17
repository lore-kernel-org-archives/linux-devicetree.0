From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] dt-bindings: regulator: pwm-regulator: fix example syntax
Date: Mon, 17 Jul 2017 15:18:23 +0200
Message-ID: <20170717131823.19687-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The "Continuous Voltage" example specifies a pwm-dutycycle-range.
However, an equal sign is missing between the property name and value.
Fix this to allow copy and paste from the documentation when writing an
own .dts file with a pwm-regulator.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/regulator/pwm-regulator.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
index bf85aa9ad6a7..3d78d507e29f 100644
--- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
@@ -71,7 +71,7 @@ Continuous Voltage With Enable GPIO Example:
 		 * Inverted PWM logic, and the duty cycle range is limited
 		 * to 30%-70%.
 		 */
-		pwm-dutycycle-range <700 300>; /* */
+		pwm-dutycycle-range = <700 300>; /* */
 	};
 
 Voltage Table Example:
-- 
2.13.3
