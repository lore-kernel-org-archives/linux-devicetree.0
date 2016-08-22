From: Sebastiaan Schalbroeck <schalbroeck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Documentation: devicetree: Fix max77693 spelling errors
Date: Mon, 22 Aug 2016 22:27:04 +0200
Message-ID: <20160822202701.GA5578@clue-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch corrects spelling errors in the max77693 devicetree doc,
in particular example code containing typos.

Signed-off-by: Sebastiaan Schalbroeck <schalbroeck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/max77693.txt | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/max77693.txt b/Documentation/devicetree/bindings/mfd/max77693.txt
index d342584..6a1ae3a 100644
--- a/Documentation/devicetree/bindings/mfd/max77693.txt
+++ b/Documentation/devicetree/bindings/mfd/max77693.txt
@@ -17,28 +17,28 @@ Required properties:
 - interrupt-parent :  The parent interrupt controller.
 
 Optional properties:
-- regulators : The regulators of max77693 have to be instantiated under subnod
+- regulators : The regulators of max77693 have to be instantiated under subnode
   named "regulators" using the following format.
 
 	regulators {
-		regualtor-compatible = ESAFEOUT1/ESAFEOUT2/CHARGER
-		standard regulator constratints[*].
+		regulator-compatible = ESAFEOUT1/ESAFEOUT2/CHARGER
+		standard regulator constraints[*].
 	};
 
 	[*] refer Documentation/devicetree/bindings/regulator/regulator.txt
 
 - haptic : The MAX77693 haptic device utilises a PWM controlled motor to provide
   users with tactile feedback. PWM period and duty-cycle are varied in
-  order to provide the approprite level of feedback.
+  order to provide the appropriate level of feedback.
 
  Required properties:
-	- compatible : Must be "maxim,max77693-hpatic"
+	- compatible : Must be "maxim,max77693-haptic"
 	- haptic-supply : power supply for the haptic motor
 	[*] refer Documentation/devicetree/bindings/regulator/regulator.txt
 	- pwms : phandle to the physical PWM(Pulse Width Modulation) device.
 	 PWM properties should be named "pwms". And number of cell is different
 	 for each pwm device.
-	 To get more informations, please refer to documentaion.
+	 To get more information, please refer to documentation.
 	[*] refer Documentation/devicetree/bindings/pwm/pwm.txt
 
 - charger : Node configuring the charger driver.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
